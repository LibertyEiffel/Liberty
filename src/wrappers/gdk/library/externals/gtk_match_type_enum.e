-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_MATCH_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = all_low_level)  or else
				(a_value = all_tail_low_level)  or else
				(a_value = head_low_level)  or else
				(a_value = tail_low_level)  or else
				(a_value = exact_low_level)  or else
				(a_value = last_low_level) )
		end

feature -- Setters
	default_create,
	set_all is
		do
			value := all_low_level
		end

	set_all_tail is
		do
			value := all_tail_low_level
		end

	set_head is
		do
			value := head_low_level
		end

	set_tail is
		do
			value := tail_low_level
		end

	set_exact is
		do
			value := exact_low_level
		end

	set_last is
		do
			value := last_low_level
		end

feature -- Queries
	is_all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	is_all_tail: BOOLEAN is
		do
			Result := (value=all_tail_low_level)
		end

	is_head: BOOLEAN is
		do
			Result := (value=head_low_level)
		end

	is_tail: BOOLEAN is
		do
			Result := (value=tail_low_level)
		end

	is_exact: BOOLEAN is
		do
			Result := (value=exact_low_level)
		end

	is_last: BOOLEAN is
		do
			Result := (value=last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MATCH_ALL"
 			}"
 		end

	all_tail_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MATCH_ALL_TAIL"
 			}"
 		end

	head_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MATCH_HEAD"
 			}"
 		end

	tail_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MATCH_TAIL"
 			}"
 		end

	exact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MATCH_EXACT"
 			}"
 		end

	last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MATCH_LAST"
 			}"
 		end


end -- class GTK_MATCH_TYPE_ENUM
