#include <gsl/gsl_check_range.h>
#include <fenv.h>

void gsl_init(){

#ifdef GSL_RANGE_CHECK
  gsl_check_range = 1;
#else
  gsl_check_range = 0;
#endif
  //Do this, if you want an os signal on IEEE exceptions
  //    gsl_ieee_set_mode(GSL_IEEE_DOUBLE_PRECISION, GSL_IEEE_ROUND_TO_NEAREST, 0);
  
  // deactivate the default error handler by default
  gsl_set_error_handler_off();
  
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

#ifdef FE_INVALID
int has_ieee_invalid(){
  return fetestexcept(FE_INVALID);
}
#endif

#ifdef FE_INEXACT
int has_ieee_inexact(){
  return fetestexcept(FE_INEXACT);
}
#endif

void reset_ieee_exceptions(){
	feclearexcept(FE_ALL_EXCEPT);
}

