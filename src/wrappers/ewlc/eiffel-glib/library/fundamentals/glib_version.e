note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"


class GLIB_VERSION
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Version Information

-- Version Information %GÅ‚Äî%@ Variables and functions to check the GLib version
	
-- Synopsis

-- #include <glib.h>


-- extern      const guint glib_major_version;
-- extern      const guint glib_minor_version;
-- extern      const guint glib_micro_version;
-- extern      const guint glib_binary_age;
-- extern      const guint glib_interface_age;
-- const gchar* glib_check_version             (guint required_major,
--                                              guint required_minor,
--                                              guint required_micro);

-- #define     GLIB_MAJOR_VERSION
-- #define     GLIB_MINOR_VERSION
-- #define     GLIB_MICRO_VERSION
-- #define     GLIB_CHECK_VERSION              (major,minor,micro)

-- Description

-- GLib provides version information, primarily useful in configure checks for builds that have a configure script. Applications will not typically use the features described here.
-- Details
-- glib_major_version

-- extern const guint glib_major_version;

-- The major version number of the GLib library. (e.g. in GLib version 1.2.5 this is 1.)

-- This variable is in the library, so represents the GLib library you have linked against. Contrast with the GLIB_MAJOR_VERSION macro, which represents the major version of the GLib headers you have included.
-- glib_minor_version

-- extern const guint glib_minor_version;

-- The minor version number of the GLib library. (e.g. in GLib version 1.2.5 this is 2.)

-- This variable is in the library, so represents the GLib library you have linked against. Contrast with the GLIB_MINOR_VERSION macro, which represents the minor version of the GLib headers you have included.
-- glib_micro_version

-- extern const guint glib_micro_version;

-- The micro version number of the GLib library. (e.g. in GLib version 1.2.5 this is 5.)

-- This variable is in the library, so represents the GLib library you have linked against. Contrast with the GLIB_MICRO_VERSION macro, which represents the micro version of the GLib headers you have included.
-- glib_binary_age

-- extern const guint glib_binary_age;

-- This is the binary age passed to libtool. If libtool means nothing to you, don't worry about it. ;-)
-- glib_interface_age

-- extern const guint glib_interface_age;

-- This is the interface age passed to libtool. If libtool means nothing to you, don't worry about it. ;-)
-- glib_check_version ()

-- const gchar* glib_check_version             (guint required_major,
--                                              guint required_minor,
--                                              guint required_micro);

-- Checks that the GLib library in use is compatible with the given version. Generally you would pass in the constants GLIB_MAJOR_VERSION, GLIB_MINOR_VERSION, GLIB_MICRO_VERSION as the three arguments to this function; that produces a check that the library in use is compatible with the version of GLib the application or module was compiled against.

-- Compatibility is defined by two things: first the version of the running library is newer than the version required_major.required_minor.required_micro. Second the running library must be binary compatible with the version required_major.required_minor.required_micro (same major version.)

-- required_major : 	the required major version.
-- required_minor : 	the required major version.
-- required_micro : 	the required major version.
-- Returns : 	NULL if the GLib library is compatible with the given version, or a string describing the version mismatch. The returned string is owned by GLib and must not be modified or freed.

-- Since 2.6
-- GLIB_MAJOR_VERSION

-- #define GLIB_MAJOR_VERSION 2

-- The major version number of the GLib library. Like glib_major_version, but from the headers used at application compile time, rather than from the library linked against at application run time.
-- GLIB_MINOR_VERSION

-- #define GLIB_MINOR_VERSION 8

-- The minor version number of the GLib library. Like gtk_minor_version, but from the headers used at application compile time, rather than from the library linked against at application run time.
-- GLIB_MICRO_VERSION

-- #define GLIB_MICRO_VERSION 3

-- The micro version number of the GLib library. Like gtk_micro_version, but from the headers used at application compile time, rather than from the library linked against at application run time.
-- GLIB_CHECK_VERSION()

-- #define     GLIB_CHECK_VERSION(major,minor,micro)

-- Checks the version of the GLib library. Returns TRUE if the version of the GLib header files is the same as or newer than the passed-in version.

-- Example 1. Checking the version of the GLib library

--   if (!GLIB_CHECK_VERSION (1, 2, 0))
--     g_error ("GLib version 1.2.0 or above is needed");

-- major : 	the major version number.
-- minor : 	the minor version number.
-- micro : 	the micro version number.
end
	
