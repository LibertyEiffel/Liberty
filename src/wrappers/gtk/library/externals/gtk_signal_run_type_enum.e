-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SIGNAL_RUN_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = first_low_level)  or else
				(a_value = last_low_level)  or else
				(a_value = both_low_level)  or else
				(a_value = no_recurse_low_level)  or else
				(a_value = action_low_level)  or else
				(a_value = no_hooks_low_level) )
		end

feature -- Setters
	default_create,
	set_first is
		do
			value := first_low_level
		end

	set_last is
		do
			value := last_low_level
		end

	set_both is
		do
			value := both_low_level
		end

	set_no_recurse is
		do
			value := no_recurse_low_level
		end

	set_action is
		do
			value := action_low_level
		end

	set_no_hooks is
		do
			value := no_hooks_low_level
		end

feature -- Queries
	is_first: BOOLEAN is
		do
			Result := (value=first_low_level)
		end

	is_last: BOOLEAN is
		do
			Result := (value=last_low_level)
		end

	is_both: BOOLEAN is
		do
			Result := (value=both_low_level)
		end

	is_no_recurse: BOOLEAN is
		do
			Result := (value=no_recurse_low_level)
		end

	is_action: BOOLEAN is
		do
			Result := (value=action_low_level)
		end

	is_no_hooks: BOOLEAN is
		do
			Result := (value=no_hooks_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	first_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RUN_FIRST"
 			}"
 		end

	last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RUN_LAST"
 			}"
 		end

	both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RUN_BOTH"
 			}"
 		end

	no_recurse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RUN_NO_RECURSE"
 			}"
 		end

	action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RUN_ACTION"
 			}"
 		end

	no_hooks_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RUN_NO_HOOKS"
 			}"
 		end


end -- class GTK_SIGNAL_RUN_TYPE_ENUM
