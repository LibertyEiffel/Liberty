class RAW_CREATE_INSTRUCTION

inherit
   CREATE_INSTRUCTION
      rename
         make as create_instruction_make
      redefine
         accept
      end

create {ANY}
   make

feature {ANY}
   accept (visitor: CREATE_INSTRUCTION_VISITOR) is
      do
         visitor.visit_raw_create_instruction(Current)
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
