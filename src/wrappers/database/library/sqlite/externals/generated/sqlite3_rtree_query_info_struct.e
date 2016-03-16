-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_RTREE_QUERY_INFO_STRUCT
-- Wrapper of struct sqlite3_rtree_query_info defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_rtree_query_info_struct_set_pcontext (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pContext field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_pcontext"
      }"
      end

   sqlite3_rtree_query_info_struct_set_nparam (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nParam field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_nparam"
      }"
      end

   sqlite3_rtree_query_info_struct_set_aparam (a_structure: POINTER; a_value: POINTER) 
         -- Setter for aParam field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_aparam"
      }"
      end

   sqlite3_rtree_query_info_struct_set_puser (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pUser field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_puser"
      }"
      end

   sqlite3_rtree_query_info_struct_set_xdeluser (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xDelUser field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_xdeluser"
      }"
      end

   sqlite3_rtree_query_info_struct_set_acoord (a_structure: POINTER; a_value: POINTER) 
         -- Setter for aCoord field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_acoord"
      }"
      end

   sqlite3_rtree_query_info_struct_set_anqueue (a_structure: POINTER; a_value: POINTER) 
         -- Setter for anQueue field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_anqueue"
      }"
      end

   sqlite3_rtree_query_info_struct_set_ncoord (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nCoord field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_ncoord"
      }"
      end

   sqlite3_rtree_query_info_struct_set_ilevel (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for iLevel field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_ilevel"
      }"
      end

   sqlite3_rtree_query_info_struct_set_mxlevel (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for mxLevel field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_mxlevel"
      }"
      end

   sqlite3_rtree_query_info_struct_set_irowid (a_structure: POINTER; a_value: INTEGER_64) 
         -- Setter for iRowid field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_irowid"
      }"
      end

   sqlite3_rtree_query_info_struct_set_rparentscore (a_structure: POINTER; a_value: REAL) 
         -- Setter for rParentScore field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_rparentscore"
      }"
      end

   sqlite3_rtree_query_info_struct_set_eparentwithin (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for eParentWithin field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_eparentwithin"
      }"
      end

   sqlite3_rtree_query_info_struct_set_ewithin (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for eWithin field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_ewithin"
      }"
      end

   sqlite3_rtree_query_info_struct_set_rscore (a_structure: POINTER; a_value: REAL) 
         -- Setter for rScore field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_rscore"
      }"
      end

   sqlite3_rtree_query_info_struct_set_apsqlparam (a_structure: POINTER; a_value: POINTER) 
         -- Setter for apSqlParam field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_set_apsqlparam"
      }"
      end

feature {} -- Low-level queries

   sqlite3_rtree_query_info_struct_get_pcontext (a_structure: POINTER): POINTER 
         -- Query for pContext field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_pcontext"
      }"
      end

   sqlite3_rtree_query_info_struct_get_nparam (a_structure: POINTER): INTEGER 
         -- Query for nParam field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_nparam"
      }"
      end

   sqlite3_rtree_query_info_struct_get_aparam (a_structure: POINTER): POINTER 
         -- Query for aParam field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_aparam"
      }"
      end

   sqlite3_rtree_query_info_struct_get_puser (a_structure: POINTER): POINTER 
         -- Query for pUser field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_puser"
      }"
      end

   sqlite3_rtree_query_info_struct_get_xdeluser (a_structure: POINTER): POINTER 
         -- Query for xDelUser field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_xdeluser"
      }"
      end

   sqlite3_rtree_query_info_struct_get_acoord (a_structure: POINTER): POINTER 
         -- Query for aCoord field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_acoord"
      }"
      end

   sqlite3_rtree_query_info_struct_get_anqueue (a_structure: POINTER): POINTER 
         -- Query for anQueue field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_anqueue"
      }"
      end

   sqlite3_rtree_query_info_struct_get_ncoord (a_structure: POINTER): INTEGER 
         -- Query for nCoord field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_ncoord"
      }"
      end

   sqlite3_rtree_query_info_struct_get_ilevel (a_structure: POINTER): INTEGER 
         -- Query for iLevel field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_ilevel"
      }"
      end

   sqlite3_rtree_query_info_struct_get_mxlevel (a_structure: POINTER): INTEGER 
         -- Query for mxLevel field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_mxlevel"
      }"
      end

   sqlite3_rtree_query_info_struct_get_irowid (a_structure: POINTER): INTEGER_64 
         -- Query for iRowid field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_irowid"
      }"
      end

   sqlite3_rtree_query_info_struct_get_rparentscore (a_structure: POINTER): REAL 
         -- Query for rParentScore field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_rparentscore"
      }"
      end

   sqlite3_rtree_query_info_struct_get_eparentwithin (a_structure: POINTER): INTEGER 
         -- Query for eParentWithin field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_eparentwithin"
      }"
      end

   sqlite3_rtree_query_info_struct_get_ewithin (a_structure: POINTER): INTEGER 
         -- Query for eWithin field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_ewithin"
      }"
      end

   sqlite3_rtree_query_info_struct_get_rscore (a_structure: POINTER): REAL 
         -- Query for rScore field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_rscore"
      }"
      end

   sqlite3_rtree_query_info_struct_get_apsqlparam (a_structure: POINTER): POINTER 
         -- Query for apSqlParam field of SQLITE3_RTREE_QUERY_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_query_info_struct_get_apsqlparam"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_rtree_query_info"
               }"
               end

end -- class SQLITE3_RTREE_QUERY_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
