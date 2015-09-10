#include "nemu.h"

/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <sys/types.h>
#include <regex.h>

enum {
	NOTYPE = 256, EQ, AND, OR, UNEQ, NEG, HEX, DEC, REG_32, REG_16, REG_8
	//PLUS, MINUS, MULTI, DIVIDE, LPAR, RPAR

	/* TODO: Add more token types */

};

static struct rule {
	char *regex;
	int token_type;
} rules[] = {

	/* TODO: Add more rules.
	 * Pay attention to the precedence level of different rules.
	 */

	{" +",	NOTYPE},				// spaces
	{"==", EQ},						// equal
	{"\\&&", AND},					// and
	{"\\||", OR},						// or
	{"\\!=", UNEQ},					// unequal
	{"\\!",  NEG},					// negative
	{"0x[0-9a-fA-F]+", HEX},		// hexadecimal number
	{"%(eax|ecx|edx|ebx|esp|ebp|esi|edi|eip)", REG_32},	// registers_32
	{"%(ax|cx|dx|bx|sp|bp|si|di)", REG_16},				// registers_16
	{"%(al|ah|cl|ch|dl|dh|bl|bh)", REG_8},				// registers_8
	{"[[:digit:]]+", DEC},			//decimal number
	{"\\+", '+'},					// plus(buggy?)
	{"\\-", '-'},					// minus
	{"\\*", '*'},					// multiply
	{"\\/", '/'},					// divide
	{"\\(", '('},					// left parenthesis
	{"\\)", ')'}					// right parenthesis

/*	{"\\+", PLUS},					// plus(buggy?)
	{"\\-", MINUS},					// minus
	{"\\*", MULTI},					// multiply
	{"\\/", DIVIDE},				// divide
	{"\\(", LPAR},					// left parenthesis
	{"\\)", RPAR}					// right parenthesis */
};

#define NR_REGEX (sizeof(rules) / sizeof(rules[0]) )

static regex_t re[NR_REGEX];

/* Rules are used for many times.
 * Therefore we compile them only once before any usage.
 */
void init_regex() {
	int i;
	char error_msg[128];
	int ret;

	for(i = 0; i < NR_REGEX; i ++) {
		ret = regcomp(&re[i], rules[i].regex, REG_EXTENDED);
		if(ret != 0) {
			regerror(ret, &re[i], error_msg, 128);
			Assert(ret != 0, "regex compilation failed: %s\n%s", error_msg, rules[i].regex);
		}
	}
}

typedef struct token {
	int type;
	char str[32];
} Token;

Token tokens[32];
int nr_token;
bool gflag;

static bool make_token(char *e) {
	int position = 0;
	int i;
	regmatch_t pmatch;
	
	nr_token = 0;

	while(e[position] != '\0') {
		/* Try all rules one by one. */
		for(i = 0; i < NR_REGEX; i ++) {
			if(regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
				char *substr_start = e + position;
				int substr_len = pmatch.rm_eo;

				Log("match rules[%d] = \"%s\" at position %d with len %d: %.*s", i, rules[i].regex, position, substr_len, substr_len, substr_start);
				position += substr_len;

				/* TODO: Now a new token is recognized with rules[i]. Add codes
				 * to record the token in the array ''tokens''. For certain 
				 * types of tokens, some extra actions should be performed.
				 */

				printf("(make token)sub_start=%d,sub_len=%d\n",substr_start-e,substr_len);
				if(rules[i].token_type==NOTYPE)break;
				switch(rules[i].token_type) {
					case EQ:	tokens[nr_token].type=EQ;break;
					case DEC:	tokens[nr_token].type=DEC;break;
					case HEX:	tokens[nr_token].type=HEX;break;
					case AND:	tokens[nr_token].type=AND;break;
					case OR:	tokens[nr_token].type=OR;break;
					case UNEQ:	tokens[nr_token].type=UNEQ;break;
					case NEG:	tokens[nr_token].type=NEG;break;
					case REG_32:tokens[nr_token].type=REG_32;break;
					case REG_16:tokens[nr_token].type=REG_16;break;
					case REG_8: tokens[nr_token].type=REG_8;break;
					case '+':	tokens[nr_token].type='+';break;
					case '-':	tokens[nr_token].type='-';break;
					case '*':	tokens[nr_token].type='*';break;
					case '/':	tokens[nr_token].type='/';break;
					case '(':	tokens[nr_token].type='(';break;
					case ')':	tokens[nr_token].type=')';break;

					default: panic("please implement me(in make_token)");
				}
				strncpy(tokens[nr_token].str,substr_start,substr_len);
				tokens[nr_token].str[substr_len]='\0';
				nr_token++;
				break;
			}
		}

		if(i == NR_REGEX) {
			printf("no match at position %d\n%s\n%*.s^\n", position, e, position, "");
			return false;
		}
	}
	//
	int cc;
	for(cc=0;cc<nr_token;++cc){
		printf("%s",tokens[cc].str);
	}printf("\t(the tokens)\n");//

	return true; 
}

bool check_parentheses(int p,int q){
	int tt=p;
	int unmatch=0;
	bool mid_break=0;
	if(tokens[tt].type=='('){
		unmatch++;
		tt++;
		while(tt<=q){
			switch(tokens[tt].type){
				case '(':{
							 unmatch++;
							 break;
						 }
				case ')':{
							 //Assert(unmatch,"Bad EXPR(parentheses can't match)");
							 if(!unmatch){
								 gflag=0;
								 printf("Parentheses can't match\n");
								 return 0;
							 }
							 unmatch--;
							 if(!unmatch&&tt<q)
								 mid_break=1;
							 break;
						 }
				default:break;
			}
			tt++;
		}
		//Assert(!unmatch,"Bad EXPR(parentheses can't match)");
		if(unmatch){
			gflag=0;
			printf("Parentheses can't match\n");
			return 0;
		}
		if(!mid_break)
			return 1;
	}
	return 0;
}

