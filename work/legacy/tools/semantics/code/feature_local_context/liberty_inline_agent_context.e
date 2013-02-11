-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_INLINE_AGENT_CONTEXT

inherit
   LIBERTY_FEATURE_LOCAL_CONTEXT

insert
   LIBERTY_AST_HANDLER

create {LIBERTY_BUILDER_TOOLS}
   make

feature {ANY}
   current_type: LIBERTY_ACTUAL_TYPE is
      do
         Result := current_entity.result_type
      end

   result_type: LIBERTY_TYPE is
      do
         if result_entity /= Void then
            Result := result_entity.result_type
         end
      end

   parameters: TRAVERSABLE[LIBERTY_PARAMETER] is
      do
         Result := parameters_list
      ensure then
         definition: Result = parameters_list
      end

   locals: TRAVERSABLE[LIBERTY_LOCAL] is
      do
         Result := locals_list
      ensure then
         definition: Result = locals_list
      end

   is_parameter (name: ABSTRACT_STRING): BOOLEAN is
      do
         Result := parameters_map.has(name.intern)
      end

   parameter (name: ABSTRACT_STRING): LIBERTY_PARAMETER is
      do
         Result := parameters_map.reference_at(name.intern)
      end

   is_local (name: ABSTRACT_STRING): BOOLEAN is
      do
         Result := locals_map.has(name.intern)
      end

   local_var (name: ABSTRACT_STRING): LIBERTY_LOCAL is
      do
         Result := locals_map.reference_at(name.intern)
      end

   current_entity: LIBERTY_CURRENT
   result_entity: LIBERTY_RESULT

   can_retry: BOOLEAN is False

   retry_instruction (a_position: LIBERTY_POSITION): LIBERTY_RETRY is
      do
         check False end
      end

feature {LIBERTY_BUILDER_TOOLS, LIBERTY_FEATURE_LOCAL_CONTEXT}
   add_parameter (a_parameter: LIBERTY_PARAMETER) is
      do
         parameters_list.add_last(a_parameter)
         parameters_map.add(a_parameter, a_parameter.name)
      end

   add_local (a_local: LIBERTY_LOCAL) is
      do
         locals_list.add_last(a_local)
         locals_map.add(a_local, a_local.name)
      end

   reconcile_retry_instructions (a_feature: LIBERTY_FEATURE) is
      do
         check False end
      end

   set_result_type (a_result_type: like result_type) is
      do
         result_entity := a_result_type.result_entity
      end

feature {LIBERTY_INLINE_AGENT, LIBERTY_SEMANTICS_BUILDER}
   specialized_in (a_type: like current_type): like Current is
      do
         Result := twin
         Result.set_specialized_in(a_type)
      end

feature {LIBERTY_INLINE_AGENT_CONTEXT}
   set_specialized_in (a_type: like current_type) is
      local
         i: INTEGER; p: LIBERTY_PARAMETER; l: LIBERTY_LOCAL
         pl: like parameters_list; pm: like parameters_map
         ll: like locals_list; lm: like locals_map
      do
         current_entity := a_type.current_entity

         if result_entity /= Void then
            set_result_type(result_type.specialized_in(a_type))
         end

         from
            pl := parameters_list
            pm := parameters_map
            i := pl.lower
         until
            i > pl.upper
         loop
            p := pl.item(i).specialized_in(a_type)
            if p /= pl.item(i) then
               if pl = parameters_list then
                  pl := pl.twin
                  pm := pm.twin
               end
               pl.put(p, i)
               pm.put(p, p.name)
            end
            i := i + 1
         end
         if pl /= parameters_list then
            parameters_list := pl
            parameters_map := pm
         end

         from
            ll := locals_list
            lm := locals_map
            i := ll.lower
         until
            i > ll.upper
         loop
            l := ll.item(i).specialized_in(a_type)
            if l /= ll.item(i) then
               if ll = locals_list then
                  ll := ll.twin
                  lm := lm.twin
               end
               ll.put(l, i)
               lm.put(l, l.name)
            end
            i := i + 1
         end
         if ll /= locals_list then
            locals_list := ll
            locals_map := lm
         end
      end

feature {}
   parameters_map: DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]
   parameters_list: COLLECTION[LIBERTY_PARAMETER]
   locals_map: DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]
   locals_list: COLLECTION[LIBERTY_LOCAL]

   make (a_parent_context: LIBERTY_FEATURE_LOCAL_CONTEXT) is
      require
         a_parent_context /= Void
      do
         current_entity := a_parent_context.current_type.current_entity
         create {FAST_ARRAY[LIBERTY_PARAMETER]} parameters_list.make(0)
         create {HASHED_DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]} parameters_map.with_capacity(a_parent_context.parameters.count + 3)
         create {FAST_ARRAY[LIBERTY_LOCAL]} locals_list.make(0)
         create {HASHED_DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]} locals_map.with_capacity(a_parent_context.locals.count + 3)
         a_parent_context.parameters.do_all(agent add_parameter)
         a_parent_context.locals.do_all(agent add_local)
      end

end
