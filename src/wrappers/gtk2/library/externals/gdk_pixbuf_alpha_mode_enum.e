-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PIXBUF_ALPHA_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = bilevel_low_level)  or else
				(a_value = full_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bilevel is
		do
			value := bilevel_low_level
		end

	set_full is
		do
			value := full_low_level
		end

feature {ANY} -- Queries
	bilevel: BOOLEAN is
		do
			Result := (value=bilevel_low_level)
		end

	full: BOOLEAN is
		do
			Result := (value=full_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	bilevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ALPHA_BILEVEL"
 			}"
 		end

	full_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ALPHA_FULL"
 			}"
 		end


end -- class GDK_PIXBUF_ALPHA_MODE_ENUM
