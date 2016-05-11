-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class WAIT_UNION
-- Wrapper of union wait defined in file /usr/include/x86_64-linux-gnu/bits/waitstatus.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   wait_union_set_w_status (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for w_status field of WAIT_UNION structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wait_union_set_w_status"
      }"
      end

feature {} -- Low-level queries

   wait_union_get_w_status (a_structure: POINTER): INTEGER 
         -- Query for w_status field of WAIT_UNION structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wait_union_get_w_status"
      }"
      end

	-- Unwrapped private field __wait_terminated.
	-- Unwrapped private field __wait_stopped.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_wait"
               }"
               end

end -- class WAIT_UNION
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
