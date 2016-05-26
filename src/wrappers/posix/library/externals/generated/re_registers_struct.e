-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class RE_REGISTERS_STRUCT
-- Wrapper of struct re_registers defined in file /usr/include/regex.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   re_registers_struct_set_num_regs (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for num_regs field of RE_REGISTERS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "re_registers_struct_set_num_regs"
      }"
      end

   re_registers_struct_set_start (a_structure: POINTER; a_value: POINTER) 
         -- Setter for start field of RE_REGISTERS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "re_registers_struct_set_start"
      }"
      end

   re_registers_struct_set_end_field (a_structure: POINTER; a_value: POINTER) 
         -- Setter for end field of RE_REGISTERS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "re_registers_struct_set_end_field"
      }"
      end

feature {} -- Low-level queries

   re_registers_struct_get_num_regs (a_structure: POINTER): NATURAL 
         -- Query for num_regs field of RE_REGISTERS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "re_registers_struct_get_num_regs"
      }"
      end

   re_registers_struct_get_start (a_structure: POINTER): POINTER 
         -- Query for start field of RE_REGISTERS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "re_registers_struct_get_start"
      }"
      end

   re_registers_struct_get_end_field (a_structure: POINTER): POINTER 
         -- Query for end field of RE_REGISTERS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "re_registers_struct_get_end_field"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_re_registers"
               }"
               end

end -- class RE_REGISTERS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
