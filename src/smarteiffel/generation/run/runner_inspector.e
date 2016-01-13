-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_INSPECTOR

inherit
   WHEN_CLAUSE_VISITOR
   WHEN_ITEM_VISITOR

insert
   RUNNER_FACET

create {RUNNER_INSTRUCTIONS}
   make

feature {RUNNER_INSTRUCTIONS}
   processor: RUNNER_PROCESSOR

   call (a_inspect: INSPECT_STATEMENT)
      local
         old_value: like value; old_found: like found
         i: INTEGER
      do
         old_value := value
         old_found := found
         value := processor.expressions.eval(a_inspect.expression)
         from
            i := a_inspect.when_list.lower
         until
            found or else i > a_inspect.when_list.upper
         loop
            a_inspect.when_list.item(i).accept(Current)
            i := i + 1
         end
         if not found then
            if a_inspect.else_compound /= Void then
               debug ("run.data")
                  std_output.put_line(once "INSPECT: selected else")
               end
               processor.instructions.execute(a_inspect.else_compound)
            elseif a_inspect.else_position.is_unknown then
               debug ("run.data")
                  std_output.put_line(once "INSPECT: nothing selected")
               end
               not_yet_implemented --| **** TODO: error, nothing selected
            end
         end
         value := old_value
         found := old_found
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE)
      local
         i: INTEGER
      do
         check
            not found
         end
         from
            i := visited.list.lower
         until
            found or else i > visited.list.upper
         loop
            visited.list.item(i).accept(Current)
            i := i + 1
         end
         if found then
            debug ("run.data")
               std_output.put_line(once "INSPECT: selected value=#(1)" # value.out)
            end
            processor.instructions.execute(visited.compound)
         end
      end

feature {WHEN_ITEM_1}
   visit_when_item_1 (visited: WHEN_ITEM_1)
      local
         item: RUNNER_OBJECT
      do
         item := processor.expressions.eval(visited.expression)
         if item.type.is_expanded then
            found := item.eq(value)
         else
            -- surely a STRING.
            --found := item.builtin_is_equal(value)
            not_yet_implemented
         end
      end

feature {WHEN_ITEM_2}
   visit_when_item_2 (visited: WHEN_ITEM_2)
      do
         break --| **** TODO
      end

feature {}
   make (a_processor: like processor)
      require
         a_processor /= Void
      do
         processor := a_processor
      ensure
         processor = a_processor
      end

   value: RUNNER_OBJECT
   found: BOOLEAN

invariant
   processor /= Void

end -- class RUNNER_INSPECTOR
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
