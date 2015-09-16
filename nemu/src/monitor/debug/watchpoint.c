#include "monitor/watchpoint.h"
#include "monitor/expr.h"

#define NR_WP 32

static WP wp_list[NR_WP];
static WP *head, *free_, *tail;

void init_wp_list() {
	int i;
	for(i = 0; i < NR_WP; i ++) {
		wp_list[i].NO = i;
		wp_list[i].next = &wp_list[i + 1];
	}
	wp_list[NR_WP - 1].next = NULL;

	head = NULL;
	tail = NULL;
	free_ = wp_list;
}

/* TODO: Implement the functionality of watchpoint */

WP* new_wp();
void free_wp(WP *wp);

WP* new_wp(){
	if(free_==NULL){
		panic("No space for watchpoint!");
	}
	WP *rt=free_;
	if(head==NULL){
		head=free_;
		tail=free_;
		head->next=NULL;
	}
	else{
		free_=free_->next;
		tail->next=rt;
		rt->next=NULL;
		tail=rt;
	}
	if(head==NULL)printf("WTF in new_wp!!!\n");
	return rt;
}

void free_wp(WP *wp){
	if(wp==head){
		head=wp->next;
		wp->next=free_;
		free_=wp;
		if(head==NULL){
			tail=NULL;
		}
	}
	else{
		WP *temp=head;
		while(temp->next!=wp){
			temp=temp->next;
		}
		temp->next=wp->next;
		wp->next=free_;
		free_=wp;
	}
}

void free_wp_n(int N)
{
	WP* tp=head;
	if(tp==NULL){
		printf("Already no watchpoints = =\n");
		return;
	}
	while(tp->NO!=N && tp->next!=NULL){
		tp=tp->next;
	}
	if(tp->NO==N){
		free_wp(tp);
	}
	else{
		printf("No such watchpoints, you could check info first :)\n");
	}
}
