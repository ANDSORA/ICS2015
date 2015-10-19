#include "nemu.h"

/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <sys/types.h>
#include <regex.h>

#define OP_TYPE tokens[op].type
#define I_TYPE tokens[i].type

enum {
	NOTYPE = 256, EQ, AND, OR, UNEQ, NOT, POS, NEG, HEX, DEC, REG_32, REG_16, REG_8, DEREF, VALUE
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
	{"&&", AND},					// and
	{"\\|\\|", OR},					// or
	{"\\!=", UNEQ},					// unequal
	{"\\!",  NOT},					// negative
	{"0x[0-9a-fA-F]+", HEX},		// hexadecimal number
	{"%(eax|ecx|edx|ebx|esp|ebp|esi|edi|eip)", REG_32},	// registers_32
	{"%(ax|cx|dx|bx|sp|bp|si|di)", REG_16},				// registers_16
	{"%(al|ah|cl|ch|dl|dh|bl|bh)", REG_8},				// registers_8
	{"[[:digit:]]+", DEC},			//decimal number
	{"[[:alpha:]]([[:alnum:]]|\\_)*", VALUE},				// variable
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
			Assert(ret == 0, "regex compilation failed: %s\n%s", error_msg, rules[i].regex);
		}
	}
}

typedef struct token {
	int type;
	char str[32];
} Token;

Token tokens[32];
int nr_token;
static char myreg_32[8][6]={"eax\0","ecx\0","edx\0","ebx\0","esp\0","ebp\0","esi\0","edi\0"};
static char myreg_16[8][6]={"ax\0","cx\0","dx\0","bx\0","sp\0","bp\0","si\0","di\0"};
static char myreg_8[8][6]={"al\0","cl\0","dl\0","bl\0","ah\0","ch\0","dh\0","bh\0"};
bool gflag;//set to guard if the proccess of expr is OK

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
					case NOT:	tokens[nr_token].type=NOT;break;
					case REG_32:tokens[nr_token].type=REG_32;break;
					case REG_16:tokens[nr_token].type=REG_16;break;
					case REG_8: tokens[nr_token].type=REG_8;break;
					case VALUE: tokens[nr_token].type=VALUE;break;
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
	//int cc;
	//for(cc=0;cc<nr_token;++cc){
	//	printf("%s",tokens[cc].str);
	//}printf("\t(the tokens)\n");//

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

uint32_t eval(int p,int q){
	printf("p==%d q==%d\n",p,q);

	int i;
	if(p>q){
		gflag=0;
		printf("Operators can't match(p>q)\n");
		return 0;
	}
	else if(p==q){

		//printf("p==q==%d\n",p);

		if(tokens[p].type==DEC){
			uint32_t xx;
			//printf("(eval)%s\n",tokens[p].str);
			sscanf(tokens[p].str,"%u",&xx);
			return xx;
		}
		else if(tokens[p].type==HEX){
			uint32_t xx;
			//printf("(eval)%s\n",tokens[p].str);
			sscanf(tokens[p].str,"%x",&xx);
			return xx;

		}
		else if(tokens[p].type==VALUE){
			printf("get the variable!\n");
			return 1;
		}
		else if(tokens[p].type==REG_32){
			for(i=0;i<8;++i){
				if(!strcmp(tokens[p].str+1,myreg_32[i]))return reg_l(i);
			}
			if(!strcmp(tokens[p].str+1,"eip")) return cpu.eip;
			gflag=0;
			printf("NO such REG_32 \"%s\"(p==q)\n",tokens[p].str);
			return 0;
		}
		else if(tokens[p].type==REG_16){
			for(i=0;i<8;++i){
				if(!strcmp(tokens[p].str+1,myreg_16[i]))return reg_w(i);
			}
			gflag=0;
			printf("NO such REG_16 \"%s\"(p==q)\n",tokens[p].str);
			return 0;
		}
		else if(tokens[p].type==REG_8){
			for(i=0;i<8;++i){
				if(!strcmp(tokens[p].str+1,myreg_8[i]))return reg_b(i);
			}
			gflag=0;
			printf("NO such REG_8 \"%s\"(p==q)\n",tokens[p].str);
			return 0;
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
				case OR:if(!unmatch)op=i;break;
				case AND:{
							if(op>0&&OP_TYPE==OR)break;
							if(!unmatch)op=i;
						 }break;
				case EQ:
				case UNEQ:{
							if(op>0&&(OP_TYPE==OR||OP_TYPE==AND))break;
							if(!unmatch)op=i;
						  }break;
				case '+':
				case '-':{
							if(op>0&&(OP_TYPE==OR||OP_TYPE==AND||OP_TYPE=='+'||OP_TYPE=='-'))break;
							if(!unmatch)op=i;
						 }break;
				case '*':
				case '/':{
							if(op>0&&(OP_TYPE==OR||OP_TYPE==AND||OP_TYPE=='+'||OP_TYPE=='-'||OP_TYPE=='*'||OP_TYPE=='/'))break;
							if(!unmatch)op=i;
						 }break;
				case NEG:
				case POS:
				case DEREF:
				case NOT:{
							if(op>0)break;
							if(!unmatch)op=i;
						 }break;
				default:break;
			}
		}

		printf("op==%d\n",op);//

		if(op==-1){
			gflag=0;
			printf("Operators can't match(p<q, no op)\n");
			return 0;
		}//guardian

		switch(tokens[op].type){
			case OR:	return eval(p,op-1)||eval(op+1,q);break;
			case AND:	return eval(p,op-1)&&eval(op+1,q);break;
			case EQ:	return eval(p,op-1)==eval(op+1,q);break;
			case UNEQ:	return eval(p,op-1)!=eval(op+1,q);break;
			case '+':	return eval(p,op-1)+eval(op+1,q);break;
			case '-':	return eval(p,op-1)-eval(op+1,q);break;
			case '*':	return eval(p,op-1)*eval(op+1,q);break;
			case '/':	return eval(p,op-1)/eval(op+1,q);break;
			case NEG:	return -eval(op+1,q);break;
			case POS:	return eval(op+1,q);break;
			case DEREF:	return swaddr_read(eval(op+1,q),4);break;
			case NOT:	return !eval(op+1,q);break;
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

	int i;
	for(i=0;i<nr_token;++i){
		if(tokens[i].type=='*'){
			if(i==0||(tokens[i-1].type!=DEC &&tokens[i-1].type!=HEX &&tokens[i-1].type!=')' &&tokens[i-1].type!=REG_32 &&tokens[i-1].type!=REG_16 &&tokens[i-1].type!=REG_8))
				tokens[i].type=DEREF;
		}
		if(tokens[i].type=='-'){
			if(i==0||(tokens[i-1].type!=DEC &&tokens[i-1].type!=HEX &&tokens[i-1].type!=')' &&tokens[i-1].type!=REG_32 &&tokens[i-1].type!=REG_16 &&tokens[i-1].type!=REG_8))
				tokens[i].type=NEG;
		}
		if(tokens[i].type=='+'){
			if(i==0||(tokens[i-1].type!=DEC &&tokens[i-1].type!=HEX &&tokens[i-1].type!=')' &&tokens[i-1].type!=REG_32 &&tokens[i-1].type!=REG_16 &&tokens[i-1].type!=REG_8))
				tokens[i].type=POS;
		}
	}

	int p=0;
	int q=nr_token-1;
	printf("(expr)p=%d,q=%d\n",p,q);//
	uint32_t result;
	gflag=1;
	result=eval(p,q);
	//Assert(gflag,"Bad EXPR");
	*success=gflag;
	//panic("please implement me(int expr)");
	return result;
}
