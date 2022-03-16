-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CST_ATT
   --
   -- For all ConSTant Attributes.
   --

inherit
   ATTRIBUTE
      redefine inline_expression_0
      end

feature {ANY}
   has_been_specialized: BOOLEAN
      do
         if ace.boost then
            Result := True
         else
            Result := require_assertion /= Void implies require_assertion.has_been_specialized
            if Result and then ensure_assertion /= Void then
               Result := ensure_assertion.has_been_specialized
            end
         end
      end

   frozen value: EXPRESSION
      do
         Result := value_memory
      ensure
         Result /= Void
      end

   side_effect_free (target_type: TYPE): BOOLEAN
      do
         Result := True
      end

   debug_list: HASHED_SET[STRING]
      once
         create Result.make
      end

   use_current (type: TYPE): BOOLEAN
      do
         -- To reach this point, we are using `Current'.
         --|*** Not sure, but I prefer to be pessimistic ! *** (Dom. june 12th 2004) ***
         Result := True
      end

   pretty (indent_level: INTEGER; is_inline_agent: BOOLEAN)
      local
         il: INTEGER
      do
         check
            indent_level = 1
            not is_inline_agent
         end
         pretty_printer.set_indent_level(1)
         pretty_print_names
         pretty_printer.put_string(once ": ")
         pretty_printer.put_type_mark(result_type)
         pretty_printer.put_string(once " ")
         pretty_constant_value(2)
         if header_comment /= Void then
            il := indent_level + pretty_printer.indent_level_for_header_comment_of_feature
            pretty_printer.set_indent_level(il)
            header_comment.pretty(il)
         elseif pretty_printer.print_end_of_feature then
            pretty_printer.put_character(';')
         end
      end

feature {CALL_0}
   inline_expression_0 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
                        target_type: TYPE; target: EXPRESSION; return_type: TYPE): INLINE_MEMO
      do
         if target.side_effect_free(type) then
            Result := smart_eiffel.get_inline_memo
            Result.set_expression(value)
            smart_eiffel.magic_count_increment
         end
      end

feature {}
   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_1
      do
         create Result.for(t.live_type, Current, fn)
      end

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_signature_in (new_type: TYPE): like Current
      do
         Result := Current
      end

   specialize_body_in (new_type: TYPE; can_twin: BOOLEAN): like Current
      do
         Result := Current
      end

   specialize_signature_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := Current
      end

   specialize_body_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE; can_twin: BOOLEAN): like Current
      do
         Result := Current
      end

feature {}
   value_memory: EXPRESSION
      deferred
      end

   pretty_constant_value (indent_level: INTEGER)
      deferred
      end

   collect_body (t: TYPE)
      local
         t2: TYPE
      do
         t2 := value_memory.collect(t)
      end

feature {}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
      end

end -- class CST_ATT
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
