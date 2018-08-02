-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class E_ROUTINE
   --
   -- Root class for all sort of routines : function, procedure,
   -- external function/procedure, deferred function/procedure and
   -- once function/procedure.
   --
   --

inherit
   ANONYMOUS_FEATURE
      redefine
         set_end_comment
      end

feature {ANY}
   arguments: FORMAL_ARG_LIST

   obsolete_mark: MANIFEST_STRING

   end_comment: COMMENT

   is_attribute: BOOLEAN False

   is_external: BOOLEAN
      do
         Result := False
      end

   local_vars: LOCAL_VAR_LIST

   routine_body: INSTRUCTION

   routine_then: EXPRESSION

   has_closures: BOOLEAN

   pretty (indent_level: INTEGER; is_inline_agent: BOOLEAN)
      local
         fn: FEATURE_NAME; il, level2, level3: INTEGER
      do
         if is_inline_agent then
            level2 := indent_level
            level3 := indent_level + 1
         else
            level2 := indent_level + 1
            level3 := indent_level + 2

            pretty_printer.set_indent_level(indent_level)
            pretty_print_names
         end
         if arguments /= Void then
            if not is_inline_agent and then not pretty_printer.zen_mode then
               pretty_printer.put_character(' ')
            end
            arguments.pretty(level2)
         end
         if result_type /= Void then
            pretty_printer.put_character(':')
            if not pretty_printer.zen_mode then
               pretty_printer.put_character(' ')
            end
            pretty_printer.put_type_mark(result_type)
         end
         pretty_printer.set_indent_level(level2)
         if header_comment /= Void then
            il := pretty_printer.indent_level_for_header_comment_of_feature + indent_level
            pretty_printer.set_indent_level(il)
            header_comment.pretty(il)
         end
         pretty_index(level2, Void)
         if obsolete_mark /= Void then
            pretty_printer.keyword(once "obsolete")
            obsolete_mark.pretty_without_once(level2)
         end
         pretty_printer.set_indent_level(level2)
         if require_assertion /= Void then
            require_assertion.pretty(level2)
         end
         pretty_print_routine_body(level2)
         if ensure_assertion /= Void then
            pretty_printer.set_indent_level(level2)
            ensure_assertion.pretty(level2)
         end
         pretty_print_rescue(level2)
         pretty_printer.set_indent_level(level2)
         pretty_printer.keyword(once "end")
         if end_comment /= Void and then not end_comment.is_dummy_feature_end(Current) then
            end_comment.pretty(level2)
         elseif pretty_printer.print_end_of_feature then
            pretty_printer.put_string(once " -- ")
            fn := first_name
            fn.inside_end_comment_pretty_print
         end
      end

feature {EIFFEL_PARSER}
   set_end_comment (ec: like end_comment)
      require else
         end_comment = Void
         ec /= Void
      do
         end_comment := ec
      ensure
         end_comment = ec
      end

feature {FEATURE_TEXT, EIFFEL_PARSER}
   set_rescue_compound (rc: like rescue_compound)
      deferred
      end

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_signature_in (new_type: TYPE): like Current
      local
         args: like arguments; cfal: like closure_arguments
      do
         if arguments /= Void then
            args := arguments.specialize_in(new_type)
         end
         cfal := specialize_closure_arguments_lists_in(new_type)
         if args = arguments and then cfal = closure_arguments then
            Result := Current
         else
            Result := twin
            Result.set_arguments(args, cfal)
         end
      end

   specialize_signature_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         args: like arguments; cfal: like closure_arguments
      do
         if arguments /= Void then
            args := arguments.specialize_thru(parent_type, parent_edge, new_type)
         end
         cfal := specialize_closure_arguments_lists_thru(parent_type, parent_edge, new_type)
         if args = arguments and then cfal = closure_arguments then
            Result := Current
         else
            Result := twin
            Result.set_arguments(args, cfal)
         end
      end

feature {E_ROUTINE}
   set_arguments (args: like arguments; cfal: like closure_arguments)
      do
         arguments := args
         closure_arguments := cfal
      end

feature {}
   make_routine (fa: like arguments; om: like obsolete_mark; hc: like header_comment; ra: like require_assertion; c: like has_closures)
      do
         header_comment := hc
         arguments := fa
         obsolete_mark := om
         require_assertion := ra
         has_closures := c
      end

   pretty_print_routine_body (indent_level: INTEGER)
      deferred
      end

   pretty_print_rescue (indent_level: INTEGER)
      deferred
      end

invariant
   routine_then /= Void implies result_type /= Void

end -- class E_ROUTINE
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
