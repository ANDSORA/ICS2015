#include "monitor/monitor.h"
#include "monitor/expr.h"
#include "monitor/watchpoint.h"
#include "nemu.h"

#include <stdlib.h>
#include <readline/readline.h>
#include <readline/history.h>

void cpu_exec(uint32_t);
//static WP *head;
WP* new_wp();
void free_wp(WP* wp);
void free_wp_n(int N);
void WP_print();
static int w_num; 

char* GiveMyName(swaddr_t myaddr);

/* We use the ``readline'' library to provide more flexibility to read from stdin. */
char* rl_gets() {
	static char *line_read = NULL;

	if (line_read) {
		free(line_read);
		line_read = NULL;
	}

	line_read = readline("(nemu) ");

	if (line_read && *line_read) {
		add_history(line_read);
	}

	return line_read;
}

static int cmd_c(char *args) {
	cpu_exec(-1);
	return 0;
}

static int cmd_q(char *args) {
	return -1;
}

//you own work!~X
static int cmd_si(char *args) {
	unsigned int xy_n;
	if(args)
		sscanf(args,"%u",&xy_n);
	else
		xy_n=1;
	
	cpu_exec(xy_n);
	return 0;
}

static int cmd_info(char *args) {
	if(args){
		//if(!strcmp(args,"r")){
		if(*args=='r'){
			printf("eax\t0x%x\n",cpu.eax);
			printf("ecx\t0x%x\n",cpu.ecx);
			printf("edx\t0x%x\n",cpu.edx);
			printf("ebx\t0x%x\n",cpu.ebx);
			printf("esp\t0x%x\n",cpu.esp);
			printf("ebp\t0x%x\n",cpu.ebp);
			printf("esi\t0x%x\n",cpu.esi);
			printf("edi\t0x%x\n",cpu.edi);
			printf("EIP\t0x%x\n",cpu.eip);
			printf("EFLAGS:\tCF\tPF\tAF\tZF\tSF\tOF\tTF\tIF\tDF\n\t%u\t%u\t%u\t%u\t%u\t%u\t%u\t%u\t%u\n",cpu.CF,cpu.PF,cpu.AF,cpu.ZF,cpu.SF,cpu.OF,cpu.TF,cpu.IF,cpu.DF);
		}
		else if(*args=='w'){
			WP_print();
		}
		else
			printf("Wrong Format!\n");
	}
	else
		printf("Subcmd missed!\n");

	return 0;
}

static int cmd_x(char *args){
	char *N;
	char *EXPR;
	if(args){
		char *args_end=args+strlen(args);
		N=strtok(args," ");
		EXPR=N+strlen(N)+1;
		if(EXPR>=args_end){
			EXPR=NULL;
			printf("Subsubcmd missed!\n");
		}
		else{
			unsigned int i;
			unsigned int xy_n;
			swaddr_t xy_rm;
			bool success=false;
			sscanf(N,"%u",&xy_n);
			xy_rm=expr(EXPR,&success);
			//sscanf(EXPR,"%x",&xy_rm);
			if(success){
				for(i=0;i<xy_n;++i){
					printf("0x%08x",swaddr_read(xy_rm+4*i,4));//buggy?
					if((i+1)==xy_n)
						printf("\n");
					else
						printf("\t");
				}
			}
			else
				printf("Bad EXPR\n");
		}
	}
	else
		printf("Subcmd missed!\n");
	return 0;
}

static int cmd_p(char *args){
	//printf("To be implemented!\tin ui.c cmd_p\n");
	if(!args){
		printf("EXPR missed!\n");
		return 0;
	}
	bool success=false;
	uint32_t result=expr(args,&success);
	if(success)
		printf("%x\n",result);
	else
		printf("Bad EXPR\n");
	return 0;
}

static int cmd_w(char *args){
	//printf("To be implemented!\tin ui.c cmd_w\n");
	if(!args){
		printf("EXPR missed!\n");
		return 0;
	}

	//static int w_num=0;

	WP* NewW;

	bool success=false;
	int T_value;
	T_value=expr(args,&success);

	if(!success){
		printf("Bad EXPR!\n");
	}
	else{
		NewW=new_wp();
		w_num++;
		NewW->NO=w_num;
		NewW->value=T_value;
		NewW->times=0;
		strcpy(NewW->T_token,args);
		printf("watchpoint %d set\n",w_num);
		printf("NO=%d value=0x%x token=%s\n",NewW->NO,NewW->value,NewW->T_token);
		if(NewW==NULL)printf("WTF!!!\n");
	}

	return 0;
}

