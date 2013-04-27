-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class NETDB_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	endrpcent is
 		-- endrpcent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endrpcent()"
		}"
		end

	getrpcbyname (a_name: POINTER): POINTER is
 		-- getrpcbyname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbyname"
		}"
		end

	getrpcbyname_r (a_name: POINTER; a_result_buf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER is
 		-- getrpcbyname_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbyname_r"
		}"
		end

	getrpcbynumber (a_number: INTEGER): POINTER is
 		-- getrpcbynumber
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbynumber"
		}"
		end

	getrpcbynumber_r (a_number: INTEGER; a_result_buf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER is
 		-- getrpcbynumber_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbynumber_r"
		}"
		end

	getrpcent: POINTER is
 		-- getrpcent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcent()"
		}"
		end

	getrpcent_r (a_result_buf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER is
 		-- getrpcent_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcent_r"
		}"
		end

	setrpcent (a_stayopen: INTEGER) is
 		-- setrpcent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setrpcent"
		}"
		end


end -- class NETDB_EXTERNALS
