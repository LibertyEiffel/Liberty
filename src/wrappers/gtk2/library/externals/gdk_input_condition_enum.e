-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_INPUT_CONDITION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_input_exception_low_level | 
				gdk_input_write_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gdk_input_exception is
		do
			value := value.bit_or(gdk_input_exception_low_level)
		end

	unset_gdk_input_exception is
		do
			value := value.bit_xor(gdk_input_exception_low_level)
		end

	set_gdk_input_write is
		do
			value := value.bit_or(gdk_input_write_low_level)
		end

	unset_gdk_input_write is
		do
			value := value.bit_xor(gdk_input_write_low_level)
		end

feature -- Queries
	is_gdk_input_exception: BOOLEAN is
		do
			Result := (value=gdk_input_exception_low_level)
		end

	is_gdk_input_write: BOOLEAN is
		do
			Result := (value=gdk_input_write_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_input_exception_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_INPUT_EXCEPTION"
 			}"
 		end

	gdk_input_write_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_INPUT_WRITE"
 			}"
 		end


end -- class GDK_INPUT_CONDITION_ENUM