int eval(int p,int q){
	if(p>q){
		gflag=0;
		printf("Operators can't match(p>q)\n");
		return 0;
	}
	else if(p==q){
		if(tokens[p].type==DEC){
			int xx;
			printf("(eval)%s\n",tokens[p].str);
			sscanf(tokens[p].str,"%d",&xx);
			return xx;
		}
		else if(tokens[p].type==HEX){
			int xx;
			printf("(eval)%s\n",tokens[p].str);
			sscanf(tokens[p].str,"%x",&xx);
			return xx;

		}
		else if(tokens[p].type==REG_32){
			if(!strcmp(tokens[p].str+1,"eax")) return cpu.eax;
			else if(!strcmp(tokens[p].str+1,"ecx")) return cpu.ecx;
			else if(!strcmp(tokens[p].str+1,"edx")) return cpu.edx;
			else if(!strcmp(tokens[p].str+1,"ebx")) return cpu.ebx;
			else if(!strcmp(tokens[p].str+1,"esp")) return cpu.esp;
			else if(!strcmp(tokens[p].str+1,"ebp")) return cpu.ebp;
			else if(!strcmp(tokens[p].str+1,"esi")) return cpu.esi;
			else if(!strcmp(tokens[p].str+1,"edi")) return cpu.edi;
			else if(!strcmp(tokens[p].str+1,"eip")) return cpu.eip;
			else {
				gflag=0;
				printf("NO such REG_32 \"%s\"(p==q)\n",tokens[p].str);
				return 0;
			}
		}
		else if(tokens[p].type==REG_16){
			if(!strcmp(tokens[p].str+1,"ax")) return cpu.ax;
			else if(!strcmp(tokens[p].str+1,"cx")) return cpu.cx;
			else if(!strcmp(tokens[p].str+1,"dx")) return cpu.dx;
			else if(!strcmp(tokens[p].str+1,"bx")) return cpu.bx;
			else if(!strcmp(tokens[p].str+1,"sp")) return cpu.sp;
			else if(!strcmp(tokens[p].str+1,"bp")) return cpu.bp;
			else if(!strcmp(tokens[p].str+1,"si")) return cpu.si;
			else if(!strcmp(tokens[p].str+1,"di")) return cpu.di;
			else {
				gflag=0;
				printf("NO such REG_16 \"%s\"(p==q)\n",tokens[p].str);
				return 0;
			}
		}
		else if(tokens[p].type==REG_8){
			if(!strcmp(tokens[p].str+1,"al")) return cpu.al;
			else if(!strcmp(tokens[p].str+1,"ah")) return cpu.ah;
			else if(!strcmp(tokens[p].str+1,"cl")) return cpu.cl;
			else if(!strcmp(tokens[p].str+1,"ch")) return cpu.ch;
			else if(!strcmp(tokens[p].str+1,"dl")) return cpu.dl;
			else if(!strcmp(tokens[p].str+1,"dh")) return cpu.dh;
			else if(!strcmp(tokens[p].str+1,"bl")) return cpu.bl;
			else if(!strcmp(tokens[p].str+1,"bh")) return cpu.bh;
			else {
				gflag=0;
				printf("NO such REG_8 \"%s\"(p==q)\n",tokens[p].str);
				return 0;
			}
		}
	

		else{
			gflag=0;
			printf("Operators can't match(p==q,not DEC\\HEX\\REG)\n");
			return 0;
		}
	}
	else if(check_parentheses(p,q)){
		return eval(p+1,q-1);
	}
	else{
		if(!gflag)return 0;
		int i;
		int op=-1;
		int unmatch=0;
		//int optype;	//0 1 2 3	+ - * /
		for(i=p;i<=q;++i){
			switch(tokens[i].type){
				case '(':unmatch++;break;
				case ')':unmatch--;break;
				case '+':
				case '-':if(!unmatch)op=i;break;
				case '*':
				case '/':{
							 if(op>0){
								 if(tokens[op].type=='+'||tokens[op].type=='-')
									 break;
							 }
							 if(!unmatch)op=i;
						 }break;
				default:break;
			}
		}

		switch(tokens[op].type){
			case '+':{
						 if(op==p)
							 return eval(op+1,q);
						 else
							 return eval(p,op-1)+eval(op+1,q);
					 }break;
			case '-':{
						 if(op==p)
							 return -eval(op+1,q);
						 else
							 return eval(p,op-1)-eval(op+1,q);
					 }break;
			case '*':return eval(p,op-1)*eval(op+1,q);break;
			case '/':return eval(p,op-1)/eval(op+1,q);break;
			case -1 :gflag=0;printf("Operators can't match(p<q,no op)\n");return 0;break;
			default :break;
		}
	}
	return 0;
}

uint32_t expr(char *e, bool *success) {
	if(!make_token(e)) {
		*success = false;
		return 0;
	}

	/* TODO: Insert codes to evaluate the expression. */
	int p=0;
	int q=nr_token-1;
	printf("(expr)p=%d,q=%d\n",p,q);//
	uint32_t result;
	gflag=1;
	result=(uint32_t)eval(p,q);
	//Assert(gflag,"Bad EXPR");
	*success=gflag;
	//panic("please implement me(int expr)");
	return result;
}
