-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FORMAL_GENERIC_TYPE_MARK
   --
   -- Handling of formal generic arguments type marks.
   --

inherit
   NON_STATIC_TYPE_MARK
      redefine
         resolve_in
      end

create {EIFFEL_PARSER, FORMAL_GENERIC_ARG}
   make

feature {ANY}
   written_name: HASHED_STRING

   declaration_type: TYPE_MARK is
      do
         if already_checking then
            Result := smart_eiffel.type_any.canonical_type_mark
         else
            Result := formal_generic_arg.constraint
            if Result = Void then
               Result := smart_eiffel.type_any.canonical_type_mark
            else
               already_checking := True
               Result := Result.declaration_type
               if already_checking = False then
                  -- A cycle was found, for instance FOO[A->B, B->A]
                  -- Check if it is valid.
                  if Result /= smart_eiffel.type_any.canonical_type_mark then
                     error_handler.add_position(start_position)
                     error_handler.add_position(formal_generic_arg.start_position)
                     error_handler.append(once "Invalid generic constraint cycle.")
                     error_handler.print_as_fatal_error
                  end
               end
            end
         end
         already_checking := False
      end

   start_position: POSITION is
      do
         Result := formal_name.start_position
      end

   specialize_in (new_type: TYPE) is
      do
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): TYPE_MARK is
      do
         Result := parent_edge.type_mark.generic_list.item(rank)
      end

   has_been_specialized: BOOLEAN is
      do
         Result := True
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := new_type.generic_list.item(rank)
      end

   to_static (new_type: TYPE; allow_unknown_class: BOOLEAN): TYPE_MARK is
      do
         Result := new_type.generic_list.item(rank).canonical_type_mark
      end

   signature_resolve_in (new_type: TYPE): TYPE is
      do
         Result := new_type.generic_list.item(rank)
      end

   accept (visitor: FORMAL_GENERIC_TYPE_MARK_VISITOR) is
      do
         visitor.visit_formal_generic_type_mark(Current)
      end

feature {}
   already_checking: BOOLEAN
         -- Crude fix to handle cases like FOO[E1->E2, E2->E1]

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_printer.put_class_name_without_link(formal_name)
      end

   set_start_position (sp: like start_position) is
      do
         if start_position /= sp then
            formal_name := formal_name.twin
            formal_name.set_accurate_position(sp)
         end
      end

feature {FORMAL_GENERIC_TYPE_MARK_VISITOR}
   formal_name: CLASS_NAME
         -- The one at the corresponding `start_position'.

   formal_generic_arg: FORMAL_GENERIC_ARG
         -- The corresponding definition.

feature {PARENT_EDGE}
   rank: INTEGER
         -- Rank in the corresponding formal generic list.

feature {}
   make (fn: like formal_name; fga: like formal_generic_arg; r: INTEGER) is
      require
         fn.to_string = fga.name.to_string
         fga.rank = r
      do
         formal_name := fn
         formal_generic_arg := fga
         written_name := fn.hashed_name
         rank := r
      ensure
         formal_name = fn
         formal_generic_arg = fga
         rank = r
      end

invariant
   not start_position.is_unknown

   formal_name.to_string = formal_generic_arg.name.to_string

   written_mark = formal_name.to_string

   rank = formal_generic_arg.rank

   not is_static

end -- class FORMAL_GENERIC_TYPE_MARK
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
