-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRFDINSERT_STRUCT
-- Wrapper of struct strfdinsert defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   strfdinsert_struct_set_flags (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for flags field of STRFDINSERT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strfdinsert_struct_set_flags"
      }"
      end

   strfdinsert_struct_set_fildes (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for fildes field of STRFDINSERT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strfdinsert_struct_set_fildes"
      }"
      end

   strfdinsert_struct_set_offset (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for offset field of STRFDINSERT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strfdinsert_struct_set_offset"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field ctlbuf.
	-- Unwrappable field databuf.
   strfdinsert_struct_get_flags (a_structure: POINTER): NATURAL 
         -- Query for flags field of STRFDINSERT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strfdinsert_struct_get_flags"
      }"
      end

   strfdinsert_struct_get_fildes (a_structure: POINTER): INTEGER 
         -- Query for fildes field of STRFDINSERT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strfdinsert_struct_get_fildes"
      }"
      end

   strfdinsert_struct_get_offset (a_structure: POINTER): INTEGER 
         -- Query for offset field of STRFDINSERT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strfdinsert_struct_get_offset"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_strfdinsert"
               }"
               end

end -- class STRFDINSERT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
