-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class ABSOLUTE_FEATURE_NAME

insert
   HASHABLE

create {TYPE}
   make

create {ANY}
   default_create

feature {ANY}
   class_name: CLASS_NAME

   feature_name: FEATURE_NAME

   hash_code: INTEGER

   is_equal (other: like Current): BOOLEAN
      do
         Result := other.matches(class_name, feature_name)
      end

   matches (class_name_: like class_name; feature_name_: like feature_name): BOOLEAN
      do
         if class_name = Void then
            Result := class_name_ = Void
         else
            Result := class_name.is_equal(class_name_)
         end
         if Result then
            if feature_name = Void then
               Result := feature_name_ = Void
            else
               Result := feature_name.is_equal(feature_name_)
            end
         end
      ensure
         --Result = (class_name.is_equal(class_name_) and then feature_name.is_equal(feature_name_))
      end

feature {}
   make (class_name_: like class_name; feature_name_: like feature_name)
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
