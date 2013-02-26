-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class DICT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_dict_create_sub (a_sub: POINTER): POINTER is
 		-- xmlDictCreateSub (node at line 123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictCreateSub"
		}"
		end

	xml_dict_owns (a_dict: POINTER; a_str: POINTER): INTEGER_32 is
 		-- xmlDictOwns (node at line 686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictOwns"
		}"
		end

	xml_dict_create: POINTER is
 		-- xmlDictCreate (node at line 1547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictCreate()"
		}"
		end

	xml_dict_reference (a_dict: POINTER): INTEGER_32 is
 		-- xmlDictReference (node at line 3241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictReference"
		}"
		end

	xml_dict_free (a_dict: POINTER) is
 		-- xmlDictFree (node at line 3463)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictFree"
		}"
		end

	xml_dict_size (a_dict: POINTER): INTEGER_32 is
 		-- xmlDictSize (node at line 3600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictSize"
		}"
		end

	xml_dict_qlookup (a_dict: POINTER; a_prefix: POINTER; a_name: POINTER): POINTER is
 		-- xmlDictQLookup (node at line 3604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictQLookup"
		}"
		end

	xml_dict_exists (a_dict: POINTER; a_name: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlDictExists (node at line 3807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictExists"
		}"
		end

	xml_dict_lookup (a_dict: POINTER; a_name: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlDictLookup (node at line 3815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictLookup"
		}"
		end

	xml_dict_cleanup is
 		-- xmlDictCleanup (node at line 5788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictCleanup()"
		}"
		end


end -- class DICT_EXTERNALS
