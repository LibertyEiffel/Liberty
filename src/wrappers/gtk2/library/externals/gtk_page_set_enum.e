-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PAGE_SET_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = all_low_level)  or else
				(a_value = even_low_level)  or else
				(a_value = odd_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_all is
		do
			value := all_low_level
		end

	set_even is
		do
			value := even_low_level
		end

	set_odd is
		do
			value := odd_low_level
		end

feature {ANY} -- Queries
	all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	even: BOOLEAN is
		do
			Result := (value=even_low_level)
		end

	odd: BOOLEAN is
		do
			Result := (value=odd_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_SET_ALL"
 			}"
 		end

	even_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_SET_EVEN"
 			}"
 		end

	odd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_SET_ODD"
 			}"
 		end


end -- class GTK_PAGE_SET_ENUM
