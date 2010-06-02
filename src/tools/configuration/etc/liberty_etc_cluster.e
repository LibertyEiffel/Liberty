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

	is_equal (other: like Current): BOOLEAN is
		do
			Result := Current = other
		end

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

	check_validity (all_clusters: MAP[LIBERTY_ETC_CLUSTER, FIXED_STRING]) is
		require
			all_clusters /= Void
		do
			needs_memory.do_all(agent {LIBERTY_ETC_NEEDS}.check_validity(all_clusters))
		end

	check_cycles is
		do
			needs_memory.do_all(agent (n: LIBERTY_ETC_NEEDS) is do n.cluster.check_cycle(Current, n) end)
		end

feature {LIBERTY_ETC_CLUSTER}
	check_cycle (a_origin: LIBERTY_ETC_CLUSTER; a_needs: LIBERTY_ETC_NEEDS) is
		require
			a_needs.cluster = Current
		do
			if find_needs_cycle(a_needs, a_origin, Current) then
				logging.trace.put_new_line
			end
			clear_cycle_mark
		end

	find_cycle (origin, start: LIBERTY_ETC_CLUSTER): BOOLEAN is
		do
			if mark = 1 then
				Result := start = Current
				if Result then
					if logging.is_trace then
						logging.trace.put_string(once "Cycle in ")
						logging.trace.put_string(origin.name)
						logging.trace.put_string(once ": ")
						logging.trace.put_string(name)
					end
				end
			else
				mark := 1
				Result := needs_memory.exists(agent find_needs_cycle(?, origin, start))
				if Result then
					if logging.is_trace then
						logging.trace.put_string(once " -> ")
						logging.trace.put_string(name)
					end
				end
			end
			mark := 0
		end

	clear_cycle_mark is
		do
			if mark /= 0 then
				mark := 0
				needs_memory.do_all(agent clear_needs_cycle)
			end
		end

feature {}
	find_needs_cycle (a_needs: LIBERTY_ETC_NEEDS; origin, start: LIBERTY_ETC_CLUSTER): BOOLEAN is
		do
			Result := a_needs.cluster.find_cycle(origin, start)
			if Result then
				a_needs.set_in_cycle
			end
		end

	clear_needs_cycle (a_needs: LIBERTY_ETC_NEEDS) is
		do
			a_needs.cluster.clear_cycle_mark
		end

feature {LIBERTY_ETC_VISITOR_IMPL, LIBERTY_ETC_CLUSTER}
	fix_depth (a_mark: like mark): BOOLEAN is
		require
			a_mark >= mark
		do
			if mark < a_mark then
				mark := a_mark
				if deepen_needs then
					Result := fix_needs_depth
				end
			end
		ensure
			mark = a_mark
		end

	mark: INTEGER

feature {}
	deepen_needs: BOOLEAN is
		local
			i: INTEGER; need: LIBERTY_ETC_NEEDS
		do
			from
				i := needs_memory.lower
			until
				i > needs_memory.upper
			loop
				need := needs_memory.item(i)
				if need.in_cycle then
					if need.cluster.depth < depth then
						need.cluster.set_depth(depth)
						Result := True
					end
				elseif need.cluster.depth <= depth then
					need.cluster.set_depth(depth + 1)
					Result := True
				end
				i := i + 1
			end
		end

	fix_needs_depth: BOOLEAN is
		local
			i: INTEGER
		do
			from
				i := needs_memory.lower
			until
				i > needs_memory.upper
			loop
				if needs_memory.item(i).cluster.fix_depth(mark) then
					Result := True
				end
				i := i + 1
			end
		end

feature {LIBERTY_ETC_CLUSTER}
	set_depth (a_depth: like depth) is
		require
			a_depth > depth
		do
			if logging.is_trace then
				logging.trace.put_string(name)
				logging.trace.put_string(once " (mark=")
				logging.trace.put_integer(mark)
				logging.trace.put_string(once "): depth from ")
				logging.trace.put_integer(depth)
				logging.trace.put_string(once " to ")
				logging.trace.put_integer(a_depth)
				logging.trace.put_new_line
			end
			depth := a_depth
		ensure
			depth = a_depth
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
