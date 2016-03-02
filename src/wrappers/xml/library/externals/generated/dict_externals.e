-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DICT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_dict_cleanup 

		-- function xmlDictCleanup (in 75 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictCleanup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictCleanup"
               }"
               end

	xml_dict_create: POINTER 

		-- function xmlDictCreate (in 37 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictCreate"
               }"
               end

	xml_dict_create_sub (a_sub: POINTER): POINTER 

		-- function xmlDictCreateSub (in 44 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictCreateSub
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictCreateSub"
               }"
               end

	xml_dict_exists (a_dict: POINTER; a_name: POINTER; a_len: INTEGER): POINTER 

		-- function xmlDictExists (in 58 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictExists
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictExists"
               }"
               end

	xml_dict_free (a_dict: POINTER) 

		-- function xmlDictFree (in 48 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictFree"
               }"
               end

	xml_dict_get_usage (a_dict: POINTER): like size_t 

		-- function xmlDictGetUsage (in 42 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictGetUsage
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictGetUsage"
               }"
               end

	xml_dict_lookup (a_dict: POINTER; a_name: POINTER; a_len: INTEGER): POINTER 

		-- function xmlDictLookup (in 54 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictLookup"
               }"
               end

	xml_dict_owns (a_dict: POINTER; a_str: POINTER): INTEGER 

		-- function xmlDictOwns (in 66 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictOwns
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictOwns"
               }"
               end

	xml_dict_qlookup (a_dict: POINTER; a_prefix: POINTER; a_name: POINTER): POINTER 

		-- function xmlDictQLookup (in 62 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictQLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictQLookup"
               }"
               end

	xml_dict_reference (a_dict: POINTER): INTEGER 

		-- function xmlDictReference (in 46 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictReference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictReference"
               }"
               end

	xml_dict_set_limit (a_dict: POINTER; a_limit: like size_t): like size_t 

		-- function xmlDictSetLimit (in 39 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictSetLimit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictSetLimit"
               }"
               end

	xml_dict_size (a_dict: POINTER): INTEGER 

		-- function xmlDictSize (in 69 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlDictSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDictSize"
               }"
               end

	xml_initialize_dict: INTEGER 

		-- function xmlInitializeDict (in 31 at line /usr/include/libxml2/libxml/dict.h)
               -- xmlInitializeDict
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitializeDict"
               }"
               end


end -- class DICT_EXTERNALS
