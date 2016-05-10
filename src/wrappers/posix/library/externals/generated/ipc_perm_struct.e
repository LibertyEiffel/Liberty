-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IPC_PERM_STRUCT
-- Wrapper of struct ipc_perm defined in file /usr/include/x86_64-linux-gnu/bits/ipc.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   ipc_perm_struct_set_uid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for uid field of IPC_PERM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_set_uid"
      }"
      end

   ipc_perm_struct_set_gid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for gid field of IPC_PERM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_set_gid"
      }"
      end

   ipc_perm_struct_set_cuid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for cuid field of IPC_PERM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_set_cuid"
      }"
      end

   ipc_perm_struct_set_cgid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for cgid field of IPC_PERM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_set_cgid"
      }"
      end

   ipc_perm_struct_set_mode (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for mode field of IPC_PERM_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_set_mode"
      }"
      end

feature {} -- Low-level queries

	-- Unwrapped private field __key.
   ipc_perm_struct_get_uid (a_structure: POINTER): NATURAL 
         -- Query for uid field of IPC_PERM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_get_uid"
      }"
      end

   ipc_perm_struct_get_gid (a_structure: POINTER): NATURAL 
         -- Query for gid field of IPC_PERM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_get_gid"
      }"
      end

   ipc_perm_struct_get_cuid (a_structure: POINTER): NATURAL 
         -- Query for cuid field of IPC_PERM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_get_cuid"
      }"
      end

   ipc_perm_struct_get_cgid (a_structure: POINTER): NATURAL 
         -- Query for cgid field of IPC_PERM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_get_cgid"
      }"
      end

   ipc_perm_struct_get_mode (a_structure: POINTER): NATURAL_16 
         -- Query for mode field of IPC_PERM_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ipc_perm_struct_get_mode"
      }"
      end

	-- Unwrapped private field __pad1.
	-- Unwrapped private field __seq.
	-- Unwrapped private field __pad2.
	-- Unwrapped private field __glibc_reserved1.
	-- Unwrapped private field __glibc_reserved2.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_ipc_perm"
               }"
               end

end -- class IPC_PERM_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
