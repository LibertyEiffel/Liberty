-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class POSIX_SPAWNATTR_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/spawn.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrapped private field __flags.
	-- Unwrapped private field __pgrp.
	-- Unwrapped private field __sd.
	-- Unwrapped private field __ss.
	-- Unwrapped private field __sp.
	-- Unwrapped private field __policy.
	-- Unwrapped private field __pad.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_posix_spawnattr_t"
               }"
               end

end -- class POSIX_SPAWNATTR_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
