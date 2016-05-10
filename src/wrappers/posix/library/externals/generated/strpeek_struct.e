-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRPEEK_STRUCT
-- Wrapper of struct strpeek defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   strpeek_struct_set_flags (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for flags field of STRPEEK_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strpeek_struct_set_flags"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field ctlbuf.
	-- Unwrappable field databuf.
   strpeek_struct_get_flags (a_structure: POINTER): NATURAL 
         -- Query for flags field of STRPEEK_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strpeek_struct_get_flags"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_strpeek"
               }"
               end

end -- class STRPEEK_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
