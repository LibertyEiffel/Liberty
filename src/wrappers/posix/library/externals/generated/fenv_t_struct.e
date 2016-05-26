-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FENV_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/x86_64-linux-gnu/bits/fenv.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrapped private field __control_word.
	-- Unwrapped private field __glibc_reserved1.
	-- Unwrapped private field __status_word.
	-- Unwrapped private field __glibc_reserved2.
	-- Unwrapped private field __tags.
	-- Unwrapped private field __glibc_reserved3.
	-- Unwrapped private field __eip.
	-- Unwrapped private field __cs_selector.
	-- Unwrapped private field __opcode.
	-- Unwrapped private field __glibc_reserved4.
	-- Unwrapped private field __data_offset.
	-- Unwrapped private field __data_selector.
	-- Unwrapped private field __glibc_reserved5.
	-- Unwrapped private field __mxcsr.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_fenv_t"
               }"
               end

end -- class FENV_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
