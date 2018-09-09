-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASS_INVARIANT
   --
   -- To store a `class invariant' clause.
   --

inherit
   ASSERTION_LIST
      redefine
         accept
      end

create {ANY}
   make

feature {ANY}
   accept (visitor: ASSERTION_LIST_VISITOR)
      do
         visitor.visit_class_invariant(Current)
      end

feature {SHORT_PRINTER}
   class_invariant_short (type: TYPE; class_text: CLASS_TEXT; client: TYPE_MARK)
      local
         i: INTEGER
      do
         class_text.header_comment_for_class_invariant(Current)
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
            short_printer.hook_or(once "hook811", once "invariant%N")
            if header_comment = Void then
               short_printer.hook_or(once "hook812", once "")
            else
               short_printer.hook_or(once "hook813", once "")
               header_comment.short(once "hook814", once "   --", once "hook815", once "%N")
               short_printer.hook_or(once "hook816", once "")
            end
            if tmp_assertion_list.is_empty then
               short_printer.hook_or(once "hook817", once "")
            else
               short_printer.hook_or(once "hook818", once "")
               from
                  i := 0
               until
                  i = tmp_assertion_list.upper
               loop
                  tmp_assertion_list.item(i).short_hooks(type
                  , once "hook819"
                  , once "   "
                  , once "hook820" -- before each assertion
                  , once "", once "hook821" -- no tag
                  , once "", once "hook822" -- before tag
                  , once ": ", once "hook823" -- after tag
                  , once "", once "hook824" -- no expression
                  , once "", once "hook825" -- before expression
                  , once ";", once "hook826" -- after expression except last
                  , once "%N", once "hook827" -- no comment
                  , once "", once "hook828" -- before comment
                  , once " --", once "hook829" -- comment begin line
                  , once "%N", once "hook830" -- comment end of line
                  , once "", once "hook831" -- after comment
                  , once "")
                  -- end of each assertion
                  i := i + 1
               end
               tmp_assertion_list.item(i).short_hooks(type
               , once "hook819"
               , once "   "
               , once "hook820" -- before each assertion
               , once "", once "hook821" -- no tag
               , once "", once "hook822" -- before tag
               , once ": ", once "hook823" -- after tag
               , once "", once "hook824" -- no expression
               , once "", once "hook832" -- before expression
               , once ";", once "hook826" -- after last expression
               , once "%N", once "hook827" -- no comment
               , once "", once "hook828" -- before comment
               , once " --", once "hook829" -- comment begin line
               , once "%N", once "hook830" -- comment end of line
               , once "", once "hook831" -- after comment
               , once "")
               short_printer.hook_or(once "hook833", once "")
            end
            short_printer.hook_or(once "hook834", once "")
         end
      end

end -- class CLASS_INVARIANT
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
