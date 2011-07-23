-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOCAL_NAME2
   --
   -- A local name used somewhere.
   --

inherit
   LOCAL_ARGUMENT2
      redefine
         written_declaration_type_mark
      end
   
insert
   LOCAL_NAME

creation {TOKEN_BUFFER, INTROSPECTION_HANDLER}
   refer_to

feature {ANY}
   rank: INTEGER
         -- The `rank' of the corresponding declaration in `local_var_list'.

   declaration_type: TYPE

   written_declaration_type_mark: TYPE_MARK
   
   resolve_in (type: TYPE): TYPE is
      do
         Result := local_var_list.type_mark(rank).resolve_in(type)
      end

   to_string: STRING is
      do
         Result := local_var_list.name(rank).to_string
      end

   specialize_in (type: TYPE): like Current is
      local
         lvl: like local_var_list
      do
         lvl := smart_eiffel.specializing_feature_local_var_list
         if declaration_type = Void then
            declaration_type := lvl.type_mark(rank).declaration_type.type
         else
            check
               declaration_type = lvl.type_mark(rank).declaration_type.type
            end
         end
         if local_var_list = lvl then
            Result := Current
         else
            Result := twin
            Result.set_local_var_list(lvl)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         lvl: like local_var_list
      do
         lvl := smart_eiffel.specializing_feature_local_var_list
         if local_var_list = lvl then
            Result := Current
         else
            Result := twin
            Result.set_local_var_list(lvl)
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
         Result := local_var_list.name(rank).collect(type)
      end

   adapt_for (type: TYPE): like Current is
      local
         af: ANONYMOUS_FEATURE; er: E_ROUTINE; lvl: LOCAL_VAR_LIST
      do
         local_var_list.name(rank).live_reference_counter_increment
         af := smart_eiffel.context_feature
         er ::= af
         lvl := er.local_vars
         if local_var_list = lvl then
            Result := Current
         else
            lvl.name(rank).live_reference_counter_increment
            Result := twin
            Result.set_local_var_list(lvl)
         end
      end

   accept (visitor: LOCAL_NAME2_VISITOR) is
      do
         visitor.visit_local_name2(Current)
      end

   frozen mapping_c_arg (type: TYPE) is
      do
         compile_to_c(type)
      end

   frozen compile_to_jvm (type: TYPE) is
      local
         jvm_offset: INTEGER
      do
         jvm_offset := jvm.local_offset_of(local_var_list.name(rank))
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

   frozen jvm_assign, jvm_assign_creation (type: TYPE) is
      local
         jvm_offset: INTEGER
      do
         jvm_offset := jvm.local_offset_of(local_var_list.name(rank))
         resolve_in(type).canonical_type_mark.jvm_write_local(jvm_offset)
      end

feature {LOCAL_NAME2}
   set_local_var_list (lvl: like local_var_list) is
      require
         lvl /= Void
      do
         local_var_list := lvl
      ensure
         local_var_list = lvl
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.add_sedb(start_position, 'S')
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   local_var_list: LOCAL_VAR_LIST

   refer_to (sp: POSITION; lvl: LOCAL_VAR_LIST; r: like rank) is
         -- Using name `r' of `lvl' at place `sp'.
      require
         not sp.is_unknown
         r.in_range(1, lvl.count)
      do
         start_position := sp
         local_var_list := lvl
         rank := r
         written_declaration_type_mark := lvl.type_mark(r)
         lvl.name(r).parsing_reference_counter_increment
      ensure
         start_position = sp
         local_var_list = lvl
         rank = r
      end

invariant
   local_var_list /= Void

end -- class LOCAL_NAME2
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
