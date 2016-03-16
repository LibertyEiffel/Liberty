-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class LIST_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_link_get_data (a_lk: POINTER): POINTER 

		-- function xmlLinkGetData (in `/usr/include/libxml2/libxml/list.h')
               -- xmlLinkGetData
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlLinkGetData"
               }"
               end

	xml_list_append (a_l: POINTER; a_data: POINTER): INTEGER 

		-- function xmlListAppend (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListAppend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListAppend"
               }"
               end

	xml_list_clear (a_l: POINTER) 

		-- function xmlListClear (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListClear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListClear"
               }"
               end

	xml_list_copy (a_cur: POINTER; an_old: POINTER): INTEGER 

		-- function xmlListCopy (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListCopy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListCopy"
               }"
               end

	xml_list_create (a_deallocator: POINTER; a_compare: POINTER): POINTER 

		-- function xmlListCreate (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListCreate"
               }"
               end

	xml_list_delete (a_l: POINTER) 

		-- function xmlListDelete (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListDelete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListDelete"
               }"
               end

	xml_list_dup (an_old: POINTER): POINTER 

		-- function xmlListDup (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListDup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListDup"
               }"
               end

	xml_list_empty (a_l: POINTER): INTEGER 

		-- function xmlListEmpty (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListEmpty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListEmpty"
               }"
               end

	xml_list_end (a_l: POINTER): POINTER 

		-- function xmlListEnd (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListEnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListEnd"
               }"
               end

	xml_list_front (a_l: POINTER): POINTER 

		-- function xmlListFront (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListFront
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListFront"
               }"
               end

	xml_list_insert (a_l: POINTER; a_data: POINTER): INTEGER 

		-- function xmlListInsert (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListInsert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListInsert"
               }"
               end

	xml_list_merge (a_l1: POINTER; a_l2: POINTER) 

		-- function xmlListMerge (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListMerge
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListMerge"
               }"
               end

	xml_list_pop_back (a_l: POINTER) 

		-- function xmlListPopBack (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListPopBack
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListPopBack"
               }"
               end

	xml_list_pop_front (a_l: POINTER) 

		-- function xmlListPopFront (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListPopFront
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListPopFront"
               }"
               end

	xml_list_push_back (a_l: POINTER; a_data: POINTER): INTEGER 

		-- function xmlListPushBack (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListPushBack
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListPushBack"
               }"
               end

	xml_list_push_front (a_l: POINTER; a_data: POINTER): INTEGER 

		-- function xmlListPushFront (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListPushFront
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListPushFront"
               }"
               end

	xml_list_remove_all (a_l: POINTER; a_data: POINTER): INTEGER 

		-- function xmlListRemoveAll (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListRemoveAll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListRemoveAll"
               }"
               end

	xml_list_remove_first (a_l: POINTER; a_data: POINTER): INTEGER 

		-- function xmlListRemoveFirst (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListRemoveFirst
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListRemoveFirst"
               }"
               end

	xml_list_remove_last (a_l: POINTER; a_data: POINTER): INTEGER 

		-- function xmlListRemoveLast (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListRemoveLast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListRemoveLast"
               }"
               end

	xml_list_reverse (a_l: POINTER) 

		-- function xmlListReverse (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListReverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListReverse"
               }"
               end

	xml_list_reverse_search (a_l: POINTER; a_data: POINTER): POINTER 

		-- function xmlListReverseSearch (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListReverseSearch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListReverseSearch"
               }"
               end

	xml_list_reverse_walk (a_l: POINTER; a_walker: POINTER; an_user: POINTER) 

		-- function xmlListReverseWalk (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListReverseWalk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListReverseWalk"
               }"
               end

	xml_list_search (a_l: POINTER; a_data: POINTER): POINTER 

		-- function xmlListSearch (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListSearch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListSearch"
               }"
               end

	xml_list_size (a_l: POINTER): INTEGER 

		-- function xmlListSize (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListSize"
               }"
               end

	xml_list_sort (a_l: POINTER) 

		-- function xmlListSort (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListSort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListSort"
               }"
               end

	xml_list_walk (a_l: POINTER; a_walker: POINTER; an_user: POINTER) 

		-- function xmlListWalk (in `/usr/include/libxml2/libxml/list.h')
               -- xmlListWalk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlListWalk"
               }"
               end


end -- class LIST_EXTERNALS
