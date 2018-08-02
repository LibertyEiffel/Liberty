-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ENSURE_ASSERTION
   --
   -- To store a `ensure' or an `ensure then' assertion.
   --

inherit
   ASSERTION_LIST
      rename make as assertion_list_make
      redefine
         accept, pretty
      end

create {ANY}
   make

feature {ANY}
   is_ensure_then: BOOLEAN

   accept (visitor: ASSERTION_LIST_VISITOR)
      do
         visitor.visit_ensure_assertion(Current)
      end

   pretty (indent_level: INTEGER)
      do
         check
            indent_level = 2
         end
         if is_ensure_then then
            pretty_print_with_tag(2, once "ensure then")
         else
            pretty_print_with_tag(2, once "ensure")
         end
      end

feature {SHORT_PRINTER}
   ensure_assertion_short (type: TYPE; client: TYPE_MARK)
      local
         i: INTEGER
      do
         tmp_assertion_list.clear_count
         if list /= Void then
            from
               i := 0
            until
               i > list.upper
            loop
               if client = Void or else not hidden_expression_detector.visit(list.item(i), type, client, False) then
                  tmp_assertion_list.add_last(list.item(i))
               end
               i := i + 1
            end
         end
         if header_comment /= Void or else not tmp_assertion_list.is_empty then
            short_printer.hook_or(once "hook511", "      ensure%N")
            if header_comment = Void then
               short_printer.hook_or(once "hook512", once "")
            else
               short_printer.hook_or(once "hook513", once "")
               header_comment.short(once "hook514", once "    --", once "hook515", once "%N")
               short_printer.hook_or(once "hook516", once "")
            end
            if tmp_assertion_list.is_empty then
               short_printer.hook_or(once "hook517", once "")
            else
               short_printer.hook_or(once "hook518", once "")
               from
                  i := tmp_assertion_list.lower
               until
                  i = tmp_assertion_list.upper
               loop
                  tmp_assertion_list.item(i).short_hooks(type
                  , once "hook519"
                  , once "    "
                  , once "hook520" -- before each assertion
                  , once "", once "hook521" -- no tag
                  , once "", once "hook522" -- before tag
                  , once ": ", once "hook523" -- after tag
                  , once "", once "hook524" -- no expression
                  , once "", once "hook525" -- before expression
                  , once ";", once "hook526" -- after expression except last
                  , once "%N", once "hook527" -- no comment
                  , once "", once "hook528" -- before comment
                  , once " --", once "hook529" -- comment begin line
                  , once "%N", once "hook530" -- comment end of line
                  , once "", once "hook531" -- after comment
                  , once "")
                  -- end of each assertion
                  i := i + 1
               end
               tmp_assertion_list.item(i).short_hooks(type
               , once "hook519", once "    "
               , once "hook520" -- before each assertion
               , once "", once "hook521" -- no tag
               , once "", once "hook522" -- before tag
               , once ": ", once "hook523" -- after tag
               , once "", once "hook524" -- no expression
               , once "", once "hook532" -- before expression
               , once "", once "hook526" -- after expression except last
               , once "%N", once "hook527" -- no comment
               , once "", once "hook528" -- before comment
               , once " --", once "hook529" -- comment begin line
               , once "%N", once "hook530" -- comment end of line
               , once "", once "hook531" -- after comment
               , once "")
               -- end of each assertion
               short_printer.hook_or(once "hook533", once "")
            end
            short_printer.hook_or(once "hook534", once "")
         end
      end

feature {}
   make (sp: like start_position; then_flag: BOOLEAN; hc: like header_comment; l: like list)
      do
         assertion_list_make(sp, hc, l)
         is_ensure_then := then_flag
      ensure
         is_ensure_then = then_flag
      end

   check_assertion_mode: STRING "ens"

end -- class ENSURE_ASSERTION
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
