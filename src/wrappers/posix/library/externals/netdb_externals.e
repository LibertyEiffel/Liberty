-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class NETDB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	endrpcent
 		-- endrpcent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endrpcent()"
		}"
		end

	getrpcbyname (a_name: POINTER): POINTER
 		-- getrpcbyname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbyname"
		}"
		end

	getrpcbyname_r (a_name: POINTER; a_result_buf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER
 		-- getrpcbyname_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbyname_r"
		}"
		end

	getrpcbynumber (a_number: INTEGER): POINTER
 		-- getrpcbynumber
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbynumber"
		}"
		end

	getrpcbynumber_r (a_number: INTEGER; a_result_buf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER
 		-- getrpcbynumber_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbynumber_r"
		}"
		end

	getrpcent: POINTER
 		-- getrpcent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcent()"
		}"
		end

	getrpcent_r (a_result_buf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER
 		-- getrpcent_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcent_r"
		}"
		end

	setrpcent (a_stayopen: INTEGER)
 		-- setrpcent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setrpcent"
		}"
		end


end -- class NETDB_EXTERNALS
