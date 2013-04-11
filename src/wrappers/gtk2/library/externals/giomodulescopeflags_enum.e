-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOMODULESCOPEFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_io_module_scope_block_duplicates_low_level)  or else
				(a_value = g_io_module_scope_none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_io_module_scope_block_duplicates is
		do
			value := g_io_module_scope_block_duplicates_low_level
		end

	set_g_io_module_scope_none is
		do
			value := g_io_module_scope_none_low_level
		end

feature {ANY} -- Queries
	is_g_io_module_scope_block_duplicates: BOOLEAN is
		do
			Result := (value=g_io_module_scope_block_duplicates_low_level)
		end

	is_g_io_module_scope_none: BOOLEAN is
		do
			Result := (value=g_io_module_scope_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_module_scope_block_duplicates_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_MODULE_SCOPE_BLOCK_DUPLICATES"
 			}"
 		end

	g_io_module_scope_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_MODULE_SCOPE_NONE"
 			}"
 		end


end -- class GIOMODULESCOPEFLAGS_ENUM
