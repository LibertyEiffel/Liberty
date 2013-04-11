-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class WHEN_ITEM_2
   --
   -- To store a slice value of a when clause in an inspect instruction.
   --
   -- Exemple :
   --          inspect ...
   --              when foo .. bar, then ...
   --

inherit
   WHEN_ITEM

create {WHEN_CLAUSE}
   make

feature {ANY}
   lower, upper: EXPRESSION
         -- The written slice in the source code (they may be calls, actually CALL_0).

   lower_manifest_expression, upper_manifest_expression: MANIFEST_EXPRESSION
         -- The corresponding values for `lower' and `upper'.

   lower_value: INTEGER is
      do
         Result := integer_value_of(lower_manifest_expression)
      end

   upper_value: INTEGER is
      do
         Result := integer_value_of(upper_manifest_expression)
      end

   start_position: POSITION is
      do
         Result := lower.start_position
      end

   accept (visitor: WHEN_ITEM_2_VISITOR) is
      do
         visitor.visit_when_item_2(Current)
      end

feature {WHEN_ITEM_2}
   init (l: like lower; u: like upper) is
      require
         l /= Void
         u /= Void
      do
         lower := l
         upper := u
      ensure
         lower = l
         upper = u
      end

   set_lower_upper_manifest_expression (type: TYPE) is
      do
         lower_manifest_expression := manifest_expression_check(lower, type)
         upper_manifest_expression := manifest_expression_check(upper, type)
      ensure
         lower_manifest_expression /= Void
         upper_manifest_expression /= Void
      end

   set_values_character is
      require
         lower_manifest_expression /= Void
         upper_manifest_expression /= Void
      do
         character_check(lower, lower_manifest_expression)
         character_check(upper, upper_manifest_expression)
      end

   set_values_integer is
      require
         lower_manifest_expression /= Void
         upper_manifest_expression /= Void
      do
         integer_check(lower, lower_manifest_expression)
         integer_check(upper, upper_manifest_expression)
      end

feature {WHEN_CLAUSE}
   validity_check_continued_ (type, expression_type: TYPE; occurrence_1: WHEN_ITEM) is
      do
         occurrence_1.validity_check_continued_when_item_2(type, expression_type, Current)
      end

   match_value (v: INTEGER): BOOLEAN is
      do
         Result := v.in_range(lower_value, upper_value)
      end

   collect (t: TYPE) is
      local
         dummy: TYPE
      do
         if lower /= Void then
            dummy := lower.collect(t)
         end
         if upper /= Void then
            dummy := upper.collect(t)
         end
      end

   adapt_for (t: TYPE): like Current is
      do
         Result := current_or_twin_init(lower.adapt_for(t), upper.adapt_for(t))
      end

   compute_values (type: TYPE; values: ARRAY[INTEGER]): like values is
      local
         l, u, i: INTEGER
      do
         if lower_manifest_expression = Void then
            lower_manifest_expression := manifest_expression_check(lower, type)
            check
               upper_manifest_expression = Void
            end
            upper_manifest_expression := manifest_expression_check(upper, type)
         end
         l := lower_value
         u := upper_value
         if values = Void then
            create Result.make(501, 502)
            Result.put(l, Result.lower)
            Result.put(u, Result.upper)
         else
            Result := values
            i := locate_in_values(Result, l)
            if i = Result.lower then
               -- l and u are lower than lowest value
               if u = Result.item(i) - 1 then
                  -- just change lower
                  Result.put(l, i)
               else
                  Result.resize(Result.lower - 2, Result.upper)
                  Result.put(l, Result.lower)
                  Result.put(u, Result.lower + 1)
               end
            elseif i > Result.upper then
               -- l and u are higher than highest
               if l = Result.item(i - 1) + 1 then
                  -- just change upper
                  Result.put(u, i - 1)
               else
                  Result.resize(Result.lower, Result.upper + 2)
                  Result.put(l, Result.upper - 1)
                  Result.put(u, Result.upper)
               end
            else
               if l = Result.item(i - 1) + 1 and then u = Result.item(i) - 1 then
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
               elseif l = Result.item(i - 1) + 1 then
                  -- just change upper
                  Result.put(u, i - 1)
               elseif u = Result.item(i) - 1 then
                  -- just change lower
                  Result.put(l, i)
               else
                  Result.resize(Result.lower, Result.upper + 2)
                  from
                     i := Result.upper - 1
                  until
                     l > Result.item(i - 1)
                  loop
                     Result.put(Result.item(i - 2), i)
                     Result.put(Result.item(i - 1), i + 1)
                     i := i - 2
                  end
                  Result.put(l, i)
                  Result.put(u, i + 1)
               end
            end
         end
      end

   force_internal_character_values (type: TYPE; container: WHEN_CLAUSE) is
      do
         set_lower_upper_manifest_expression(type)
         set_values_character
      end

   force_internal_integer_values (type: TYPE; container: WHEN_CLAUSE) is
      do
         set_lower_upper_manifest_expression(type)
         set_values_integer
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := lower.side_effect_free(type) and then upper.side_effect_free(type)
      end

