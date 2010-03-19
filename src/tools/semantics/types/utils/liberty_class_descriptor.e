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
	make

create {LIBERTY_VOID_TYPE}
	make_void

feature {ANY}
	cluster: LIBERTY_CLUSTER
	name: FIXED_STRING
	position: LIBERTY_POSITION
	file: FIXED_STRING
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
			compute_file
		ensure
			cluster = a_cluster
			name = a_name
			position = a_position
		end

	make_void (a_position: like position) is
		do
			create cluster.make_void
			name := "<Void>".intern
			position := a_position
			file := name
		ensure
			position = a_position
		end

	compute_file is
		local
			n, f: STRING
		do
			n := once ""
			n.clear_count
			n.append(name)
			n.to_lower
			n.append(once ".e")
			f := once ""
			f.copy(cluster.location)
			dir.compute_file_path_with(f, n)
			f.copy(dir.last_entry)
			if f.is_empty or else not file_tools.is_file(f) then
				std_error.put_string(" *** Unknown class: ")
				std_error.put_string(name)
				std_error.put_string(" in cluster ")
				std_error.put_line(cluster.location)
				sedb_breakpoint
				die_with_code(1)
			end
			file := f.intern
		ensure
			file /= Void
		end

feature {}
	compute_hash_code is
		local
			h: like hash_code
		do
			h := name.hash_code #*31 #+ cluster.hash_code
			if h < 0 then
				h := ~h
			end
			hash_code := h
		end

	file_tools: FILE_TOOLS
	dir: BASIC_DIRECTORY

invariant
	cluster /= Void
	name /= Void
	file /= Void

end
