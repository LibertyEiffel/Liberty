-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class HASHTAB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	htab_clear_slot (an_argument_l3220_c7: POINTER; an_argument_l3221_c7: POINTER) 
               -- htab_clear_slot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_collisions (an_argument_l5039_c7: POINTER): REAL 
               -- htab_collisions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_create (an_argument_l7388_c7: like long_unsigned; an_argument_l7389_c7: POINTER; an_argument_l7390_c7: POINTER; an_argument_l7391_c7: POINTER): POINTER 
               -- htab_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_create_alloc (an_argument_l2619_c7: like long_unsigned; an_argument_l2620_c7: POINTER; an_argument_l2621_c7: POINTER; an_argument_l2622_c7: POINTER; an_argument_l2623_c7: POINTER; an_argument_l2624_c7: POINTER): POINTER 
               -- htab_create_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_create_alloc_ex (an_argument_l2962_c7: like long_unsigned; an_argument_l2963_c7: POINTER; an_argument_l2964_c7: POINTER; an_argument_l2965_c7: POINTER; an_argument_l2966_c7: POINTER; an_argument_l2967_c7: POINTER; an_argument_l2968_c7: POINTER): POINTER 
               -- htab_create_alloc_ex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_create_typed_alloc (an_argument_l4659_c7: like long_unsigned; an_argument_l4660_c7: POINTER; an_argument_l4661_c7: POINTER; an_argument_l4662_c7: POINTER; an_argument_l4663_c7: POINTER; an_argument_l4664_c7: POINTER; an_argument_l4665_c7: POINTER): POINTER 
               -- htab_create_typed_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_delete (an_argument_l4960_c7: POINTER) 
               -- htab_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_elements (an_argument_l2734_c7: POINTER): like long_unsigned 
               -- htab_elements
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_empty (an_argument_l3799_c7: POINTER) 
               -- htab_empty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_eq_pointer: POINTER
               -- htab_eq_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "htab_eq_pointer"
               }"
               end

       address_of_htab_eq_pointer: POINTER
               -- Address of htab_eq_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&htab_eq_pointer"
               }"
               end

       set_htab_eq_pointer (a_value: POINTER)
               -- Set variable htab_eq_pointer value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_htab_eq_pointer"
               }"
               end

	htab_find (an_argument_l4800_c7: POINTER; an_argument_l4801_c7: POINTER): POINTER 
               -- htab_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_find_slot (an_argument_l2759_c7: POINTER; an_argument_l2760_c7: POINTER; an_argument_l2761_c7: INTEGER): POINTER 
               -- htab_find_slot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_find_slot_with_hash (an_argument_l2023_c7: POINTER; an_argument_l2024_c7: POINTER; an_argument_l2025_c7: NATURAL; an_argument_l2026_c7: INTEGER): POINTER 
               -- htab_find_slot_with_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_find_with_hash (an_argument_l1841_c7: POINTER; an_argument_l1842_c7: POINTER; an_argument_l1843_c7: NATURAL): POINTER 
               -- htab_find_with_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_hash_pointer: POINTER
               -- htab_hash_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "htab_hash_pointer"
               }"
               end

       address_of_htab_hash_pointer: POINTER
               -- Address of htab_hash_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&htab_hash_pointer"
               }"
               end

       set_htab_hash_pointer (a_value: POINTER)
               -- Set variable htab_hash_pointer value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_htab_hash_pointer"
               }"
               end

	htab_hash_string (an_argument_l4186_c7: POINTER): NATURAL 
               -- htab_hash_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_remove_elt (an_argument_l3134_c7: POINTER; an_argument_l3135_c7: POINTER) 
               -- htab_remove_elt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_remove_elt_with_hash (an_argument_l2289_c7: POINTER; an_argument_l2290_c7: POINTER; an_argument_l2291_c7: NATURAL) 
               -- htab_remove_elt_with_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_set_functions_ex (an_argument_l862_c7: POINTER; an_argument_l863_c7: POINTER; an_argument_l864_c7: POINTER; an_argument_l865_c7: POINTER; an_argument_l866_c7: POINTER; an_argument_l867_c7: POINTER; an_argument_l868_c7: POINTER) 
               -- htab_set_functions_ex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_size (an_argument_l6950_c7: POINTER): like long_unsigned 
               -- htab_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_traverse (an_argument_l6035_c7: POINTER; an_argument_l6036_c7: POINTER; an_argument_l6037_c7: POINTER) 
               -- htab_traverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_traverse_noresize (an_argument_l5508_c7: POINTER; an_argument_l5509_c7: POINTER; an_argument_l5510_c7: POINTER) 
               -- htab_traverse_noresize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htab_try_create (an_argument_l503_c7: like long_unsigned; an_argument_l504_c7: POINTER; an_argument_l505_c7: POINTER; an_argument_l506_c7: POINTER): POINTER 
               -- htab_try_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	iterative_hash (an_argument_l3651_c7: POINTER; an_argument_l3652_c7: like long_unsigned; an_argument_l3653_c7: NATURAL): NATURAL 
               -- iterative_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class HASHTAB_EXTERNALS
