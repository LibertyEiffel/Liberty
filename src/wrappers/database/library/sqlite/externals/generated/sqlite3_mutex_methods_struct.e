-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_MUTEX_METHODS_STRUCT
-- Wrapper of struct sqlite3_mutex_methods defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_mutex_methods_struct_set_xmutexinit (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexInit field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexinit"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutexend (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexEnd field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexend"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutexalloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexAlloc field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexalloc"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutexfree (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexFree field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexfree"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutexenter (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexEnter field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexenter"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutextry (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexTry field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutextry"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutexleave (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexLeave field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexleave"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutexheld (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexHeld field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexheld"
      }"
      end

   sqlite3_mutex_methods_struct_set_xmutexnotheld (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMutexNotheld field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_set_xmutexnotheld"
      }"
      end

feature {} -- Low-level queries

   sqlite3_mutex_methods_struct_get_xmutexinit (a_structure: POINTER): POINTER 
         -- Query for xMutexInit field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexinit"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutexend (a_structure: POINTER): POINTER 
         -- Query for xMutexEnd field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexend"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutexalloc (a_structure: POINTER): POINTER 
         -- Query for xMutexAlloc field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexalloc"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutexfree (a_structure: POINTER): POINTER 
         -- Query for xMutexFree field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexfree"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutexenter (a_structure: POINTER): POINTER 
         -- Query for xMutexEnter field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexenter"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutextry (a_structure: POINTER): POINTER 
         -- Query for xMutexTry field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutextry"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutexleave (a_structure: POINTER): POINTER 
         -- Query for xMutexLeave field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexleave"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutexheld (a_structure: POINTER): POINTER 
         -- Query for xMutexHeld field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexheld"
      }"
      end

   sqlite3_mutex_methods_struct_get_xmutexnotheld (a_structure: POINTER): POINTER 
         -- Query for xMutexNotheld field of SQLITE3_MUTEX_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mutex_methods_struct_get_xmutexnotheld"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_mutex_methods"
               }"
               end

end -- class SQLITE3_MUTEX_METHODS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
