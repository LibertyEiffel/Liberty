-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LOCAL_NAME_REF
   --
   -- A local name used somewhere.
   --

inherit
   LOCAL_ARGUMENT_REF

insert
   LOCAL_NAME

create {ANY}
   refer_to

feature {ANY}
   closure_rank: INTEGER
         -- 0 if the local is declared in the function scope; >0 if the local is declared in the
         -- nth enclosing function (i.e. available via a closure)

   rank: INTEGER
         -- The `rank' of the corresponding declaration in `local_var_list'.

   declaration_type: TYPE

   written_declaration_type_mark: TYPE_MARK

   resolve_in (type: TYPE): TYPE
      do
         Result := local_var_list.type_mark(rank).resolve_in(type)
      end

   to_string: STRING
      do
         Result := local_var_list.name(rank).to_string
      end

   specialize_in (type: TYPE): like Current
      local
         lvl: like local_var_list
      do
         if closure_rank = 0 then
            lvl := smart_eiffel.specializing_feature_local_var_list
         else
            lvl := smart_eiffel.specializing_closure_local_var_lists.item(closure_rank - 1 + smart_eiffel.specializing_closure_local_var_lists.lower)
            lvl.name(rank).set_outside(type)
         end
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

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         lvl: like local_var_list
      do
         if closure_rank = 0 then
            lvl := smart_eiffel.specializing_feature_local_var_list
         else
            lvl := smart_eiffel.specializing_closure_local_var_lists.item(closure_rank - 1 + smart_eiffel.specializing_closure_local_var_lists.lower)
            check lvl.name(rank).is_outside(parent_type) end
            lvl.name(rank).set_outside(new_type)
         end
         if local_var_list = lvl then
            Result := Current
         else
            Result := twin
            Result.set_local_var_list(lvl)
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         lvl: like local_var_list
         mhf: MEMORY_HANDLER_FACTORY
      do
         if closure_rank = 0 then
            lvl := smart_eiffel.specializing_feature_local_var_list
         else
            lvl := smart_eiffel.specializing_closure_local_var_lists.item(closure_rank - 1 + smart_eiffel.specializing_closure_local_var_lists.lower)
            check lvl.name(rank).is_outside(type) end
         end
         if lvl.name(rank).is_outside(type) then
            if closure_rank = 0 and then mhf.is_no_gc then
               error_handler.add_position(lvl.name(rank).start_position)
               error_handler.append(once "This variable is used in a closure. Beware, each time the method is called, a lot of memory may be wasted.")
               error_handler.print_as_warning
            end
            Result := as_outside
            Result.set_local_var_list(lvl)
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
         Result := local_var_list.name(rank).collect(type)
      end

   adapt_for (type: TYPE): like Current
      local
         af: ANONYMOUS_FEATURE; er: E_ROUTINE; lvl: LOCAL_VAR_LIST
      do
         af := smart_eiffel.context_feature
         er ::= af
         if closure_rank = 0 then
            lvl := er.local_vars
         else
            lvl := er.closure_local_vars.item(closure_rank - 1 + er.closure_local_vars.lower)
         end
         lvl.name(rank).live_reference_counter_increment
         if local_var_list = lvl then
            Result := Current
         else
            Result := twin
            Result.set_local_var_list(lvl)
         end
      end

   accept (visitor: LOCAL_NAME_REF_VISITOR)
      do
         visitor.visit_local_name_ref(Current)
      end

feature {LOCAL_NAME_REF}
   set_local_var_list (lvl: like local_var_list)
      require
         lvl /= Void
      do
         local_var_list := lvl
      ensure
         local_var_list = lvl
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.add_sedb(start_position, 'S')
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   local_var_list: LOCAL_VAR_LIST

   refer_to (sp: POSITION; lvl: LOCAL_VAR_LIST; r: like rank; cr: like closure_rank)
         -- Using name `r' of `lvl' at place `sp'.
      require
         not sp.is_unknown
         r.in_range(1, lvl.count)
      do
         start_position := sp
         local_var_list := lvl
         rank := r
         closure_rank := cr
         written_declaration_type_mark := lvl.type_mark(r)
         lvl.name(r).parsing_reference_counter_increment
         is_outside := cr > 0
      ensure
         start_position = sp
         local_var_list = lvl
         rank = r
         closure_rank = cr
      end

invariant
   rank.in_range(1, local_var_list.count)
   closure_rank >= 0
   closure_rank /= 0 implies is_outside

end -- class LOCAL_NAME_REF
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
