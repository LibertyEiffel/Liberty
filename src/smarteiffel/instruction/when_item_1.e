-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class WHEN_ITEM_1
   --
   -- To store a single value of a when clause in an inspect instruction.
   --
   -- Example :
   --          inspect ...
   --              when foo, bar, then ...
   --

inherit
   WHEN_ITEM

create {WHEN_CLAUSE}
   make

feature {ANY}
   expression: EXPRESSION
         -- The written one in the source code (which can be a CALL_0).

   manifest_expression: MANIFEST_EXPRESSION
         -- The corresponding manifest value for `expression'.

   expression_value: INTEGER
      do
         Result := integer_value_of(manifest_expression)
      end

   start_position: POSITION
      do
         Result := expression.start_position
      end

   accept (visitor: WHEN_ITEM_1_VISITOR)
      do
         visitor.visit_when_item_1(Current)
      end

feature {WHEN_ITEM_1}
   validity_check_continued_when_item_1 (type, expression_type: TYPE; occurrence_2: WHEN_ITEM_1)
      do
         if expression_value = occurrence_2.expression_value then
            error_handler.add_position(start_position)
            error_handler.add_position(occurrence_2.start_position)
            error_handler.append(once "Second occurrence for this value in the same inspect. (Wrong inspect statement.)")
            error_handler.print_as_fatal_error
         end
      end

feature {WHEN_ITEM_2}
   validity_check_continued_when_item_2 (type, expression_type: TYPE; occurrence_2: WHEN_ITEM_2)
      do
         if expression_value.in_range(occurrence_2.lower_value, occurrence_2.upper_value) then
            error_handler.add_position(start_position)
            error_handler.add_position(occurrence_2.start_position)
            error_handler.append(once "The slice includes an already encountered value. (Wrong inspect statement.)")
            error_handler.print_as_fatal_error
         end
      end

feature {WHEN_CLAUSE}
   validity_check_continued_ (type, expression_type: TYPE; occurrence_1: WHEN_ITEM)
      do
         occurrence_1.validity_check_continued_when_item_1(type, expression_type, Current)
      end

   match_value (v: INTEGER): BOOLEAN
      do
         Result := expression_value = v
      end

   collect (t: TYPE)
      local
         dummy: TYPE
      do
         dummy := expression.collect(t)
      end

   adapt_for (t: TYPE): like Current
      do
         Result := current_or_twin_init(expression.adapt_for(t))
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := expression.side_effect_free(type)
      end

feature {WHEN_ITEM_1}
   set_manifest_expression (type: TYPE)
      do
         manifest_expression := manifest_expression_check(expression, type)
      ensure
         manifest_expression /= Void
      end

   set_expression_value_character
      require
         manifest_expression /= Void
      do
         character_check(expression, manifest_expression)
      end

   set_expression_value_integer
      require
         manifest_expression /= Void
      do
         integer_check(expression, manifest_expression)
      end

feature {WHEN_CLAUSE}
   compute_values (type: TYPE; values: RING_ARRAY[INTEGER]): like values
      local
         i, v: INTEGER
      do
         if manifest_expression = Void then
            manifest_expression := manifest_expression_check(expression, type)
         end
         v := expression_value
         if values = Void then
            create Result.make(501, 502)
            Result.put(v, Result.lower)
            Result.put(v, Result.upper)
         else
            Result := values
            i := locate_in_values(Result, v)
            if i = Result.lower then
               -- v is lower than lowest value
               if v = Result.item(i) - 1 then
                  -- just change lower
                  Result.put(v, i)
               else
                  Result.resize(Result.lower - 2, Result.upper)
                  Result.put(v, Result.lower)
                  Result.put(v, Result.lower + 1)
               end
            elseif i > Result.upper then
               -- v is higher than highest value
               if v = Result.item(i - 1) + 1 then
                  -- just change upper
                  Result.put(v, i - 1)
               else
                  Result.resize(Result.lower, Result.upper + 2)
                  Result.put(v, Result.upper - 1)
                  Result.put(v, Result.upper)
               end
            else
               if v = Result.item(i - 1) + 1 and then v = Result.item(i) - 1 then
                  Result.put(Result.item(i + 1), i - 1)
                  from
                  until
                     i > Result.upper - 2
                  loop
                     Result.put(Result.item(i + 2), i)
                     Result.put(Result.item(i + 3), i + 1)
                     i := i + 2
                  end
                  Result.resize(Result.lower, Result.upper - 2)
               elseif v = Result.item(i - 1) + 1 then
                  -- just change upper
                  Result.put(v, i - 1)
               elseif v = Result.item(i) - 1 then
                  -- just change lower
                  Result.put(v, i)
               else
                  Result.resize(Result.lower, Result.upper + 2)
                  from
                     i := Result.upper - 1
                  until
                     v > Result.item(i - 1)
                  loop
                     Result.put(Result.item(i - 2), i)
                     Result.put(Result.item(i - 1), i + 1)
                     i := i - 2
                  end
                  Result.put(v, i)
                  Result.put(v, i + 1)
               end
            end
         end
      end

   force_internal_character_values (type: TYPE; container: WHEN_CLAUSE)
      do
         set_manifest_expression(type)
         set_expression_value_character
      end

   force_internal_integer_values (type: TYPE; container: WHEN_CLAUSE)
      do
         set_manifest_expression(type)
         set_expression_value_integer
      end

feature {WHEN_CLAUSE, WHEN_ITEM}
   specialize_in (new_type: TYPE): like Current
      do
         Result := current_or_twin_init(expression.specialize_in(new_type))
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := current_or_twin_init(expression.specialize_thru(parent_type, parent_edge, new_type))
      end

   specialize_and_check_character (type: TYPE): like Current
      do
         Result := current_or_twin_init(expression.specialize_and_check(type))
         Result.set_manifest_expression(type)
         Result.set_expression_value_character
      end

   specialize_and_check_integer (type: TYPE): like Current
      do
         Result := current_or_twin_init(expression.specialize_and_check(type))
         Result.set_manifest_expression(type)
         Result.set_expression_value_integer
      end

   has_been_specialized: BOOLEAN
      do
         Result := expression.has_been_specialized
      end

   pretty (indent_level: INTEGER)
      do
         expression.pretty(indent_level)
      end

feature {MANIFEST_STRING_INSPECTOR}
   set_expression_value (ev: INTEGER)
      do
         -- *** DOM April 2008 ***
         -- I am not proud of that... but what can I do here ?
         -- *** DOM April 2008 ***
         create {INTEGER_CONSTANT} manifest_expression.make(ev, expression.start_position)
      end

feature {WHEN_ITEM_1, INTROSPECTION_HANDLER}
   init (exp: like expression)
      require
         exp /= Void
      do
         expression := exp
      ensure
         expression = exp
      end

feature {}
   make (v: like expression)
      require
         v /= Void
      do
         expression := v
      ensure
         expression = v
      end

   current_or_twin_init (exp: like expression): like Current
      require
         exp /= Void
      do
         if exp = expression then
            Result := Current
         else
            error_handler.add_position(expression.start_position)
            error_handler.append(once "Internal error inside WHEN_ITEM_1 (compiler error).")
            error_handler.print_as_fatal_error
            Result := twin
            Result.init(exp)
         end
      ensure
         Result.expression = exp
      end

invariant
   expression /= Void

end -- class WHEN_ITEM_1
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
