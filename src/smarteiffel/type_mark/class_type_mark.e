-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASS_TYPE_MARK

inherit
   STATIC_TYPE_MARK
      redefine resolve_in
      end

creation {ANY}
   make

feature {ANY}
   class_text_name: CLASS_NAME

   is_generic: BOOLEAN is False

   written_name: HASHED_STRING is
      do
         Result := class_text_name.hashed_name
      end

   type: TYPE is
      do
         if type_memory = Void then
            type_memory := smart_eiffel.get_type_for_non_generic(Current)
         end
         Result := type_memory
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := type
      end

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
         Result := is_expanded
      end

   is_empty_expanded: BOOLEAN is
      do
         if is_expanded and then not type.has_external_type then
            Result := type.live_type.writable_attributes = Void
         end
      end

   generic_list: ARRAY[TYPE_MARK] is
      do
         check
            False -- Because of the inherited require.
         end
      end

   id: INTEGER is
      do
         Result := class_text.id
      end

   accept (visitor: CLASS_TYPE_MARK_VISITOR) is
      do
         visitor.visit_class_type_mark(Current)
      end

   start_position: POSITION is
      do
         Result := class_text_name.start_position
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      do
         Result := canonical_long_name
      end

feature {TYPE_MARK}
   frozen short_ (shorted_type: TYPE) is
      do
         short_printer.put_class_name(class_text_name)
      end

   set_start_position (sp: like start_position) is
      do
         if start_position /= sp then
            class_text_name := class_text_name.twin
            class_text_name.set_accurate_position(sp)
         end
      end

feature {}
   type_memory: like type

   make (ctn: like class_text_name) is
      require
         not ctn.predefined
         not ctn.is_tuple_related
      local
         n, written_site: STRING; error_flag: BOOLEAN
      do
         class_text_name := ctn
         n := ctn.to_string
         if n = as_integer_general then
            written_site := ctn.start_position.class_text.name.to_string
            if not written_site.has_prefix(as_integer) then
               error_flag := True
            end
         elseif n = as_real_general then
            written_site := ctn.start_position.class_text.name.to_string
            if not written_site.has_prefix(as_real) then
               error_flag := True
            end
         end
         if error_flag then
            error_handler.add_position(ctn.start_position)
            error_handler.append("The ")
            error_handler.append(n)
            error_handler.append(" type cannot be used here. Actually this is only a compiler %
                                 %implementation facility.")
            error_handler.print_as_fatal_error
         end
      ensure
         class_text_name = ctn
      end

end -- class CLASS_TYPE_MARK
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
