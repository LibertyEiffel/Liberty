-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DIR_STRUCT
-- Wrapper of struct __dirstream defined in file /usr/include/dirent.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_dir"
               }"
               end

end -- class DIR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
