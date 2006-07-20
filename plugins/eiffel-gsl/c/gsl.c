#include <gsl/gsl_check_range.h>
#include <fenv.h>

//TODO: not used
void gsl_init(){
	printf("gsl init...\n");
	gsl_check_range = 1;
	
//Do this, if you want a signal on IEEE exceptions
//    gsl_ieee_set_mode(GSL_IEEE_DOUBLE_PRECISION, GSL_IEEE_ROUND_TO_NEAREST, 0);
}

int has_ieee_exception(){
	return fetestexcept(FE_ALL_EXCEPT);
}

#ifdef FE_UNDERFLOW
int has_ieee_underflow(){
	return fetestexcept(FE_UNDERFLOW);
}
#endif

#ifdef FE_OVERFLOW
int has_ieee_overflow(){
		return fetestexcept(FE_OVERFLOW);
}
#endif

#ifdef FE_DIVBYZERO
int has_ieee_div_by_zero(){
		return fetestexcept(FE_DIVBYZERO);
}
#endif

void reset_ieee_exceptions(){
	feclearexcept(FE_ALL_EXCEPT);
}

