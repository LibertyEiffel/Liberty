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
class LIBERTY_ETC_CLUSTER
	--
	-- A cluster from the master configuration, to be imported if not overridden by the local loadpath.
	--

inherit
	HASHABLE
		redefine
			out_in_tagged_out_memory
		end

create {LIBERTY_ETC_VISITOR_IMPL}
	make

feature {ANY}
	name: FIXED_STRING
	locations: TRAVERSABLE[FIXED_STRING]
	version: FIXED_STRING
	depth: INTEGER
	cluster: LIBERTY_CLUSTER

	needs: TRAVERSABLE[LIBERTY_ETC_NEEDS] is
		do
			Result := needs_memory
		ensure
			Result /= Void
		end

	hash_code: INTEGER is
		do
			Result := name.hash_code
		end

	out_in_tagged_out_memory is
		local
			i: INTEGER
		do
			tagged_out_memory.append(once "Master cluster %"")
			tagged_out_memory.append(name)
			tagged_out_memory.extend('"')
			if version /= Void then
				tagged_out_memory.append(once " (version ")
				tagged_out_memory.append(version)
				tagged_out_memory.extend(')')
			end
			tagged_out_memory.append(once ": {")
			from
				i := locations.lower
			until
				i > locations.upper
			loop
				if i > locations.lower then
					tagged_out_memory.append(once ", ")
				end
				tagged_out_memory.append(locations.item(i))
				i := i + 1
			end
			tagged_out_memory.append(once "} (depth: ")
			depth.append_in(tagged_out_memory)
			tagged_out_memory.extend(')')
		end

feature {LIBERTY_ETC_VISITOR_IMPL}
	set_version (a_version: like version) is
		require
			version = Void
			a_version /= Void
		do
			version := a_version
		ensure
			version = a_version
		end

	add_needs (a_needs: LIBERTY_ETC_NEEDS) is
		require
			a_needs /= Void
		do
			needs_memory.add_last(a_needs)
		ensure
			needs_memory.fast_has(a_needs)
		end

	consolidate (all_clusters: MAP[LIBERTY_ETC_CLUSTER, FIXED_STRING]) is
		require
			all_clusters /= Void
		do
			needs_memory.do_all(agent {LIBERTY_ETC_NEEDS}.consolidate(all_clusters))
		end

	set_depth: BOOLEAN is
		local
			d: like depth
			i: INTEGER
			need: LIBERTY_ETC_NEEDS
		do
			from
				i := needs_memory.lower
			until
				i > needs_memory.upper
			loop
				need := needs_memory.item(i)
				if need.cluster.depth >= d then
					d := need.cluster.depth + 1
				end
				i := i + 1
			end
			if depth < d then
				depth := d
				Result := True
			end
		end

feature {LIBERTY_CLUSTER}
	set_cluster (a_cluster: like cluster) is
		require
			cluster = Void
			a_cluster /= Void
		do
			cluster := a_cluster
		ensure
			cluster = a_cluster
		end

feature {}
	make (a_name: like name; a_locations: like locations) is
		require
			not a_name.is_empty
			not a_locations.is_empty
		do
			name := a_name
			locations := a_locations
			create needs_memory.with_capacity(2)
			if logging.is_trace then
				logging.trace.put_string(once "Master cluster definition: ")
				logging.trace.put_string(name)
				logging.trace.put_string(once " -> ")
				logging.trace.put_line(a_locations.out)
			end
		ensure
			name = a_name
			locations = a_locations
		end

	needs_memory: FAST_ARRAY[LIBERTY_ETC_NEEDS]
	logging: LOGGING

invariant
	name /= Void
	not locations.is_empty
	needs_memory /= Void

end -- class LIBERTY_ETC_CLUSTER
