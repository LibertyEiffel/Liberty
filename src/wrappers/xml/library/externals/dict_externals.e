-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class DICT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_dict_cleanup 
               -- xmlDictCleanup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictCleanup"
               }"
               end

	xml_dict_create: POINTER 
               -- xmlDictCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictCreate"
               }"
               end

	xml_dict_create_sub (a_sub: POINTER): POINTER 
               -- xmlDictCreateSub
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictCreateSub"
               }"
               end

	xml_dict_exists (a_dict: POINTER; a_name: POINTER; a_len: INTEGER): POINTER 
               -- xmlDictExists
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictExists"
               }"
               end

	xml_dict_free (a_dict: POINTER) 
               -- xmlDictFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictFree"
               }"
               end

	xml_dict_get_usage (a_dict: POINTER): like size_t 
               -- xmlDictGetUsage
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictGetUsage"
               }"
               end

	xml_dict_lookup (a_dict: POINTER; a_name: POINTER; a_len: INTEGER): POINTER 
               -- xmlDictLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictLookup"
               }"
               end

	xml_dict_owns (a_dict: POINTER; a_str: POINTER): INTEGER 
               -- xmlDictOwns
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictOwns"
               }"
               end

	xml_dict_qlookup (a_dict: POINTER; a_prefix: POINTER; a_name: POINTER): POINTER 
               -- xmlDictQLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictQLookup"
               }"
               end

	xml_dict_reference (a_dict: POINTER): INTEGER 
               -- xmlDictReference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictReference"
               }"
               end

	xml_dict_set_limit (a_dict: POINTER; a_limit: like size_t): like size_t 
               -- xmlDictSetLimit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictSetLimit"
               }"
               end

	xml_dict_size (a_dict: POINTER): INTEGER 
               -- xmlDictSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictSize"
               }"
               end

	xml_initialize_dict: INTEGER 
               -- xmlInitializeDict
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitializeDict"
               }"
               end


end -- class DICT_EXTERNALS
