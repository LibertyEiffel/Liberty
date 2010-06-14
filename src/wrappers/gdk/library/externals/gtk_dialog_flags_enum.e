-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DIALOG_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (modal_low_level | 
				no_separator_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_modal is
		do
			value := value.bit_or(modal_low_level)
		end

	unset_modal is
		do
			value := value.bit_xor(modal_low_level)
		end

	set_no_separator is
		do
			value := value.bit_or(no_separator_low_level)
		end

	unset_no_separator is
		do
			value := value.bit_xor(no_separator_low_level)
		end

feature -- Queries
	is_modal: BOOLEAN is
		do
			Result := (value=modal_low_level)
		end

	is_no_separator: BOOLEAN is
		do
			Result := (value=no_separator_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	modal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DIALOG_MODAL"
 			}"
 		end

	no_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DIALOG_NO_SEPARATOR"
 			}"
 		end


end -- class GTK_DIALOG_FLAGS_ENUM
