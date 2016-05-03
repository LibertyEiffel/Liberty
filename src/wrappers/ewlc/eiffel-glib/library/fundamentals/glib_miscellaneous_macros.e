note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_MISCELLANEOUS_MACROS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Miscellaneous Macros

-- Miscellaneous Macros %GÅ‚Äî%@ specialized macros which are not used often.
	
-- Synopsis

-- #include <glib.h>


-- #define     G_INLINE_FUNC

-- #define     G_STMT_START
-- #define     G_STMT_END

-- #define     G_BEGIN_DECLS
-- #define     G_END_DECLS

-- #define     G_N_ELEMENTS                    (arr)

-- #define     G_VA_COPY                       (ap1,ap2)

-- #define     G_STRINGIFY                     (macro_or_string)

-- #define     G_GNUC_EXTENSION
-- #define     G_GNUC_CONST
-- #define     G_GNUC_PURE
-- #define     G_GNUC_MALLOC
-- #define     G_GNUC_DEPRECATED
-- #define     G_GNUC_NORETURN
-- #define     G_GNUC_UNUSED
-- #define     G_GNUC_PRINTF                   ( format_idx, arg_idx )
-- #define     G_GNUC_SCANF                    ( format_idx, arg_idx )
-- #define     G_GNUC_FORMAT                   ( arg_idx )
-- #define     G_GNUC_NULL_TERMINATED
-- #define     G_GNUC_FUNCTION
-- #define     G_GNUC_PRETTY_FUNCTION
-- #define     G_GNUC_NO_INSTRUMENT
-- #define     G_HAVE_GNUC_VISIBILITY
-- #define     G_GNUC_INTERNAL

-- #define     G_LIKELY                        (expr)
-- #define     G_UNLIKELY                      (expr)

-- #define     G_STRLOC
-- #define     G_STRFUNC

-- #define     G_GINT16_MODIFIER
-- #define     G_GINT16_FORMAT
-- #define     G_GUINT16_FORMAT
-- #define     G_GINT32_MODIFIER
-- #define     G_GINT32_FORMAT
-- #define     G_GUINT32_FORMAT
-- #define     G_GINT64_MODIFIER
-- #define     G_GINT64_FORMAT
-- #define     G_GUINT64_FORMAT
-- #define     G_GSIZE_MODIFIER
-- #define     G_GSIZE_FORMAT
-- #define     G_GSSIZE_FORMAT

-- Description

-- These macros provide more specialized features which are not needed so often by application programmers.
-- Details
-- G_INLINE_FUNC

-- #define     G_INLINE_FUNC

-- This macro is used to export function prototypes so they can be linked with an external version when no inlining is performed. The file which implements the functions should define G_IMPLEMENTS_INLINES before including the headers which contain G_INLINE_FUNC declarations. Since inlining is very compiler-dependent using these macros correctly is very difficult. Their use is strongly discouraged.

-- This macro is often mistaken for a replacement for the inline keyword; inline is already declared in a portable manner in the glib headers and can be used normally.
-- G_STMT_START

-- #define     G_STMT_START

-- Used within multi-statement macros so that they can be used in places where only one statement is expected by the compiler.
-- G_STMT_END

-- #define     G_STMT_END

-- Used within multi-statement macros so that they can be used in places where only one statement is expected by the compiler.
-- G_BEGIN_DECLS

-- #define     G_BEGIN_DECLS

-- Used (along with G_END_DECLS) to bracket header files. If the compiler in use is a C++ compiler, adds extern "C" around the header.
-- G_END_DECLS

-- #define     G_END_DECLS

-- Used (along with G_BEGIN_DECLS) to bracket header files. If the compiler in use is a C++ compiler, adds extern "C" around the header.
-- G_N_ELEMENTS()

-- #define G_N_ELEMENTS(arr)		(sizeof (arr) / sizeof ((arr)))

