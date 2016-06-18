note
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class GLIB_BASIC_TYPES
	-- GLib defines a number of commonly used types, which can be
	-- divided into 4 groups:

	-- o New types which are not part of standard C - gboolean, gsize,
	-- gssize. 

	-- o Integer types which are guaranteed to be the same size across
	-- all platforms - gint8, guint8, gint16, guint16, gint32, guint32,
	-- gint64, guint64.

	-- o Types which are easier to use than their standard C
	-- counterparts - gpointer, gconstpointer, guchar, guint, gushort,
	-- gulong.

	-- o Types which correspond exactly to standard C types, but are
	-- included for completeness - gchar, gint, gshort, glong, gfloat,
	-- gdouble.

insert ANY undefine is_equal, copy end

feature {ANY} -- Basic Types: standard GLib types, defined for ease-of-use and portability.
	--  #include <glib.h>

	--  typedef     gboolean;
	--  typedef     gpointer;
	--  typedef     gconstpointer;
	--  typedef     gchar;
	--  typedef     guchar;

	--  typedef     gint;
	--  typedef     guint;
	--  typedef     gshort;
	--  typedef     gushort;
	--  typedef     glong;
	--  typedef     gulong;

	--  typedef     gint8;
	--  typedef     guint8;
	--  typedef     gint16;
	--  typedef     guint16;
	--  typedef     gint32;
	--  typedef     guint32;

	--  #define     G_HAVE_GINT64
	--  typedef     gint64;
	--  typedef     guint64;
	--  #define     G_GINT64_CONSTANT               (val)
	--  #define     G_GUINT64_CONSTANT              (val)

	--  typedef     gfloat;
	--  typedef     gdouble;

	--  typedef     gsize;
	--  typedef     gssize;

	gboolean: INTEGER
			-- The standard boolean typein Glib type system. Variables of
			-- this type should only contain the value TRUE (i.e. 1) or
			-- FALSE (i.e. 0).
		
			--  typedef gint   gboolean;
		do
			-- Empty by design
		end

	--    --------------------------------------------------------------------------

	--   gpointer

	--  typedef void* gpointer;

	--    An untyped pointer. gpointer looks better and is easier to use than void*.

	--   gconstpointer

	--  typedef const void *gconstpointer;

	--    An untyped pointer to constant data. The data pointed to should not be
	--    changed.

	--    This is typically used in function prototypes to indicate that the data
	--    pointed to will not be altered by the function.

	--    --------------------------------------------------------------------------

	--   gchar

	--  typedef char   gchar;

	--    Corresponds to the standard C char type.

	--    --------------------------------------------------------------------------

	--   guchar

	--  typedef unsigned char   guchar;

	--    Corresponds to the standard C unsigned char type.

	--    --------------------------------------------------------------------------

	--   gint

	--  typedef int    gint;

	--    Corresponds to the standard C int type. Values of this type can range from
	--    G_MININT to G_MAXINT.

	--    --------------------------------------------------------------------------

	--   guint

	--  typedef unsigned int    guint;

	--    Corresponds to the standard C unsigned int type. Values of this type can
	--    range from 0 to G_MAXUINT.

	--    --------------------------------------------------------------------------

	--   gshort

	--  typedef short  gshort;

	--    Corresponds to the standard C short type. Values of this type can range
	--    from G_MINSHORT to G_MAXSHORT.

	--    --------------------------------------------------------------------------

	--   gushort

	--  typedef unsigned short  gushort;

	--    Corresponds to the standard C unsigned short type. Values of this type can
	--    range from 0 to G_MAXUSHORT.

	glong_size: INTEGER
		external "C use <glib.h>"
		alias "sizeof(glong)"
		end
	
	glong: INTEGER
			--  typedef long   glong;
		
			-- Corresponds to the standard C long type. Values of this type can
			-- range from G_MINLONG to G_MAXLONG.
		do
			-- empty by design
		ensure glong_is_32_bit: glong_size=4
		end

	--   gulong

	--  typedef unsigned long   gulong;

	--    Corresponds to the standard C unsigned long type. Values of this type can
	--    range from 0 to G_MAXULONG.

	--   gint8

	--  typedef signed char gint8;

	--    A signed integer guaranteed to be 8 bits on all platforms. Values of this
	--    type can range from -128 to 127.

	--   guint8

	--  typedef unsigned char guint8;

	--    An unsigned integer guaranteed to be 8 bits on all platforms. Values of
	--    this type can range from 0 to 255.

	--   gint16

	--  typedef signed short gint16;

	--    A signed integer guaranteed to be 16 bits on all platforms. Values of this
	--    type can range from -32,768 to 32,767.

	--   guint16

	--  typedef unsigned short guint16;

	--    An unsigned integer guaranteed to be 16 bits on all platforms. Values of
	--    this type can range from 0 to 65,535.

	--   gint32

	--  typedef signed int gint32;

	--    A signed integer guaranteed to be 32 bits on all platforms. Values of this
	--    type can range from -2,147,483,648 to 2,147,483,647.

	--   guint32

	--  typedef unsigned int guint32;

	--    An unsigned integer guaranteed to be 32 bits on all platforms. Values of
	--    this type can range from 0 to 4,294,967,295.

	--   gint64

	--  G_GNUC_EXTENSION typedef signed long long gint64;

	--    A signed integer guaranteed to be 64 bits on all platforms. Values of this
	--    type can range from -9,223,372,036,854,775,808 to
	--    9,223,372,036,854,775,807.

	--   guint64

	--  G_GNUC_EXTENSION typedef unsigned long long guint64;

	--    An unsigned integer guaranteed to be 64 bits on all platforms. Values of
	--    this type can range from 0 to 18,446,744,073,709,551,615.

	--   G_GINT64_CONSTANT()

	--  #define G_GINT64_CONSTANT(val)  (G_GNUC_EXTENSION (val##LL))

	--    This macro is used to insert 64-bit integer literals into the source code.

	--    val : a literal integer value, e.g. 0x1d636b02300a7aa7U.

	--   G_GUINT64_CONSTANT()

	--  #define G_GUINT64_CONSTANT(val) (G_GNUC_EXTENSION (val##ULL))

	--    This macro is used to insert 64-bit unsigned integer literals into the
	--    source code.

	--    val : a literal integer value, e.g. 0x1d636b02300a7aa7U.

	--    Since 2.10

	--   gfloat

	--  typedef float   gfloat;

	--    Corresponds to the standard C float type. Values of this type can range
	--    from -G_MAXFLOAT to G_MAXFLOAT.

	--   gdouble

	--  typedef double  gdouble;

	--    Corresponds to the standard C double type. Values of this type can range
	--    from -G_MAXDOUBLE to G_MAXDOUBLE.

	gsize: INTEGER
			-- An unsigned 32-bit integer intended to represent sizes of
			-- data structures.

			--  typedef unsigned int gsize;
		
			-- TODO: should be NATURAL, since it is implemented as an unsigned int.
		do
			-- empty by design
		end

	gssize: INTEGER
			-- A signed 32-bit integer intended to represent sizes of
			-- data structures.

			-- typedef signed int gssize;
		do
			-- Empty by design
		end
	
