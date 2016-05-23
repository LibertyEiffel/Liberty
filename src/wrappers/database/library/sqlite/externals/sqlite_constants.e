note
	description: "SQLIte constants"
	copyright: "2014 Paolo Redaelli <paolo.redaelli@gmail.com>"
	license: "LGPL v2 or later"

expanded class SQLITE_CONSTANTS

feature {} -- Destructors constants
   -- Constats used to inform SQLIte on the life cycle of the memory buffers passed to routines like sqlite3_result_blob (and s passed in as the final argument to routines like
   -- sqlite3_result_blob(). If the destructor argument is SQLITE_STATIC, it means that the content pointer is constant and
   -- will never change. It does not need to be destroyed. The SQLITE_TRANSIENT value means that the content will likely change
   -- in the near future and that SQLite should make its own private copy of the content before returning.

   -- The typedef is necessary to work around problems in certain C++ compilers.

   sqlite_static: POINTER
   -- #define SQLITE_INTEGER 1
   external "plug_in"
   alias "{
   location: "generated"
   module_name: "plugin"
   feature_name: "SQLITE_STATIC"
   }"
		end

	sqlite_transient: POINTER is
		-- asdads
		external "plug_in"
		alias "{
		location: "generated"
		module_name: "plugin"
		feature_name: "SQLITE_TRANSIENT"
		}"
end

end

