-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FFI_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       ffi_type: NATURAL
               -- typedef FFI_TYPE from /usr/include/x86_64-linux-gnu/ffi.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ffi_sarg: like long
               -- typedef ffi_sarg from /usr/include/x86_64-linux-gnu/ffitarget.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       ffi_arg: like long_unsigned
               -- typedef ffi_arg from /usr/include/x86_64-linux-gnu/ffitarget.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
