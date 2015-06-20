-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GDEBUG_KEY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gdebug_key_struct_set_key (a_structure: POINTER; a_value: POINTER) 
         -- Setter for key field of GDEBUG_KEY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdebug_key_struct_set_key"
      }"
      end

   gdebug_key_struct_set_value (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for value field of GDEBUG_KEY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdebug_key_struct_set_value"
      }"
      end

feature {} -- Low-level queries

   gdebug_key_struct_get_key (a_structure: POINTER): POINTER 
         -- Query for key field of GDEBUG_KEY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdebug_key_struct_get_key"
      }"
      end

   gdebug_key_struct_get_value (a_structure: POINTER): NATURAL 
         -- Query for value field of GDEBUG_KEY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdebug_key_struct_get_value"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GDebugKey"
               }"
               end

end -- class GDEBUG_KEY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
