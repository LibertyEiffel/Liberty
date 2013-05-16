-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLIENT_TYPE_MARK
   --
   -- A truncated type mark, only useable in client lists (compatibility with standard Eiffel)
   --

inherit
   TYPE_MARK
      redefine resolve_in, class_text, try_class_text
      end

create {ANY}
   make

feature {ANY}
   class_text_name: CLASS_NAME is
      do
         check False end
      end

   is_static: BOOLEAN is False

   to_static (new_type: TYPE; allow_unknown_class: BOOLEAN): TYPE_MARK is
      local
         gl: ARRAY[TYPE_MARK]; static_tuple: TUPLE[TYPE, TYPE]
         ugtm: USER_GENERIC_TYPE_MARK
      do
         if static_memory = Void then
            create static_memory.make
         else
            static_tuple := static_memory.fast_reference_at(new_type)
         end
         if static_tuple = Void then
            if is_generic then
               gl := class_type_mark.class_text.constraints_generic_list
               create ugtm.make(class_type_mark.class_text_name, gl)
               Result := ugtm
            else
               Result := class_type_mark
            end
            static_tuple := [smart_eiffel.get_type(Result.to_static(new_type, False), False), smart_eiffel.get_type(Result.to_static(new_type, True), True)]
            static_memory.add(static_tuple, new_type)
         end
         if allow_unknown_class then
            Result := static_tuple.second.canonical_type_mark
         else
            Result := static_tuple.first.canonical_type_mark
         end
      end

   is_generic: BOOLEAN is
      do
         Result := class_type_mark.class_text.is_generic
      end

   written_name: HASHED_STRING is
      do
         Result := class_type_mark.written_name
      end

   type: TYPE is
      do
         check
            must_have_been_resolved_before: False
         end
         sedb_breakpoint
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := to_static(new_type, False).type
      end

   is_expanded: BOOLEAN is
      do
         Result := class_type_mark.is_expanded
      end

   is_reference: BOOLEAN is
      do
         Result := class_type_mark.is_reference
      end

   is_user_expanded: BOOLEAN is
      do
         Result := is_expanded
      end

   is_empty_expanded: BOOLEAN is
      do
         Result := class_type_mark.is_empty_expanded
      end

   generic_list: ARRAY[TYPE_MARK] is
      do
         if is_generic then
            Result := generic_list_memory
            if Result = Void then
               Result := class_type_mark.class_text.constraints_generic_list
               generic_list_memory := Result
            end
         end
      end

   id: INTEGER is
      do
         Result := class_type_mark.id
      end

   accept (visitor: CLIENT_TYPE_MARK_VISITOR) is
      do
         visitor.visit_client_type_mark(Current)
      end

   start_position: POSITION is
      do
         Result := class_type_mark.start_position
      end

   has_been_specialized: BOOLEAN is False

   signature_resolve_in (new_type: TYPE): TYPE is
      do
         check False end
      end

   specialize_in (new_type: TYPE) is
      do
         check False end
         sedb_breakpoint
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): TYPE_MARK is
      do
         check False end
         sedb_breakpoint
      end

   declaration_type: TYPE_MARK is
      do
         check False end
      end

   class_text: CLASS_TEXT is
      do
         Result := class_type_mark.class_text
      end

   try_class_text: CLASS_TEXT is
      do
         Result := class_type_mark.try_class_text
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      do
         Result := canonical_long_name
      end

feature {TYPE_MARK}
   frozen short_ (shorted_type: TYPE) is
      do
         class_type_mark.short_(shorted_type)
      end

   set_start_position (sp: like start_position) is
      do
         check False end
      end

feature {}
   make (ctm: like class_type_mark) is
      require
         ctm /= Void
      do
         class_type_mark := ctm
      ensure
         class_type_mark = ctm
      end

   class_type_mark: CLASS_TYPE_MARK
   static_memory: HASHED_DICTIONARY[TUPLE[TYPE, TYPE], TYPE]
   generic_list_memory: ARRAY[TYPE_MARK]

end -- class CLIENT_TYPE_MARK
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
