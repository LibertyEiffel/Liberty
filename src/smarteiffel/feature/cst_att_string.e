-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CST_ATT_STRING

inherit
   CST_ATT

create {ANY}
   make

create {CST_ATT_STRING}
   with

feature {ANY}
   accept (visitor: CST_ATT_STRING_VISITOR)
      do
         visitor.visit_cst_att_string(Current)
      end

feature {CST_ATT_STRING, CST_ATT_STRING_VISITOR}
   value_memory: MANIFEST_STRING

feature {}
   rank: INTEGER
         -- To find the corresponding name in the `feature_text' (i.e.
         -- in most cases, this is simply one, because people are not
         -- used to have a lot of synonyms).

   add_into_ (ft: like feature_text; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
         --|*** remove rank and change add_into_ to use default definition.
      local
         n: like names; fn: FEATURE_NAME; i: INTEGER; cst_att_string: like Current
      do
         n := ft.names
         i := n.count
         rank := i
         fn := n.item(i)
         fd.add(Current, fn)
         -- Creation of copies for synonyms:
         from
            i := i - 1
         until
            i = 0
         loop
            fn := n.item(i)
            create cst_att_string.with(ft, Current, i)
            fd.add(cst_att_string, fn)
            i := i - 1
         end
      end

   make (rt: like result_type; ms: MANIFEST_STRING)
      require
         rt /= Void
         ms /= Void
      do
         result_type := rt
         value_memory := ms
      ensure
         result_type = rt
         value_memory = ms
      end

   with (ft: like feature_text; model: like Current; r: like rank)
      require
         ft /= Void
         model /= Void
         r >= 1
      do
         feature_text := ft
         result_type := model.result_type
         value_memory := model.value_memory.twin
         rank := r
      ensure
         feature_text = ft
         result_type = model.result_type
         value /= model.value and value.is_equal(model.value)
      end

   pretty_constant_value (indent_level: INTEGER)
      do
         value_memory.pretty_without_once(indent_level)
      end

end -- class CST_ATT_STRING
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
