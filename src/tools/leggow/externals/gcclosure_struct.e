-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCCLOSURE_STRUCT
-- Wrapper of struct _GCClosure defined in file /usr/include/glib-2.0/gobject/gclosure.h

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gcclosure_struct_set_callback (a_structure: POINTER; a_value: POINTER) 
         -- Setter for callback field of GCCLOSURE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gcclosure_struct_set_callback"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field closure.
   gcclosure_struct_get_callback (a_structure: POINTER): POINTER 
         -- Query for callback field of GCCLOSURE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gcclosure_struct_get_callback"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gcclosure"
               }"
               end

end -- class GCCLOSURE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
