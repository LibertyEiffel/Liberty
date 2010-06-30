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
class LIBERTY_VOID_TYPE
	--
	-- The type of a 'Void' expression unless or before its precise type can be determined.
	--
	-- In other words: good old NONE.
	--

inherit
	LIBERTY_KNOWN_TYPE

insert
	SINGLETON
		undefine out_in_tagged_out_memory
		end

creation {LIBERTY_VOID}
	make

feature {ANY}
	current_entity: LIBERTY_CURRENT is
		do
			check Result = Void end
		end

	known_type: LIBERTY_VOID_TYPE is
		do
			Result := Current
		end

	file: FIXED_STRING is
		once
			Result := "<Void>".intern
		end

	name: FIXED_STRING is
		once
			Result := "{Void type}".intern
		end

	hash_code: INTEGER is 20050814

	is_obsolete: BOOLEAN is False

	cluster: LIBERTY_CLUSTER is
		do
			check Result = Void end
		end

	the_invariant: LIBERTY_INVARIANT is
		do
			check Result = Void end
		end

	has_feature (a_feature_name: LIBERTY_FEATURE_NAME): BOOLEAN is
		do
			check not Result end
		end

	feature_definition (a_feature_name: LIBERTY_FEATURE_NAME): LIBERTY_FEATURE_DEFINITION is
		do
			check False end
		end

	is_conform_to (other: LIBERTY_KNOWN_TYPE): BOOLEAN is
		do
			Result := not other.is_expanded
		end

	is_non_conformant_child_of (other: LIBERTY_KNOWN_TYPE): BOOLEAN is
		do
			check not Result end
		end

	parameters: TRAVERSABLE[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
		end

	is_deferred: BOOLEAN is False
	is_expanded: BOOLEAN is False
	is_separate: BOOLEAN is False
	is_reference: BOOLEAN is False
	is_runtime_category_set: BOOLEAN is True

	accept (visitor: LIBERTY_TYPE_VISITOR) is
		do
			visitor.visit_void(Current)
		end

	converts_to (target_type: LIBERTY_ACTUAL_TYPE): BOOLEAN is
		do
			check not Result end
		end

	do_convert (target_type: LIBERTY_ACTUAL_TYPE; a_converter: LIBERTY_TYPE_CONVERTER) is
		do
			check False end
		end

feature {LIBERTY_KNOWN_TYPE}
	full_name_in (buffer: STRING) is
		do
			buffer.append(once "NONE")
		end

	same_base_class_as (other: LIBERTY_ACTUAL_TYPE): BOOLEAN is
		do
			check not Result end
		end

feature {ANY}
	debug_display (o: OUTPUT_STREAM; show_features: BOOLEAN) is
		do
			o.put_line(full_name)
		end

feature {LIBERTY_KNOWN_TYPE}
	common_parent (other: LIBERTY_KNOWN_TYPE): LIBERTY_KNOWN_TYPE is
		do
			check False end
		end

feature {LIBERTY_TYPE_BUILDER}
	has_no_parents: BOOLEAN is True

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_BUILDER}
	has_loaded_features: BOOLEAN is True

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: like reachable_mark) is
		do
			if reachable_mark < mark then
				reachable_mark := mark
			end
		end

feature {LIBERTY_TYPE_LISTENER, LIBERTY_TYPE}
	add_listener (a_listener: LIBERTY_TYPE_LISTENER) is
		do
			a_listener.on_type_known(Current)
		end

feature {}
	make is
		do
			reachable_mark := 1
			create result_entity.make(Current, errors.unknown_position)
		ensure
			is_reachable
		end

	errors: LIBERTY_ERRORS

invariant
	is_reachable

end -- class LIBERTY_VOID_TYPE
