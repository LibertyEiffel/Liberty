-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIKE_ARGUMENT_TYPE_MARK
   --
   -- For an anchored declaration type mark using a formal argument.
   --
   -- See also TYPE_LIKE and TYPE_LIKE_CURRENT.
   --

inherit
   ANCHORED_TYPE_MARK

create {EIFFEL_PARSER, FORMAL_ARG_LIST}
   make

feature {ANY}
   like_what: ARGUMENT_NAME_REF
         -- The one written.

   written_name: HASHED_STRING

   type_marks_memory: HASHED_DICTIONARY[TYPE_MARK, TYPE]
         -- Memorize the corresponding TYPE_MARK for all context TYPEs.

   has_been_specialized: BOOLEAN
      do
         Result := True
      end

   frozen specialize_in (new_type: TYPE)
      local
         type_mark: TYPE_MARK
      do
         type_mark := like_what.formal_arg_list.type_mark(like_what.rank)
         if {LIKE_ARGUMENT_TYPE_MARK} ?:= type_mark then
            error_handler.append(once "Type mark %"like <argument>%" must not reference another %"like <argument>%" type mark. %
                                       %(One level of indirection is always possible and always better ;-)")
            error_handler.add_position(start_position)
            error_handler.add_position(type_mark.start_position)
            error_handler.print_as_fatal_error
         end
         -- Because the corresponding `type_mark' can be after `Current':
         type_mark.specialize_in(new_type)
         -- Storing the information:
         type_marks_memory.fast_put(type_mark, new_type)
      end

   frozen specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         type_mark: TYPE_MARK
      do
         type_mark := type_marks_memory.fast_reference_at(parent_type)
         type_mark := type_mark.specialize_thru(parent_type, parent_edge, new_type)
         type_marks_memory.fast_put(type_mark, new_type)
         Result := Current
      end

   declaration_type: TYPE_MARK
      do
         Result := like_what.formal_arg_list.type_mark(like_what.rank).declaration_type
      end

   accept (visitor: LIKE_ARGUMENT_TYPE_MARK_VISITOR)
      do
         visitor.visit_like_argument_type_mark(Current)
      end

   to_static (new_type: TYPE; allow_raw_class_name: BOOLEAN): TYPE_MARK
      do
         check
            not allow_raw_class_name
         end
         if like_argument_computing then
            error_handler.append(once "Unable to solve cyclic anchored types.")
            like_argument_computing := False
         else
            like_argument_computing := True
            Result := type_marks_memory.fast_reference_at(new_type).to_static(new_type, False)
            if Result = Void then
               error_handler.add_position(start_position)
            end
            if like_argument_computing = False then
               error_handler.print_as_fatal_error
            end
            like_argument_computing := False
         end
      end

   signature_resolve_in (new_type: TYPE): TYPE
      do
         Result := type_marks_memory.fast_reference_at(new_type).signature_resolve_in(new_type)
      end

feature {}
   like_argument_computing: BOOLEAN

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
      do
         short_printer.hook_or(once "like", once "like ")
         like_what.short(shorted_type)
      end

feature {}
   make (sp: like start_position; lw: like like_what)
      require
         not sp.is_unknown
         lw /= Void
      do
         start_position := sp
         like_what := lw
         written_mark_buffer.copy(fz_like)
         written_mark_buffer.extend(' ')
         written_mark_buffer.append(like_what.to_string)
         written_name := string_aliaser.hashed_string(written_mark_buffer)
         create type_marks_memory.with_capacity(32)
      ensure
         start_position = sp
         like_what = lw
      end

invariant
   as_current /= like_what.to_string

end -- class LIKE_ARGUMENT_TYPE_MARK
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
