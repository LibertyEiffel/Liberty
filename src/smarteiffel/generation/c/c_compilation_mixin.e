-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_COMPILATION_MIXIN

insert
   GLOBALS

feature {} -- cpp access helpers for a bit of prettiness
   out_h: STRING is
      do
         Result := cpp.out_h_buffer
      end

   flush_out_h is
      do
         cpp.write_out_h_buffer
         cpp.out_h_buffer.clear_count
      end

   out_c: STRING is
      do
         Result := cpp.out_c_buffer
      end

   function_signature: STRING is
      do
         Result := cpp.pending_c_function_signature
      end

   function_body: STRING is
      do
         Result := cpp.pending_c_function_body
      end

feature {}
   native_array_type_in (na: NATIVE_ARRAY_TYPE_MARK; str: STRING) is
      local
         et: TYPE_MARK
      do
         et := na.generic_list.first
         if et.is_reference then
            str.append(once "T0**")
         else
            str.extend('T')
            et.type.live_type.id.append_in(str)
            str.extend('*')
         end
      end

   rank_name_in (rank: INTEGER; tag, buffer: STRING) is
      do
         buffer.append(tag)
         if rank = -1 then
            buffer.extend('C')
         else
            buffer.extend('a')
            rank.append_in(buffer)
         end
      end

   closed_operand_name_in (co: CLOSED_OPERAND; buffer: STRING) is
      do
         rank_name_in(co.rank, once "closed_", buffer)
      end

   open_operand_name_in (oo: OPEN_OPERAND; buffer: STRING) is
      do
         rank_name_in(oo.rank, once "open_", buffer)
      end

feature {}
   expanded_initializer (tm: TYPE): BOOLEAN is
      do
         if tm.is_user_expanded then
            Result := tm.live_type.default_create_run_feature /= Void
         end
      end

   rf7_does_need_c_wrapper (rf7: RUN_FEATURE_7): BOOLEAN is
      do
         if rf7.base_feature.is_generated_eiffel then
            Result := True
         elseif cpp.native_need_wrapper.for_rf7(rf7) then
            Result := True
         elseif rf7.require_assertion /= Void then
            Result := True
         elseif rf7.ensure_assertion /= Void then
            Result := True
         end
      end

   rf8_does_need_c_wrapper (rf8: RUN_FEATURE_8): BOOLEAN is
      do
         if rf8.base_feature.is_generated_eiffel then
            Result := True
         elseif cpp.native_need_wrapper.for_rf8(rf8) then
            Result := True
         elseif rf8.require_assertion /= Void then
            Result := True
         elseif rf8.ensure_assertion /= Void then
            Result := True
         end
      end

feature {}
   fe_c2c (rf: RUN_FEATURE) is
      do
         error_handler.add_position(rf.start_position)
         error_handler.append("Command 'compile_to_c' cannot compile this code.")
         error_handler.print_as_fatal_error
      end

   extra_c_prototype_in_cpp_out_h_buffer (position: POSITION; context_type: TYPE; er: EXTERNAL_ROUTINE) is
      local
         arguments: FORMAL_ARG_LIST; i: INTEGER
      do
         out_h.copy(once "/* Extra external prototype for line ")
         position.line.append_in(out_h)
         out_h.append(once " of ")
         out_h.append(position.path)
         out_h.append(once ":*/%N")
         if er.result_type = Void then
            out_h.append(once "void")
         else
            out_h.append(cpp.result_type.for_external(er.result_type.to_static(context_type)))
         end
         out_h.extend(' ')
         out_h.append(er.external_name)
         out_h.extend('(')
         arguments := er.arguments
         if arguments = Void then
            out_h.append(once "void")
         else
            from
               i := 1
            until
               i > arguments.count
            loop
               out_h.append(cpp.result_type.for_external(arguments.type_mark(i).to_static(context_type)))
               out_h.append(once " a")
               i.append_in(out_h)
               if i < arguments.count then
                  out_h.extend(',')
               end
               i := i + 1
            end
         end
         out_h.extend(')')
      end

end -- class C_COMPILATION_MIXIN
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
