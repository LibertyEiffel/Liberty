indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"
	description: "G_PARAMETER is an auxiliary data type (structure) used to hand parameter name/value to the creation feature of a G_OBJECT."

class G_PARAMETER

inherit
	C_STRUCT

insert 
	G_PARAMETER_EXTERNALS

creation from_external_pointer
	
feature 
	name: STRING is
			-- the parameter name
		do
			create {CONST_STRING} Result.from_external(get_name(handle))
		end
	
	
	-- typedef struct {
	--   const gchar *name;
	--   GValue       value;
	-- } GParameter;

	-- gparameter: POINTER to GParameter
	-- const gchar *name; 	the parameter name
	-- GValue value; 	the parameter value

feature -- size
	struct_size: INTEGER is
		external "C inline use <glib-object.h>"
		alias "sizeof(GParameter)"
		end	
end
