-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TERMIOS_STRUCT
-- Wrapper of struct termios defined in file /usr/include/x86_64-linux-gnu/bits/termios.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   termios_struct_set_c_iflag (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for c_iflag field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_iflag"
      }"
      end

   termios_struct_set_c_oflag (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for c_oflag field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_oflag"
      }"
      end

   termios_struct_set_c_cflag (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for c_cflag field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_cflag"
      }"
      end

   termios_struct_set_c_lflag (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for c_lflag field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_lflag"
      }"
      end

   termios_struct_set_c_line (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for c_line field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_line"
      }"
      end

   termios_struct_set_c_cc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for c_cc field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_cc"
      }"
      end

   termios_struct_set_c_ispeed (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for c_ispeed field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_ispeed"
      }"
      end

   termios_struct_set_c_ospeed (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for c_ospeed field of TERMIOS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_set_c_ospeed"
      }"
      end

feature {} -- Low-level queries

   termios_struct_get_c_iflag (a_structure: POINTER): NATURAL 
         -- Query for c_iflag field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_iflag"
      }"
      end

   termios_struct_get_c_oflag (a_structure: POINTER): NATURAL 
         -- Query for c_oflag field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_oflag"
      }"
      end

   termios_struct_get_c_cflag (a_structure: POINTER): NATURAL 
         -- Query for c_cflag field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_cflag"
      }"
      end

   termios_struct_get_c_lflag (a_structure: POINTER): NATURAL 
         -- Query for c_lflag field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_lflag"
      }"
      end

   termios_struct_get_c_line (a_structure: POINTER): CHARACTER 
         -- Query for c_line field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_line"
      }"
      end

   termios_struct_get_c_cc (a_structure: POINTER): POINTER 
         -- Query for c_cc field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_cc"
      }"
      end

   termios_struct_get_c_ispeed (a_structure: POINTER): NATURAL 
         -- Query for c_ispeed field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_ispeed"
      }"
      end

   termios_struct_get_c_ospeed (a_structure: POINTER): NATURAL 
         -- Query for c_ospeed field of TERMIOS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "termios_struct_get_c_ospeed"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_termios"
               }"
               end

end -- class TERMIOS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