feature {ANY} -- Limits of Basic Types
	-- Limits of Basic Types:  portable method of determining the limits of the standard types.
	
-- #include <glib.h>


-- #define     G_MININT
-- #define     G_MAXINT
-- #define     G_MAXUINT

-- #define     G_MINSHORT
-- #define     G_MAXSHORT
-- #define     G_MAXUSHORT

-- #define     G_MINLONG
-- #define     G_MAXLONG
-- #define     G_MAXULONG

-- #define     G_MININT8
-- #define     G_MAXINT8
-- #define     G_MAXUINT8

-- #define     G_MININT16
-- #define     G_MAXINT16
-- #define     G_MAXUINT16

-- #define     G_MININT32
-- #define     G_MAXINT32
-- #define     G_MAXUINT32

-- #define     G_MININT64
-- #define     G_MAXINT64
-- #define     G_MAXUINT64

-- #define     G_MAXSIZE

-- #define     G_MINFLOAT
-- #define     G_MAXFLOAT

-- #define     G_MINDOUBLE
-- #define     G_MAXDOUBLE

-- Description

-- These macros provide a portable method to determine the limits of some of the standard integer and floating point types.
-- Details
-- G_MININT

-- #define G_MININT	INT_MIN

-- The minimum value which can be held in a gint.
-- G_MAXINT

