-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_IO_METHODS_STRUCT
-- Wrapper of struct sqlite3_io_methods defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_io_methods_struct_set_iversion (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for iVersion field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_iversion"
      }"
      end

   sqlite3_io_methods_struct_set_xclose (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xClose field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xclose"
      }"
      end

   sqlite3_io_methods_struct_set_xread (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRead field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xread"
      }"
      end

   sqlite3_io_methods_struct_set_xwrite (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xWrite field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xwrite"
      }"
      end

   sqlite3_io_methods_struct_set_xtruncate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xTruncate field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xtruncate"
      }"
      end

   sqlite3_io_methods_struct_set_xsync (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xSync field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xsync"
      }"
      end

   sqlite3_io_methods_struct_set_xfilesize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFileSize field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xfilesize"
      }"
      end

   sqlite3_io_methods_struct_set_xlock (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xLock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xlock"
      }"
      end

   sqlite3_io_methods_struct_set_xunlock (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xUnlock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xunlock"
      }"
      end

   sqlite3_io_methods_struct_set_xcheckreservedlock (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCheckReservedLock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xcheckreservedlock"
      }"
      end

   sqlite3_io_methods_struct_set_xfilecontrol (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFileControl field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xfilecontrol"
      }"
      end

   sqlite3_io_methods_struct_set_xsectorsize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xSectorSize field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xsectorsize"
      }"
      end

   sqlite3_io_methods_struct_set_xdevicecharacteristics (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xDeviceCharacteristics field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xdevicecharacteristics"
      }"
      end

   sqlite3_io_methods_struct_set_xshmmap (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xShmMap field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xshmmap"
      }"
      end

   sqlite3_io_methods_struct_set_xshmlock (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xShmLock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xshmlock"
      }"
      end

   sqlite3_io_methods_struct_set_xshmbarrier (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xShmBarrier field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xshmbarrier"
      }"
      end

   sqlite3_io_methods_struct_set_xshmunmap (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xShmUnmap field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xshmunmap"
      }"
      end

   sqlite3_io_methods_struct_set_xfetch (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFetch field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xfetch"
      }"
      end

   sqlite3_io_methods_struct_set_xunfetch (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xUnfetch field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_set_xunfetch"
      }"
      end

feature {} -- Low-level queries

   sqlite3_io_methods_struct_get_iversion (a_structure: POINTER): INTEGER 
         -- Query for iVersion field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_iversion"
      }"
      end

   sqlite3_io_methods_struct_get_xclose (a_structure: POINTER): POINTER 
         -- Query for xClose field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xclose"
      }"
      end

   sqlite3_io_methods_struct_get_xread (a_structure: POINTER): POINTER 
         -- Query for xRead field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xread"
      }"
      end

   sqlite3_io_methods_struct_get_xwrite (a_structure: POINTER): POINTER 
         -- Query for xWrite field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xwrite"
      }"
      end

   sqlite3_io_methods_struct_get_xtruncate (a_structure: POINTER): POINTER 
         -- Query for xTruncate field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xtruncate"
      }"
      end

   sqlite3_io_methods_struct_get_xsync (a_structure: POINTER): POINTER 
         -- Query for xSync field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xsync"
      }"
      end

   sqlite3_io_methods_struct_get_xfilesize (a_structure: POINTER): POINTER 
         -- Query for xFileSize field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xfilesize"
      }"
      end

   sqlite3_io_methods_struct_get_xlock (a_structure: POINTER): POINTER 
         -- Query for xLock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xlock"
      }"
      end

   sqlite3_io_methods_struct_get_xunlock (a_structure: POINTER): POINTER 
         -- Query for xUnlock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xunlock"
      }"
      end

   sqlite3_io_methods_struct_get_xcheckreservedlock (a_structure: POINTER): POINTER 
         -- Query for xCheckReservedLock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xcheckreservedlock"
      }"
      end

   sqlite3_io_methods_struct_get_xfilecontrol (a_structure: POINTER): POINTER 
         -- Query for xFileControl field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xfilecontrol"
      }"
      end

   sqlite3_io_methods_struct_get_xsectorsize (a_structure: POINTER): POINTER 
         -- Query for xSectorSize field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xsectorsize"
      }"
      end

   sqlite3_io_methods_struct_get_xdevicecharacteristics (a_structure: POINTER): POINTER 
         -- Query for xDeviceCharacteristics field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xdevicecharacteristics"
      }"
      end

   sqlite3_io_methods_struct_get_xshmmap (a_structure: POINTER): POINTER 
         -- Query for xShmMap field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xshmmap"
      }"
      end

   sqlite3_io_methods_struct_get_xshmlock (a_structure: POINTER): POINTER 
         -- Query for xShmLock field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xshmlock"
      }"
      end

   sqlite3_io_methods_struct_get_xshmbarrier (a_structure: POINTER): POINTER 
         -- Query for xShmBarrier field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xshmbarrier"
      }"
      end

   sqlite3_io_methods_struct_get_xshmunmap (a_structure: POINTER): POINTER 
         -- Query for xShmUnmap field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xshmunmap"
      }"
      end

   sqlite3_io_methods_struct_get_xfetch (a_structure: POINTER): POINTER 
         -- Query for xFetch field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xfetch"
      }"
      end

   sqlite3_io_methods_struct_get_xunfetch (a_structure: POINTER): POINTER 
         -- Query for xUnfetch field of SQLITE3_IO_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_io_methods_struct_get_xunfetch"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_io_methods"
               }"
               end

end -- class SQLITE3_IO_METHODS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
