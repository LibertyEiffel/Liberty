-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STATVFS_STRUCT
-- Wrapper of struct statvfs defined in file /usr/include/x86_64-linux-gnu/bits/statvfs.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   statvfs_struct_set_f_bsize (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_bsize field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_bsize"
      }"
      end

   statvfs_struct_set_f_frsize (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_frsize field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_frsize"
      }"
      end

   statvfs_struct_set_f_blocks (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_blocks field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_blocks"
      }"
      end

   statvfs_struct_set_f_bfree (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_bfree field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_bfree"
      }"
      end

   statvfs_struct_set_f_bavail (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_bavail field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_bavail"
      }"
      end

   statvfs_struct_set_f_files (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_files field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_files"
      }"
      end

   statvfs_struct_set_f_ffree (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_ffree field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_ffree"
      }"
      end

   statvfs_struct_set_f_favail (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_favail field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_favail"
      }"
      end

   statvfs_struct_set_f_fsid (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_fsid field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_fsid"
      }"
      end

   statvfs_struct_set_f_flag (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_flag field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_flag"
      }"
      end

   statvfs_struct_set_f_namemax (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for f_namemax field of STATVFS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_set_f_namemax"
      }"
      end

feature {} -- Low-level queries

   statvfs_struct_get_f_bsize (a_structure: POINTER): like long_unsigned 
         -- Query for f_bsize field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_bsize"
      }"
      end

   statvfs_struct_get_f_frsize (a_structure: POINTER): like long_unsigned 
         -- Query for f_frsize field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_frsize"
      }"
      end

   statvfs_struct_get_f_blocks (a_structure: POINTER): like long_unsigned 
         -- Query for f_blocks field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_blocks"
      }"
      end

   statvfs_struct_get_f_bfree (a_structure: POINTER): like long_unsigned 
         -- Query for f_bfree field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_bfree"
      }"
      end

   statvfs_struct_get_f_bavail (a_structure: POINTER): like long_unsigned 
         -- Query for f_bavail field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_bavail"
      }"
      end

   statvfs_struct_get_f_files (a_structure: POINTER): like long_unsigned 
         -- Query for f_files field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_files"
      }"
      end

   statvfs_struct_get_f_ffree (a_structure: POINTER): like long_unsigned 
         -- Query for f_ffree field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_ffree"
      }"
      end

   statvfs_struct_get_f_favail (a_structure: POINTER): like long_unsigned 
         -- Query for f_favail field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_favail"
      }"
      end

   statvfs_struct_get_f_fsid (a_structure: POINTER): like long_unsigned 
         -- Query for f_fsid field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_fsid"
      }"
      end

   statvfs_struct_get_f_flag (a_structure: POINTER): like long_unsigned 
         -- Query for f_flag field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_flag"
      }"
      end

   statvfs_struct_get_f_namemax (a_structure: POINTER): like long_unsigned 
         -- Query for f_namemax field of STATVFS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "statvfs_struct_get_f_namemax"
      }"
      end

	-- Unwrapped private field __f_spare.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_statvfs"
               }"
               end

end -- class STATVFS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
