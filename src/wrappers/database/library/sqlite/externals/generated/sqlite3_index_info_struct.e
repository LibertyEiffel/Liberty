-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_INDEX_INFO_STRUCT
-- Wrapper of struct sqlite3_index_info defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_index_info_struct_set_nconstraint (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nConstraint field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_nconstraint"
      }"
      end

   sqlite3_index_info_struct_set_aconstraint (a_structure: POINTER; a_value: POINTER) 
         -- Setter for aConstraint field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_aconstraint"
      }"
      end

   sqlite3_index_info_struct_set_norderby (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nOrderBy field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_norderby"
      }"
      end

   sqlite3_index_info_struct_set_aorderby (a_structure: POINTER; a_value: POINTER) 
         -- Setter for aOrderBy field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_aorderby"
      }"
      end

   sqlite3_index_info_struct_set_aconstraintusage (a_structure: POINTER; a_value: POINTER) 
         -- Setter for aConstraintUsage field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_aconstraintusage"
      }"
      end

   sqlite3_index_info_struct_set_idxnum (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for idxNum field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_idxnum"
      }"
      end

   sqlite3_index_info_struct_set_idxstr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for idxStr field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_idxstr"
      }"
      end

   sqlite3_index_info_struct_set_needtofreeidxstr (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for needToFreeIdxStr field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_needtofreeidxstr"
      }"
      end

   sqlite3_index_info_struct_set_orderbyconsumed (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for orderByConsumed field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_orderbyconsumed"
      }"
      end

   sqlite3_index_info_struct_set_estimatedcost (a_structure: POINTER; a_value: REAL) 
         -- Setter for estimatedCost field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_estimatedcost"
      }"
      end

   sqlite3_index_info_struct_set_estimatedrows (a_structure: POINTER; a_value: INTEGER_64) 
         -- Setter for estimatedRows field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_estimatedrows"
      }"
      end

   sqlite3_index_info_struct_set_idxflags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for idxFlags field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_idxflags"
      }"
      end

   sqlite3_index_info_struct_set_colused (a_structure: POINTER; a_value: NATURAL_64) 
         -- Setter for colUsed field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_set_colused"
      }"
      end

feature {} -- Low-level queries

   sqlite3_index_info_struct_get_nconstraint (a_structure: POINTER): INTEGER 
         -- Query for nConstraint field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_nconstraint"
      }"
      end

   sqlite3_index_info_struct_get_aconstraint (a_structure: POINTER): POINTER 
         -- Query for aConstraint field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_aconstraint"
      }"
      end

   sqlite3_index_info_struct_get_norderby (a_structure: POINTER): INTEGER 
         -- Query for nOrderBy field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_norderby"
      }"
      end

   sqlite3_index_info_struct_get_aorderby (a_structure: POINTER): POINTER 
         -- Query for aOrderBy field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_aorderby"
      }"
      end

   sqlite3_index_info_struct_get_aconstraintusage (a_structure: POINTER): POINTER 
         -- Query for aConstraintUsage field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_aconstraintusage"
      }"
      end

   sqlite3_index_info_struct_get_idxnum (a_structure: POINTER): INTEGER 
         -- Query for idxNum field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_idxnum"
      }"
      end

   sqlite3_index_info_struct_get_idxstr (a_structure: POINTER): POINTER 
         -- Query for idxStr field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_idxstr"
      }"
      end

   sqlite3_index_info_struct_get_needtofreeidxstr (a_structure: POINTER): INTEGER 
         -- Query for needToFreeIdxStr field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_needtofreeidxstr"
      }"
      end

   sqlite3_index_info_struct_get_orderbyconsumed (a_structure: POINTER): INTEGER 
         -- Query for orderByConsumed field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_orderbyconsumed"
      }"
      end

   sqlite3_index_info_struct_get_estimatedcost (a_structure: POINTER): REAL 
         -- Query for estimatedCost field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_estimatedcost"
      }"
      end

   sqlite3_index_info_struct_get_estimatedrows (a_structure: POINTER): INTEGER_64 
         -- Query for estimatedRows field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_estimatedrows"
      }"
      end

   sqlite3_index_info_struct_get_idxflags (a_structure: POINTER): INTEGER 
         -- Query for idxFlags field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_idxflags"
      }"
      end

   sqlite3_index_info_struct_get_colused (a_structure: POINTER): NATURAL_64 
         -- Query for colUsed field of SQLITE3_INDEX_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_info_struct_get_colused"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_index_info"
               }"
               end

end -- class SQLITE3_INDEX_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
