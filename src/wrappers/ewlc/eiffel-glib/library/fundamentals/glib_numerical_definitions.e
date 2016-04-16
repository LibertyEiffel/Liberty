note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_NUMERICAL_DEFINITIONS

-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Numerical Definitions

-- Numerical Definitions %GÅ‚Äî%@ mathematical constants, and floating point decomposition.
	
-- Synopsis

-- #include <glib.h>


-- #define     G_IEEE754_FLOAT_BIAS
-- #define     G_IEEE754_DOUBLE_BIAS
-- union       GFloatIEEE754;
-- union       GDoubleIEEE754;


-- #define     G_E
-- #define     G_LN2
-- #define     G_LN10
-- #define     G_PI
-- #define     G_PI_2
-- #define     G_PI_4
-- #define     G_SQRT2
-- #define     G_LOG_2_BASE_10

-- Description

-- GLib offers mathematical constants such as G_PI for the value of pi; many platforms have these in the C library, but some don't, the GLib versions always exist.

-- The GFloatIEEE754 and GDoubleIEEE754 unions are used to access the sign, mantissa and exponent of IEEE floats and doubles. These unions are defined as appropriate for a given platform. IEEE floats and doubles are supported (used for storage) by at least Intel, PPC and Sparc, for reference: http://cch.loria.fr/documentation/IEEE754/numerical_comp_guide/ncg_math.doc.html
-- Details
-- G_IEEE754_FLOAT_BIAS

-- #define G_IEEE754_FLOAT_BIAS	(127)

-- See http://cch.loria.fr/documentation/IEEE754/numerical_comp_guide/ncg_math.doc.html
-- G_IEEE754_DOUBLE_BIAS

-- #define G_IEEE754_DOUBLE_BIAS	(1023)

-- See http://cch.loria.fr/documentation/IEEE754/numerical_comp_guide/ncg_math.doc.html
-- union GFloatIEEE754

-- union GFloatIEEE754
-- {
--   gfloat v_float;
--   struct {
--     guint mantissa : 23;
--     guint biased_exponent : 8;
--     guint sign : 1;
--   } mpn;
-- };

-- The GFloatIEEE754 and GDoubleIEEE754 unions are used to access the sign, mantissa and exponent of IEEE floats and doubles. These unions are defined as appropriate for a given platform. IEEE floats and doubles are supported (used for storage) by at least Intel, PPC and Sparc, for reference: http://cch.loria.fr/documentation/IEEE754/numerical_comp_guide/ncg_math.doc.html
-- union GDoubleIEEE754

-- union GDoubleIEEE754
-- {
--   gdouble v_double;
--   struct {
--     guint mantissa_low : 32;
--     guint mantissa_high : 20;
--     guint biased_exponent : 11;
--     guint sign : 1;
--   } mpn;
-- };

-- The GFloatIEEE754 and GDoubleIEEE754 unions are used to access the sign, mantissa and exponent of IEEE floats and doubles. These unions are defined as appropriate for a given platform. IEEE floats and doubles are supported (used for storage) by at least Intel, PPC and Sparc, for reference: http://cch.loria.fr/documentation/IEEE754/numerical_comp_guide/ncg_math.doc.html
-- G_E

-- #define G_E     2.7182818284590452353602874713526624977572470937000

-- The base of natural logarithms.
-- G_LN2

-- #define G_LN2   0.69314718055994530941723212145817656807550013436026

-- The natural logarithm of 2.
-- G_LN10

-- #define G_LN10  2.3025850929940456840179914546843642076011014886288

-- The natural logarithm of 10.
-- G_PI

-- #define G_PI    3.1415926535897932384626433832795028841971693993751

-- The value of pi (ratio of circle's circumference to its diameter).
-- G_PI_2

-- #define G_PI_2  1.5707963267948966192313216916397514420985846996876

-- Pi divided by 2.
-- G_PI_4

-- #define G_PI_4  0.78539816339744830961566084581987572104929234984378

-- Pi divided by 4.
-- G_SQRT2

-- #define G_SQRT2 1.4142135623730950488016887242096980785696718753769

-- The square root of two.
-- G_LOG_2_BASE_10

-- #define G_LOG_2_BASE_10		(0.30102999566398119521)

-- Used for fooling around with float formats, see http://cch.loria.fr/documentation/IEEE754/numerical_comp_guide/ncg_math.doc.html
-- See Also

-- http://cch.loria.fr/documentation/IEEE754/numerical_comp_guide/ncg_math.doc.html
end
