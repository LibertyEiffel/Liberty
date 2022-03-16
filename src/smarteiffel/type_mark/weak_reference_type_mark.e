-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class WEAK_REFERENCE_TYPE_MARK
   --
   -- Handling of the "WEAK_REFERENCE[FOO]" type mark.
   --

inherit
   GENERIC_TYPE_MARK
      redefine
         canonical_long_name, weak_reference_argument
      end

create {ANY}
   make

feature {ANY}
   is_reference: BOOLEAN True

   is_expanded, is_user_expanded: BOOLEAN False

   elements_type: TYPE_MARK
      do
         Result := generic_list.first
      end

   of_references: BOOLEAN
      do
         Result := elements_type.is_reference
      end

   id: INTEGER
      do
         Result := type.live_type.id
      end

   accept (visitor: WEAK_REFERENCE_TYPE_MARK_VISITOR)
      do
         visitor.visit_weak_reference_type_mark(Current)
      end

feature {LIVE_TYPE, TYPE_MARK}
   is_empty_expanded: BOOLEAN False

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
      do
         short_generic(shorted_type, class_text_name)
      end

feature {TYPE}
   special_weak_reference_extra_check
      require
         is_static
      local
         tm: TYPE_MARK
      do
         tm := generic_list.first
         if tm.is_expanded then
            error_handler.add_type_mark(tm)
            error_handler.add_position(tm.start_position)
            error_handler.add_position(start_position)
            error_handler.append(once " is expanded. The generic argument of WEAK_REFERENCE must not be %
                                      %expanded. (It does not makes sense to do so.)")
            error_handler.print_as_fatal_error
         end
      end

feature {}
   make (sp: like start_position; of_what: TYPE_MARK)
      require
         not sp.is_unknown
         of_what /= Void
      local
         of_what_wm, buffer: STRING
      do
         buffer := once "............................................."
         create class_text_name.make(weak_reference_name, sp, False)
         create generic_list.make(1, 1)
         generic_list.put(of_what, 1)
         of_what_wm := of_what.written_mark
         buffer.copy(as_weak_reference)
         buffer.extend('[')
         buffer.append(of_what_wm)
         buffer.extend(']')
         written_name_memory := string_aliaser.hashed_string(buffer)
      ensure
         start_position = sp
      end

   weak_reference_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_weak_reference)
      end

   canonical_long_name: HASHED_STRING
      do
         Result := weak_reference_name
      end

feature {ANY}
   weak_reference_argument (lt: LIVE_TYPE): LIVE_TYPE
      do
         Result := generic_list.first.type.live_type
      end

end -- class WEAK_REFERENCE_TYPE_MARK
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
