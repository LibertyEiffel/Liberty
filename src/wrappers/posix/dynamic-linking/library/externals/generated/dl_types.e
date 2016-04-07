-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DL_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       lmid_t: like long
               -- typedef Lmid_t from /usr/include/dlfcn.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
