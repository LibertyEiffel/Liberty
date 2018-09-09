-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EMPTY_TUPLE_TYPE_MARK
   --
   -- For the "TUPLE" declaration type_mark.
   --

inherit
   TUPLE_TYPE_MARK
   NON_GENERIC_TYPE_MARK
      undefine is_tuple, canonical_long_name
      end

insert
   STATIC_TYPE_MARK
      undefine is_tuple, canonical_long_name
      end

create {ANY}
   make

feature {ANY}
   class_text_name: CLASS_NAME
         -- Always TUPLE, but with the correct `start_position'.

   as_type_mark: TYPE_MARK
      do
         Result := Current
      end

   type: TYPE
      do
         if type_memory = Void then
            type_memory := smart_eiffel.get_type(Current, False)
         end
         Result := type_memory
      end

   written_name: HASHED_STRING
      do
         Result := string_aliaser.tuple_name
      end

   start_position: POSITION
      do
         Result := class_text_name.start_position
      end

   count: INTEGER 0

   accept (visitor: EMPTY_TUPLE_TYPE_MARK_VISITOR)
      do
         visitor.visit_empty_tuple_type_mark(Current)
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING
      do
         Result := canonical_long_name
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
      do
         short_printer.put_class_name(class_text_name)
      end

   set_start_position (sp: like start_position)
      do
         if start_position /= sp then
            class_text_name := class_text_name.twin
            class_text_name.set_accurate_position(sp)
         end
      end

feature {}
   type_memory: like type

   make (sp: like start_position)
      require
         not sp.is_unknown
      do
         create class_text_name.make(string_aliaser.tuple_name, sp, False)
      ensure
         start_position = sp
      end

end -- class EMPTY_TUPLE_TYPE_MARK
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
