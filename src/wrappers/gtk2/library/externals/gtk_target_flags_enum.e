-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TARGET_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (same_app_low_level | 
				other_app_low_level | 
				other_widget_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_same_app is
		do
			value := value.bit_or(same_app_low_level)
		end

	unset_same_app is
		do
			value := value.bit_xor(same_app_low_level)
		end

	set_other_app is
		do
			value := value.bit_or(other_app_low_level)
		end

	unset_other_app is
		do
			value := value.bit_xor(other_app_low_level)
		end

	set_other_widget is
		do
			value := value.bit_or(other_widget_low_level)
		end

	unset_other_widget is
		do
			value := value.bit_xor(other_widget_low_level)
		end

feature {ANY} -- Queries
	is_same_app: BOOLEAN is
		do
			Result := (value=same_app_low_level)
		end

	is_other_app: BOOLEAN is
		do
			Result := (value=other_app_low_level)
		end

	is_other_widget: BOOLEAN is
		do
			Result := (value=other_widget_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	same_app_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TARGET_SAME_APP"
 			}"
 		end

	other_app_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TARGET_OTHER_APP"
 			}"
 		end

	other_widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TARGET_OTHER_WIDGET"
 			}"
 		end


end -- class GTK_TARGET_FLAGS_ENUM
