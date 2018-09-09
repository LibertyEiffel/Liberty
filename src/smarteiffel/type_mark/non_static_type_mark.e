-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class NON_STATIC_TYPE_MARK
   --
   -- Some frozen definition shared by non static type marks (ANCHORED_TYPE_MARK and TYPE_FORMAL_GENERIC).
   --

inherit
   TYPE_MARK

feature {ANY}
   frozen is_static: BOOLEAN False

   frozen type: TYPE
      do
         err_nonstatic("type")
      end

   frozen is_reference: BOOLEAN
      do
         err_nonstatic("is_reference")
      end

   frozen is_expanded: BOOLEAN
      do
         err_nonstatic("is_expanded")
      end

   frozen is_generic: BOOLEAN
      do
         err_nonstatic("is_generic")
      end

   frozen generic_list: ARRAY[TYPE_MARK]
      do
         err_nonstatic("generic_list")
      end

   frozen id: INTEGER
      do
         err_nonstatic("id")
      end

   frozen class_text_name: CLASS_NAME
      do
         err_nonstatic("class_text_name")
      end

   frozen is_user_expanded: BOOLEAN
      do
         err_nonstatic("is_user_expanded")
      end

feature {LIVE_TYPE, TYPE_MARK}
   frozen is_empty_expanded: BOOLEAN
      do
         err_nonstatic("is_empty_expanded")
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   frozen long_name: HASHED_STRING
      do
         err_nonstatic("long_name")
      end

feature {LIVE_TYPE, TYPE_MARK}
   frozen just_before_gc_mark_in (str: STRING)
      do
         err_nonstatic("just_before_gc_mark_in")
      end

feature {}
   err_nonstatic (tag: STRING)
      require
         never_called: False
      do
         error_handler.append(tag)
         error_handler.append(" called on non-static type mark")
         error_handler.add_position(start_position)
         error_handler.print_as_internal_error
      end

end -- class NON_STATIC_TYPE_MARK
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
