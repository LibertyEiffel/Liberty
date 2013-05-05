-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIREPOSITORY_LOAD_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_irepository_load_flag_lazy_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_g_irepository_load_flag_lazy is
		do
			value := value.bit_or(g_irepository_load_flag_lazy_low_level)
		end

	unset_g_irepository_load_flag_lazy is
		do
			value := value.bit_xor(g_irepository_load_flag_lazy_low_level)
		end

feature -- Queries
	is_g_irepository_load_flag_lazy: BOOLEAN is
		do
			Result := (value=g_irepository_load_flag_lazy_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_irepository_load_flag_lazy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_IREPOSITORY_LOAD_FLAG_LAZY"
 			}"
 		end


end -- class GIREPOSITORY_LOAD_FLAGS_ENUM
