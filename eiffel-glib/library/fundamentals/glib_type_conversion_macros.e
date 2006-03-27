indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_TYPE_CONVERSION_MACROS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Type Conversion Macros

-- Type Conversion Macros %GÅ‚Äî%@ portably storing integers in pointer variables.
	
-- Synopsis

-- #include <glib.h>


-- #define     GINT_TO_POINTER                 (i)
-- #define     GPOINTER_TO_INT                 (p)

-- #define     GUINT_TO_POINTER                (u)
-- #define     GPOINTER_TO_UINT                (p)
-- #define     GSIZE_TO_POINTER                (s)
-- #define     GPOINTER_TO_SIZE                (p)

-- Description

-- Many times GLib, GTK+, and other libraries allow you to pass "user data" to a callback, in the form of a void pointer. From time to time you want to pass an integer instead of a pointer. You could allocate an integer, with something like:

--  int *ip = g_new (int, 1);
--  *ip = 42;

-- But this is inconvenient, and it's annoying to have to free the memory at some later time.

-- Pointers are always at least 32 bits in size (on all platforms GLib intends to support). Thus you can store at least 32-bit integer values in a pointer value. Naively, you might try this, but it's incorrect:

--  gpointer p;
--  int i;
--  p = (void*) 42;
--  i = (int) p;

-- Again, that example was not correct, don't copy it. The problem is that on some systems you need to do this:

--  gpointer p;
--  int i;
--  p = (void*) (long) 42;
--  i = (int) (long) p;

-- So GPOINTER_TO_INT(), GINT_TO_POINTER(), etc. do the right thing on the current platform.

-- Warning

-- YOU MAY NOT STORE POINTERS IN INTEGERS. THIS IS NOT PORTABLE IN ANY WAY SHAPE OR FORM. These macros ONLY allow storing integers in pointers, and only preserve 32 bits of the integer; values outside the range of a 32-bit integer will be mangled.

-- Details
-- GINT_TO_POINTER()

-- #define GINT_TO_POINTER(i)	((gpointer)  (i))

-- Stuffs an integer into a pointer type.

-- Remember, YOU MAY NOT STORE POINTERS IN INTEGERS. THIS IS NOT PORTABLE IN ANY WAY SHAPE OR FORM. These macros ONLY allow storing integers in pointers, and only preserve 32 bits of the integer; values outside the range of a 32-bit integer will be mangled.
-- i : 	integer to stuff into a pointer.
-- GPOINTER_TO_INT()

-- #define GPOINTER_TO_INT(p)	((gint)   (p))

-- Extracts an integer from a pointer. The integer must have been stored in the pointer with GINT_TO_POINTER().

-- Remember, YOU MAY NOT STORE POINTERS IN INTEGERS. THIS IS NOT PORTABLE IN ANY WAY SHAPE OR FORM. These macros ONLY allow storing integers in pointers, and only preserve 32 bits of the integer; values outside the range of a 32-bit integer will be mangled.
-- p : 	pointer containing an integer.
-- GUINT_TO_POINTER()

-- #define GUINT_TO_POINTER(u)	((gpointer)  (u))

-- Stuffs an unsigned integer into a pointer type.
-- u : 	unsigned integer to stuff into the pointer.
-- GPOINTER_TO_UINT()

-- #define GPOINTER_TO_UINT(p)	((guint)  (p))

-- Extracts an unsigned integer from a pointer. The integer must have been stored in the pointer with GUINT_TO_POINTER().
-- p : 	pointer to extract an unsigned integer from.
-- GSIZE_TO_POINTER()

-- #define GSIZE_TO_POINTER(s)	((gpointer) (gsize) (s))

-- Stuffs a gsize into a pointer type.
-- s : 	gsize to stuff into the pointer.
-- GPOINTER_TO_SIZE()

-- #define GPOINTER_TO_SIZE(p)	((gsize) (p))

-- Extracts a gsize from a pointer. The gsize must have been stored in the pointer with GSIZE_TO_POINTER().
-- p : 	pointer to extract a gsize from.
end
	
