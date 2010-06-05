-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class UNDO_CODEENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = delete_low_level)  or else
				(a_value = begin_low_level)  or else
				(a_value = end_external_low_level) )
		end

feature -- Setters
	default_create,
	set_delete is
		do
			value := delete_low_level
		end

	set_begin is
		do
			value := begin_low_level
		end

	set_end_external is
		do
			value := end_external_low_level
		end

feature -- Queries
	is_delete: BOOLEAN is
		do
			Result := (value=delete_low_level)
		end

	is_begin: BOOLEAN is
		do
			Result := (value=begin_low_level)
		end

	is_end_external: BOOLEAN is
		do
			Result := (value=end_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	delete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_DELETE"
 			}"
 		end

	begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_BEGIN"
 			}"
 		end

	end_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UNDO_END"
 			}"
 		end


end -- class UNDO_CODEENUM