feature {}
   make (l, u: EXPRESSION) is
      require
         l /= Void
         u /= Void
      do
         lower := l
         upper := u
      ensure
         lower = l
         upper = u
      end

feature {WHEN_CLAUSE, WHEN_ITEM}
   specialize_in (new_type: TYPE): like Current is
      do
         Result := current_or_twin_init(lower.specialize_in(new_type), upper.specialize_in(new_type))
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         Result := current_or_twin_init(lower.specialize_thru(parent_type, parent_edge, new_type), upper.specialize_thru(parent_type, parent_edge, new_type))
      end

   specialize_2_character (type: TYPE): like Current is
      do
         Result := current_or_twin_init(lower.specialize_2(type), upper.specialize_2(type))
         Result.set_lower_upper_manifest_expression(type)
         Result.set_values_character
         Result.lower_upper_value_check
      end

   specialize_2_integer (type: TYPE): like Current is
      do
         Result := current_or_twin_init(lower.specialize_2(type), upper.specialize_2(type))
         Result.set_lower_upper_manifest_expression(type)
         Result.set_values_integer
         Result.lower_upper_value_check
      end

   has_been_specialized: BOOLEAN is
      do
         Result := lower.has_been_specialized and then upper.has_been_specialized
      end

   pretty (indent_level: INTEGER) is
      do
         lower.pretty(indent_level)
         if not pretty_printer.zen_mode then
            pretty_printer.put_character(' ')
         end
         pretty_printer.put_string(once "..")
         if not pretty_printer.zen_mode then
            pretty_printer.put_character(' ')
         end
         upper.pretty(indent_level)
      end

feature {WHEN_ITEM_1}
   validity_check_continued_when_item_1 (type, expression_type: TYPE; occurrence_2: WHEN_ITEM_1) is
      do
         if occurrence_2.expression_value.in_range(lower_value, upper_value) then
            error_handler.add_position(start_position)
            error_handler.add_position(occurrence_2.start_position)
            error_handler.append(once "The value is already part of previously encountered slice. (Wrong inspect statement.)")
            error_handler.print_as_fatal_error
         end
      end

feature {WHEN_ITEM_2}
   validity_check_continued_when_item_2 (type, expression_type: TYPE; occurrence_2: WHEN_ITEM_2) is
      do
         if occurrence_2.lower_value.in_range(lower_value, upper_value) or else occurrence_2.upper_value.in_range(lower_value, upper_value) then
            error_handler.add_position(start_position)
            error_handler.add_position(occurrence_2.start_position)
            error_handler.append(once "Overlapping slices. (Wrong inspect statement.)")
            error_handler.print_as_fatal_error
         end
      end

   lower_upper_value_check is
      do
         if lower_value >= upper_value then
            error_handler.add_position(lower.start_position)
            error_handler.add_position(upper.start_position)
            error_handler.append(once "Not a good slice. The lower bound (")
            error_handler.append_integer(lower_value)
            error_handler.append(once ") is not smaller than upper bound (")
            error_handler.append_integer(upper_value)
            error_handler.append(once ").")
            error_handler.print_as_fatal_error
         end
      end

feature {}
   current_or_twin_init (l: like lower; u: like upper): like Current is
      require
         l /= Void
         u /= Void
      do
         if l = lower and then u = upper then
            Result := Current
         else
            error_handler.add_position(lower.start_position)
            error_handler.append(once "Internal error inside WHEN_ITEM_2 (compiler error).")
            error_handler.print_as_fatal_error
            Result := twin
            Result.init(l, u)
         end
      ensure
         Result.lower = l
         Result.upper = u
      end

invariant
   lower /= Void

   upper /= Void

end -- class WHEN_ITEM_2
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
