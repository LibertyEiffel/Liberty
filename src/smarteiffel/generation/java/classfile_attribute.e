-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASSFILE_ATTRIBUTE
   --
   -- Unique Global Object in charge of the classfile attribute of
   -- a class as described in the JVM specification.
   -- Obviously, the same object is recycled.
   --
   
insert
   GLOBALS

creation {ANY}
   make

feature {JVM}
   idx_sourcefile: INTEGER

   idx_classfile: INTEGER

   is_set: BOOLEAN

   clear is
      do
         is_set := False
         idx_sourcefile := -1
         idx_classfile := -1
      end

   set (name: STRING) is
      local
         i: INTEGER; s: STRING
      do
         idx_sourcefile := constant_pool.idx_utf8(once "SourceFile")
         create s.make(64)
         from
            i := name.lower
         until
            i > name.upper or else name.item(i) = '['
         loop
            s.extend(name.item(i).to_lower)
            i := i + 1
         end
         s.append(once ".e")
         idx_classfile := constant_pool.idx_utf8(s)
         is_set := True
      end

   write_bytes is
      do
         if is_set = False or ace.boost = True then
            jvm.b_put_u2(0)
         else
            jvm.b_put_u2(1)
            jvm.b_put_u2(idx_sourcefile)
            jvm.b_put_u2(0)
            jvm.b_put_u2(2)
            jvm.b_put_u2(idx_classfile)
         end
      end

feature {}
   make is
      do
      end

end -- class CLASSFILE_ATTRIBUTE
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
