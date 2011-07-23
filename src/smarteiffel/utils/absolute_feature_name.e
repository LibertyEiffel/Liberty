-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class ABSOLUTE_FEATURE_NAME

insert
   HASHABLE

creation {TYPE}
   make

creation {ANY}
   default_create

feature {ANY}
   class_name: CLASS_NAME

   feature_name: FEATURE_NAME

   hash_code: INTEGER

   is_equal (other: like Current): BOOLEAN is
      do
         Result := other.matches(class_name, feature_name)
      end

   matches (class_name_: like class_name; feature_name_: like feature_name): BOOLEAN is
      do
         Result := class_name.is_equal(class_name_) and then feature_name.is_equal(feature_name_)
      ensure
         Result = (class_name.is_equal(class_name_) and then feature_name.is_equal(feature_name_))
      end

feature {}
   make (class_name_: like class_name; feature_name_: like feature_name) is
      require
         class_name_ /= Void
         feature_name_ /= Void
      do
         class_name := class_name_
         feature_name := feature_name_
         hash_code := class_name.hash_code.bit_xor(feature_name.hash_code)
      ensure
         class_name = class_name_
         feature_name = feature_name_
      end

end -- class ABSOLUTE_FEATURE_NAME
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
