-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ARRAY_TYPE_MARK
   --
   -- Handling of the "ARRAY[FOO]" type mark.
   --
   -- Note: can be implicit when used for the type of manifest arrays.
   --

inherit
   GENERIC_TYPE_MARK
      redefine
         canonical_long_name
      end

create {ANY}
   make

feature {ANY}
   is_reference: BOOLEAN True

   is_expanded, is_user_expanded: BOOLEAN False

   array_of: TYPE_MARK
      do
         Result := generic_list.first
      end

   id: INTEGER
      do
         Result := type.live_type.id
      end

   accept (visitor: ARRAY_TYPE_MARK_VISITOR)
      do
         visitor.visit_array_type_mark(Current)
      end

feature {LIVE_TYPE, TYPE_MARK}
   is_empty_expanded: BOOLEAN False

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
      do
         short_generic(shorted_type, class_text_name)
      end

feature {}
   make (sp: like start_position; of_what: TYPE_MARK)
      require
         not sp.is_unknown
         of_what /= Void
      do
         create class_text_name.make(array_name, sp, False)
         set_generic_list_with(of_what)
      ensure
         start_position = sp
         class_text_name.to_string = as_array
         array_of = of_what
      end

   set_generic_list_with (t: TYPE_MARK)
      do
         create generic_list.make(1, 1)
         generic_list.put(t, 1)
      end

   array_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_array)
      end

   canonical_long_name: HASHED_STRING
      do
         Result := array_name
      end

invariant
   generic_list.count = 1

   generic_list.lower = 1

end -- class ARRAY_TYPE_MARK
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
