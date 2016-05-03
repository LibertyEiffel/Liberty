-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_PATH_DATA_T_UNION
-- Wrapper of union cairo_path_data_t defined in file /usr/include/cairo/cairo.h line 2043

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field header.
	-- Unwrappable field point.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_cairo_path_data_t"
               }"
               end

end -- class CAIRO_PATH_DATA_T_UNION
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
