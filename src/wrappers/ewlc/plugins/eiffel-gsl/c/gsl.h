//This file is part of the eiffel wrapper of gsl
//Copyright: 2008 Raphael Mack <mail@raphael-mack.de>
#include <gsl/gsl_ieee_utils.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_blas.h>

#include <fenv.h>

void gsl_init();

#include <gsl/gsl_complex.h>
#include <gsl/gsl_complex_math.h>

#define gsl_complex_zero {{0.0,0.0}}

#define gsl_set_default_err_handler() gsl_set_error_handler(NULL)
#define gsl_complex_polar_wrapper(c, r, t) c = gsl_complex_polar(r, t)
#define gsl_complex_rect_wrapper(c, a, b) c = gsl_complex_rect(a, b)
#define gsl_complex_arg_wrapper(c) gsl_complex_arg(c)
#define gsl_complex_abs_wrapper(c) gsl_complex_abs(c)
#define gsl_complex_abs2_wrapper(c) gsl_complex_abs2(c)
#define gsl_complex_logabs_wrapper(c) gsl_complex_logabs(c)
#define gsl_complex_add_wrapper(a, b, c) c = gsl_complex_add(a, b)
#define gsl_complex_sub_wrapper(a, b, c) c = gsl_complex_sub(a, b)
#define GSL_SET_REAL_W(c, a) GSL_SET_REAL(&c, a)
#define GSL_SET_IMAG_W(c, a) GSL_SET_IMAG(&c, a)

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

//vector_double: GSL_VECTOR_REAL_64
#include <gsl/gsl_vector_double.h>
#define vector_double_c_struct_size sizeof(gsl_vector)
#define vector_double_size(x) ((gsl_vector*)x)->size
#define vector_double_stride(x) ((gsl_vector*)x)->stride
#define vector_double_data(x) ((gsl_vector*)x)->data
#define vector_double_block(x) ((gsl_vector*)x)->block
#define vector_double_owner(x) ((gsl_vector*)x)->owner

//vector_float: GSL_VECTOR_REAL_32
#include <gsl/gsl_vector_float.h>
#define vector_float_c_struct_size sizeof(gsl_vector)
#define vector_float_size(x) ((gsl_vector*)x)->size
#define vector_float_stride(x) ((gsl_vector*)x)->stride
#define vector_float_data(x) ((gsl_vector*)x)->data
#define vector_float_block(x) ((gsl_vector*)x)->block

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

#ifdef FE_INEXACT
int has_ieee_inexact();
#else
#define has_ieee_inexact() 0
#endif

#ifdef FE_INVALID
int has_ieee_invalid();
#else
#define has_ieee_invalid() 0
#endif

