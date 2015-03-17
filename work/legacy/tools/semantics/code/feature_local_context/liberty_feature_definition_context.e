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
class LIBERTY_FEATURE_DEFINITION_CONTEXT

inherit
   LIBERTY_FEATURE_LOCAL_CONTEXT

insert
   LIBERTY_AST_HANDLER

create {LIBERTY_BUILDER_TOOLS}
   make

feature {ANY}
   current_type: LIBERTY_ACTUAL_TYPE
      do
         Result := current_entity.result_type
      end

   result_type: LIBERTY_TYPE
      do
         if result_entity /= Void then
            Result := result_entity.result_type
         end
      end

   parameters: TRAVERSABLE[LIBERTY_PARAMETER]
      do
         Result := parameters_list
      ensure then
         definition: Result = parameters_list
      end

   locals: TRAVERSABLE[LIBERTY_LOCAL]
      do
         Result := locals_list
      ensure then
         definition: Result = locals_list
      end

   is_parameter (name: ABSTRACT_STRING): BOOLEAN
      do
         Result := parameters_map.has(name.intern)
      end

   parameter (name: ABSTRACT_STRING): LIBERTY_PARAMETER
      do
         Result := parameters_map.reference_at(name.intern)
      end

   is_local (name: ABSTRACT_STRING): BOOLEAN
      do
         Result := locals_map.has(name.intern)
      end

   local_var (name: ABSTRACT_STRING): LIBERTY_LOCAL
      do
         Result := locals_map.reference_at(name.intern)
      end

   current_entity: LIBERTY_CURRENT
   result_entity: LIBERTY_RESULT

   can_retry: BOOLEAN True

   retry_instruction (a_position: LIBERTY_POSITION): LIBERTY_RETRY
      do
         create Result.make(a_position)
         retries.add_last(Result)
      end

feature {LIBERTY_BUILDER_TOOLS, LIBERTY_FEATURE_LOCAL_CONTEXT}
   add_parameter (a_parameter: LIBERTY_PARAMETER)
      do
         parameters_list.add_last(a_parameter)
         parameters_map.add(a_parameter, a_parameter.name)
      end

   add_local (a_local: LIBERTY_LOCAL)
      do
         locals_list.add_last(a_local)
         locals_map.add(a_local, a_local.name)
      end

   reconcile_retry_instructions (a_feature: LIBERTY_FEATURE)
      do
         retries.do_all(agent {LIBERTY_RETRY}.set_feature(a_feature))
      end

   set_result_type (a_result_type: like result_type)
      do
         result_entity := a_result_type.result_entity
      end

   set_feature_names (a_feature_names: like feature_names)
      require
         a_feature_names /= Void
      do
         feature_names := a_feature_names
         compute_written_feature_names
         compute_best_accelerator
      ensure
         feature_names = a_feature_names
         written_feature_names /= Void
         best_accelerator /= Void
      end

   best_accelerator: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]

   written_feature_names: FIXED_STRING

   find_precursor (parent: LIBERTY_ACTUAL_TYPE; redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME];
                   ast: LIBERTY_AST_ONE_CLASS; file: FIXED_STRING): LIBERTY_FEATURE
      local
         i: INTEGER; fn: LIBERTY_AST_FEATURE_NAME
      do
         from
            i := feature_names.lower
         until
            Result /= Void or else i > feature_names.upper
         loop
            fn ::= feature_names.item(i)
            Result := redefined_features.reference_at(create {LIBERTY_FEATURE_NAME}.make_from_ast(fn.feature_name_or_alias, ast, file))
            i := i + 1
         end
         if Result /= Void then
            Result := Result.find_precursor(parent)
         end
         if Result = Void then
            breakpoint
         end
      end

feature {LIBERTY_FEATURE, LIBERTY_SEMANTICS_BUILDER}
   specialized_in (a_type: like current_type): like Current
      do
         Result := twin
         Result.set_specialized_in(a_type)
      end

   debug_display_signature (o: OUTPUT_STREAM)
      local
         i: INTEGER
      do
         if not parameters_list.is_empty then
            o.put_character('(')
            from
               i := parameters_list.lower
            until
               i > parameters_list.upper
            loop
               if i > parameters_list.lower then
                  o.put_string(once "; ")
               end
               o.put_string(parameters_list.item(i).name)
               o.put_string(once ": ")
               o.put_string(parameters_list.item(i).result_type.full_name)
               i := i + 1
            end
            o.put_character(')')
         end
         if result_type /= Void then
            o.put_string(once ": ")
            o.put_string(result_type.full_name)
         end
      end

feature {LIBERTY_FEATURE_DEFINITION_CONTEXT}
   set_specialized_in (a_type: like current_type)
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

         --|*** TODO: retries
      end

