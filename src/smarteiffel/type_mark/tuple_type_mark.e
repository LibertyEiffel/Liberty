-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class TUPLE_TYPE_MARK
   --
   -- For the TUPLE type. The common ancestor of EMPTY_TUPLE_TYPE_MARK and NON_EMPTY_TUPLE_TYPE_MARK.
   --

inherit
   TYPE_MARK
      redefine is_tuple, canonical_long_name
      end

feature {ANY}
   is_tuple: BOOLEAN True

   is_reference: BOOLEAN True

   is_expanded, is_user_expanded: BOOLEAN False

   is_static: BOOLEAN
      deferred
      end

   as_type_mark: TYPE_MARK
      deferred
      end

   generic_list: ARRAY[TYPE_MARK]
      deferred
      end

   type: TYPE
      deferred
      end

   count: INTEGER
      deferred
      ensure
         Result >= 0
      end

   id: INTEGER
      do
         Result := type.live_type.id
      end

feature {LIVE_TYPE, TYPE_MARK}
   is_empty_expanded: BOOLEAN False

feature {}
   canonical_long_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_tuple)
      end

end -- class TUPLE_TYPE_MARK
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
