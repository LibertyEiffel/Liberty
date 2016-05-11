-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class BANDINFO_STRUCT
-- Wrapper of struct bandinfo defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   bandinfo_struct_set_bi_pri (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for bi_pri field of BANDINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "bandinfo_struct_set_bi_pri"
      }"
      end

   bandinfo_struct_set_bi_flag (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for bi_flag field of BANDINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "bandinfo_struct_set_bi_flag"
      }"
      end

feature {} -- Low-level queries

   bandinfo_struct_get_bi_pri (a_structure: POINTER): CHARACTER 
         -- Query for bi_pri field of BANDINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "bandinfo_struct_get_bi_pri"
      }"
      end

   bandinfo_struct_get_bi_flag (a_structure: POINTER): INTEGER 
         -- Query for bi_flag field of BANDINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "bandinfo_struct_get_bi_flag"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_bandinfo"
               }"
               end

end -- class BANDINFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
