-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCLOSURE_NOTIFY_DATA_STRUCT
-- Wrapper of struct _GClosureNotifyData defined in file /usr/include/glib-2.0/gobject/gclosure.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gclosure_notify_data_struct_set_data (a_structure: POINTER; a_value: POINTER) 
         -- Setter for data field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_notify_data_struct_set_data"
      }"
      end

   gclosure_notify_data_struct_set_notify (a_structure: POINTER; a_value: POINTER) 
         -- Setter for notify field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_notify_data_struct_set_notify"
      }"
      end

feature {} -- Low-level queries

   gclosure_notify_data_struct_get_data (a_structure: POINTER): POINTER 
         -- Query for data field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_notify_data_struct_get_data"
      }"
      end

   gclosure_notify_data_struct_get_notify (a_structure: POINTER): POINTER 
         -- Query for notify field of GCLOSURE_NOTIFY_DATA_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gclosure_notify_data_struct_get_notify"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gclosure_notify_data"
               }"
               end

end -- class GCLOSURE_NOTIFY_DATA_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
