note
	description: "External calls for accessing GFlagsClass"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_FLAGS_CLASS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
--   GFlagsClass

--  typedef struct {
--    GTypeClass   g_type_class;

--    guint        mask;
--    guint        n_values;
--    GFlagsValue *values;
--  } GFlagsClass;

--    The class of a flags type holds information about its possible values.

--    GTypeClass g_type_class; the parent class
--    guint mask;              a mask covering all possible values.
--    guint n_values;          the number of possible values.
--    GFlagsValue *values;     an array of GFlagsValue structs describing the
--                             individual values.
	get_mask (a_gflags: POINTER): INTEGER
			-- Get the mask covering all possible values.
			-- TODO: should be NATURAL, since it's a guint
		external "C struct GFlagsClass get mask use <glib-gobject.h>"
		end

	get_n_values (a_gflags: POINTER): INTEGER
			-- Get the number of possible values.
			-- TODO: should be NATURAL, since it's a guint
		external "C struct GFlagsClass get n_values use <glib-gobject.h>"
		end

	get_values (a_gflags: POINTER): POINTER
			-- Get the an array of GFlagsValue structs describing the --
			-- individual values.
		external "C struct GFlagsClass get values use <glib-gobject.h>"
		end
end