static int cmd_d(char *args){
	//printf("To be implemented!\tin ui.c cmd_d\n");
	if(!args){
		printf("EXPR missed!\n");
		return 0;
	}
	
	int N;
	sscanf(args,"%d",&N);

	free_wp_n(N);

	return 0;
}

static int cmd_bt(char *args){
	//printf("To be implemented!\tin ui.c cmd_bt\n");
	swaddr_t dog = cpu.ebp;
	swaddr_t myaddr;
	int index=0;
	char* a;
	printf("Index\t\tAddr\t\tName\t\tPara1\t\tPara2\t\tPara3\t\tPara4\t\tdog\n");
	while(dog){
		printf("#%d\t\t",index);
		if(index==0){
			myaddr = cpu.eip;
			printf("0x%08x\t",myaddr);
		}
		else{
			myaddr = swaddr_read(dog+4,4);
			printf("0x%08x\t",myaddr);
			dog = swaddr_read(dog,4);
		}
		//printf("0x%x\t0x%x\n",dog,swaddr_read(dog+4,4));
		//dog = swaddr_read(dog,4);
		a=GiveMyName(myaddr-1);
		if(a==NULL){
			printf("I can't find My Func!\n");
			return 0;
		}
		else printf("%s\t\t",a);
		if(dog+20>0x8000000) printf("No Para\n");
		else printf("0x%08x\t0x%08x\t0x%08x\t0x%08x\t",swaddr_read(dog+8,4),swaddr_read(dog+12,4),swaddr_read(dog+16,4),swaddr_read(dog+20,4));
		printf("0x%08x\n",dog);
		index++;
	}
	return 0;
}
//you own work!~Y

static int cmd_help(char *args);

static struct {
	char *name;
	char *description;
	int (*handler) (char *);
} cmd_table [] = {
	{ "help", "Display informations about all supported commands", cmd_help },
	{ "c", "Continue the execution of the program", cmd_c },
	{ "q", "Exit NEMU", cmd_q },
	{ "si", "Step one or more instructions exactly", cmd_si },
	{ "info", "Command for showing things about the priogram being debugged\n\tr List of all registers and their contents\n\tw Status of watchpoints", cmd_info },
	{ "x", "Examine memory\n\tN EXPR\trepeat count and an expression for the memory address to examine", cmd_x },
	{ "p", "Print value of expression EXPR\n\tEXPR\tthe EXPR waiting to be calculated and printed", cmd_p },
	{ "w", "Set watchpoints", cmd_w },
	{ "d", "Delete watchpoints", cmd_d },
	{ "bt", "Print backtrace of all stack frames", cmd_bt },

	/* TODO: Add more commands */

};

#define NR_CMD (sizeof(cmd_table) / sizeof(cmd_table[0]))

static int cmd_help(char *args) {
	/* extract the first argument */
	char *arg = strtok(NULL, " ");
	int i;

	if(arg == NULL) {
		/* no argument given */
		for(i = 0; i < NR_CMD; i ++) {
			printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
		}
	}
	else {
		for(i = 0; i < NR_CMD; i ++) {
			if(strcmp(arg, cmd_table[i].name) == 0) {
				printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
				return 0;
			}
		}
		printf("Unknown command '%s'\n", arg);
	}
	return 0;
}

void ui_mainloop() {
	while(1) {
		char *str = rl_gets();
		char *str_end = str + strlen(str);

		/* extract the first token as the command */
		char *cmd = strtok(str, " ");
		if(cmd == NULL) { continue; }

		/* treat the remaining string as the arguments,
		 * which may need further parsing
		 */
		char *args = cmd + strlen(cmd) + 1;
		if(args >= str_end) {
			args = NULL;
		}

#ifdef HAS_DEVICE
		extern void sdl_clear_event_queue(void);
		sdl_clear_event_queue();
#endif

		int i;
		for(i = 0; i < NR_CMD; i ++) {
			if(strcmp(cmd, cmd_table[i].name) == 0) {
				if(cmd_table[i].handler(args) < 0) { return; }
				break;
			}
		}

		if(i == NR_CMD) { printf("Unknown command '%s'\n", cmd); }
	}
}
