-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FTW_STRUCT
-- Wrapper of struct FTW defined in file /usr/include/ftw.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ftw_struct_set_base (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for base field of FTW_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ftw_struct_set_base"
      }"
      end

   ftw_struct_set_level (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for level field of FTW_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ftw_struct_set_level"
      }"
      end

feature {} -- Low-level queries

   ftw_struct_get_base (a_structure: POINTER): INTEGER 
         -- Query for base field of FTW_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ftw_struct_get_base"
      }"
      end

   ftw_struct_get_level (a_structure: POINTER): INTEGER 
         -- Query for level field of FTW_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ftw_struct_get_level"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_FTW"
               }"
               end

end -- class FTW_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
