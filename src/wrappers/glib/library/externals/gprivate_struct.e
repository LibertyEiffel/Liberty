-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPRIVATE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gprivate_struct_set_p (a_structure: POINTER; a_value: POINTER) 
         -- Setter for p field of GPRIVATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gprivate_struct_set_p"
      }"
      end

   gprivate_struct_set_notify (a_structure: POINTER; a_value: POINTER) 
         -- Setter for notify field of GPRIVATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gprivate_struct_set_notify"
      }"
      end

   gprivate_struct_set_future (a_structure: POINTER; a_value: POINTER) 
         -- Setter for future field of GPRIVATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gprivate_struct_set_future"
      }"
      end

feature {} -- Low-level queries

   gprivate_struct_get_p (a_structure: POINTER): POINTER 
         -- Query for p field of GPRIVATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gprivate_struct_get_p"
      }"
      end

   gprivate_struct_get_notify (a_structure: POINTER): POINTER 
         -- Query for notify field of GPRIVATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gprivate_struct_get_notify"
      }"
      end

   gprivate_struct_get_future (a_structure: POINTER): POINTER 
         -- Query for future field of GPRIVATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gprivate_struct_get_future"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GPrivate"
               }"
               end

end -- class GPRIVATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
