-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCLOSURE_STRUCT
-- Wrapper of struct _GClosure defined in file /usr/include/glib-2.0/gobject/gclosure.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gclosure_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for ref_count field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_ref_count"
      }"
      end

   gclosure_struct_set_meta_marshal_nouse (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for meta_marshal_nouse field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_meta_marshal_nouse"
      }"
      end

   gclosure_struct_set_n_guards (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_guards field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_n_guards"
      }"
      end

   gclosure_struct_set_n_fnotifiers (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_fnotifiers field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_n_fnotifiers"
      }"
      end

   gclosure_struct_set_n_inotifiers (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_inotifiers field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_n_inotifiers"
      }"
      end

   gclosure_struct_set_in_inotify (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for in_inotify field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_in_inotify"
      }"
      end

   gclosure_struct_set_floating (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for floating field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_floating"
      }"
      end

   gclosure_struct_set_derivative_flag (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for derivative_flag field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_derivative_flag"
      }"
      end

   gclosure_struct_set_in_marshal (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for in_marshal field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_in_marshal"
      }"
      end

   gclosure_struct_set_is_invalid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for is_invalid field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_is_invalid"
      }"
      end

   gclosure_struct_set_marshal (a_structure: POINTER; a_value: POINTER) 
         -- Setter for marshal field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_marshal"
      }"
      end

   gclosure_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_data"
      }"
      end

   gclosure_struct_set_notifiers (a_structure: POINTER; a_value: POINTER) 
         -- Setter for notifiers field of GCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_set_notifiers"
      }"
      end

feature {} -- Low-level queries

   gclosure_struct_get_ref_count (a_structure: POINTER): NATURAL 
         -- Query for ref_count field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_ref_count"
      }"
      end

   gclosure_struct_get_meta_marshal_nouse (a_structure: POINTER): NATURAL 
         -- Query for meta_marshal_nouse field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_meta_marshal_nouse"
      }"
      end

   gclosure_struct_get_n_guards (a_structure: POINTER): NATURAL 
         -- Query for n_guards field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_n_guards"
      }"
      end

   gclosure_struct_get_n_fnotifiers (a_structure: POINTER): NATURAL 
         -- Query for n_fnotifiers field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_n_fnotifiers"
      }"
      end

   gclosure_struct_get_n_inotifiers (a_structure: POINTER): NATURAL 
         -- Query for n_inotifiers field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_n_inotifiers"
      }"
      end

   gclosure_struct_get_in_inotify (a_structure: POINTER): NATURAL 
         -- Query for in_inotify field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_in_inotify"
      }"
      end

   gclosure_struct_get_floating (a_structure: POINTER): NATURAL 
         -- Query for floating field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_floating"
      }"
      end

   gclosure_struct_get_derivative_flag (a_structure: POINTER): NATURAL 
         -- Query for derivative_flag field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_derivative_flag"
      }"
      end

   gclosure_struct_get_in_marshal (a_structure: POINTER): NATURAL 
         -- Query for in_marshal field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_in_marshal"
      }"
      end

   gclosure_struct_get_is_invalid (a_structure: POINTER): NATURAL 
         -- Query for is_invalid field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_is_invalid"
      }"
      end

   gclosure_struct_get_marshal (a_structure: POINTER): POINTER 
         -- Query for marshal field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_marshal"
      }"
      end

   gclosure_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_data"
      }"
      end

   gclosure_struct_get_notifiers (a_structure: POINTER): POINTER 
         -- Query for notifiers field of GCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_struct_get_notifiers"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gclosure"
               }"
               end

end -- class GCLOSURE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
