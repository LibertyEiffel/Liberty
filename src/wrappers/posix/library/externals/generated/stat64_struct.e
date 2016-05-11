-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STAT64_STRUCT
-- Wrapper of struct stat64 defined in file /usr/include/x86_64-linux-gnu/bits/stat.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   stat64_struct_set_st_dev (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for st_dev field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_dev"
      }"
      end

   stat64_struct_set_st_ino (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for st_ino field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_ino"
      }"
      end

   stat64_struct_set_st_nlink (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for st_nlink field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_nlink"
      }"
      end

   stat64_struct_set_st_mode (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for st_mode field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_mode"
      }"
      end

   stat64_struct_set_st_uid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for st_uid field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_uid"
      }"
      end

   stat64_struct_set_st_gid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for st_gid field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_gid"
      }"
      end

   stat64_struct_set_st_rdev (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for st_rdev field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_rdev"
      }"
      end

   stat64_struct_set_st_size (a_structure: POINTER; a_value: like long) 
         -- Setter for st_size field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_size"
      }"
      end

   stat64_struct_set_st_blksize (a_structure: POINTER; a_value: like long) 
         -- Setter for st_blksize field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_blksize"
      }"
      end

   stat64_struct_set_st_blocks (a_structure: POINTER; a_value: like long) 
         -- Setter for st_blocks field of STAT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_set_st_blocks"
      }"
      end

feature {} -- Low-level queries

   stat64_struct_get_st_dev (a_structure: POINTER): like long_unsigned 
         -- Query for st_dev field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_dev"
      }"
      end

   stat64_struct_get_st_ino (a_structure: POINTER): like long_unsigned 
         -- Query for st_ino field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_ino"
      }"
      end

   stat64_struct_get_st_nlink (a_structure: POINTER): like long_unsigned 
         -- Query for st_nlink field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_nlink"
      }"
      end

   stat64_struct_get_st_mode (a_structure: POINTER): NATURAL 
         -- Query for st_mode field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_mode"
      }"
      end

   stat64_struct_get_st_uid (a_structure: POINTER): NATURAL 
         -- Query for st_uid field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_uid"
      }"
      end

   stat64_struct_get_st_gid (a_structure: POINTER): NATURAL 
         -- Query for st_gid field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_gid"
      }"
      end

	-- Unwrapped private field __pad0.
   stat64_struct_get_st_rdev (a_structure: POINTER): like long_unsigned 
         -- Query for st_rdev field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_rdev"
      }"
      end

   stat64_struct_get_st_size (a_structure: POINTER): like long 
         -- Query for st_size field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_size"
      }"
      end

   stat64_struct_get_st_blksize (a_structure: POINTER): like long 
         -- Query for st_blksize field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_blksize"
      }"
      end

   stat64_struct_get_st_blocks (a_structure: POINTER): like long 
         -- Query for st_blocks field of STAT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "stat64_struct_get_st_blocks"
      }"
      end

	-- Unwrappable field st_atim.
	-- Unwrappable field st_mtim.
	-- Unwrappable field st_ctim.
	-- Unwrapped private field __glibc_reserved.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_stat64"
               }"
               end

end -- class STAT64_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
