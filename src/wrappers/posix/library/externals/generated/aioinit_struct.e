-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class AIOINIT_STRUCT
-- Wrapper of struct aioinit defined in file /usr/include/aio.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   aioinit_struct_set_aio_threads (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_threads field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_threads"
      }"
      end

   aioinit_struct_set_aio_num (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_num field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_num"
      }"
      end

   aioinit_struct_set_aio_locks (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_locks field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_locks"
      }"
      end

   aioinit_struct_set_aio_usedba (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_usedba field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_usedba"
      }"
      end

   aioinit_struct_set_aio_debug (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_debug field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_debug"
      }"
      end

   aioinit_struct_set_aio_numusers (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_numusers field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_numusers"
      }"
      end

   aioinit_struct_set_aio_idle_time (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_idle_time field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_idle_time"
      }"
      end

   aioinit_struct_set_aio_reserved (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for aio_reserved field of AIOINIT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_set_aio_reserved"
      }"
      end

feature {} -- Low-level queries

   aioinit_struct_get_aio_threads (a_structure: POINTER): INTEGER 
         -- Query for aio_threads field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_threads"
      }"
      end

   aioinit_struct_get_aio_num (a_structure: POINTER): INTEGER 
         -- Query for aio_num field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_num"
      }"
      end

   aioinit_struct_get_aio_locks (a_structure: POINTER): INTEGER 
         -- Query for aio_locks field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_locks"
      }"
      end

   aioinit_struct_get_aio_usedba (a_structure: POINTER): INTEGER 
         -- Query for aio_usedba field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_usedba"
      }"
      end

   aioinit_struct_get_aio_debug (a_structure: POINTER): INTEGER 
         -- Query for aio_debug field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_debug"
      }"
      end

   aioinit_struct_get_aio_numusers (a_structure: POINTER): INTEGER 
         -- Query for aio_numusers field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_numusers"
      }"
      end

   aioinit_struct_get_aio_idle_time (a_structure: POINTER): INTEGER 
         -- Query for aio_idle_time field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_idle_time"
      }"
      end

   aioinit_struct_get_aio_reserved (a_structure: POINTER): INTEGER 
         -- Query for aio_reserved field of AIOINIT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "aioinit_struct_get_aio_reserved"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_aioinit"
               }"
               end

end -- class AIOINIT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
