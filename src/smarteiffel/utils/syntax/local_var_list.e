-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOCAL_VAR_LIST
   --
   -- To store local variables declaration list.
   --

inherit
   DECLARATION_LIST

creation {EIFFEL_PARSER, INTROSPECTION_HANDLER}
   make

feature {ANY}
   name (i: INTEGER): LOCAL_NAME1 is
      do
         Result := flat_list.item(i)
      end

   collect (t: TYPE) is
      local
         i, c: INTEGER; t2: TYPE
      do
         from
            i := 1
            c := count
         until
            i > c
         loop
            t2 := name(i).result_type.resolve_in(t)
            if t2.is_expanded then
               smart_eiffel.collect_local_expanded(t2)
            end
            i := i + 1
         end
      end

   side_effect_free (type: TYPE): BOOLEAN is
      require
         smart_eiffel.status.collecting_done
      local
         i: INTEGER; static_tm: TYPE_MARK
      do
         from
            Result := True
            i := 1
         until
            not Result or else i > count
         loop
            static_tm := type_mark(i).to_static(type)
            if static_tm.is_user_expanded then
               Result := static_tm.type.live_type.side_effect_free_default_create
            end
            i := i + 1
         end
      end

   pretty is
      local
         i, j, column, wrap_limit: INTEGER; buffer: STRING; c: CHARACTER
      do
         buffer := once "........................"
         buffer.clear_count
         -- Fill the `buffer' first:
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).pretty_in(buffer)
            buffer.extend(';')
            if not pretty_printer.zen_mode then
               buffer.extend(' ')
            end
            i := i + 1
         end
         -- Output of `pretty' now start:
         pretty_printer.set_indent_level(2)
         pretty_printer.keyword(once "local")
         if pretty_printer.zen_mode and list.count = 1 then
            buffer.remove_last
            pretty_printer.put_string(buffer)
         else
            wrap_limit := pretty_printer.wrap_limit
            from
               pretty_printer.set_indent_level(3)
            until
               buffer.is_empty
            loop
               column := pretty_printer.column
               i := buffer.index_of(';', 1)
               if column + i <= wrap_limit then
                  from
                  until
                     buffer.index_of(';', i + 1) = 0 or else column + buffer.index_of(';', i + 1) > wrap_limit
                  loop
                     i := buffer.index_of(';', i + 1)
                  end
               else
                  i := buffer.index_of(',', 1)
                  if i = 0 then
                     i := buffer.index_of(';', 1)
                  else
                     from
                     until
                        buffer.index_of(',', i + 1) = 0 or else column + buffer.index_of(',', i + 1) > wrap_limit
                     loop
                        i := buffer.index_of(',', i + 1)
                     end
                  end
               end
               check
                  i > 1
               end
               -- Output from 1 .. `i' range:
               from
                  j := 1
               until
                  j = i
               loop
                  c := buffer.item(j)
                  if j = i and then c = ';' then
                     if pretty_printer.parano_mode then
                        pretty_printer.put_character(c)
                     end
                  else
                     pretty_printer.put_character(c)
                  end
                  j := j + 1
               end
               pretty_printer.set_indent_level(3)
               buffer.remove_head(i)
               if not buffer.is_empty then
                  if buffer.first = ' ' then
                     buffer.remove_first
                  end
               end
            end
         end
         pretty_printer.set_indent_level(0)
      end

   accept (visitor: LOCAL_VAR_LIST_VISITOR) is
      do
         visitor.visit_local_var_list(Current)
      end

feature {DECLARATION}
   add_last (n: LOCAL_ARGUMENT1) is
      require
         {LOCAL_NAME1} ?:= n
      local
         i: INTEGER; n1, n2: like name
      do
         n1 ::= n
         from
            i := flat_list.lower
         until
            flat_list.item(i) = Void
         loop
            n2 := flat_list.item(i)
            if n2.to_string = n1.to_string then
               error_handler.add_position(n1.start_position)
               error_handler.add_position(n2.start_position)
               error_handler.append("Same local name appears twice in this %"local%" variable list.")
               error_handler.print_as_fatal_error
            end
            i := i + 1
         end
         flat_list.put(n1, i)
         n1.set_rank(i)
      end

feature {ONCE_ROUTINE_POOL, C_LIVE_TYPE_COMPILER}
   c_declare (type: TYPE; volatile_flag: BOOLEAN) is
         -- Generate the C code for the declaration part. The `volatile_flag' indicate that an extra
         -- volatile C keyword must be generated because we are in the case of a routine with a rescue
         -- clause.
      local
         i, c: INTEGER
      do
         from
            i := 1
            c := count
         until
            i > c
         loop
            name(i).c_declare(type, volatile_flag)
            i := i + 1
         end
      end

   initialize_expanded (type: TYPE) is
      require
         cpp.pending_c_function
      local
         i, id, class_invariant_flag: INTEGER; local_type: TYPE; rf: RUN_FEATURE
         internal_c_local: INTERNAL_C_LOCAL
      do
         from
            i := 1
         until
            i > count
         loop
            local_type := type_mark(i).resolve_in(type)
            if local_type.is_user_expanded and then name(i).must_be_c_generated(type) then
               rf := local_type.live_type.default_create_run_feature
               if rf /= Void then
                  internal_c_local := cpp.pending_c_function_lock_local(local_type, once "locexp")
                  id := local_type.id
                  internal_c_local.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "=M")
                  id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ";%N")
                  cpp.push_create_instruction(type, rf, Void, internal_c_local)
                  cpp.mapper.compile(rf)
                  cpp.pop
                  cpp.pending_c_function_body.extend('_')
                  cpp.pending_c_function_body.append(name(i).to_string)
                  cpp.pending_c_function_body.extend('=')
                  internal_c_local.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ";%N")
                  internal_c_local.unlock
               end
               -- Even when there is no default creation procedure to apply, we must call the class invariant:
               class_invariant_flag := cpp.class_invariant_call_opening(local_type, False)
               if class_invariant_flag > 0 then
                  if cpp.need_struct.for(local_type.canonical_type_mark) then
                     cpp.pending_c_function_body.extend('&')
                  end
                  cpp.pending_c_function_body.extend('_')
                  cpp.pending_c_function_body.append(name(i).to_string)
                  cpp.class_invariant_call_closing(class_invariant_flag, True)
               end
            end
            i := i + 1
         end
      end

feature {ONCE_ROUTINE_POOL, RUN_FEATURE}
   jvm_initialize (type: TYPE) is
         -- Produce code in order to initialize variables.
      local
         jvm_offset, i, dummy: INTEGER; t: TYPE_MARK
      do
         from
            i := 1
         until
            i > count
         loop
            jvm_offset := jvm.local_offset_of(name(i))
            t := type_mark(i).to_static(type)
            dummy := t.jvm_push_default
            t.jvm_write_local_creation(jvm_offset)
            i := i + 1
         end
      end

feature {}
   make (l: like list) is
      require
         l.lower = 1
         not l.is_empty
      local
         il, actual_count: INTEGER
      do
         list := l
         actual_count := compute_flat_list_count_by_using_list
         create flat_list.make(1, actual_count)
         from
            il := list.lower
         until
            il > list.upper
         loop
            list.item(il).append_in_local_var_list(Current)
            il := il + 1
         end
      ensure
         list = l
         flat_list /= Void
         not flat_list.fast_has(Void)
      end

end -- class LOCAL_VAR_LIST
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