-- Determines the number of elements in an array. The array must be declared so the compiler knows its size at compile-time; this macro will not work on an array allocated on the heap, only static arrays or arrays on the stack.
-- arr : 	the array
-- G_VA_COPY()

-- #define     G_VA_COPY(ap1,ap2)

-- Portable way to copy va_list variables.

-- In order to use this function, you must include string.h yourself, because this macro may use memmove() and GLib does not include string.h for you.
-- ap1 : 	the va_list variable to place a copy of ap2 in.
-- ap2 : 	a va_list.
-- G_STRINGIFY()

-- #define G_STRINGIFY(macro_or_string)	G_STRINGIFY_ARG (macro_or_string)

-- Accepts a macro or a string and converts it into a string.
-- macro_or_string : 	a macro or a string.
-- G_GNUC_EXTENSION

-- #define     G_GNUC_EXTENSION

-- Expands to __extension__ when gcc is used as the compiler. This simply tells gcc not to warn about the following non-standard code when compiling with the -pedantic option.
-- G_GNUC_CONST

-- #define     G_GNUC_CONST

-- Expands to the GNU C const function attribute if the compiler is gcc. Declaring a function as const enables better optimization of calls to the function. A const function doesn't examine any values except its parameters, and has no effects except its return value. See the GNU C documentation for details.
-- Note

-- A function that has pointer arguments and examines the data pointed to must not be declared const. Likewise, a function that calls a non-const function usually must not be const. It doesn't make sense for a const function to return void.
-- G_GNUC_PURE

-- #define     G_GNUC_PURE

-- Expands to the GNU C pure function attribute if the compiler is gcc. Declaring a function as pure enables better optimization of calls to the function. A pure function has no effects except its return value and the return value depends only on the parameters and/or global variables. See the GNU C documentation for details.
-- G_GNUC_MALLOC

-- #define     G_GNUC_MALLOC

-- Expands to the GNU C malloc function attribute if the compiler is gcc. Declaring a function as malloc enables better optimization of the function. A function can have the malloc attribute if it returns a pointer which is guaranteed to not alias with any other pointer when the function returns (in practice, this means newly allocated memory). See the GNU C documentation for details.

-- Since 2.6
-- G_GNUC_DEPRECATED

-- #define     G_GNUC_DEPRECATED

-- Expands to the GNU C deprecated attribute if the compiler is gcc. It can be used to mark typedefs, variables and functions as deprecated. When called with the -Wdeprecated option, the compiler will generate warnings when deprecated interfaces are used. See the GNU C documentation for details.

-- Since 2.2
-- G_GNUC_NORETURN

-- #define     G_GNUC_NORETURN

-- Expands to the GNU C noreturn function attribute if the compiler is gcc. It is used for declaring functions which never return. It enables optimization of the function, and avoids possible compiler warnings. See the GNU C documentation for details.
-- G_GNUC_UNUSED

-- #define     G_GNUC_UNUSED

-- Expands to the GNU C unused function attribute if the compiler is gcc. It is used for declaring functions which may never be used. It avoids possible compiler warnings. See the GNU C documentation for details.
-- G_GNUC_PRINTF()

-- #define     G_GNUC_PRINTF( format_idx, arg_idx )

-- Expands to the GNU C format function attribute if the compiler is gcc. This is used for declaring functions which take a variable number of arguments, with the same syntax as printf(). It allows the compiler to type-check the arguments passed to the function. See the GNU C documentation for details.

-- gint g_snprintf (gchar  *string,
--                  gulong       n,
--                  gchar const *format,
--                  ...) G_GNUC_PRINTF (3, 4);

-- format_idx : 	the index of the argument corresponding to the format string. (The arguments are numbered from 1).
-- arg_idx : 	the index of the first of the format arguments.
-- G_GNUC_SCANF()

-- #define     G_GNUC_SCANF( format_idx, arg_idx )

