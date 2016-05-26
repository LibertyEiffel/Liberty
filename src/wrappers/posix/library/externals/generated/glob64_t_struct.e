-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GLOB64_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/glob.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   glob64_t_struct_set_gl_pathc (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for gl_pathc field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_pathc"
      }"
      end

   glob64_t_struct_set_gl_pathv (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gl_pathv field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_pathv"
      }"
      end

   glob64_t_struct_set_gl_offs (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for gl_offs field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_offs"
      }"
      end

   glob64_t_struct_set_gl_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for gl_flags field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_flags"
      }"
      end

   glob64_t_struct_set_gl_closedir (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gl_closedir field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_closedir"
      }"
      end

   glob64_t_struct_set_gl_readdir (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gl_readdir field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_readdir"
      }"
      end

   glob64_t_struct_set_gl_opendir (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gl_opendir field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_opendir"
      }"
      end

   glob64_t_struct_set_gl_lstat (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gl_lstat field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_lstat"
      }"
      end

   glob64_t_struct_set_gl_stat (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gl_stat field of GLOB64_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_set_gl_stat"
      }"
      end

feature {} -- Low-level queries

   glob64_t_struct_get_gl_pathc (a_structure: POINTER): like long_unsigned 
         -- Query for gl_pathc field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_pathc"
      }"
      end

   glob64_t_struct_get_gl_pathv (a_structure: POINTER): POINTER 
         -- Query for gl_pathv field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_pathv"
      }"
      end

   glob64_t_struct_get_gl_offs (a_structure: POINTER): like long_unsigned 
         -- Query for gl_offs field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_offs"
      }"
      end

   glob64_t_struct_get_gl_flags (a_structure: POINTER): INTEGER 
         -- Query for gl_flags field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_flags"
      }"
      end

   glob64_t_struct_get_gl_closedir (a_structure: POINTER): POINTER 
         -- Query for gl_closedir field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_closedir"
      }"
      end

   glob64_t_struct_get_gl_readdir (a_structure: POINTER): POINTER 
         -- Query for gl_readdir field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_readdir"
      }"
      end

   glob64_t_struct_get_gl_opendir (a_structure: POINTER): POINTER 
         -- Query for gl_opendir field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_opendir"
      }"
      end

   glob64_t_struct_get_gl_lstat (a_structure: POINTER): POINTER 
         -- Query for gl_lstat field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_lstat"
      }"
      end

   glob64_t_struct_get_gl_stat (a_structure: POINTER): POINTER 
         -- Query for gl_stat field of GLOB64_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "glob64_t_struct_get_gl_stat"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_glob64_t"
               }"
               end

end -- class GLOB64_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
