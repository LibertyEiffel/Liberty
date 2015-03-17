-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_JVM13

create {}
   make

feature {ANY}
   make
      local
         dog: DOG
      do
         --    s1, s2: STRING;
         --    a: ANIMAL;
         --    cat: CAT;
         --    s1 := foo;
         --    s2 := foo;
         --    check
         --       s1 = s2;
         --       not (s1 /= s2);
         --    end;
         --
         --    !!cat;
         --    check
         --       cat /= Void;
         --       not cat.is_dog;
         --       cat.is_cat;
         --    end;
         create dog
         --    a := dog;
         --    check
         --       not a.is_cat;
         --       a.is_dog;
         --    end;
         --    a := Void;
         --    check
         --       a = Void;
         --       not (a /= Void)
         --    end;
         --    !CAT!a;
         --    check
         --       cat.is_cat;
         --       not cat.is_dog;
         --    end;
      end

   foo: STRING "foo"

end -- class TEST_JVM13
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
