-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EFFECTIVE_ARG_LIST_0
   --
   -- For an empty effective argument list (for a routine call).
   --
   -- Useful only for implicit tuple creation.
   --

inherit
   EFFECTIVE_ARG_LIST

insert
   GLOBALS
      undefine out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY}
   expression (i: INTEGER): EXPRESSION
      do
         check False end
      end

   start_position: POSITION
   end_position: POSITION

   specialize_in (type: TYPE): like Current
      do
         check False end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         check False end
      end

   specialize_and_check (t: TYPE; af: ANONYMOUS_FEATURE; target_type: TYPE; allow_tuple: BOOLEAN): EFFECTIVE_ARG_LIST
      local
         fal: FORMAL_ARG_LIST; formal_type: TYPE
      do
         fal := af.arguments
         if fal = Void then
            Result := Current
         elseif fal.count = 1 then
            formal_type := fal.type_mark(1).resolve_in(target_type)
            if allow_tuple and then formal_type.is_tuple then
               create {EFFECTIVE_ARG_LIST_N} Result.make_1(start_position, synthetize_tuple(target_type, t, fal))
               Result.end_position := end_position
            else
               specialize_count_error(af.start_position, fal)
            end
         else
            specialize_count_error(af.start_position, fal)
         end
      end

   has_been_specialized: BOOLEAN True

   simplify (type: TYPE): like Current
      do
         Result := Void
         smart_eiffel.magic_count_increment
      end

   static_simplify
      do
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   safety_check (type: TYPE)
      do
      end

   use_current (type: TYPE): BOOLEAN
      do
         check not Result end
      end

   pretty (indent_level: INTEGER)
      do
      end

   short (type: TYPE)
      do
      end

   is_static: BOOLEAN True

feature {EIFFEL_PARSER, EFFECTIVE_ARG_LIST}
   set_end_position (p: POSITION) assign end_position
      do
         end_position := p
      end

feature {ANY} -- Implementation of TRAVERSABLE:
   count: INTEGER 0

   is_empty: BOOLEAN True

   item (i: INTEGER): EXPRESSION
      do
         check False end
      end

   first: like item
      do
         check False end
      end

   last: like item
      do
         check False end
      end

feature {CODE}
   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE): like Current
      do
         Result := Current
      end

feature {CREATE_EXPRESSION, MANIFEST_TUPLE}
   specialize_and_check_on_expressions (type: TYPE): like Current
      do
         Result := Current
      end

feature {FEATURE_CALL, PRECURSOR_CALL, AGENT_INSTRUCTION}
   adapt_for (t: TYPE): like Current
      do
         Result := Current
      end

feature {FEATURE_CALL}
   collect (t: TYPE; fs: FEATURE_STAMP; feature_type: TYPE)
      do
      end

feature {AGENT_INSTRUCTION, AGENT_EXPRESSION}
   to_fake_tuple (type: TYPE): FAKE_TUPLE
      do
         check False end
      end

feature {EFFECTIVE_ARG_LIST, FAKE_TUPLE, CALL_1}
   put (e: EXPRESSION; i: INTEGER)
      do
         check False end
      end

feature {ANY}
   accept (visitor: VISITOR)
      local
         v: EFFECTIVE_ARG_LIST_0_VISITOR
      do
         v ::= visitor
         v.visit_effective_arg_list_0(Current)
      end

feature {PROCEDURE_CALL_N}
   create_inline: like Current
      do
         Result := Current
      end

feature {}
   specialize_count_error (af_position: POSITION; fal: FORMAL_ARG_LIST)
      require
         fal /= Void
      do
         error_handler.append(once "The feature called has ")
         error_handler.append_integer(fal.count)
         error_handler.append(once " argument")
         if fal.count > 1 then
            error_handler.append(once "s")
         end
         error_handler.append(once " while the actual argument list has no argument.")
         error_handler.add_position(fal.start_position)
         error_handler.add_position(start_position)
         error_handler.print_as_fatal_error
      end

feature {}
   make (sp: POSITION)
      require
         not sp.is_unknown
      do
         start_position := sp
         end_position := sp
      end

end -- class EFFECTIVE_ARG_LIST
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
