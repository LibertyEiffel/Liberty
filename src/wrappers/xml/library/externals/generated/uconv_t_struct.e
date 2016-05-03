-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UCONV_T_STRUCT
-- Wrapper of struct _uconv_t defined in file /usr/include/libxml2/libxml/encoding.h

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

   uconv_t_struct_set_uconv (a_structure: POINTER; a_value: POINTER) 
         -- Setter for uconv field of UCONV_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "uconv_t_struct_set_uconv"
      }"
      end

   uconv_t_struct_set_utf8 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for utf8 field of UCONV_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "uconv_t_struct_set_utf8"
      }"
      end

feature {} -- Low-level queries

   uconv_t_struct_get_uconv (a_structure: POINTER): POINTER 
         -- Query for uconv field of UCONV_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "uconv_t_struct_get_uconv"
      }"
      end

   uconv_t_struct_get_utf8 (a_structure: POINTER): POINTER 
         -- Query for utf8 field of UCONV_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "uconv_t_struct_get_utf8"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_uconv_t"
               }"
               end

end -- class UCONV_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
