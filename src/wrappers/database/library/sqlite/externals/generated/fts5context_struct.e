-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FTS5CONTEXT_STRUCT
-- Wrapper of struct Fts5Context defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
	-- Fieldless struct
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_fts5context"
               }"
               end

end -- class FTS5CONTEXT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