feature {}
   parameters_map: DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]
   parameters_list: COLLECTION[LIBERTY_PARAMETER]
   locals_map: DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]
   locals_list: COLLECTION[LIBERTY_LOCAL]
   retries: COLLECTION[LIBERTY_RETRY]
   feature_names: EIFFEL_LIST_NODE

   make (a_current_type: like current_type)
      require
         a_current_type /= Void
      do
         current_entity := a_current_type.current_entity
         create {FAST_ARRAY[LIBERTY_PARAMETER]} parameters_list.make(0)
         create {HASHED_DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]} parameters_map.with_capacity(3)
         create {FAST_ARRAY[LIBERTY_LOCAL]} locals_list.make(0)
         create {HASHED_DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]} locals_map.with_capacity(3)
         create {FAST_ARRAY[LIBERTY_RETRY]} retries.with_capacity(1)
      ensure
         current_type = a_current_type
      end

   compute_written_feature_names
      require
         written_feature_names = Void
      local
         i: INTEGER
         fn: LIBERTY_AST_FEATURE_NAME
         fnoa: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
         buffer: STRING
      do
         buffer := once ""
         buffer.clear_count
         from
            i := feature_names.lower
         until
            i > feature_names.upper
         loop
            fn ::= feature_names.item(i)
            fnoa := fn.feature_name_or_alias
            if fnoa.is_regular then
               buffer.append(fnoa.entity_name.image.image.intern)
            elseif fnoa.is_prefix then
               buffer.append(once "prefix ")
               buffer.append(fnoa.free_operator_name.image.image.intern)
            else
               check fnoa.is_infix end
               buffer.append(once "infix ")
               buffer.append(fnoa.free_operator_name.image.image.intern)
            end
            if i < feature_names.upper then
               buffer.append(once ", ")
            end
            i := i + 1
         end
         written_feature_names := buffer.intern
      ensure
         written_feature_names /= Void
      end

   compute_best_accelerator
      local
         i: INTEGER
         fn: LIBERTY_AST_FEATURE_NAME
         fnoa: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
         full_feature_name: STRING
         second_best_accelerator: like best_accelerator
      do
         -- Heuristics to accelerate the feature calls (at least in the interpreter builtins).
         best_accelerator := Void
         from
            full_feature_name := once ""
            i := feature_names.lower
         until
            best_accelerator /= Void or else i > feature_names.upper
         loop
            fn ::= feature_names.item(i)
            fnoa := fn.feature_name_or_alias
            if fnoa.is_regular then
               full_feature_name.copy(fnoa.entity_name.image.image)
            elseif fnoa.is_prefix then
               full_feature_name.copy(once "prefix ")
               full_feature_name.append(fnoa.free_operator_name.image.image)
            else
               check fnoa.is_infix end
               full_feature_name.copy(once "infix ")
               full_feature_name.append(fnoa.free_operator_name.image.image)
            end
            inspect
               full_feature_name
            when "infix %"implies%"" then
               best_accelerator := accelerator_implies
            when "infix %"or else%"" then
               best_accelerator := accelerator_or_else
            when "infix %"or%"" then
               best_accelerator := accelerator_or
            when "infix %"xor%"" then
               best_accelerator := accelerator_xor
            when "infix %"and then%"" then
               best_accelerator := accelerator_and_then
            when "infix %"and%"" then
               best_accelerator := accelerator_and
            when "infix %"<=%"" then
               best_accelerator := accelerator_less_or_equal
            when "infix %"<%"" then
               best_accelerator := accelerator_less_than
            when "infix %">=%"" then
               best_accelerator := accelerator_greater_or_equal
            when "infix %">%"" then
               best_accelerator := accelerator_greater_than
            when "infix %"+%"" then
               best_accelerator := accelerator_add
            when "infix %"-%"" then
               best_accelerator := accelerator_subtract
            when "infix %"*%"" then
               best_accelerator := accelerator_times
            when "infix %"/%"" then
               best_accelerator := accelerator_divide
            when "infix %"//%"" then
               best_accelerator := accelerator_int_divide
            when "infix %"\\%"" then
               best_accelerator := accelerator_int_remainder
            when "infix %"^%"" then
               best_accelerator := accelerator_power
            when "prefix %"+%"" then
               best_accelerator := accelerator_positive
            when "prefix %"-%"" then
               best_accelerator := accelerator_negative
            when "prefix %"not%"" then
               best_accelerator := accelerator_not
            else
               if second_best_accelerator /= Void then
                  if fnoa.is_prefix then
                     second_best_accelerator := accelerator_free_prefix
                  elseif fnoa.is_infix then
                     second_best_accelerator := accelerator_free_infix
                  end
               end
            end
            i := i + 1
         end
         if best_accelerator = Void then
            if second_best_accelerator /= Void then
               best_accelerator := second_best_accelerator
            else
               best_accelerator := accelerator_other
            end
         end
      ensure
         best_accelerator /= Void
      end

   errors: LIBERTY_ERRORS

feature {} -- Accelerators
   accelerator_implies: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_implies
      end

   accelerator_or_else: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_or_else
      end

   accelerator_or: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_or
      end

   accelerator_xor: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_xor
      end

   accelerator_and_then: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_and_then
      end

   accelerator_and: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_and
      end

   accelerator_less_or_equal: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_less_or_equal
      end

   accelerator_less_than: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_less_than
      end

   accelerator_greater_or_equal: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_greater_or_equal
      end

   accelerator_greater_than: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_greater_than
      end

   accelerator_add: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_add
      end

   accelerator_subtract: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_subtract
      end

   accelerator_times: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_times
      end

   accelerator_divide: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_divide
      end

   accelerator_int_divide: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_int_divide
      end

   accelerator_int_remainder: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_int_remainder
      end

   accelerator_power: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_power
      end

   accelerator_positive: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_positive
      end

   accelerator_negative: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_negative
      end

   accelerator_not: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_not
      end

   accelerator_free_prefix: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_free_prefix
      end

   accelerator_free_infix: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_free_infix
      end

   accelerator_other: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
      once
         Result := agent {LIBERTY_FEATURE_ACCELERATOR}.call_other
      end

invariant
   current_type /= Void
   parameters_list /= Void
   locals_list /= Void
   parameters_map /= Void
   locals_map /= Void
   retries /= Void

end
