#include "monitor/monitor.h"
#include "monitor/expr.h"
#include "monitor/watchpoint.h"
#include "nemu.h"

#include <stdlib.h>
#include <readline/readline.h>
#include <readline/history.h>

void cpu_exec(uint32_t);

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
			printf("eip\t0x%x\n",cpu.eip);
		}
		else if(*args=='w'){
			//To be continued
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
			unsigned int xy_n;
			unsigned int i;
			hwaddr_t xy_rm;
			sscanf(N,"%u",&xy_n);
			sscanf(EXPR,"%x",&xy_rm);
			for(i=0;i<xy_n;++i){
				printf("0x%08x",hwaddr_read(xy_rm+4*i,4));//buggy?
				if((i+1)==xy_n)
					printf("\n");
				else
					printf("\t");
			}
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
	bool success = false;
	uint32_t result=expr(args,&success);
	if(success)
		printf("%d\n",result);
	else
		printf("something wrong in expr.c expr\n");
	return 0;
}

static int cmd_w(char *args){
	printf("To be implemented!\tin ui.c cmd_w\n");
	return 0;
}

static int cmd_d(char *args){
	printf("To be implemented!\tin ui.c cmd_d\n");
	return 0;
}

static int cmd_bt(char *args){
	printf("To be implemented!\tin ui.c cmd_bt\n");
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
	{ "bt", "Print the link of stack(?)", cmd_bt },

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
