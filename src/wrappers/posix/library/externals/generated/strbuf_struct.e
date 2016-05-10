-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRBUF_STRUCT
-- Wrapper of struct strbuf defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   strbuf_struct_set_maxlen (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for maxlen field of STRBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strbuf_struct_set_maxlen"
      }"
      end

   strbuf_struct_set_len (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for len field of STRBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strbuf_struct_set_len"
      }"
      end

   strbuf_struct_set_buf (a_structure: POINTER; a_value: POINTER) 
         -- Setter for buf field of STRBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strbuf_struct_set_buf"
      }"
      end

feature {} -- Low-level queries

   strbuf_struct_get_maxlen (a_structure: POINTER): INTEGER 
         -- Query for maxlen field of STRBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strbuf_struct_get_maxlen"
      }"
      end

   strbuf_struct_get_len (a_structure: POINTER): INTEGER 
         -- Query for len field of STRBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strbuf_struct_get_len"
      }"
      end

   strbuf_struct_get_buf (a_structure: POINTER): POINTER 
         -- Query for buf field of STRBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strbuf_struct_get_buf"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_strbuf"
               }"
               end

end -- class STRBUF_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
