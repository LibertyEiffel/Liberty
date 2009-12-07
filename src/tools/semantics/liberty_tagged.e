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
deferred class LIBERTY_TAGGED

feature {LIBERTY_TAG_REF}
	add_tag (a_tag: LIBERTY_TAG) is
		require
			not tag_set(a_tag.id)
		do
			tags.add(a_tag, a_tag.id)
		ensure
			tag_set(a_tag.id)
		end

	set_tag (a_tag: LIBERTY_TAG) is
		do
			tags.put(a_tag, a_tag.id)
		ensure
			tag_set(a_tag.id)
		end

	tag_set (tag_id: FIXED_STRING): BOOLEAN is
		do
			if tags_memory /= Void then
				Result := tags_memory.fast_has(tag_id)
			end
		end

	tag (tag_id: FIXED_STRING): LIBERTY_TAG is
		require
			tag_set(tag_id)
		do
			Result := tags_memory.fast_reference_at(tag_id)
		end

feature {}
	tags_memory: DICTIONARY[LIBERTY_TAG, FIXED_STRING]

	tags: like tags_memory is
		do
			Result := tags_memory
			if Result = Void then
				create {HASHED_DICTIONARY[LIBERTY_TAG, FIXED_STRING]} Result.make
				tags_memory := Result
			end
		end

end
