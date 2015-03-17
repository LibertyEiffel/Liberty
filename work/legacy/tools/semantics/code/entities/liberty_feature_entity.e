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
class LIBERTY_FEATURE_ENTITY
--
-- A proxy to the feature itself.
--
-- See also LIBERTY_WRITABLE_FEATURE
--

inherit
   LIBERTY_ENTITY
      redefine out_in_tagged_out_memory
      end

insert
   LIBERTY_REACHABLE_MARKED
      redefine out_in_tagged_out_memory
      end
   LOGGING
      redefine out_in_tagged_out_memory
      end

create {LIBERTY_BUILDER_TOOLS, LIBERTY_CALL, LIBERTY_CALL_PROMOTION}
   make

create {LIBERTY_FEATURE_ENTITY}
   specialized

feature {ANY}
   target_type: LIBERTY_TYPE

   name: FIXED_STRING
      do
         Result := feature_name.name
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "feature: ")
         feature_name.out_in_tagged_out_memory
      end

   feature_name: LIBERTY_FEATURE_NAME

   result_type: LIBERTY_TYPE
      do
         if the_feature /= Void then
            Result := the_feature.result_type
         elseif delayed_feature_type.is_ready then
            the_feature := delayed_feature_type.the_feature
            Result := the_feature.result_type
         else
            Result := result_type_memory
         end
      end

   has_feature: BOOLEAN
      do
         Result := target_type.known_type.has_feature(feature_name)
      end

   feature_definition: LIBERTY_FEATURE_DEFINITION
      require
         has_feature
      do
         Result := target_type.known_type.feature_definition(feature_name)
      end

   debug_display
      do
         target_type.known_type.debug_display(log.trace, True)
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      local
         f: like the_feature
         dft: like delayed_feature_type
         tt: like target_type
      do
         tt := target_type.specialized_in(a_type)
         if delayed_feature_type = Void or else delayed_feature_type.is_ready then
            if the_feature = Void then
               check
                  delayed_feature_type /= Void
               end
               the_feature := delayed_feature_type.the_feature
            end
            f := the_feature.specialized_in(a_type)
            if f = the_feature and then tt = target_type then
               Result := Current
            else
               create Result.specialized(feature_name, tt, f, Void)
            end
         else
            dft := delayed_feature_type.specialized_in(a_type)
            if dft = delayed_feature_type and then tt = target_type then
               Result := Current
            else
               create Result.specialized(feature_name, tt, Void, dft)
            end
         end
      end

feature {LIBERTY_CALL_EXPRESSION}
   can_check_agent_signature (a_agent_call: LIBERTY_CALL_EXPRESSION): BOOLEAN
      require
         a_agent_call /= Void
      do
         Result := the_feature /= Void and then the_feature.can_check_agent_signature(a_agent_call)
      ensure
         can_also_check_result_type: Result implies (the_feature.result_type = Void or else the_feature.result_type.is_known)
      end

   agent_signature (a_agent_call: LIBERTY_CALL_EXPRESSION): COLLECTION[LIBERTY_KNOWN_TYPE]
      require
         can_check_agent_signature(a_agent_call)
         a_agent_call.is_agent_call
      do
         Result := the_feature.agent_signature(a_agent_call)
      end

   check_agent_signature (a_agent_call: LIBERTY_CALL_EXPRESSION)
      require
         can_check_agent_signature(a_agent_call)
         a_agent_call.is_agent_call
      do
         the_feature.check_agent_signature(a_agent_call)
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER)
      local
         rt: like result_type
      do
         if not is_reachable then
            debug ("mark.reachable")
               log.trace.put_string(once "Marked reachable the feature entity {")
               log.trace.put_string(target_type.full_name)
               log.trace.put_string(once "}.")
               log.trace.put_line(feature_name.name)
            end
            torch.burn
         end
         reachable_mark := mark

         if the_feature /= Void then
            the_feature.mark_reachable_code(mark)
         elseif delayed_feature_type /= Void then
            delayed_feature_type.mark_reachable_code(mark)
         end

         rt := result_type
         if rt /= Void then--and then rt.is_known and then rt.known_type.is_runtime_category_set and then rt.known_type.is_expanded then
            rt.mark_reachable_code(mark)
         end
      end

feature {}
   the_feature: LIBERTY_FEATURE
   delayed_feature_type: LIBERTY_DELAYED_FEATURE_TYPE
   result_type_memory: LIBERTY_TYPE

   make (a_name: like feature_name; a_target_type: like target_type)
      require
         a_name /= Void
         a_target_type /= Void
      do
         feature_name := a_name
         target_type := a_target_type
         create delayed_feature_type.make(a_target_type, a_name)
         create {LIBERTY_DELAYED_TYPE} result_type_memory.make(delayed_feature_type)
         position := a_name.position
      ensure
         feature_name = a_name
         target_type = a_target_type
         position = a_name.position
      end

   specialized (a_name: like feature_name; a_target_type: like target_type; a_feature: like the_feature; a_delayed_feature_type: like delayed_feature_type)
      require
         a_name /= Void
         a_target_type /= Void
         a_feature /= Void xor a_delayed_feature_type /= Void
      do
         feature_name := a_name
         target_type := a_target_type
         the_feature := a_feature
         delayed_feature_type := a_delayed_feature_type
         if a_delayed_feature_type /= Void then
            create {LIBERTY_DELAYED_TYPE} result_type_memory.make(a_delayed_feature_type)
         end
         position := a_name.position
      ensure
         feature_name = a_name
         target_type = a_target_type
         the_feature = a_feature
         delayed_feature_type = a_delayed_feature_type
         position = a_name.position
      end

   torch: LIBERTY_ENLIGHTENING_THE_WORLD

feature {ANY}
   accept (v: VISITOR)
      local
         v0: LIBERTY_FEATURE_ENTITY_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_feature_entity(Current)
      end

invariant
   name /= Void
   the_feature = Void implies delayed_feature_type /= Void
   target_type /= Void

end
