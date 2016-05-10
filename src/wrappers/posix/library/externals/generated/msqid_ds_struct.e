-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MSQID_DS_STRUCT
-- Wrapper of struct msqid_ds defined in file /usr/include/x86_64-linux-gnu/bits/msq.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   msqid_ds_struct_set_msg_stime (a_structure: POINTER; a_value: like long) 
         -- Setter for msg_stime field of MSQID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_set_msg_stime"
      }"
      end

   msqid_ds_struct_set_msg_rtime (a_structure: POINTER; a_value: like long) 
         -- Setter for msg_rtime field of MSQID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_set_msg_rtime"
      }"
      end

   msqid_ds_struct_set_msg_ctime (a_structure: POINTER; a_value: like long) 
         -- Setter for msg_ctime field of MSQID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_set_msg_ctime"
      }"
      end

   msqid_ds_struct_set_msg_qnum (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for msg_qnum field of MSQID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_set_msg_qnum"
      }"
      end

   msqid_ds_struct_set_msg_qbytes (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for msg_qbytes field of MSQID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_set_msg_qbytes"
      }"
      end

   msqid_ds_struct_set_msg_lspid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msg_lspid field of MSQID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_set_msg_lspid"
      }"
      end

   msqid_ds_struct_set_msg_lrpid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msg_lrpid field of MSQID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_set_msg_lrpid"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field msg_perm.
   msqid_ds_struct_get_msg_stime (a_structure: POINTER): like long 
         -- Query for msg_stime field of MSQID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_get_msg_stime"
      }"
      end

   msqid_ds_struct_get_msg_rtime (a_structure: POINTER): like long 
         -- Query for msg_rtime field of MSQID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_get_msg_rtime"
      }"
      end

   msqid_ds_struct_get_msg_ctime (a_structure: POINTER): like long 
         -- Query for msg_ctime field of MSQID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_get_msg_ctime"
      }"
      end

	-- Unwrapped private field __msg_cbytes.
   msqid_ds_struct_get_msg_qnum (a_structure: POINTER): like long_unsigned 
         -- Query for msg_qnum field of MSQID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_get_msg_qnum"
      }"
      end

   msqid_ds_struct_get_msg_qbytes (a_structure: POINTER): like long_unsigned 
         -- Query for msg_qbytes field of MSQID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_get_msg_qbytes"
      }"
      end

   msqid_ds_struct_get_msg_lspid (a_structure: POINTER): INTEGER 
         -- Query for msg_lspid field of MSQID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_get_msg_lspid"
      }"
      end

   msqid_ds_struct_get_msg_lrpid (a_structure: POINTER): INTEGER 
         -- Query for msg_lrpid field of MSQID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msqid_ds_struct_get_msg_lrpid"
      }"
      end

	-- Unwrapped private field __glibc_reserved4.
	-- Unwrapped private field __glibc_reserved5.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_msqid_ds"
               }"
               end

end -- class MSQID_DS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
