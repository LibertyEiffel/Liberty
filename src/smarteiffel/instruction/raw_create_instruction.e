class RAW_CREATE_INSTRUCTION

inherit
   CREATE_INSTRUCTION
      rename
         make as create_instruction_make
      redefine
         compile_to_c
      end

creation
   make

feature {ANY}
   compile_to_c (type: TYPE) is
      local
         created_type_memory: TYPE; internal_c_local: INTERNAL_C_LOCAL
      do
         created_type_memory := created_type(type)
         if created_type_memory.is_reference then
            internal_c_local := cpp.pending_c_function_lock_local(created_type_memory, once "rawci")
            cpp.gc_handler.allocation_of(internal_c_local, created_type_memory.live_type)
            writable.compile_to_c(type)
            cpp.pending_c_function_body.append(once "=((T0*)")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ");%N")
            internal_c_local.unlock
         else
            writable.compile_to_c(type)
            cpp.pending_c_function_body.append(once "=M")
            created_type_memory.live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
      end

feature {}
   make (sp: like start_position; et: like explicit_type; w: like writable) is
      require
         not sp.is_unknown
         w /= Void
      do
         create_instruction_make(sp, et, w, Void)
      ensure
         start_position = sp
         explicit_type = et
         writable /= Void
         call = Void
      end

end -- class RAW_CREATE_INSTRUCTION