-- Expands to the GNU C format function attribute if the compiler is gcc. This is used for declaring functions which take a variable number of arguments, with the same syntax as scanf(). It allows the compiler to type-check the arguments passed to the function. See the GNU C documentation for details.
-- format_idx : 	the index of the argument corresponding to the format string. (The arguments are numbered from 1).
-- arg_idx : 	the index of the first of the format arguments.
-- G_GNUC_FORMAT()

-- #define     G_GNUC_FORMAT( arg_idx )

-- Expands to the GNU C format_arg function attribute if the compiler is gcc. This function attribute specifies that a function takes a format string for a printf(), scanf(), strftime() or strfmon() style function and modifies it, so that the result can be passed to a printf(), scanf(), strftime() or strfmon() style function (with the remaining arguments to the format function the same as they would have been for the unmodified string). See the GNU C documentation for details.

-- gchar *g_dgettext (gchar *domain_name, gchar *msgid) G_GNUC_FORMAT (2);

-- arg_idx : 	the index of the argument.
-- G_GNUC_NULL_TERMINATED

-- #define     G_GNUC_NULL_TERMINATED

-- Expands to the GNU C sentinel function attribute if the compiler is gcc, or "" if it isn't. This function attribute only applies to variadic functions and instructs the compiler to check that the argument list is terminated with an explicit NULL. See the GNU C documentation for details.
-- Since: 2.8
-- G_GNUC_FUNCTION

-- #define     G_GNUC_FUNCTION

-- Expands to the GNU C __FUNCTION__ variable if the compiler is gcc, or "" if it isn't. The GNU C __FUNCTION__ variable contains the name of the current function. See the GNU C documentation for details.
-- G_GNUC_PRETTY_FUNCTION

-- #define     G_GNUC_PRETTY_FUNCTION

-- Expands to the GNU C __PRETTY_FUNCTION__ variable if the compiler is gcc, or "" if it isn't. The GNU C __PRETTY_FUNCTION__ variable contains the name of the current function. For a C program this is the same as the __FUNCTION__ variable but for C++ it also includes extra information such as the class and function prototype. See the GNU C documentation for details.
-- G_GNUC_NO_INSTRUMENT

-- #define     G_GNUC_NO_INSTRUMENT

-- Expands to the GNU C no_instrument_function function attribute if the compiler is gcc. Functions with this attribute will not be instrumented for profiling, when the compiler is called with the -finstrument-functions option. See the GNU C documentation for details.
-- G_HAVE_GNUC_VISIBILITY

-- #define G_HAVE_GNUC_VISIBILITY 1

-- This macro is defined as 1 if the the compiler supports ELF visibility attributes (currently only gcc).
-- Since: 2.6
-- G_GNUC_INTERNAL

-- #define G_GNUC_INTERNAL __attribute__((visibility("hidden")))

-- Expands to the GNU C visibility(hidden) attribute if the compiler supports it (currently only gcc). This attribute can be used for marking library functions as being used internally to the lib only, to not create inefficient PLT entries. Note that static functions do not need to be marked as internal in this way. See the GNU C documentation for details.
-- Since: 2.6
-- G_LIKELY()

-- #define     G_LIKELY(expr)

-- Hints the compiler that the expression is likely to evaluate to a true value. The compiler may use this information for optimizations.

-- if (G_LIKELY (random() != 1))
--   g_print ("not one");

-- expr : 	the expression

-- Since 2.2
-- G_UNLIKELY()

-- #define     G_UNLIKELY(expr)

-- Hints the compiler that the expression is unlikely to evaluate to a true value. The compiler may use this information for optimizations.

-- if (G_UNLIKELY (random() == 1))
--   g_print ("a random one");

-- expr : 	the expression

-- Since 2.2
-- G_STRLOC

-- #define     G_STRLOC

-- Expands to a string identifying the current code position.
-- G_STRFUNC

-- #define     G_STRFUNC

-- Expands to a string identifying the current function.

-- Since 2.4
-- G_GINT16_MODIFIER

-- #define G_GINT16_MODIFIER "h"

