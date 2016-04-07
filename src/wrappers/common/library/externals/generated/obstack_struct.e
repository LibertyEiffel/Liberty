-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class OBSTACK_STRUCT
-- Wrapper of struct obstack defined in file /usr/include/stdio.h

insert STANDARD_C_LIBRARY_TYPES

	STANDARD_C_LIBRARY_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_obstack"
               }"
               end

end -- class OBSTACK_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
