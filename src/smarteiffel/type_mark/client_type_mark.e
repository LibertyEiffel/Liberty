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
   class_text_name: CLASS_NAME
      do
         check False end
      end

   is_static: BOOLEAN False

   to_static (new_type: TYPE; allow_raw_class_name: BOOLEAN): TYPE_MARK
      local
         gl: ARRAY[TYPE_MARK]; static_tuple: TUPLE[TYPE, TYPE]
         ugtm: USER_GENERIC_TYPE_MARK
      do
         if class_text /= Void then
            if static_memory = Void then
               create static_memory.make
            else
               static_tuple := static_memory.fast_reference_at(new_type)
            end
            if static_tuple = Void then
               if is_generic then
                  gl := class_text.constraints_generic_list
                  create ugtm.make(class_type_mark.class_text_name, gl)
                  Result := ugtm
               else
                  Result := class_type_mark
               end
               static_tuple := [smart_eiffel.get_type(Result.to_static(new_type, False), False), smart_eiffel.get_type(Result.to_static(new_type, True), True)]
               static_memory.add(static_tuple, new_type)
            end
            if allow_raw_class_name then
               Result := static_tuple.second.canonical_type_mark
            else
               Result := static_tuple.first.canonical_type_mark
            end
         end
      end

   is_generic: BOOLEAN
      do
         Result := class_text.is_generic
      end

   written_name: HASHED_STRING
      do
         Result := class_type_mark.written_name
      end

   type: TYPE
      do
         check
            must_have_been_resolved_before: False
         end
         sedb_breakpoint
      end

   resolve_in (new_type: TYPE): TYPE
      do
         Result := to_static(new_type, False).type
      end

   is_expanded: BOOLEAN
      do
         Result := class_type_mark.is_expanded
      end

   is_reference: BOOLEAN
      do
         Result := class_type_mark.is_reference
      end

   is_user_expanded: BOOLEAN
      do
         Result := is_expanded
      end

   generic_list: ARRAY[TYPE_MARK]
      do
         if is_generic then
            Result := generic_list_memory
            if Result = Void then
               Result := class_type_mark.class_text.constraints_generic_list
               generic_list_memory := Result
            end
         end
      end

   id: INTEGER
      do
         Result := class_type_mark.id
      end

   accept (visitor: CLIENT_TYPE_MARK_VISITOR)
      do
         visitor.visit_client_type_mark(Current)
      end

   start_position: POSITION
      do
         Result := class_type_mark.start_position
      end

   has_been_specialized: BOOLEAN
      do
         Result := specialized_type_mark /= Void
      end

   signature_resolve_in (new_type: TYPE): TYPE
      do
         check False end
      end

   specialize_in (new_type: TYPE)
      do
         specialized_type_mark := to_static(new_type, True)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): CLIENT_TYPE_MARK
      local
         stm: like specialized_type_mark
      do
         if specialized_type_mark = Void then
            stm := to_static(new_type, True)
         else
            stm := specialized_type_mark
         end
         stm := stm.specialize_thru(parent_type, parent_edge, new_type)
         if stm = specialized_type_mark then
            Result := Current
         else
            Result := twin
            Result.set_specialized_type_mark(stm)
         end
      end

   declaration_type: TYPE_MARK
      do
         check False end
      end

   class_text: CLASS_TEXT
      do
         Result := class_type_mark.class_text
      end

   try_class_text: CLASS_TEXT
      do
         Result := class_type_mark.try_class_text
      end

feature {LIVE_TYPE, TYPE_MARK}
   is_empty_expanded: BOOLEAN
      do
         Result := class_type_mark.is_empty_expanded
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING
      do
         Result := canonical_long_name
      end

feature {TYPE_MARK}
   frozen short_ (shorted_type: TYPE)
      do
         class_type_mark.short_(shorted_type)
      end

   set_start_position (sp: like start_position)
      do
         check False end
      end

feature {CLIENT_TYPE_MARK}
   set_specialized_type_mark (stm: like specialized_type_mark)
      require
         stm /= Void
         specialized_type_mark /= Void
      do
         specialized_type_mark := stm
      ensure
         specialized_type_mark = stm
      end

feature {}
   make (ctm: like class_type_mark)
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
   specialized_type_mark: TYPE_MARK

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
