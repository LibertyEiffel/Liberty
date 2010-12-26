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
class LIBERTY_DELAYED_RESOLVER_IN_TYPE

inherit
   LIBERTY_DELAYED_RESOLVER

insert
   EIFFEL_NODE_HANDLER
      redefine out_in_tagged_out_memory, is_equal
      end

creation {LIBERTY_TYPE_RESOLVER_IN_TYPE}
   like_current, like_feature

creation {LIBERTY_DELAYED_RESOLVER_IN_TYPE}
   specialized

feature {ANY}
   out_in_tagged_out_memory is
      do
         current_type.out_in_tagged_out_memory
         if feature_name /= Void then
            tagged_out_memory.append(once ".")
            feature_name.out_in_tagged_out_memory
         end
      end

   hash_code: INTEGER is
      do
         Result := current_type.hash_code
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := other = Current
      end

feature {LIBERTY_DELAYED_TYPE}
   can_resolve: BOOLEAN is
      local
         fd: LIBERTY_FEATURE_DEFINITION
         bound_feature: LIBERTY_FEATURE
      do
         if feature_name = Void then
            Result := True
         elseif current_type.has_feature(feature_name) then
            fd := definition_type.feature_definition(feature_name)
            if definition_type = current_type then
               bound_feature := fd.the_feature
            elseif fd.the_feature.is_bound(current_type) then
               bound_feature := fd.the_feature.bound(current_type)
            end
            if bound_feature /= Void then
               Result := bound_feature.result_type.is_known
            end
         end
      end

   resolved: LIBERTY_KNOWN_TYPE is
      do
         if feature_name = Void then
            Result := current_type
         else
            Result := definition_type.feature_definition(feature_name).the_feature.bound(current_type).result_type.known_type
         end
      end

   full_name: FIXED_STRING is
      do
         Result := current_type.full_name
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      do
         if a_type.is_child_of(definition_type) then
            create Result.specialized(a_type, definition_type, feature_name)
         else
            Result := Current
         end
      end

feature {}
   like_current (a_type: like current_type) is
      require
         a_type /= Void
      do
         current_type := a_type
         definition_type := a_type
      ensure
         current_type = a_type
         definition_type = a_type
         feature_name = Void
      end

    like_feature (a_type: like current_type; a_feature_name: like feature_name) is
      require
         a_type /= Void
         a_feature_name /= Void
      do
         current_type := a_type
         definition_type := a_type
         feature_name := a_feature_name
      ensure
         current_type = a_type
         definition_type = a_type
         feature_name = a_feature_name
      end

    specialized (a_type: like current_type; a_definition_type: like definition_type; a_feature_name: like feature_name) is
      require
         a_type /= Void
         a_definition_type /= Void
         a_type.is_child_of(a_definition_type)
      do
         debug ("feature.specialization")
            log.trace.put_string(once "Creating specialized type resolver from ")
            log.trace.put_string(a_definition_type.full_name)
            log.trace.put_string(once " to ")
            log.trace.put_line(a_type.full_name)
         end
         current_type := a_type
         definition_type := a_definition_type
         feature_name := a_feature_name
      ensure
         current_type = a_type
         definition_type = a_definition_type
         feature_name = a_feature_name
      end

   current_type: LIBERTY_ACTUAL_TYPE
   definition_type: LIBERTY_ACTUAL_TYPE
   feature_name: LIBERTY_FEATURE_NAME

invariant
   current_type /= Void
   definition_type /= Void

end -- class LIBERTY_DELAYED_RESOLVER_IN_TYPE
