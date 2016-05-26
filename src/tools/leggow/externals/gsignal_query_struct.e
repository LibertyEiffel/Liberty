-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSIGNAL_QUERY_STRUCT
-- Wrapper of struct _GSignalQuery defined in file /usr/include/glib-2.0/gobject/gsignal.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gsignal_query_struct_set_signal_id (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for signal_id field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_set_signal_id"
      }"
      end

   gsignal_query_struct_set_signal_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for signal_name field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_set_signal_name"
      }"
      end

   gsignal_query_struct_set_itype (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for itype field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_set_itype"
      }"
      end

   gsignal_query_struct_set_signal_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for signal_flags field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_set_signal_flags"
      }"
      end

   gsignal_query_struct_set_return_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for return_type field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_set_return_type"
      }"
      end

   gsignal_query_struct_set_n_params (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for n_params field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_set_n_params"
      }"
      end

   gsignal_query_struct_set_param_types (a_structure: POINTER; a_value: POINTER) 
         -- Setter for param_types field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_set_param_types"
      }"
      end

feature {} -- Low-level queries

   gsignal_query_struct_get_signal_id (a_structure: POINTER): NATURAL 
         -- Query for signal_id field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_get_signal_id"
      }"
      end

   gsignal_query_struct_get_signal_name (a_structure: POINTER): POINTER 
         -- Query for signal_name field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_get_signal_name"
      }"
      end

   gsignal_query_struct_get_itype (a_structure: POINTER): like long_unsigned 
         -- Query for itype field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_get_itype"
      }"
      end

   gsignal_query_struct_get_signal_flags (a_structure: POINTER): INTEGER 
         -- Query for signal_flags field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_get_signal_flags"
      }"
      end

   gsignal_query_struct_get_return_type (a_structure: POINTER): like long_unsigned 
         -- Query for return_type field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_get_return_type"
      }"
      end

   gsignal_query_struct_get_n_params (a_structure: POINTER): NATURAL 
         -- Query for n_params field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_get_n_params"
      }"
      end

   gsignal_query_struct_get_param_types (a_structure: POINTER): POINTER 
         -- Query for param_types field of GSIGNAL_QUERY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_query_struct_get_param_types"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gsignal_query"
               }"
               end

end -- class GSIGNAL_QUERY_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
