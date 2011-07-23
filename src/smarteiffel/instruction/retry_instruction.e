-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RETRY_INSTRUCTION
   --
   -- To store instruction "retry" for exception handling.
   --

inherit
   INSTRUCTION

creation {ANY}
   make

feature {ANY}
   start_position: POSITION

   end_mark_comment: BOOLEAN is False

   use_current (type: TYPE): BOOLEAN is
      do
      end

   specialize_in (type: TYPE): like Current is
      do
         Result := Current
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN is True

   specialize_2 (type: TYPE): like Current is
      do
         Result := Current
      end

   collect (type: TYPE): TYPE is
      do
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
      end

   adapt_for (t: TYPE): like Current is
      do
         Result := Current
      end

   safety_check (type: TYPE) is
      do
      end

   simplify (type: TYPE): INSTRUCTION is
      do
         Result := Current --|*** To be done *** (Dom. april 29th 2004) ***
      end

   compile_to_c (type: TYPE) is
      do
         if ace.no_check then
            if ace.flat_check then
               --|*** PH (17/04/2005) it's wrong but very hard to do better here
               cpp.pending_c_function_body.append(once "assertion_depth=1;%Nfree_exception_frames();%N")
            else
               cpp.pending_c_function_body.append(once "fd.assertion_flag=1;%Nfree_exception_frames();%N")
            end
         end
         cpp.pending_c_function_body.append(once "goto retry_tag;%N")
      end

   compile_to_jvm (type: TYPE) is
      do
         code_attribute.opcode_goto_backward(jvm.current_frame.jvm_try_begin)
      end

   pretty (indent_level: INTEGER) is
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "retry")
         if pretty_printer.semi_colon_flag then
            pretty_printer.put_character(';')
         end
         pretty_printer.set_indent_level(indent_level)
      end

   accept (visitor: RETRY_INSTRUCTION_VISITOR) is
      do
         visitor.visit_retry_instruction(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end
   
feature {}
   make (sp: like start_position) is
      do
         start_position := sp
      end

end -- class RETRY_INSTRUCTION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
