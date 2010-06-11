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
class LIBERTY_FEATURE_EXTERNAL

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		redefine
			set_specialized_in
		end

create {LIBERTY_BUILDER_TOOLS}
	make

feature {ANY}
	external_def: FIXED_STRING
	alias_def: FIXED_STRING

	rescue_instruction: LIBERTY_INSTRUCTION

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_FEATURE_EXTERNAL_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_feature_external(Current)
		end

feature {LIBERTY_FEATURE}
	set_specialized_in (a_context: like context) is
		do
			Precursor(a_context)
			if rescue_instruction /= Void then
				rescue_instruction := rescue_instruction.specialized_in(a_context.current_type)
			end
		end

feature {LIBERTY_BUILDER_TOOLS}
	set_rescue (a_rescue: like rescue_instruction) is
		require
			rescue_instruction = Void
			a_rescue /= Void
		do
			rescue_instruction := a_rescue
		ensure
			rescue_instruction = a_rescue
		end

feature {}
	do_join (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			Result := a_feature.joined_external(a_type, Current, other_fd, current_fd)
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_ATTRIBUTE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_constant (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_CONSTANT; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_deferred (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_DEFERRED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			Result := Current
		end

	joined_do (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_DO; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_external (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_EXTERNAL; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_once (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_ONCE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_redefined (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_REDEFINED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			if a_feature.definition_type = definition_type then
				current_fd.fatal_join_error_concrete_redefined(a_type, other_fd)
			end
			Result := Current
		end

	joined_unique (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_UNIQUE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

feature {}
	make (a_definition_type: like definition_type; a_external, a_alias: FIXED_STRING; a_accelerator: like accelerator) is
		require
			a_definition_type /= Void
			a_external /= Void
			a_accelerator /= Void
		do
			make_late_binding(a_definition_type, a_accelerator)
			external_def := a_external
			alias_def := a_alias
		ensure
			definition_type = a_definition_type
			external_def = a_external
			alias_def = a_alias
		end

invariant
	external_def /= Void

end
