-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CMPRESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = lessthan_low_level)  or else
				(a_value = greaterthan_low_level)  or else
				(a_value = unordered_low_level) )
		end

feature -- Setters
	default_create,
	set_lessthan is
		do
			value := lessthan_low_level
		end

	set_greaterthan is
		do
			value := greaterthan_low_level
		end

	set_unordered is
		do
			value := unordered_low_level
		end

feature -- Queries
	is_lessthan: BOOLEAN is
		do
			Result := (value=lessthan_low_level)
		end

	is_greaterthan: BOOLEAN is
		do
			Result := (value=greaterthan_low_level)
		end

	is_unordered: BOOLEAN is
		do
			Result := (value=unordered_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	lessthan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "cmpLessThan"
 			}"
 		end

	greaterthan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "cmpGreaterThan"
 			}"
 		end

	unordered_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "cmpUnordered"
 			}"
 		end


end -- class CMPRESULT_ENUM
