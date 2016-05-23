-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_RTREE_GEOMETRY_STRUCT
-- Wrapper of struct sqlite3_rtree_geometry defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_rtree_geometry_struct_set_pcontext (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pContext field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_set_pcontext"
      }"
      end

   sqlite3_rtree_geometry_struct_set_nparam (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nParam field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_set_nparam"
      }"
      end

   sqlite3_rtree_geometry_struct_set_aparam (a_structure: POINTER; a_value: POINTER) 
         -- Setter for aParam field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_set_aparam"
      }"
      end

   sqlite3_rtree_geometry_struct_set_puser (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pUser field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_set_puser"
      }"
      end

   sqlite3_rtree_geometry_struct_set_xdeluser (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xDelUser field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_set_xdeluser"
      }"
      end

feature {} -- Low-level queries

   sqlite3_rtree_geometry_struct_get_pcontext (a_structure: POINTER): POINTER 
         -- Query for pContext field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_get_pcontext"
      }"
      end

   sqlite3_rtree_geometry_struct_get_nparam (a_structure: POINTER): INTEGER 
         -- Query for nParam field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_get_nparam"
      }"
      end

   sqlite3_rtree_geometry_struct_get_aparam (a_structure: POINTER): POINTER 
         -- Query for aParam field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_get_aparam"
      }"
      end

   sqlite3_rtree_geometry_struct_get_puser (a_structure: POINTER): POINTER 
         -- Query for pUser field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_get_puser"
      }"
      end

   sqlite3_rtree_geometry_struct_get_xdeluser (a_structure: POINTER): POINTER 
         -- Query for xDelUser field of SQLITE3_RTREE_GEOMETRY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_rtree_geometry_struct_get_xdeluser"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_rtree_geometry"
               }"
               end

end -- class SQLITE3_RTREE_GEOMETRY_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
