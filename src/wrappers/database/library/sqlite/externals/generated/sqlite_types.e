-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature {ANY} -- C type definitions (typedefs)
       fts5_extension_function: POINTER
               -- typedef fts5_extension_function from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_rtree_dbl: REAL
               -- typedef sqlite3_rtree_dbl from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_destructor_type: POINTER
               -- typedef sqlite3_destructor_type from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_syscall_ptr: POINTER
               -- typedef sqlite3_syscall_ptr from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_callback: POINTER
               -- typedef sqlite3_callback from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_uint64: NATURAL_64
               -- typedef sqlite3_uint64 from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite3_int64: INTEGER_64
               -- typedef sqlite3_int64 from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite_uint64: NATURAL_64
               -- typedef sqlite_uint64 from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

       sqlite_int64: INTEGER_64
               -- typedef sqlite_int64 from /usr/include/sqlite3.h
               -- Empty by design, used for anchored declarations.
       do
       ensure Result.is_default
       end

end
