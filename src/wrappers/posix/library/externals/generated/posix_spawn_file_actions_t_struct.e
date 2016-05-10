-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class POSIX_SPAWN_FILE_ACTIONS_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/spawn.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrapped private field __allocated.
	-- Unwrapped private field __used.
	-- Unwrapped private field __actions.
	-- Unwrapped private field __pad.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_posix_spawn_file_actions_t"
               }"
               end

end -- class POSIX_SPAWN_FILE_ACTIONS_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
