-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class DICT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_dict_cleanup is
 		-- xmlDictCleanup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictCleanup()"
		}"
		end

	xml_dict_create: POINTER is
 		-- xmlDictCreate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictCreate()"
		}"
		end

	xml_dict_create_sub (a_sub: POINTER): POINTER is
 		-- xmlDictCreateSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictCreateSub"
		}"
		end

	xml_dict_exists (a_dict: POINTER; a_name: POINTER; a_len: INTEGER): POINTER is
 		-- xmlDictExists
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictExists"
		}"
		end

	xml_dict_free (a_dict: POINTER) is
 		-- xmlDictFree
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictFree"
		}"
		end

	xml_dict_lookup (a_dict: POINTER; a_name: POINTER; a_len: INTEGER): POINTER is
 		-- xmlDictLookup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictLookup"
		}"
		end

	xml_dict_owns (a_dict: POINTER; a_str: POINTER): INTEGER is
 		-- xmlDictOwns
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictOwns"
		}"
		end

	xml_dict_qlookup (a_dict: POINTER; a_prefix: POINTER; a_name: POINTER): POINTER is
 		-- xmlDictQLookup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictQLookup"
		}"
		end

	xml_dict_reference (a_dict: POINTER): INTEGER is
 		-- xmlDictReference
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictReference"
		}"
		end

	xml_dict_size (a_dict: POINTER): INTEGER is
 		-- xmlDictSize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDictSize"
		}"
		end


end -- class DICT_EXTERNALS
