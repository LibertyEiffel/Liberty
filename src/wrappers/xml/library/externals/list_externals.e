-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class LIST_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_list_walk (a_l: POINTER; a_walker: POINTER; an_user: POINTER) is
 		-- xmlListWalk (node at line 71)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListWalk"
		}"
		end

	xml_list_clear (a_l: POINTER) is
 		-- xmlListClear (node at line 110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListClear"
		}"
		end

	xml_list_insert (a_l: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlListInsert (node at line 321)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListInsert"
		}"
		end

	xml_list_remove_last (a_l: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlListRemoveLast (node at line 440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListRemoveLast"
		}"
		end

	xml_list_copy (a_cur: POINTER; an_old: POINTER): INTEGER_32 is
 		-- xmlListCopy (node at line 527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListCopy"
		}"
		end

	xml_list_create (a_deallocator: POINTER; a_compare: POINTER): POINTER is
 		-- xmlListCreate (node at line 606)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListCreate"
		}"
		end

	xml_list_size (a_l: POINTER): INTEGER_32 is
 		-- xmlListSize (node at line 2453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListSize"
		}"
		end

	xml_list_front (a_l: POINTER): POINTER is
 		-- xmlListFront (node at line 2556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListFront"
		}"
		end

	xml_list_sort (a_l: POINTER) is
 		-- xmlListSort (node at line 3283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListSort"
		}"
		end

	xml_list_push_front (a_l: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlListPushFront (node at line 3532)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListPushFront"
		}"
		end

	xml_list_merge (a_l1: POINTER; a_l2: POINTER) is
 		-- xmlListMerge (node at line 3820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListMerge"
		}"
		end

	xml_list_reverse (a_l: POINTER) is
 		-- xmlListReverse (node at line 3861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListReverse"
		}"
		end

	xml_list_reverse_search (a_l: POINTER; a_data: POINTER): POINTER is
 		-- xmlListReverseSearch (node at line 4395)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListReverseSearch"
		}"
		end

	xml_list_dup (an_old: POINTER): POINTER is
 		-- xmlListDup (node at line 4519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListDup"
		}"
		end

	xml_list_search (a_l: POINTER; a_data: POINTER): POINTER is
 		-- xmlListSearch (node at line 4597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListSearch"
		}"
		end

	xml_list_push_back (a_l: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlListPushBack (node at line 4763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListPushBack"
		}"
		end

	xml_list_delete (a_l: POINTER) is
 		-- xmlListDelete (node at line 4774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListDelete"
		}"
		end

	xml_list_pop_back (a_l: POINTER) is
 		-- xmlListPopBack (node at line 4853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListPopBack"
		}"
		end

	xml_link_get_data (a_lk: POINTER): POINTER is
 		-- xmlLinkGetData (node at line 4993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlLinkGetData"
		}"
		end

	xml_list_empty (a_l: POINTER): INTEGER_32 is
 		-- xmlListEmpty (node at line 5020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListEmpty"
		}"
		end

	xml_list_reverse_walk (a_l: POINTER; a_walker: POINTER; an_user: POINTER) is
 		-- xmlListReverseWalk (node at line 5254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListReverseWalk"
		}"
		end

	xml_list_remove_all (a_l: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlListRemoveAll (node at line 5574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListRemoveAll"
		}"
		end

	xml_list_end (a_l: POINTER): POINTER is
 		-- xmlListEnd (node at line 5731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListEnd"
		}"
		end

	xml_list_pop_front (a_l: POINTER) is
 		-- xmlListPopFront (node at line 5752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListPopFront"
		}"
		end

	xml_list_remove_first (a_l: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlListRemoveFirst (node at line 5931)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListRemoveFirst"
		}"
		end

	xml_list_append (a_l: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlListAppend (node at line 5953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlListAppend"
		}"
		end


end -- class LIST_EXTERNALS
