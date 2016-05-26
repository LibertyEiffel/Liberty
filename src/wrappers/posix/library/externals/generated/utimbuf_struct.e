-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UTIMBUF_STRUCT
-- Wrapper of struct utimbuf defined in file /usr/include/utime.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   utimbuf_struct_set_actime (a_structure: POINTER; a_value: like long) 
         -- Setter for actime field of UTIMBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utimbuf_struct_set_actime"
      }"
      end

   utimbuf_struct_set_modtime (a_structure: POINTER; a_value: like long) 
         -- Setter for modtime field of UTIMBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utimbuf_struct_set_modtime"
      }"
      end

feature {} -- Low-level queries

   utimbuf_struct_get_actime (a_structure: POINTER): like long 
         -- Query for actime field of UTIMBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utimbuf_struct_get_actime"
      }"
      end

   utimbuf_struct_get_modtime (a_structure: POINTER): like long 
         -- Query for modtime field of UTIMBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utimbuf_struct_get_modtime"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_utimbuf"
               }"
               end

end -- class UTIMBUF_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
