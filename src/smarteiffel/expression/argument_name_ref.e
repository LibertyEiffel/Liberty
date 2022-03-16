-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ARGUMENT_NAME_REF
   --
   -- An argument name used somewhere.
   --

inherit
   LOCAL_ARGUMENT_REF

insert
   ARGUMENT_NAME

create {ANY}
   refer_to

feature {ANY}
   closure_rank: INTEGER
         -- 0 if the local is declared in the function scope; >0 if the local is declared in the
         -- nth enclosing function (i.e. available via a closure)
         -- Note: the `formal_arg_list' will link to the good one.

   rank: INTEGER

   declaration_type: TYPE -- *** IT WOULD BE BETTER TO COMPUTE `declaration_type' USING
         -- `formal_arg_list' ... BUT IT DOES NOT WORK BECAUSE FOR EXAMPLE
         -- like Current ARE HARD CODED INSIDE `formal_arg_list' *** DOM April 14th 2008 ***

   written_declaration_type_mark: TYPE_MARK
      do
         Result := formal_arg_list.type_mark(rank)
      end

   to_string: STRING
      do
         Result := formal_arg_list.name(rank).to_string
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := formal_arg_list.type_mark(rank).resolve_in(type)
      end

   specialize_in (type: TYPE): like Current
      local
         fal: like formal_arg_list
      do
         if closure_rank = 0 then
            fal := feature_accumulator.current_mixer.formal_arg_list
         else
            fal := feature_accumulator.current_mixer.closure_formal_arg_list(closure_rank)
            fal.name(rank).set_outside(type)
         end
         if declaration_type = Void then
            declaration_type := fal.type_mark(rank).declaration_type.type
         end
         if formal_arg_list = fal then
            Result := Current
         else
            Result := twin
            Result.set_formal_arg_list(fal)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         fal: like formal_arg_list
      do
         if closure_rank = 0 then
            fal := feature_accumulator.current_mixer.formal_arg_list
         else
            fal := feature_accumulator.current_mixer.closure_formal_arg_list(closure_rank)
            check fal.name(rank).is_outside(parent_type) end
            fal.name(rank).set_outside(new_type)
         end
         if formal_arg_list = fal then
            Result := Current
         else
            Result := twin
            Result.set_formal_arg_list(fal)
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         fal: like formal_arg_list
      do
         if closure_rank = 0 then
            fal := smart_eiffel.specializing_feature_arguments_list
         else
            fal := smart_eiffel.specializing_closure_arguments_lists.item(closure_rank - 1 + smart_eiffel.specializing_closure_arguments_lists.lower)
            check fal.name(rank).is_outside(type) end
         end
         if fal.name(rank).is_outside(type) then
            Result := as_outside
            Result.set_formal_arg_list(fal)
         else
            Result := Current
         end
      end

   has_been_specialized: BOOLEAN
      do
         Result := declaration_type /= Void
      end

   collect (type: TYPE): TYPE
      do
         Result := formal_arg_list.name(rank).collect(type)
      end

   adapt_for (type: TYPE): like Current
      local
         af: ANONYMOUS_FEATURE; fal: FORMAL_ARG_LIST
      do
         af := smart_eiffel.context_feature
         if closure_rank = 0 then
            fal := af.arguments
         else
            fal := af.closure_arguments.item(closure_rank - 1 + af.closure_arguments.lower)
            check
               fal.name(rank).is_outside(type)
               is_outside
            end
         end
         check
            formal_arg_list.start_position = fal.start_position
         end
         if formal_arg_list = fal then
            Result := Current
         else
            Result := twin
            Result.set_formal_arg_list(fal)
         end
      end

   accept (visitor: ARGUMENT_NAME_REF_VISITOR)
      do
         visitor.visit_argument_name_ref(Current)
      end

feature {ARGUMENT_NAME_REF}
   set_formal_arg_list (fal: like formal_arg_list)
      require
         fal /= Void
      do
         formal_arg_list := fal
      ensure
         formal_arg_list = fal
      end

feature {INTROSPECTION_HANDLER}
   set_declaration_type (declaration_type_: like declaration_type)
      require
         declaration_type_ /= Void
      do
         declaration_type := declaration_type_
      ensure
         declaration_type = declaration_type_
      end

feature {LIKE_ARGUMENT_TYPE_MARK} --|*** PH: should be {}
   formal_arg_list: FORMAL_ARG_LIST

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.add_sedb(start_position, 'S')
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   refer_to (sp: POSITION; fal: FORMAL_ARG_LIST; r: like rank; cr: like closure_rank)
      require
         not sp.is_unknown
         r.in_range(1, fal.count)
         cr >= 0
      do
         start_position := sp
         formal_arg_list := fal
         rank := r
         closure_rank := cr
         is_outside := cr > 0
      ensure
         start_position = sp
         formal_arg_list = fal
         rank = r
         closure_rank = cr
      end

invariant
   not start_position.is_unknown
   rank.in_range(1, formal_arg_list.count)
   closure_rank >= 0
   closure_rank /= 0 implies is_outside

end -- class ARGUMENT_NAME_REF
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
