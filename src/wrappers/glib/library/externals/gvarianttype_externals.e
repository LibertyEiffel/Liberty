-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVARIANTTYPE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_variant_type_checked (an_argument_l7042_c7: POINTER): POINTER 
               -- g_variant_type_checked_
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_checked_"
               }"
               end

	g_variant_type_copy (a_type: POINTER): POINTER 
               -- g_variant_type_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_copy"
               }"
               end

	g_variant_type_dup_string (a_type: POINTER): POINTER 
               -- g_variant_type_dup_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_dup_string"
               }"
               end

	g_variant_type_element (a_type: POINTER): POINTER 
               -- g_variant_type_element
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_element"
               }"
               end

	g_variant_type_equal (a_type1: POINTER; a_type2: POINTER): INTEGER 
               -- g_variant_type_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_equal"
               }"
               end

	g_variant_type_first (a_type: POINTER): POINTER 
               -- g_variant_type_first
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_first"
               }"
               end

	g_variant_type_free (a_type: POINTER) 
               -- g_variant_type_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_free"
               }"
               end

	g_variant_type_get_string_length (a_type: POINTER): like long_unsigned 
               -- g_variant_type_get_string_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_get_string_length"
               }"
               end

	g_variant_type_hash (a_type: POINTER): NATURAL 
               -- g_variant_type_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_hash"
               }"
               end

	g_variant_type_is_array (a_type: POINTER): INTEGER 
               -- g_variant_type_is_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_array"
               }"
               end

	g_variant_type_is_basic (a_type: POINTER): INTEGER 
               -- g_variant_type_is_basic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_basic"
               }"
               end

	g_variant_type_is_container (a_type: POINTER): INTEGER 
               -- g_variant_type_is_container
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_container"
               }"
               end

	g_variant_type_is_definite (a_type: POINTER): INTEGER 
               -- g_variant_type_is_definite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_definite"
               }"
               end

	g_variant_type_is_dict_entry (a_type: POINTER): INTEGER 
               -- g_variant_type_is_dict_entry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_dict_entry"
               }"
               end

	g_variant_type_is_maybe (a_type: POINTER): INTEGER 
               -- g_variant_type_is_maybe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_maybe"
               }"
               end

	g_variant_type_is_subtype_of (a_type: POINTER; a_supertype: POINTER): INTEGER 
               -- g_variant_type_is_subtype_of
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_subtype_of"
               }"
               end

	g_variant_type_is_tuple (a_type: POINTER): INTEGER 
               -- g_variant_type_is_tuple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_tuple"
               }"
               end

	g_variant_type_is_variant (a_type: POINTER): INTEGER 
               -- g_variant_type_is_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_is_variant"
               }"
               end

	g_variant_type_key (a_type: POINTER): POINTER 
               -- g_variant_type_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_key"
               }"
               end

	g_variant_type_n_items (a_type: POINTER): like long_unsigned 
               -- g_variant_type_n_items
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_n_items"
               }"
               end

	g_variant_type_new (a_type_string: POINTER): POINTER 
               -- g_variant_type_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_new"
               }"
               end

	g_variant_type_new_array (an_element: POINTER): POINTER 
               -- g_variant_type_new_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_new_array"
               }"
               end

	g_variant_type_new_dict_entry (a_key: POINTER; a_value: POINTER): POINTER 
               -- g_variant_type_new_dict_entry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_new_dict_entry"
               }"
               end

	g_variant_type_new_maybe (an_element: POINTER): POINTER 
               -- g_variant_type_new_maybe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_new_maybe"
               }"
               end

	g_variant_type_new_tuple (an_items: POINTER; a_length: INTEGER): POINTER 
               -- g_variant_type_new_tuple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_new_tuple"
               }"
               end

	g_variant_type_next (a_type: POINTER): POINTER 
               -- g_variant_type_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_next"
               }"
               end

	g_variant_type_peek_string (a_type: POINTER): POINTER 
               -- g_variant_type_peek_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_peek_string"
               }"
               end

	g_variant_type_string_is_valid (a_type_string: POINTER): INTEGER 
               -- g_variant_type_string_is_valid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_string_is_valid"
               }"
               end

	g_variant_type_string_scan (a_string: POINTER; a_limit: POINTER; an_endptr: POINTER): INTEGER 
               -- g_variant_type_string_scan
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_string_scan"
               }"
               end

	g_variant_type_value (a_type: POINTER): POINTER 
               -- g_variant_type_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_type_value"
               }"
               end


end -- class GVARIANTTYPE_EXTERNALS
