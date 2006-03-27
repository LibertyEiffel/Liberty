indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_BASIC_TYPES

-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Limits of Basic Types

-- Limits of Basic Types %GÅ‚Äî%@ portable method of determining the limits of the standard types.
	
-- Synopsis

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
	
