-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class WHEN_ITEM
   --
   -- A part of the inspect instruction.
   -- There are two descendant WHEN_ITEM_1 (for a single value) and WHEN_ITEM_2 (for a slice).
   --

inherit
   VISITABLE

insert
   GLOBALS

feature {ANY}
   start_position: POSITION
      deferred
      end

feature {WHEN_CLAUSE}
   validity_check (type, expression_type: TYPE; container: INSPECT_STATEMENT)
      require
         type /= Void
         expression_type /= Void
         container /= Void
      do
         container.validity_check_continued(type, expression_type, Current)
      end

   side_effect_free (type: TYPE): BOOLEAN
      deferred
      end

feature {WHEN_CLAUSE}
   validity_check_continued (type, expression_type: TYPE; occurrence_1: WHEN_ITEM): BOOLEAN
      require
         type /= Void
         expression_type /= Void
         occurrence_1 /= Void
      do
         if Current = occurrence_1 then
            -- Back to the very same item:
            Result := True
         else
            validity_check_continued_(type, expression_type, occurrence_1)
         end
      end

feature {}
   validity_check_continued_ (type, expression_type: TYPE; occurrence_1: WHEN_ITEM)
      require
         type /= Void
         expression_type /= Void
         occurrence_1 /= Void
      deferred
      end

feature {WHEN_CLAUSE}
   collect (t: TYPE)
      require
         has_been_specialized
         t.feature_collection_done
         smart_eiffel.status.is_collecting
         not smart_eiffel.status.is_specializing
      deferred
      end

   adapt_for (type: TYPE): like Current
         --|*** May become a procedure because this is always static ???
         --|*** (Dom. 20 dec 2003)
      deferred
      end

   specialize_in (new_type: TYPE): like Current
         --|*** May become a procedure because this is always static ???
         --|*** (Dom. 20 dec 2003)
      require
         new_type /= Void
      deferred
      ensure
         Result.has_been_specialized
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
         --|*** May become a procedure because this is always static ???
         --|*** (Dom. 20 dec 2003)
      require
         parent_type /= Void
         parent_edge /= Void
         new_type /= Void
         new_type /= parent_type
         has_been_specialized
      deferred
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   specialize_and_check_character (type: TYPE): like Current
         --|*** May become a procedure because this is always static ???
         --|*** (Dom. 20 dec 2003)
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      deferred
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   specialize_and_check_integer (type: TYPE): like Current
         --|*** May become a procedure because this is always static ???
         --|*** (Dom. 20 dec 2003)
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      deferred
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   compute_values (type: TYPE; values: RING_ARRAY[INTEGER]): like values
      deferred
      ensure
         Result /= Void
      end

   force_internal_character_values (type: TYPE; container: WHEN_CLAUSE)
      require
         container /= Void
      deferred
      end

   force_internal_integer_values (type: TYPE; container: WHEN_CLAUSE)
      require
         container /= Void
      deferred
      end

   pretty (indent_level: INTEGER)
      deferred
      end

   match_value (v: INTEGER): BOOLEAN
      deferred
      end

feature {WHEN_CLAUSE, WHEN_ITEM}
   has_been_specialized: BOOLEAN
      deferred
      ensure
         Result
      end

feature {}
   locate_in_values (values: RING_ARRAY[INTEGER]; v: INTEGER): INTEGER
         -- Returns index in values table where `v' would be inserted.
      require
         values /= Void
      do
         from
            Result := values.lower
         until
            (Result > values.upper) or else (v < values.item(Result))
         loop
            Result := Result + 2
         end
      ensure
         (Result - values.lower) \\ 2 = 0
         (Result < values.upper) implies (v < values.item(Result))
         (Result > values.upper) implies (v > values.item(Result - 1))
      end

   frozen manifest_expression_check (expression: EXPRESSION; type: TYPE): MANIFEST_EXPRESSION
         -- Check that the `expression' is a valid bound for a when item (i.e. this is a statically
         -- computable expression).
      require
         expression /= Void
      local
         call_0: CALL_0
      do
         Result ?= expression
         if Result = Void then
            call_0 ::= expression
            check
               call_0 /= Void -- (Actually, this is already checked in `eiffel_parser'.)
            end
            Result := call_0.manifest_expression(type)
         end
      ensure
         Result /= Void
      end

   frozen integer_check (e: EXPRESSION; me: MANIFEST_EXPRESSION)
         -- Where `e' is `me' itself or the corresponding static call.
      require
         e /= Void
         me /= Void
      local
         integer_constant: INTEGER_CONSTANT
      do
         integer_constant ?= me
         if integer_constant = Void then
            error_handler.add_position(e.start_position)
            error_handler.append(once "This is not an INTEGER expression.")
            explain_fatal_error(e, me)
         end
      end

   frozen character_check (e: EXPRESSION; me: MANIFEST_EXPRESSION)
         -- Where `e' is `me' itself or the corresponding static call.
      require
         e /= Void
         me /= Void
      local
         character_constant: CHARACTER_CONSTANT
      do
         character_constant ?= me
         if character_constant = Void then
            error_handler.add_position(e.start_position)
            error_handler.append(once "This is not an CHARACTER expression.")
            explain_fatal_error(e, me)
         end
      end

   frozen explain_fatal_error (e: EXPRESSION; me: MANIFEST_EXPRESSION)
         -- Where `e' is `me' itself or the corresponding static call.
      require
         e /= Void
         me /= Void
      do
         if e /= me then
            error_handler.append(once "(The corresponding feature definition is in the next error message.)")
            error_handler.print_as_error
            error_handler.add_position(me.start_position)
            error_handler.append(once "The corresponding feature definition.")
         end
         error_handler.print_as_fatal_error
      end

   integer_value_of (manifest_expression: MANIFEST_EXPRESSION): INTEGER
      require
         manifest_expression /= Void
      local
         integer_constant: INTEGER_CONSTANT
         character_constant: CHARACTER_CONSTANT
      do
         if {INTEGER_CONSTANT} ?:= manifest_expression then
            integer_constant ::= manifest_expression
            Result := integer_constant.value_memory.to_integer_32
         else
            -- Because the validity check is already performed:
            character_constant ::= manifest_expression
            Result := character_constant.value.code
         end
      end

feature {WHEN_ITEM_1}
   validity_check_continued_when_item_1 (type, expression_type: TYPE; occurrence_2: WHEN_ITEM_1)
      require
         type /= Void
         expression_type /= Void
         occurrence_2 /= Void
      deferred
      end

feature {WHEN_ITEM_2}
   validity_check_continued_when_item_2 (type, expression_type: TYPE; occurrence_2: WHEN_ITEM_2)
      require
         type /= Void
         expression_type /= Void
         occurrence_2 /= Void
      deferred
      end

end -- class WHEN_ITEM
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
