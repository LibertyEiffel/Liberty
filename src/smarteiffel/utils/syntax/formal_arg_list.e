-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FORMAL_ARG_LIST
   --
   -- For the formal arguments list of a routine.
   --

inherit
   DECLARATION_LIST

create {ANY}
   make

feature {ANY}
   name (i: INTEGER): ARGUMENT_NAME_DEF
      do
         Result := flat_list.item(i)
      end

   pretty (indent_level: INTEGER)
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
            buffer.append(once "; ")
            i := i + 1
         end
         -- Output of `pretty' now start:
         pretty_printer.put_character('(')
         from
            wrap_limit := pretty_printer.wrap_limit
         until
            buffer.is_empty
         loop
            column := pretty_printer.column
            i := buffer.index_of(';', 1)
            check
               buffer.valid_index(i)
            end
            if column + i <= wrap_limit then
               from
               until
                  not buffer.valid_index(buffer.index_of(';', i + 1)) or else column + buffer.index_of(';', i + 1) > wrap_limit
               loop
                  i := buffer.index_of(';', i + 1)
               end
            else
               i := buffer.index_of(',', 1)
               if not buffer.valid_index(i) then
                  i := buffer.index_of(';', 1)
               else
                  from
                  until
                     not buffer.valid_index(buffer.index_of(',', i + 1)) or else column + buffer.index_of(',', i + 1) > wrap_limit
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
               j > i
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
            buffer.remove_head(i)
            if not buffer.is_empty then
               if buffer.first = ' ' then
                  buffer.remove_first
               end
            end
            if not buffer.is_empty then
               pretty_printer.set_indent_level(indent_level)
            end
         end
         pretty_printer.put_character(')')
      end

   short (shorted_type: TYPE)
      local
         i: INTEGER
      do
         short_printer.hook_or(once "hook302", once " (")
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).short(shorted_type)
            i := i + 1
            if i <= list.upper then
               short_printer.hook_or(once "hook303", once "; ")
            end
         end
         short_printer.hook_or(once "hook306", once ")")
      end

   accept (visitor: FORMAL_ARG_LIST_VISITOR)
      do
         visitor.visit_formal_arg_list(Current)
      end

feature {AGENT_CREATION}
   omitted_open_arguments (type, target_type: TYPE; sp: POSITION): EFFECTIVE_ARG_LIST_N
         -- Create the corresponding omitted open arguments list.
      local
         rank: INTEGER; open_operand_1, open_operand: OPEN_OPERAND; resolved: TYPE; remainder: FAST_ARRAY[EXPRESSION]
      do
         create open_operand_1.question_mark(sp)
         open_operand_1.set_rank(1)
         resolved := type_mark(1).resolve_in(target_type)
         open_operand_1.update_resolved_memory(type, resolved)
         if count > 1 then
            create remainder.with_capacity(count - 2)
            from
               rank := 2
            until
               rank > count
            loop
               create open_operand.question_mark(sp)
               open_operand.set_rank(rank)
               resolved := type_mark(rank).resolve_in(target_type)
               open_operand.update_resolved_memory(type, resolved)
               remainder.add_last(open_operand)
               rank := rank + 1
            end
         end
         create Result.make_n(start_position, open_operand_1, remainder)
      ensure
         Result.count = count
      end

feature {ANY}
   has_like_current: BOOLEAN
      local
         i: INTEGER
      do
         from
            i := flat_list.lower
         until
            Result or else i > flat_list.upper
         loop
            Result := flat_list.item(i).result_type.is_like_current
            i := i + 1
         end
      end

feature {DECLARATION}
   add_last (n: LOCAL_ARGUMENT_DEF)
      require
         {ARGUMENT_NAME_DEF} ?:= n
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
               error_handler.append(once "Same argument name appears twice in this formal argument list.")
               error_handler.print_as_fatal_error
            end
            i := i + 1
         end
         flat_list.put(n1, i)
         n1.set_rank(i)
      end

feature {}
   make (sp: POSITION; l: like list)
         -- Parsing creation procedure.
      require
         l.lower = 1
         not l.is_empty
      local
         an: like name; tlf: LIKE_FEATURE_TYPE_MARK; an2: ARGUMENT_NAME_REF; tla, tla2: LIKE_ARGUMENT_TYPE_MARK
         i, rank, il, actual_count: INTEGER
      do
         start_position := sp
         list := l
         -- Setting up the `flat_list' first:
         actual_count := compute_flat_list_count_by_using_list
         create flat_list.make(1, actual_count)
         from
            il := list.lower
         until
            il > list.upper
         loop
            list.item(il).append_in_formal_arg_list(Current)
            il := il + 1
         end
         -- Substituting LIKE_FEATURE_TYPE_MARK/LIKE_ARGUMENT_TYPE_MARK:
         from
            check
               count = actual_count
            end
            i := 1
         until
            i > actual_count
         loop
            an := name(i)
            tlf ?= an.result_type
            if tlf /= Void then
               rank := fast_rank_of(tlf.like_what.to_string)
               if rank = i then
                  error_handler.add_position(tlf.start_position)
                  error_handler.append(fz_cad)
                  error_handler.print_as_fatal_error
               elseif rank > 0 then
                  create an2.refer_to(tlf.like_what.start_position, Current, rank, 0)
                  create tla.make(tlf.start_position, an2)
                  an.set_result_type(tla)
               end
            end
            i := i + 1
         end
         if ace.all_check then
            from
               i := 1
            until
               i > count
            loop
               tla ?= name(i).result_type
               if tla /= Void then
                  rank := fast_rank_of(tla.like_what.to_string)
                  tla2 ?= name(rank).result_type
                  if tla2 /= Void then
                     error_handler.add_position(tla.start_position)
                     error_handler.add_position(tla2.start_position)
                     error_handler.append(fz_cad)
                     error_handler.print_as_fatal_error
                  end
               end
               i := i + 1
            end
         end
      ensure
         list = list
         flat_list /= Void
      end

   tmp_string: STRING
      once
         create Result.make(32)
      end

end -- class FORMAL_ARG_LIST
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
