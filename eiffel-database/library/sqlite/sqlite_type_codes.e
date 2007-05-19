indexing
	description: "values of the the sqlite type code"
	copyright: "2007 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class SQLITE_TYPE_CODES

feature -- Type codes

	Sqlite_integer: INTEGER is 1
	Sqlite_float: INTEGER is 2
	Sqlite_text: INTEGER is 3
	Sqlite_blob: INTEGER is 4
	Sqlite_null: INTEGER is 5

feature
	ext_sqlite_integer: INTEGER is
			-- #define SQLITE_INTEGER 1
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_INTEGER"
			}"
		end

	ext_sqlite_float: INTEGER is
			-- #define SQLITE_FLOAT 2
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_FLOAT"
			}"
		end

	ext_sqlite_text: INTEGER is
			-- #define SQLITE_TEXT 3
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_TEXT"
			}"
		end

	ext_sqlite_blob: INTEGER is
			-- #define SQLITE_BLOB 4
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_BLOB"
			}"
		end

	ext_sqlite_null: INTEGER is
			-- #define SQLITE_NULL 5
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "sqlite3"
			feature_name: "SQLITE_NULL"
			}"
		end


feature -- test

	check_type_codes is
		do
			check
				Sqlite_integer = ext_sqlite_integer
				Sqlite_float = ext_sqlite_float
				Sqlite_text = ext_sqlite_text
				Sqlite_blob = ext_sqlite_blob
				Sqlite_null = ext_sqlite_null
			end
		end

end

