#include "FLOAT.h"

typedef union{
	float f_type;
	unsigned u_type;
	int i_type;
}  type_trans;

FLOAT F_mul_F(FLOAT a, FLOAT b) {
	nemu_assert(0);
	return 0;
}

FLOAT F_div_F(FLOAT a, FLOAT b) {
	nemu_assert(0);
	return 0;
}

FLOAT f2F(float a) {
	//nemu_assert(0);
	type_trans T;
	T.f_type = a;
	unsigned temp = T.u_type;
	unsigned sign = temp>>31;
	unsigned exp = temp>>23&0xff;
	unsigned frac = temp&0x7fffff;
	unsigned ans;
	if(exp==0xff) {
		if(frac==0){
			if(sign) nemu_assert(0);//negetive infinite
			else nemu_assert(0);//positive infinite
		}
		else nemu_assert(0);//NaN
	}
	else if(exp==0) {
		nemu_assert(0);//unnormal(too small)
	}
	else{
		if(exp>=111&&exp<=141) {
			frac |= 0x800000;
			if(exp>134){
				exp = exp - 134;
				ans = frac<<exp;
			}
			else{
				exp = 134 - exp;
				ans = frac>>exp;
			}
		}
		else {
			nemu_assert(0);//fatal overflow
		}
	}

	if(sign) ans = ~ans + 1;
	return (FLOAT)ans;
}

FLOAT Fabs(FLOAT a) {
	nemu_assert(0);
	return 0;
}

FLOAT sqrt(FLOAT x) {
	FLOAT dt, t = int2F(2);

	do {
		dt = F_div_int((F_div_F(x, t) - t), 2);
		t += dt;
	} while(Fabs(dt) > f2F(1e-4));

	return t;
}

FLOAT pow(FLOAT x, FLOAT y) {
	/* we only compute x^0.333 */
	FLOAT t2, dt, t = int2F(2);

	do {
		t2 = F_mul_F(t, t);
		dt = (F_div_F(x, t2) - t) / 3;
		t += dt;
	} while(Fabs(dt) > f2F(1e-4));

	return t;
}

