-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NON_EMPTY_TUPLE_TYPE_MARK
   --
   -- For non empty TUPLE declaration type_mark like: "TUPLE[BAR]" or "TUPLE[BAR, ZOO]".
   --

inherit
   TUPLE_TYPE_MARK
   GENERIC_TYPE_MARK
      undefine is_tuple, canonical_long_name
      redefine pretty_in
      end

creation {ANY}
   make

feature {ANY}
   as_type_mark: TYPE_MARK is
      do
         Result := Current
      end

   pretty_in (buffer: STRING) is
      local
         i: INTEGER
      do
         buffer.append(once "TUPLE")
         buffer.extend('[')
         from
            i := generic_list.lower
         until
            i > generic_list.upper
         loop
            generic_list.item(i).pretty_in(buffer)
            i := i + 1
            if i <= generic_list.upper then
               buffer.append(once ", ")
            end
         end
         buffer.extend(']')
      end

   count: INTEGER is
      do
         Result := generic_list.count
      end

   accept (visitor: NON_EMPTY_TUPLE_TYPE_MARK_VISITOR) is
      do
         visitor.visit_non_empty_tuple_type_mark(Current)
      end

   need_c_struct: BOOLEAN is True

   c_initialize_in (buffer: STRING) is
      do
         buffer.append(once "(void*)0")
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_generic(shorted_type, create {CLASS_NAME}.make(string_aliaser.tuple_name, start_position))
      end

feature {}
   make (sp: like start_position; gl: like generic_list) is
      require
         gl.lower = 1 and gl.count > 0
      local
         buffer: STRING
      do
         generic_list := gl
         buffer := once "TUPLE..."
         buffer.copy(as_tuple)
         if gl /= Void then
            buffer.extend(' ')
            gl.count.append_in(buffer)
         end
         create class_text_name.make(string_aliaser.hashed_string(buffer), sp)
      ensure
         start_position = sp
         generic_list = gl
      end

end -- class NON_EMPTY_TUPLE_TYPE_MARK
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
