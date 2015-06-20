-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GDATE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gdate_struct_set_julian_days (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for julian_days field of GDATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_set_julian_days"
      }"
      end

   gdate_struct_set_julian (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for julian field of GDATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_set_julian"
      }"
      end

   gdate_struct_set_dmy (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for dmy field of GDATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_set_dmy"
      }"
      end

   gdate_struct_set_day (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for day field of GDATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_set_day"
      }"
      end

   gdate_struct_set_month (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for month field of GDATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_set_month"
      }"
      end

   gdate_struct_set_year (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for year field of GDATE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_set_year"
      }"
      end

feature {} -- Low-level queries

   gdate_struct_get_julian_days (a_structure: POINTER): NATURAL 
         -- Query for julian_days field of GDATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_get_julian_days"
      }"
      end

   gdate_struct_get_julian (a_structure: POINTER): NATURAL 
         -- Query for julian field of GDATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_get_julian"
      }"
      end

   gdate_struct_get_dmy (a_structure: POINTER): NATURAL 
         -- Query for dmy field of GDATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_get_dmy"
      }"
      end

   gdate_struct_get_day (a_structure: POINTER): NATURAL 
         -- Query for day field of GDATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_get_day"
      }"
      end

   gdate_struct_get_month (a_structure: POINTER): NATURAL 
         -- Query for month field of GDATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_get_month"
      }"
      end

   gdate_struct_get_year (a_structure: POINTER): NATURAL 
         -- Query for year field of GDATE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gdate_struct_get_year"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GDate"
               }"
               end

end -- class GDATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
