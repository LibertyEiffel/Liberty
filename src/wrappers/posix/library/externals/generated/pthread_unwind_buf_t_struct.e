-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class PTHREAD_UNWIND_BUF_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/pthread.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrapped private field __cancel_jmp_buf.
	-- Unwrapped private field __pad.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof___pthread_unwind_buf_t"
               }"
               end

end -- class PTHREAD_UNWIND_BUF_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
