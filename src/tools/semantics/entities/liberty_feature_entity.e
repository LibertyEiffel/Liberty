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

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	name: FIXED_STRING is
		do
			Result := feature_name.name
		end

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "feature: ")
			feature_name.out_in_tagged_out_memory
		end

	feature_name: LIBERTY_FEATURE_NAME

	result_type: LIBERTY_TYPE is
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

feature {LIBERTY_CALL_EXPRESSION}
	can_check_agent_signature: BOOLEAN is
		do
			Result := the_feature /= Void and then the_feature.can_check_agent_signature
		ensure
			can_also_check_result_type: Result implies (the_feature.result_type = Void or else the_feature.result_type.is_actual_type_set)
		end

	check_agent_signature (a_agent_arguments: COLLECTION[LIBERTY_ACTUAL_TYPE]): COLLECTION[LIBERTY_ACTUAL_TYPE] is
		require
			can_check_agent_signature
		do
			Result := the_feature.check_agent_signature(a_agent_arguments)
		end

feature {}
	the_feature: LIBERTY_FEATURE
	delayed_feature_type: LIBERTY_DELAYED_FEATURE_TYPE
	result_type_memory: LIBERTY_TYPE

	make (a_name: like feature_name; a_delayed_feature_type: like delayed_feature_type) is
		require
			a_name /= Void
			a_delayed_feature_type /= Void
			a_delayed_feature_type.name = a_name
		do
			feature_name := a_name
			delayed_feature_type := a_delayed_feature_type
			create {LIBERTY_DELAYED_TYPE} result_type_memory.make(a_delayed_feature_type)
			position := a_name.position
		ensure
			feature_name = a_name
			delayed_feature_type = a_delayed_feature_type
			position = a_name.position
		end

invariant
	name /= Void
	delayed_feature_type /= Void

end
