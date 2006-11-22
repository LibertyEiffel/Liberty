indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"
	description: "G_PARAMETER is an auxiliary data type (structure) used to hand parameter name/value to the creation feature of a G_OBJECT."

class G_PARAMETER

inherit
	C_STRUCT

insert 
	G_PARAMETER_EXTERNALS

creation make
	
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

