-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class NETDB_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	setrpcent (a_stayopen: INTEGER_32) is
 		-- setrpcent (node at line 208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setrpcent"
		}"
		end

	getrpcent: POINTER is
 		-- getrpcent (node at line 1145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcent()"
		}"
		end

	endrpcent is
 		-- endrpcent (node at line 1359)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endrpcent()"
		}"
		end

	getrpcbyname (a_name: POINTER): POINTER is
 		-- getrpcbyname (node at line 2684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbyname"
		}"
		end

	getrpcbyname_r (a_name: POINTER; a_result_buf: POINTER; a_buffer: POINTER; a_buflen: NATURAL_64; a_result: POINTER): INTEGER_32 is
 		-- getrpcbyname_r (node at line 2748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbyname_r"
		}"
		end

	getrpcent_r (a_result_buf: POINTER; a_buffer: POINTER; a_buflen: NATURAL_64; a_result: POINTER): INTEGER_32 is
 		-- getrpcent_r (node at line 3246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcent_r"
		}"
		end

	getrpcbynumber_r (a_number: INTEGER_32; a_result_buf: POINTER; a_buffer: POINTER; a_buflen: NATURAL_64; a_result: POINTER): INTEGER_32 is
 		-- getrpcbynumber_r (node at line 4608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbynumber_r"
		}"
		end

	getrpcbynumber (a_number: INTEGER_32): POINTER is
 		-- getrpcbynumber (node at line 8622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getrpcbynumber"
		}"
		end


end -- class NETDB_EXTERNALS
