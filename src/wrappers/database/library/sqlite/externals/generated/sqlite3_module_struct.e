-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_MODULE_STRUCT
-- Wrapper of struct sqlite3_module defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_module_struct_set_iversion (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for iVersion field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_iversion"
      }"
      end

   sqlite3_module_struct_set_xcreate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCreate field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xcreate"
      }"
      end

   sqlite3_module_struct_set_xconnect (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xConnect field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xconnect"
      }"
      end

   sqlite3_module_struct_set_xbestindex (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xBestIndex field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xbestindex"
      }"
      end

   sqlite3_module_struct_set_xdisconnect (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xDisconnect field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xdisconnect"
      }"
      end

   sqlite3_module_struct_set_xdestroy (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xDestroy field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xdestroy"
      }"
      end

   sqlite3_module_struct_set_xopen (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xOpen field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xopen"
      }"
      end

   sqlite3_module_struct_set_xclose (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xClose field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xclose"
      }"
      end

   sqlite3_module_struct_set_xfilter (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFilter field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xfilter"
      }"
      end

   sqlite3_module_struct_set_xnext (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xNext field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xnext"
      }"
      end

   sqlite3_module_struct_set_xeof (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xEof field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xeof"
      }"
      end

   sqlite3_module_struct_set_xcolumn (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xColumn field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xcolumn"
      }"
      end

   sqlite3_module_struct_set_xrowid (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRowid field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xrowid"
      }"
      end

   sqlite3_module_struct_set_xupdate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xUpdate field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xupdate"
      }"
      end

   sqlite3_module_struct_set_xbegin (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xBegin field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xbegin"
      }"
      end

   sqlite3_module_struct_set_xsync (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xSync field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xsync"
      }"
      end

   sqlite3_module_struct_set_xcommit (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCommit field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xcommit"
      }"
      end

   sqlite3_module_struct_set_xrollback (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRollback field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xrollback"
      }"
      end

   sqlite3_module_struct_set_xfindfunction (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFindFunction field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xfindfunction"
      }"
      end

   sqlite3_module_struct_set_xrename (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRename field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xrename"
      }"
      end

   sqlite3_module_struct_set_xsavepoint (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xSavepoint field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xsavepoint"
      }"
      end

   sqlite3_module_struct_set_xrelease (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRelease field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xrelease"
      }"
      end

   sqlite3_module_struct_set_xrollbackto (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRollbackTo field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_set_xrollbackto"
      }"
      end

feature {} -- Low-level queries

   sqlite3_module_struct_get_iversion (a_structure: POINTER): INTEGER 
         -- Query for iVersion field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_iversion"
      }"
      end

   sqlite3_module_struct_get_xcreate (a_structure: POINTER): POINTER 
         -- Query for xCreate field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xcreate"
      }"
      end

   sqlite3_module_struct_get_xconnect (a_structure: POINTER): POINTER 
         -- Query for xConnect field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xconnect"
      }"
      end

   sqlite3_module_struct_get_xbestindex (a_structure: POINTER): POINTER 
         -- Query for xBestIndex field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xbestindex"
      }"
      end

   sqlite3_module_struct_get_xdisconnect (a_structure: POINTER): POINTER 
         -- Query for xDisconnect field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xdisconnect"
      }"
      end

   sqlite3_module_struct_get_xdestroy (a_structure: POINTER): POINTER 
         -- Query for xDestroy field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xdestroy"
      }"
      end

   sqlite3_module_struct_get_xopen (a_structure: POINTER): POINTER 
         -- Query for xOpen field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xopen"
      }"
      end

   sqlite3_module_struct_get_xclose (a_structure: POINTER): POINTER 
         -- Query for xClose field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xclose"
      }"
      end

   sqlite3_module_struct_get_xfilter (a_structure: POINTER): POINTER 
         -- Query for xFilter field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xfilter"
      }"
      end

   sqlite3_module_struct_get_xnext (a_structure: POINTER): POINTER 
         -- Query for xNext field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xnext"
      }"
      end

   sqlite3_module_struct_get_xeof (a_structure: POINTER): POINTER 
         -- Query for xEof field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xeof"
      }"
      end

   sqlite3_module_struct_get_xcolumn (a_structure: POINTER): POINTER 
         -- Query for xColumn field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xcolumn"
      }"
      end

   sqlite3_module_struct_get_xrowid (a_structure: POINTER): POINTER 
         -- Query for xRowid field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xrowid"
      }"
      end

   sqlite3_module_struct_get_xupdate (a_structure: POINTER): POINTER 
         -- Query for xUpdate field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xupdate"
      }"
      end

   sqlite3_module_struct_get_xbegin (a_structure: POINTER): POINTER 
         -- Query for xBegin field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xbegin"
      }"
      end

   sqlite3_module_struct_get_xsync (a_structure: POINTER): POINTER 
         -- Query for xSync field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xsync"
      }"
      end

   sqlite3_module_struct_get_xcommit (a_structure: POINTER): POINTER 
         -- Query for xCommit field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xcommit"
      }"
      end

   sqlite3_module_struct_get_xrollback (a_structure: POINTER): POINTER 
         -- Query for xRollback field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xrollback"
      }"
      end

   sqlite3_module_struct_get_xfindfunction (a_structure: POINTER): POINTER 
         -- Query for xFindFunction field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xfindfunction"
      }"
      end

   sqlite3_module_struct_get_xrename (a_structure: POINTER): POINTER 
         -- Query for xRename field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xrename"
      }"
      end

   sqlite3_module_struct_get_xsavepoint (a_structure: POINTER): POINTER 
         -- Query for xSavepoint field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xsavepoint"
      }"
      end

   sqlite3_module_struct_get_xrelease (a_structure: POINTER): POINTER 
         -- Query for xRelease field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xrelease"
      }"
      end

   sqlite3_module_struct_get_xrollbackto (a_structure: POINTER): POINTER 
         -- Query for xRollbackTo field of SQLITE3_MODULE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_module_struct_get_xrollbackto"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_module"
               }"
               end

end -- class SQLITE3_MODULE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
