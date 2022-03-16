-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_COMPILATION_MIXIN

inherit
   TAGGER

insert
   GLOBALS
   C_AGENT_CREATION_MIXIN

feature {} -- cpp access helpers for a bit of prettiness
   out_h: STRING
      do
         Result := cpp.out_h_buffer
      end

   flush_out_h
      do
         cpp.write_out_h_buffer
         cpp.out_h_buffer.clear_count
      end

   out_c: STRING
      do
         Result := cpp.out_c_buffer
      end

   function_signature: STRING
      do
         Result := cpp.pending_c_function_signature
      end

   function_body: STRING
      do
         Result := cpp.pending_c_function_body
      end

feature {} -- pending_c_function_counter
   pending_c_function_counter_tag (tagged: TAGGED): INTEGER
      require
         tagged /= Void
      local
         tag: TAGGED_INTEGER
      do
         tag ::= tagged.tag(pending_c_function_counter_tag_key)
         if tag /= Void then
            Result := tag.item
         end
      end

   set_pending_c_function_counter_tag (tagged: TAGGED)
      require
         tagged /= Void
      local
         value: INTEGER; tag: TAGGED_INTEGER
      do
         value := cpp.pending_c_function_counter
         tag := pending_c_function_counter_tag_values.fast_reference_at(value)
         if tag = Void then
            create tag.set_item(value)
            pending_c_function_counter_tag_values.add(tag, value)
         end
         check
            tag.item = value
         end
         tagged.set_tag(pending_c_function_counter_tag_key, tag)
      ensure
         pending_c_function_counter_tag(tagged) = cpp.pending_c_function_counter
      end

   pending_c_function_counter_tag_key: FIXED_STRING
      once
         Result := "pending_c_function_counter_tag".intern
      end

   pending_c_function_counter_tag_values: HASHED_DICTIONARY[TAGGED_INTEGER, INTEGER]
      once
         create Result.make
      end

feature {} -- internal_c_local
   internal_c_local_tag (tagged: TAGGED): INTERNAL_C_LOCAL
      require
         tagged /= Void
      local
         tag: TAGGED_INTERNAL_C_LOCAL
      do
         tag ::= tagged.tag(internal_c_local_tag_key)
         if tag /= Void then
            Result := tag.item
         end
      end

   set_internal_c_local_tag (tagged: TAGGED; c_local: INTERNAL_C_LOCAL)
      require
         tagged /= Void
         internal_c_local_tag(tagged) = Void
         c_local /= Void
      local
         tag: TAGGED_INTERNAL_C_LOCAL
      do
         tag ::= tagged.tag(internal_c_local_tag_key)
         if tag /= Void then
            tag.set_item(c_local)
         else
            create tag.set_item(c_local)
            tagged.set_tag(internal_c_local_tag_key, tag)
         end
      ensure
         internal_c_local_tag(tagged) = c_local
      end

   unlock_internal_c_local_tag (tagged: TAGGED)
      require
         tagged /= Void
      local
         tag: TAGGED_INTERNAL_C_LOCAL
      do
         tag ::= tagged.tag(internal_c_local_tag_key)
         if tag /= Void and then tag.item /= Void then
            tag.item.unlock
            tag.set_item(Void)
         end
      ensure
         internal_c_local_tag(tagged) = Void
      end

   internal_c_local_tag_key: FIXED_STRING
      once
         Result := "internal_c_local_tag".intern
      end

feature {}
   native_array_type_in (ref: NATIVE_ARRAY_TYPE_MARK; str: STRING)
      local
         et: TYPE_MARK
      do
         et := ref.generic_list.first
         if et.is_reference then
            str.append(once "T0**")
         else
            str.extend('T')
            et.type.live_type.id.append_in(str)
            str.extend('*')
         end
      ensure
         str.last = '*'
      end

   rank_name_in (rank: INTEGER; tag, buffer: STRING)
      do
         buffer.append(tag)
         if rank = -1 then
            buffer.extend('C')
         else
            buffer.extend('a')
            rank.append_in(buffer)
         end
      end

   closed_operand_name_in (co: CLOSED_OPERAND; buffer: STRING)
      do
         rank_name_in(co.rank, once "closed_", buffer)
      end

   open_operand_name_in (oo: OPEN_OPERAND; buffer: STRING)
      do
         rank_name_in(oo.rank, once "open_", buffer)
      end

feature {}
   expanded_initializer (tm: TYPE): BOOLEAN
      do
         if tm.is_user_expanded then
            Result := tm.live_type.default_create_run_feature /= Void
         end
      end

   rf7_does_need_c_wrapper (rf7: RUN_FEATURE_7): BOOLEAN
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

   rf8_does_need_c_wrapper (rf8: RUN_FEATURE_8): BOOLEAN
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

   put_c_field_name (rf2: RUN_FEATURE_2)
         -- Emit using `cpp' the corresponding field name with an extra C comment which
         -- include the offset of the corresponding C field. This extra C comment
         -- mandatory to force C recompilation, because the field may move from one
         -- compilation to another.
      require
         cpp.pending_c_function
      do
         function_body.extend('_')
         function_body.append(rf2.name.to_string)
         cpp.recompilation_comment(rf2.type_of_current.live_type)
      end

feature {}
   fe_c2c (rf: RUN_FEATURE)
      do
         error_handler.add_position(rf.start_position)
         error_handler.append(once "Command 'compile_to_c' cannot compile this code.")
         error_handler.print_as_fatal_error
      end

   extra_c_prototype_in_cpp_out_h_buffer (position: POSITION; context_type: TYPE; er: EXTERNAL_ROUTINE)
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
            out_h.append(cpp.external_type.for(er.result_type.to_static(context_type, False)))
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
               out_h.append(cpp.external_type.for(arguments.type_mark(i).to_static(context_type, False)))
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
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
