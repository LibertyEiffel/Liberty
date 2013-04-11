-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSEEK_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = cur_low_level)  or else
				(a_value = set_low_level)  or else
				(a_value = end_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_cur is
		do
			value := cur_low_level
		end

	set_set is
		do
			value := set_low_level
		end

	set_end_external is
		do
			value := end_external_low_level
		end

feature {ANY} -- Queries
	is_cur: BOOLEAN is
		do
			Result := (value=cur_low_level)
		end

	is_set: BOOLEAN is
		do
			Result := (value=set_low_level)
		end

	is_end_external: BOOLEAN is
		do
			Result := (value=end_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cur_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SEEK_CUR"
 			}"
 		end

	set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SEEK_SET"
 			}"
 		end

	end_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SEEK_END"
 			}"
 		end


end -- class GSEEK_TYPE_ENUM
