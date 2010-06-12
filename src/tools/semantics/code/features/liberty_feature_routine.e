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
deferred class LIBERTY_FEATURE_ROUTINE

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		redefine
			mark_reachable_code, set_specialized_in
		end

feature {ANY}
	block_instruction: LIBERTY_INSTRUCTION

	rescue_instruction: LIBERTY_INSTRUCTION

	locals: TRAVERSABLE[LIBERTY_LOCAL] is
		require
			has_context
		do
			Result := context.locals
		ensure
			exists: Result /= Void
		end

feature {LIBERTY_FEATURE}
	set_specialized_in (a_context: like context) is
		do
			Precursor(a_context)
			block_instruction := block_instruction.specialized_in(a_context.current_type)
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
	make (a_definition_type: like definition_type; a_instruction: like block_instruction; a_accelerator: like accelerator) is
		require
			a_definition_type /= Void
			a_instruction /= Void
			a_accelerator /= Void
		do
			make_late_binding(a_definition_type, a_accelerator)
			block_instruction := a_instruction
		ensure
			definition_type = a_definition_type
			block_instruction = a_instruction
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		local
			old_mark: like reachable_mark
		do
			old_mark := reachable_mark
			Precursor(mark)
			if old_mark < mark then
				block_instruction.mark_reachable_code(mark)
				if rescue_instruction /= Void then
					rescue_instruction.mark_reachable_code(mark)
				end
			end
		end

invariant
	block_instruction /= Void
	accelerator /= Void

end
