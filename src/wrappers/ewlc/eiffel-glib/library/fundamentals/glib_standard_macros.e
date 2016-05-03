note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_STANDARD_MACROS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Standard Macros

-- Standard Macros %GÅ‚Äî%@ commonly-used macros.
	
-- Synopsis

-- #include <glib.h>



-- #define     G_OS_WIN32
-- #define     G_OS_BEOS
-- #define     G_OS_UNIX

-- #define     G_DIR_SEPARATOR
-- #define     G_DIR_SEPARATOR_S
-- #define     G_IS_DIR_SEPARATOR              (c)
-- #define     G_SEARCHPATH_SEPARATOR
-- #define     G_SEARCHPATH_SEPARATOR_S

-- #define     TRUE
-- #define     FALSE

-- #define     NULL

-- #define     MIN                             (a, b)
-- #define     MAX                             (a, b)

-- #define     ABS                             (a)
-- #define     CLAMP                           (x, low, high)

-- #define     G_STRUCT_MEMBER                 (member_type, struct_p, struct_offset)
-- #define     G_STRUCT_MEMBER_P               (struct_p, struct_offset)
-- #define     G_STRUCT_OFFSET                 (struct_type, member)

-- #define     G_MEM_ALIGN

-- #define     G_CONST_RETURN

-- Description

-- These macros provide a few commonly-used features.
-- Details
-- G_OS_WIN32

-- #define G_OS_WIN32

-- This macro is defined only on Windows. So you can bracket Windows-specific code in "#ifdef G_OS_WIN32".
-- G_OS_BEOS

-- #define G_OS_BEOS

-- This macro is defined only on BeOS. So you can bracket BeOS-specific code in "#ifdef G_OS_BEOS".
-- G_OS_UNIX

-- #define G_OS_UNIX

-- This macro is defined only on UNIX. So you can bracket UNIX-specific code in "#ifdef G_OS_UNIX".
-- G_DIR_SEPARATOR

-- #define     G_DIR_SEPARATOR

-- The directory separator character. This is '/' on UNIX machines and '\' under Windows.
-- G_DIR_SEPARATOR_S

-- #define     G_DIR_SEPARATOR_S

-- The directory separator as a string. This is "/" on UNIX machines and "\" under Windows.
-- G_IS_DIR_SEPARATOR()

-- #define     G_IS_DIR_SEPARATOR(c)

-- Checks whether a character is a directory separator. It returns TRUE for '/' on UNIX machines and for '\' or '/' under Windows.
-- c : 	a character

-- Since 2.6
-- G_SEARCHPATH_SEPARATOR

-- #define     G_SEARCHPATH_SEPARATOR

-- The search path separator character. This is ':' on UNIX machines and ';' under Windows.
-- G_SEARCHPATH_SEPARATOR_S

-- #define     G_SEARCHPATH_SEPARATOR_S

-- The search path separator as a string. This is ":" on UNIX machines and ";" under Windows.
-- TRUE

-- #define	TRUE	(!FALSE)

-- Defines the TRUE value for the gboolean type.
-- FALSE

-- #define	FALSE	(0)

-- Defines the FALSE value for the gboolean type.
-- NULL

-- #define     NULL

-- Defines the standard NULL pointer.
-- MIN()

-- #define MIN(a, b)  (((a) < (b)) ? (a) : (b))

-- Calculates the minimum of a and b.
-- a : 	a numeric value.
-- b : 	a numeric value.
-- Returns : 	the minimum of a and b.
-- MAX()

-- #define MAX(a, b)  (((a) > (b)) ? (a) : (b))

-- Calculates the maximum of a and b.
-- a : 	a numeric value.
-- b : 	a numeric value.
-- Returns : 	the maximum of a and b.
-- ABS()

-- #define ABS(a)	   (((a) < 0) ? -(a) : (a))

-- Calculates the absolute value of a. The absolute value is simply the number with any negative sign taken away.

-- For example,

--     *

--       ABS(-10) is 10.
--     *

--       ABS(10) is also 10.

-- a : 	a numeric value.
-- Returns : 	the absolute value of a.
-- CLAMP()

-- #define CLAMP(x, low, high)  (((x) > (high)) ? (high) : (((x) < (low)) ? (low) : (x)))

-- Ensures that x is between the limits set by low and high.

-- For example,

--     *

--       CLAMP(5, 10, 15) is 10.
--     *

--       CLAMP(15, 5, 10) is 10.
--     *

--       CLAMP(20, 15, 25) is 20.

-- x : 	the value to clamp.
-- low : 	the minimum value allowed.
-- high : 	the maximum value allowed.
-- Returns : 	the value of x clamped to the range between low and high.
-- G_STRUCT_MEMBER()

-- #define     G_STRUCT_MEMBER(member_type, struct_p, struct_offset)

-- Returns a member of a structure at a given offset, using the given type.
-- member_type : 	the type of the struct field.
-- struct_p : 	a pointer to a struct.
-- struct_offset : 	the offset of the field from the start of the struct, in bytes.
-- Returns : 	the struct member.
-- G_STRUCT_MEMBER_P()

-- #define     G_STRUCT_MEMBER_P(struct_p, struct_offset)

-- Returns an untyped pointer to a given offset of a struct.
-- struct_p : 	a pointer to a struct.
-- struct_offset : 	the offset from the start of the struct, in bytes.
-- Returns : 	an untyped pointer to struct_p plus struct_offset bytes.
-- G_STRUCT_OFFSET()

-- #define     G_STRUCT_OFFSET(struct_type, member)

-- Returns the offset, in bytes, of a member of a struct.
-- struct_type : 	a structure type, e.g. GtkWidget.
-- member : 	a field in the structure, e.g. window.
-- Returns : 	the offset of member from the start of struct_type.
-- G_MEM_ALIGN

-- #define     G_MEM_ALIGN

-- Indicates the number of bytes to which memory will be aligned on the current platform.
-- G_CONST_RETURN

-- #define     G_CONST_RETURN

-- If G_DISABLE_CONST_RETURNS is defined, this macro expands to nothing. By default, the macro expands to const. The macro should be used in place of const for functions that return a value that should not be modified. The purpose of this macro is to allow us to turn on const for returned constant strings by default, while allowing programmers who find that annoying to turn it off. This macro should only be used for return values and for out parameters, it doesn't make sense for in parameters.
end
