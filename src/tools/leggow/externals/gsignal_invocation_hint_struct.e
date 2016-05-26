-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSIGNAL_INVOCATION_HINT_STRUCT
-- Wrapper of struct _GSignalInvocationHint defined in file /usr/include/glib-2.0/gobject/gsignal.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gsignal_invocation_hint_struct_set_signal_id (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for signal_id field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_invocation_hint_struct_set_signal_id"
      }"
      end

   gsignal_invocation_hint_struct_set_detail (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for detail field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_invocation_hint_struct_set_detail"
      }"
      end

   gsignal_invocation_hint_struct_set_run_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for run_type field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_invocation_hint_struct_set_run_type"
      }"
      end

feature {} -- Low-level queries

   gsignal_invocation_hint_struct_get_signal_id (a_structure: POINTER): NATURAL 
         -- Query for signal_id field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_invocation_hint_struct_get_signal_id"
      }"
      end

   gsignal_invocation_hint_struct_get_detail (a_structure: POINTER): NATURAL 
         -- Query for detail field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_invocation_hint_struct_get_detail"
      }"
      end

   gsignal_invocation_hint_struct_get_run_type (a_structure: POINTER): INTEGER 
         -- Query for run_type field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsignal_invocation_hint_struct_get_run_type"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gsignal_invocation_hint"
               }"
               end

end -- class GSIGNAL_INVOCATION_HINT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
