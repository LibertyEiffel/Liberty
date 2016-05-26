-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UTMPX_STRUCT
-- Wrapper of struct utmpx defined in file /usr/include/x86_64-linux-gnu/bits/utmpx.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   utmpx_struct_set_ut_type (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for ut_type field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_type"
      }"
      end

   utmpx_struct_set_ut_pid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ut_pid field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_pid"
      }"
      end

   utmpx_struct_set_ut_line (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ut_line field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_line"
      }"
      end

   utmpx_struct_set_ut_id (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ut_id field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_id"
      }"
      end

   utmpx_struct_set_ut_user (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ut_user field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_user"
      }"
      end

   utmpx_struct_set_ut_host (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ut_host field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_host"
      }"
      end

   utmpx_struct_set_ut_session (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ut_session field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_session"
      }"
      end

   utmpx_struct_set_ut_addr_v6 (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ut_addr_v6 field of UTMPX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_set_ut_addr_v6"
      }"
      end

feature {} -- Low-level queries

   utmpx_struct_get_ut_type (a_structure: POINTER): INTEGER_16 
         -- Query for ut_type field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_type"
      }"
      end

   utmpx_struct_get_ut_pid (a_structure: POINTER): INTEGER 
         -- Query for ut_pid field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_pid"
      }"
      end

   utmpx_struct_get_ut_line (a_structure: POINTER): POINTER 
         -- Query for ut_line field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_line"
      }"
      end

   utmpx_struct_get_ut_id (a_structure: POINTER): POINTER 
         -- Query for ut_id field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_id"
      }"
      end

   utmpx_struct_get_ut_user (a_structure: POINTER): POINTER 
         -- Query for ut_user field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_user"
      }"
      end

   utmpx_struct_get_ut_host (a_structure: POINTER): POINTER 
         -- Query for ut_host field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_host"
      }"
      end

	-- Unwrappable field ut_exit.
   utmpx_struct_get_ut_session (a_structure: POINTER): INTEGER 
         -- Query for ut_session field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_session"
      }"
      end

	-- Unwrappable field ut_tv.
   utmpx_struct_get_ut_addr_v6 (a_structure: POINTER): POINTER 
         -- Query for ut_addr_v6 field of UTMPX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utmpx_struct_get_ut_addr_v6"
      }"
      end

	-- Unwrapped private field __glibc_reserved.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_utmpx"
               }"
               end

end -- class UTMPX_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
