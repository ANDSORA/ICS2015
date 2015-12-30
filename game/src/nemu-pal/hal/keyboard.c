#include "hal.h"

#define NR_KEYS 18

enum {KEY_STATE_EMPTY, KEY_STATE_WAIT_RELEASE, KEY_STATE_RELEASE, KEY_STATE_PRESS};

/* Only the following keys are used in NEMU-PAL. */
static const int keycode_array[] = {
	K_UP, K_DOWN, K_LEFT, K_RIGHT, K_ESCAPE,
	K_RETURN, K_SPACE, K_PAGEUP, K_PAGEDOWN, K_r,
	K_a, K_d, K_e, K_w, K_q,
	K_s, K_f, K_p
};

static int key_state[NR_KEYS];

static volatile int recent_key_index = -1;
static volatile int recent_keycode = -1;
//static volatile int pre_recent_keycode = -1;

void
keyboard_event(void) {
	/* TODO: Fetch the scancode and update the key states. */
	//assert(0);
	int key_code = in_byte(0x60);
	int i;
	recent_keycode = key_code;
	if(key_code == 0xf0) return;
	for (i = 0; i < NR_KEYS; i ++){
		if(keycode_array[i] == key_code) {
			if(recent_key_index == 0xf0) key_state[i] = KEY_STATE_RELEASE;
			else if(key_state[i] == KEY_STATE_RELEASE || key_state[i] == KEY_STATE_EMPTY) key_state[i] = KEY_STATE_PRESS;
			else key_state[i] = KEY_STATE_WAIT_RELEASE;
			break;
		}
	}
	assert(i < NR_KEYS);
	recent_keycode = key_code;
	recent_key_index = i;
	Log("K_a==0x%x, mykey==0x%x", K_a, key_code);
}

static inline int
get_keycode(int index) {
	assert(index >= 0 && index < NR_KEYS);
	return keycode_array[index];
}

static inline int
query_key(int index) {
	assert(index >= 0 && index < NR_KEYS);
	return key_state[index];
}

static inline void
release_key(int index) {
	assert(index >= 0 && index < NR_KEYS);
	//recent_key_index = index;
	key_state[index] = KEY_STATE_WAIT_RELEASE;
}

static inline void
clear_key(int index) {
	assert(index >= 0 && index < NR_KEYS);
	//recent_key_index = index;
	key_state[index] = KEY_STATE_EMPTY;
}

bool 
process_keys(void (*key_press_callback)(int), void (*key_release_callback)(int)) {
	cli();
	/* TODO: Traverse the key states. Find a key just pressed or released.
	 * If a pressed key is found, call ``key_press_callback'' with the keycode.
	 * If a released key is found, call ``key_release_callback'' with the keycode.
	 * If any such key is found, the function return true.
	 * If no such key is found, the function return false.
	 * Remember to enable interrupts before returning from the function.
	 */
	if(recent_key_index == -1) {
		sti(); return false;
	}
	else {
		int recent_key_state = query_key(recent_key_index);
		int recent_keycode = get_keycode(recent_key_index);
		if(recent_key_state == KEY_STATE_PRESS || recent_key_state == KEY_STATE_WAIT_RELEASE) {
			key_press_callback(recent_keycode);
			sti(); return true;
		}
		else if(recent_key_state == KEY_STATE_RELEASE) {
			key_release_callback(recent_keycode);
			sti(); return true;
		}
		else {
			assert(0);
			sti(); return false;
		}
	}
	assert(0); /* You shouldn't reach here... --ANDSORA */
}
