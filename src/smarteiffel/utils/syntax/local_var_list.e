-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOCAL_VAR_LIST
   --
   -- To store local variables declaration list.
   --

inherit
   DECLARATION_LIST

create {ANY}
   make

feature {ANY}
   name (i: INTEGER): LOCAL_NAME_DEF
      do
         Result := flat_list.item(i)
      end

   collect (t: TYPE)
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

   side_effect_free (type: TYPE): BOOLEAN
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
            static_tm := type_mark(i).to_static(type, False)
            if static_tm.is_user_expanded then
               Result := static_tm.type.live_type.side_effect_free_default_create
            end
            i := i + 1
         end
      end

   pretty
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

   accept (visitor: LOCAL_VAR_LIST_VISITOR)
      do
         visitor.visit_local_var_list(Current)
      end

feature {DECLARATION}
   add_last (n: LOCAL_ARGUMENT_DEF)
      require
         {LOCAL_NAME_DEF} ?:= n
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
               error_handler.append(once "Same local name appears twice in this %"local%" variable list.")
               error_handler.print_as_fatal_error
            end
            i := i + 1
         end
         flat_list.put(n1, i)
         n1.set_rank(i)
      end

feature {}
   make (sp: POSITION; l: like list)
      require
         l.lower = 1
         not l.is_empty
      local
         il, actual_count: INTEGER
      do
         start_position := sp
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