-- #define G_MAXINT	INT_MAX

-- The maximum value which can be held in a gint.
-- G_MAXUINT

-- #define G_MAXUINT	UINT_MAX

-- The maximum value which can be held in a guint.
-- G_MINSHORT

-- #define G_MINSHORT	SHRT_MIN

-- The minimum value which can be held in a gshort.
-- G_MAXSHORT

-- #define G_MAXSHORT	SHRT_MAX

-- The maximum value which can be held in a gshort.
-- G_MAXUSHORT

-- #define G_MAXUSHORT	USHRT_MAX

-- The maximum value which can be held in a gushort.
-- G_MINLONG

-- #define G_MINLONG	LONG_MIN

-- The minimum value which can be held in a glong.
-- G_MAXLONG

-- #define G_MAXLONG	LONG_MAX

-- The maximum value which can be held in a glong.
-- G_MAXULONG

-- #define G_MAXULONG	ULONG_MAX

-- The maximum value which can be held in a gulong.
-- G_MININT8

-- #define G_MININT8	((gint8)  0x80)

-- The minimum value which can be held in a gint8.

-- Since 2.4
-- G_MAXINT8

-- #define G_MAXINT8	((gint8)  0x7f)

-- The maximum value which can be held in a gint8.

-- Since 2.4
-- G_MAXUINT8

-- #define G_MAXUINT8	((guint8) 0xff)

-- The maximum value which can be held in a guint8.

-- Since 2.4
-- G_MININT16

-- #define G_MININT16	((gint16)  0x8000)

-- The minimum value which can be held in a gint16.

-- Since 2.4
-- G_MAXINT16

-- #define G_MAXINT16	((gint16)  0x7fff)

-- The maximum value which can be held in a gint16.

-- Since 2.4
-- G_MAXUINT16

-- #define G_MAXUINT16	((guint16) 0xffff)

-- The maximum value which can be held in a guint16.

-- Since 2.4
-- G_MININT32

-- #define G_MININT32	((gint32)  0x80000000)

-- The minimum value which can be held in a gint32.

-- Since 2.4
-- G_MAXINT32

-- #define G_MAXINT32	((gint32)  0x7fffffff)

-- The maximum value which can be held in a gint32.

-- Since 2.4
-- G_MAXUINT32

-- #define G_MAXUINT32	((guint32) 0xffffffff)

-- The maximum value which can be held in a guint32.

-- Since 2.4
-- G_MININT64

-- #define G_MININT64	((gint64) G_GINT64_CONSTANT(0x8000000000000000))

-- The minimum value which can be held in a gint64.
-- G_MAXINT64

-- #define G_MAXINT64	G_GINT64_CONSTANT(0x7fffffffffffffff)

-- The maximum value which can be held in a gint64.
-- G_MAXUINT64

-- #define G_MAXUINT64	G_GINT64_CONSTANT(0xffffffffffffffffU)

-- The maximum value which can be held in a guint64.
-- G_MAXSIZE

-- #define G_MAXSIZE	G_MAXUINT

-- The maximum value which can be held in a gsize.

-- Since 2.4
-- G_MINFLOAT

-- #define G_MINFLOAT	FLT_MIN

-- The minimum positive value which can be held in a gfloat.

-- If you are interested in the smallest value which can be held in a gfloat, use -G_MAX_FLOAT.
-- G_MAXFLOAT

-- #define G_MAXFLOAT	FLT_MAX

-- The maximum value which can be held in a gfloat.
-- G_MINDOUBLE

-- #define G_MINDOUBLE	DBL_MIN

-- The minimum positive value which can be held in a gdouble.

-- If you are interested in the smallest value which can be held in a gdouble, use -G_MAXDOUBLE.
-- G_MAXDOUBLE

-- #define G_MAXDOUBLE	DBL_MAX

-- The maximum value which can be held in a gdouble.
end
	
