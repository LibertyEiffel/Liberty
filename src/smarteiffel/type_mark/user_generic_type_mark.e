-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class USER_GENERIC_TYPE_MARK
   --
   -- Handling of generic type mark excluding ARRAY, NATIVE_ARRAY, and AGENT_TYPE_MARK.
   --

inherit
   GENERIC_TYPE_MARK

create {ANY}
   make

feature {ANY}
   is_expanded: BOOLEAN is
      do
         Result := class_text.is_expanded
      end

   is_reference: BOOLEAN is
      do
         Result := not class_text.is_expanded
      end

   is_user_expanded: BOOLEAN is
      do
         Result := class_text.is_expanded
      end

   is_empty_expanded: BOOLEAN is
      do
         if is_user_expanded then
            Result := type.live_type.writable_attributes = Void
         end
      end

   id: INTEGER is
      do
         Result := type.live_type.id
      end

   accept (visitor: USER_GENERIC_TYPE_MARK_VISITOR) is
      do
         visitor.visit_user_generic_type_mark(Current)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_generic(shorted_type, class_text_name)
      end

feature {}
   make (bcn: like class_text_name; gl: like generic_list) is
      require
         bcn /= Void
         gl.lower = 1
         not gl.is_empty
      do
         class_text_name := bcn
         generic_list := gl
      ensure
         class_text_name = bcn
         generic_list = gl
      end

invariant
   generic_list.count >= 1

end -- class USER_GENERIC_TYPE_MARK
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
