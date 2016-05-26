-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIREPOSITORY_LOAD_FLAGS_ENUM

-- Wrapper of enum GIRepositoryLoadFlags defined in file /usr/include/gobject-introspection-1.0/girepository.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (g_irepository_load_flag_lazy_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_g_irepository_load_flag_lazy
               do
                       value := value.bit_or(g_irepository_load_flag_lazy_low_level)
               end

	unset_g_irepository_load_flag_lazy
               do
                       value := value.bit_xor(g_irepository_load_flag_lazy_low_level)
               end

feature {ANY} -- Queries
       is_g_irepository_load_flag_lazy: BOOLEAN
               do
                       Result := (value=g_irepository_load_flag_lazy_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     g_irepository_load_flag_lazy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IREPOSITORY_LOAD_FLAG_LAZY"
                       }"
               end


end -- class GIREPOSITORY_LOAD_FLAGS_ENUM
