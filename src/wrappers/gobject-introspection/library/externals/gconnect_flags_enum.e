-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONNECT_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_connect_after_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_g_connect_after is
		do
			value := value.bit_or(g_connect_after_low_level)
		end

	unset_g_connect_after is
		do
			value := value.bit_xor(g_connect_after_low_level)
		end

feature -- Queries
	is_g_connect_after: BOOLEAN is
		do
			Result := (value=g_connect_after_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_connect_after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_CONNECT_AFTER"
 			}"
 		end


end -- class GCONNECT_FLAGS_ENUM
