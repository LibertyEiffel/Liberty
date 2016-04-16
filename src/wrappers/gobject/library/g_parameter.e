note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"
	description: "G_PARAMETER is an auxiliary data type (structure) used to hand parameter name/value to the creation feature of a G_OBJECT."

class G_PARAMETER
	-- An auxiliary data type (structure) used to hand parameter
	-- name/value to the creation feature of a G_OBJECT.

inherit
	C_STRUCT
	EIFFEL_OWNED

insert 
	G_PARAMETER_EXTERNALS

create {ANY} from_external_pointer
	
feature {ANY} 
	name: STRING
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

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib-object.h>"
		alias "sizeof(GParameter)"
		end	
end
