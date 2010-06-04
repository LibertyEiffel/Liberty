-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class UNDO_CODEENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = d_elete_low_level)  or else
				(a_value = b_egin_low_level)  or else
				(a_value = e_nd_low_level) )
		end

feature -- Setters
	default_create,
	set_d_elete is
		do
			value := d_elete_low_level
		end

	set_b_egin is
		do
			value := b_egin_low_level
		end

	set_e_nd is
		do
			value := e_nd_low_level
		end

feature -- Queries
	is_d_elete: BOOLEAN is
		do
			Result := (value=d_elete_low_level)
		end

	is_b_egin: BOOLEAN is
		do
			Result := (value=b_egin_low_level)
		end

	is_e_nd: BOOLEAN is
		do
			Result := (value=e_nd_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	d_elete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_DELETE"
 			}"
 		end

	b_egin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_BEGIN"
 			}"
 		end

	e_nd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_END"
 			}"
 		end


end -- class UNDO_CODEENUM
