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
int how_many(WP *wp);
bool check_wp();

WP* new_wp(){
	if(free_==NULL){
		panic("No space for watchpoint!");
	}
	WP *rt=free_;
	free_=free_->next;
	if(head==NULL){
		head=rt;
		tail=rt;
		head->next=NULL;
	}
	else{
		tail->next=rt;
		rt->next=NULL;
		tail=rt;
	}
	if(head==NULL)printf("WTF in new_wp!!!\n");

	printf("available space = %d\n",how_many(free_));

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
	printf("available space = %d\n",how_many(free_));
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

int  how_many(WP* wp){
	int ans=0;
	WP *rt=wp;
	while(rt!=NULL){
		ans++;
		rt=rt->next;
	}
	return ans;
}

bool check_wp(){
	WP *rt=head;
	if(rt==NULL)return false;
	
	bool flag=false;

	while(rt!=NULL){
		bool useless;
		int value_now=expr(rt->T_token,&useless);
		if(value_now!=rt->value){
			rt->oldvalue=rt->value;
			rt->value=value_now;
			flag=true;
			printf("watchpoint %d was hit\n",rt->NO);
		}
		rt=rt->next;
	}
	return flag;
}
