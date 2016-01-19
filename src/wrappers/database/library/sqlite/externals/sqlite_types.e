-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       sqlite_uint64: NATURAL_64
               -- typedef sqlite_uint64
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_callback: POINTER
               -- typedef sqlite3_callback
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_syscall_ptr: POINTER
               -- typedef sqlite3_syscall_ptr
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_uint64: NATURAL_64
               -- typedef sqlite3_uint64
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_int64: INTEGER_64
               -- typedef sqlite3_int64
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite_int64: INTEGER_64
               -- typedef sqlite_int64
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_destructor_type: POINTER
               -- typedef sqlite3_destructor_type
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
