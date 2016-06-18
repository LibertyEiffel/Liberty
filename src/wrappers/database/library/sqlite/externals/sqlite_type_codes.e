note
	description: "values of the the sqlite type code"
	copyright: "2007 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class SQLITE_TYPE_CODES

feature {} -- Type codes
	sqlite_integer: INTEGER
			-- #define SQLITE_INTEGER 1
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_INTEGER"
			}"
		end

	sqlite_float: INTEGER
			-- #define SQLITE_FLOAT 2
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_FLOAT"
			}"
		end

	sqlite_text: INTEGER
			-- #define SQLITE3_TEXT 
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE3_TEXT"
			}"
		end

	sqlite_blob: INTEGER
			-- #define SQLITE_BLOB 4
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_BLOB"
			}"
		end

	sqlite_null: INTEGER
			-- #define SQLITE_NULL 5
		external "plug_in"
		alias "{
			location: "generated"
			module_name: "plugin"
			feature_name: "SQLITE_NULL"
			}"
		end
end

