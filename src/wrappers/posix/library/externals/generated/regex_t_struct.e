-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class REGEX_T_STRUCT
-- Wrapper of struct re_pattern_buffer defined in file /usr/include/regex.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   regex_t_struct_set_buffer (a_structure: POINTER; a_value: POINTER) 
         -- Setter for buffer field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_buffer"
      }"
      end

   regex_t_struct_set_allocated (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for allocated field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_allocated"
      }"
      end

   regex_t_struct_set_used (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for used field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_used"
      }"
      end

   regex_t_struct_set_syntax (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for syntax field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_syntax"
      }"
      end

   regex_t_struct_set_fastmap (a_structure: POINTER; a_value: POINTER) 
         -- Setter for fastmap field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_fastmap"
      }"
      end

   regex_t_struct_set_translate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for translate field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_translate"
      }"
      end

   regex_t_struct_set_re_nsub (a_structure: POINTER; a_value: like size_t) 
         -- Setter for re_nsub field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_re_nsub"
      }"
      end

   regex_t_struct_set_can_be_null (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for can_be_null field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_can_be_null"
      }"
      end

   regex_t_struct_set_regs_allocated (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for regs_allocated field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_regs_allocated"
      }"
      end

   regex_t_struct_set_fastmap_accurate (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for fastmap_accurate field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_fastmap_accurate"
      }"
      end

   regex_t_struct_set_no_sub (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for no_sub field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_no_sub"
      }"
      end

   regex_t_struct_set_not_bol (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for not_bol field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_not_bol"
      }"
      end

   regex_t_struct_set_not_eol (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for not_eol field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_not_eol"
      }"
      end

   regex_t_struct_set_newline_anchor (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for newline_anchor field of REGEX_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_set_newline_anchor"
      }"
      end

feature {} -- Low-level queries

   regex_t_struct_get_buffer (a_structure: POINTER): POINTER 
         -- Query for buffer field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_buffer"
      }"
      end

   regex_t_struct_get_allocated (a_structure: POINTER): like long_unsigned 
         -- Query for allocated field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_allocated"
      }"
      end

   regex_t_struct_get_used (a_structure: POINTER): like long_unsigned 
         -- Query for used field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_used"
      }"
      end

   regex_t_struct_get_syntax (a_structure: POINTER): like long_unsigned 
         -- Query for syntax field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_syntax"
      }"
      end

   regex_t_struct_get_fastmap (a_structure: POINTER): POINTER 
         -- Query for fastmap field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_fastmap"
      }"
      end

   regex_t_struct_get_translate (a_structure: POINTER): POINTER 
         -- Query for translate field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_translate"
      }"
      end

   regex_t_struct_get_re_nsub (a_structure: POINTER): like size_t 
         -- Query for re_nsub field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_re_nsub"
      }"
      end

   regex_t_struct_get_can_be_null (a_structure: POINTER): NATURAL 
         -- Query for can_be_null field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_can_be_null"
      }"
      end

   regex_t_struct_get_regs_allocated (a_structure: POINTER): NATURAL 
         -- Query for regs_allocated field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_regs_allocated"
      }"
      end

   regex_t_struct_get_fastmap_accurate (a_structure: POINTER): NATURAL 
         -- Query for fastmap_accurate field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_fastmap_accurate"
      }"
      end

   regex_t_struct_get_no_sub (a_structure: POINTER): NATURAL 
         -- Query for no_sub field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_no_sub"
      }"
      end

   regex_t_struct_get_not_bol (a_structure: POINTER): NATURAL 
         -- Query for not_bol field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_not_bol"
      }"
      end

   regex_t_struct_get_not_eol (a_structure: POINTER): NATURAL 
         -- Query for not_eol field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_not_eol"
      }"
      end

   regex_t_struct_get_newline_anchor (a_structure: POINTER): NATURAL 
         -- Query for newline_anchor field of REGEX_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "regex_t_struct_get_newline_anchor"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_regex_t"
               }"
               end

end -- class REGEX_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
