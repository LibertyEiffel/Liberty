indexing
	description: "The GParameter struct is an auxiliary structure used to hand parameter name/value pairs to g_object_newv()."
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"


class G_PARAMETER

inherit ANY undefine is_equal, copy end

feature
	get_name (gparameter: POINTER): POINTER is
		external "C struct GParameter get name use <glib-object.h>"
		end

	get_value (gparameter: POINTER): POINTER is
		external "C struct GParameter get value use <glib-object.h>"
		end
	
	set_name (gparameter: POINTER): POINTER is
		external "C struct GParameter get name use <glib-object.h>"
		end

	set_value (gpointer, gvalue: POINTER): POINTER is
		external "C struct GParameter get value use <glib-object.h>"
		end
	
	-- typedef struct {
	--   const gchar *name;
	--   GValue       value;
	-- } GParameter;

	-- gparameter: POINTER to GParameter
	-- const gchar *name; 	the parameter name
	-- GValue value; 	the parameter value
end

