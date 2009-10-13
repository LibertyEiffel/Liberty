class LIBERTY_CLASS_DESCRIPTOR

insert
	HASHABLE

create {ANY}
	make, default_create

feature {ANY}
	cluster: LIBERTY_CLUSTER
	name: FIXED_STRING
	position: LIBERTY_POSITION

feature {LIBERTY_UNIVERSE}
	file: STRING is
		local
			n: STRING
		do
			n := once ""
			n.copy(name)
			n.to_lower
			n.append(once ".e")
			Result := once ""
			Result.copy(cluster.location)
			dir.compute_file_path_with(Result, n)
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
