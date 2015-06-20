-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTHREAD_POOL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gthread_pool_struct_set_func (a_structure: POINTER; a_value: POINTER) 
         -- Setter for func field of GTHREAD_POOL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gthread_pool_struct_set_func"
      }"
      end

   gthread_pool_struct_set_user_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for user_data field of GTHREAD_POOL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gthread_pool_struct_set_user_data"
      }"
      end

   gthread_pool_struct_set_exclusive (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for exclusive field of GTHREAD_POOL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gthread_pool_struct_set_exclusive"
      }"
      end

feature {} -- Low-level queries

   gthread_pool_struct_get_func (a_structure: POINTER): POINTER 
         -- Query for func field of GTHREAD_POOL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gthread_pool_struct_get_func"
      }"
      end

   gthread_pool_struct_get_user_data (a_structure: POINTER): POINTER 
         -- Query for user_data field of GTHREAD_POOL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gthread_pool_struct_get_user_data"
      }"
      end

   gthread_pool_struct_get_exclusive (a_structure: POINTER): INTEGER 
         -- Query for exclusive field of GTHREAD_POOL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gthread_pool_struct_get_exclusive"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GThreadPool"
               }"
               end

end -- class GTHREAD_POOL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
