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
class LIBERTY_CLASS_DESCRIPTOR

insert
	HASHABLE

create {ANY}
	make, default_create

feature {ANY}
	cluster: LIBERTY_CLUSTER
	name: FIXED_STRING
	position: LIBERTY_POSITION

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_DESCRIPTOR}
	file: STRING is
		local
			n: STRING
		do
			n := once ""
			n.clear_count
			n.append(name)
			n.to_lower
			n.append(once ".e")
			Result := once ""
			Result.copy(cluster.location)
			dir.compute_file_path_with(Result, n)
			Result.copy(dir.last_entry)
			if Result.is_empty or else not file_tools.is_file(Result) then
				std_error.put_string(" *** Unknown class: " + name + " in cluster " + cluster.location)
				die_with_code(1)
			end
		ensure
			Result /= Void
		end

feature {ANY}
	hash_code: INTEGER

	is_equal (other: like Current): BOOLEAN is
		do
			Result := name.is_equal(other.name) and then cluster.is_equal(other.cluster)
		end

	make (a_cluster: like cluster; a_name: like name; a_position: like position) is
		require
			a_cluster /= Void
			a_name /= Void
		do
			cluster := a_cluster
			name := a_name
			position := a_position
			compute_hash_code
		ensure
			cluster = a_cluster
			name = a_name
			position = a_position
		end

feature {}
	compute_hash_code is
		do
			hash_code := name.hash_code #*31 + cluster.hash_code
		end

	file_tools: FILE_TOOLS
	dir: BASIC_DIRECTORY

invariant
	cluster /= Void
	name /= Void

end
