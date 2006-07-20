//This file is part of the eiffel wrapper of gsl
//Copyright: Raphael Mack <mail@raphael-mack.de>
#include <gsl/gsl_ieee_utils.h>
#include <gsl/gsl_errno.h>
#include <fenv.h>

void gsl_init();

#define gsl_set_default_err_handler() gsl_set_error_handler(NULL)

//matrix_float: GSL_MATRIX_REAL_32
#include <gsl/gsl_matrix_float.h>
#define matrix_float_c_struct_size sizeof(gsl_matrix_float)
#define matrix_float_size1(x) ((gsl_matrix_float*)x)->size1
#define matrix_float_size2(x) ((gsl_matrix_float*)x)->size2
#define matrix_float_tda(x) ((gsl_matrix_float*)x)->tda
#define matrix_float_data(x) ((gsl_matrix_float*)x)->data
#define matrix_float_block(x) ((gsl_matrix_float*)x)->block
#define matrix_float_owner(x) ((gsl_matrix_float*)x)->owner

//matrix_double: GSL_MATRIX_REAL_64
#include <gsl/gsl_matrix_double.h>
#define matrix_double_c_struct_size sizeof(gsl_matrix)
#define matrix_double_size1(x) ((gsl_matrix*)x)->size1
#define matrix_double_size2(x) ((gsl_matrix*)x)->size2
#define matrix_double_tda(x) ((gsl_matrix*)x)->tda
#define matrix_double_data(x) ((gsl_matrix*)x)->data
#define matrix_double_block(x) ((gsl_matrix*)x)->block
#define matrix_double_owner(x) ((gsl_matrix*)x)->owner


char* ieee_strerror();

void reset_ieee_exceptions();

int has_ieee_exception();

#ifdef FE_UNDERFLOW
int has_ieee_underflow();
#else
#define has_ieee_underflow() 0
#endif

#ifdef FE_OVERFLOW
int has_ieee_overflow();
#else
#define has_ieee_overflow() 0
#endif

#ifdef FE_DIVBYZERO
int has_ieee_div_by_zero();
#else
#define has_ieee_div_by_zero() 0
#endif

//TODO:
int has_ieee_inexact();
int has_ieee_invalid();

