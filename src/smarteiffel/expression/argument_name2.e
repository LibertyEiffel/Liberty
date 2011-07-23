-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ARGUMENT_NAME2
   --
   -- An argument name used somewhere.
   --

inherit
   LOCAL_ARGUMENT2

insert
   ARGUMENT_NAME

creation {ANY}
   refer_to

feature {ANY}
   rank: INTEGER

   declaration_type: TYPE -- *** IT WOULD BE BETTER TO COMPUTE `declaration_type' USING
         -- `formal_arg_list' ... BUT IT DOES NOT WORK BECAUSE FOR EXAMPLE 
         -- like Current ARE HARD CODED INSIDE `formal_arg_list' *** DOM April 14th 2008 ***

   to_string: STRING is
      do
         Result := formal_arg_list.name(rank).to_string
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := formal_arg_list.type_mark(rank).resolve_in(type)
      end

   specialize_in (new_type: TYPE): like Current is
      local
         fal: like formal_arg_list
      do
         fal := feature_accumulator.current_mixer.formal_arg_list(new_type)
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

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         fal: like formal_arg_list
      do
         fal := feature_accumulator.current_mixer.formal_arg_list(new_type)
         if formal_arg_list = fal then
            Result := Current
         else
            Result := twin
            Result.set_formal_arg_list(fal)
         end
      end

   specialize_2 (type: TYPE): like Current is
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN is
      do
         Result := declaration_type /= Void
      end

   collect (type: TYPE): TYPE is
      do
         Result := formal_arg_list.name(rank).collect(type)
      end

   adapt_for (type: TYPE): like Current is
      local
         af: ANONYMOUS_FEATURE; fal: FORMAL_ARG_LIST
      do
         af := smart_eiffel.context_feature
         fal := af.arguments
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

   accept (visitor: ARGUMENT_NAME2_VISITOR) is
      do
         visitor.visit_argument_name2(Current)
      end

   frozen compile_to_jvm (type: TYPE) is
      local
         jvm_offset: INTEGER
      do
         jvm_offset := jvm.argument_offset_of(formal_arg_list.name(rank))
         resolve_in(type).canonical_type_mark.jvm_push_local(jvm_offset)
      end

   frozen jvm_branch_if_false (type: TYPE): INTEGER is
      do
         compile_to_jvm(type)
         Result := code_attribute.opcode_ifeq
      end

   frozen jvm_branch_if_true (type: TYPE): INTEGER is
      do
         compile_to_jvm(type)
         Result := code_attribute.opcode_ifne
      end

   frozen jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   frozen mapping_c_arg (type: TYPE) is
      do
         cpp.print_argument(rank)
      end

feature {ARGUMENT_NAME2}
   set_formal_arg_list (fal: like formal_arg_list) is
      require
         fal /= Void
      do
         formal_arg_list := fal
      ensure
         formal_arg_list = fal
      end

feature {INTROSPECTION_HANDLER}
   set_declaration_type (declaration_type_: like declaration_type) is
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
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.add_sedb(start_position, 'S')
         code_accumulator.current_context.add_last(Current)
      end
   
feature {}
   refer_to (sp: POSITION; fal: FORMAL_ARG_LIST; r: like rank) is
      require
         not sp.is_unknown
         r.in_range(1, fal.count)
      do
         start_position := sp
         formal_arg_list := fal
         rank := r
      ensure
         start_position = sp
         rank = r
      end

invariant
   formal_arg_list /= Void

end -- class ARGUMENT_NAME2
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