-- The platform dependent length modifier for constructing printf() conversion specifiers for values of type gint16 or guint16. It is a string literal, but doesn't include the percent-sign, such that you can add precision and length modifiers between percent-sign and conversion specifier and append a conversion specifier.

-- The following example prints "0x7b";

-- gint16 value = 123;
-- g_print ("%#" G_GINT16_MODIFIER "x", value);

-- Since 2.4
-- G_GINT16_FORMAT

-- #define G_GINT16_FORMAT "hi"

-- This is the platform dependent conversion specifier for scanning and printing values of type gint16. It is a string literal, but doesn't include the percent-sign, such that you can add precision and length modifiers between percent-sign and conversion specifier.

-- gint16 in;
-- gint32 out;
-- sscanf ("42", "%" G_GINT16_FORMAT, &in)
-- out = in * 1000;
-- g_print ("%" G_GINT32_FORMAT, out);

-- G_GUINT16_FORMAT

-- #define G_GUINT16_FORMAT "hu"

-- This is the platform dependent conversion specifier for scanning and printing values of type guint16. See also G_GINT16_FORMAT.
-- G_GINT32_MODIFIER

-- #define G_GINT32_MODIFIER ""

-- The platform dependent length modifier for constructing printf() conversion specifiers for values of type gint32 or guint32. See also G_GINT16_MODIFIER.

-- Since 2.4
-- G_GINT32_FORMAT

-- #define G_GINT32_FORMAT "i"

-- This is the platform dependent conversion specifier for scanning and printing values of type gint32. See also G_GINT16_FORMAT.
-- G_GUINT32_FORMAT

-- #define G_GUINT32_FORMAT "u"

-- This is the platform dependent conversion specifier for scanning and printing values of type guint32. See also G_GINT16_FORMAT.
-- G_GINT64_MODIFIER

-- #define G_GINT64_MODIFIER "ll"

-- The platform dependent length modifier for constructing printf() conversion specifiers for values of type gint64 or guint64. See also G_GINT16_MODIFIER.
-- Note

-- Some platforms do not support printing 64 bit integers, even though the types are supported. On such platforms G_GINT64_MODIFIER is not defined.

-- Since 2.4
-- G_GINT64_FORMAT

-- #define G_GINT64_FORMAT "lli"

-- This is the platform dependent conversion specifier for scanning and printing values of type gint64. See also G_GINT16_FORMAT.
-- Note

-- Some platforms do not support scanning and printing 64 bit integers, even though the types are supported. On such platforms G_GINT64_FORMAT is not defined. Note that scanf() may not support 64 bit integers, even if G_GINT64_FORMAT is defined. Due to its weak error handling, scanf() is not recommended for parsing anyway; consider using g_strtoull() instead.
-- G_GUINT64_FORMAT

-- #define G_GUINT64_FORMAT "llu"

-- This is the platform dependent conversion specifier for scanning and printing values of type guint64. See also G_GINT16_FORMAT.
-- Note

-- Some platforms do not support scanning and printing 64 bit integers, even though the types are supported. On such platforms G_GUINT64_FORMAT is not defined. Note that scanf() may not support 64 bit integers, even if G_GINT64_FORMAT is defined. Due to its weak error handling, scanf() is not recommended for parsing anyway; consider using g_strtoull() instead.
-- G_GSIZE_MODIFIER

-- #define G_GSIZE_MODIFIER ""

-- The platform dependent length modifier for constructing printf() conversion specifiers for values of type gsize or gssize. See also G_GINT16_MODIFIER.

-- Since 2.6
-- G_GSIZE_FORMAT

-- #define G_GSIZE_FORMAT "u"

-- This is the platform dependent conversion specifier for scanning and printing values of type gsize. See also G_GINT16_FORMAT.

-- Since 2.6
-- G_GSSIZE_FORMAT

-- #define G_GSSIZE_FORMAT "i"

-- This is the platform dependent conversion specifier for scanning and printing values of type gssize. See also G_GINT16_FORMAT.

-- Since 2.6
end
