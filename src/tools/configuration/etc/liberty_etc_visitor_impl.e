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
class LIBERTY_ETC_VISITOR_IMPL

inherit
	LIBERTY_ETC_VISITOR

create {ANY}
	make

feature {LIBERTY_ETC}
	tool_name: FIXED_STRING

	clusters: MAP[LIBERTY_ETC_CLUSTER, FIXED_STRING] is
		do
			Result := all_clusters
		end

	check_validity is
		local
			fix_point: BOOLEAN; mark: INTEGER
		do
			from
				all_clusters.do_all(agent {LIBERTY_ETC_CLUSTER}.check_validity(clusters))
				all_clusters.do_all(agent {LIBERTY_ETC_CLUSTER}.check_cycles)
				check not fix_point end
			until
				fix_point
			loop
				mark := mark + 1
				if mark > 1024 then
					std_error.put_line("No fix point after 1024 iterations, clusters graph too complex?")
					die_with_code(1)
				end
				fix_point := not all_clusters.exists(agent {LIBERTY_ETC_CLUSTER}.fix_depth(mark))
			end
		end

feature {LIBERTY_ETC_FACTORY} -- Lists
	visit_environment_variable_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_cluster_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_cluster_configuration_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_debug_configuration_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_debug_key_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_location_list (list: LIBERTY_ETC_LIST) is
		do
			create last_locations.with_capacity(2)
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

feature {LIBERTY_ETC_FACTORY} -- Non-Terminals
	visit_master (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			t: EIFFEL_TERMINAL_NODE
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "KW entity name")
				nt.name_at(2).is_equal(once "Environment")
				nt.name_at(3).is_equal(once "Clusters")
			end
			t ::= nt.node_at(1)
			if not t.image.image.is_equal(tool_name) then
				errors.set(errors.level_fatal_error, "Invalid file content: bad Master name " + t.image.image
							  + " (expected " + tool_name + ")")
				check
					dead: False
				end
			end
			nt.node_at(2).accept(Current)
			nt.node_at(3).accept(Current)
		end

	visit_cluster_definition (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			cluster_name: EIFFEL_TERMINAL_NODE
			cluster_definition_name: FIXED_STRING
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "KW cluster name")
				nt.name_at(2).is_equal(once "Version")
				nt.name_at(3).is_equal(once "Locations")
				nt.name_at(4).is_equal(once "Needs")
				nt.name_at(5).is_equal(once "Concurrency")
				nt.name_at(6).is_equal(once "Assertion")
				nt.name_at(7).is_equal(once "Debug")
				nt.name_at(8).is_equal(once "Environment")
				nt.name_at(9).is_equal(once "Clusters")
			end

			check
				current_cluster = Void
			end
			cluster_name ::= nt.node_at(1)
			cluster_definition_name := cluster_name.image.image.intern
			if current_cluster_name = Void then
				current_cluster_name := cluster_definition_name
			elseif current_cluster_name /= cluster_definition_name then
				errors.set(errors.level_fatal_error, "Invalid file content: bad cluster name " + cluster_definition_name
							  + " (expected " + current_cluster_name + ")")
				check
					dead: False
				end
			end
			if all_clusters.fast_has(cluster_definition_name) then
				errors.set(errors.level_fatal_error, "Invalid file content: duplicate cluster name " + cluster_definition_name)
				check
					dead: False
				end
			end

			nt.node_at(8).accept(Current)
			nt.node_at(9).accept(Current)
			nt.node_at(3).accept(Current)

			set_current_cluster_from_last_locations

			nt.node_at(2).accept(Current)
			nt.node_at(4).accept(Current)
			nt.node_at(5).accept(Current)
			nt.node_at(6).accept(Current)
			nt.node_at(7).accept(Current)

			check
				current_cluster /= Void
			end
		end

	visit_environment (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			if not nt.is_empty then
				nt.node_at(1).accept(Current)
			end
		end

	visit_environment_variable (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			entity_name, entity_value: EIFFEL_TERMINAL_NODE
			entity_value_image: TYPED_EIFFEL_IMAGE[STRING]
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW entity name")
				nt.name_at(2).is_equal(once "KW string")
			end
			entity_name ::= nt.node_at(0)
			entity_value ::= nt.node_at(2)
			entity_value_image ::= entity_value.image
			env.set(entity_name.image.image, entity_value_image.decoded)
		end

	visit_clusters (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			if not nt.is_empty then
				check
					nt.lower = 0
					nt.name_at(1).is_equal(once "Cluster*")
				end
				nt.node_at(1).accept(Current)
			end
		end

	visit_cluster (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			cluster_name: EIFFEL_TERMINAL_NODE
			previous_cluster: like current_cluster
			previous_cluster_name: like current_cluster_name
			location: EIFFEL_TERMINAL_NODE
			location_image: TYPED_EIFFEL_IMAGE[STRING]
			descriptor: STRING
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW cluster name")
				nt.name_at(2).is_equal(once "KW string")
				nt.name_at(3).is_equal(once "Configure")
			end
			cluster_name ::= nt.node_at(0)
			previous_cluster_name := current_cluster_name
			previous_cluster := current_cluster
			current_cluster_name := cluster_name.image.image.intern
			current_cluster := Void

			location ::= nt.node_at(2)
			location_image ::= location.image
			descriptor := location_image.decoded
			env.substitute(descriptor)
			set_current_cluster_from_location(canonical_location(descriptor))
			if current_cluster.name /= current_cluster_name then
				-- an aliased cluster, usually for the PROGRAM_LOADPATH / PROGRAM_LOADPATH_ pair

				if all_clusters.fast_has(current_cluster_name) then
					errors.set(errors.level_fatal_error, "Invalid file content: duplicate cluster name " + current_cluster_name)
					check
						dead: False
					end
				end

				all_clusters.add(current_cluster, current_cluster_name)
			end
			nt.node_at(3).accept(Current)
			current_cluster := previous_cluster
			current_cluster_name := previous_cluster_name
		end

	visit_configure (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_locations (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "Location+")
			end
			nt.node_at(1).accept(Current)
		end

	visit_location (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			location: EIFFEL_TERMINAL_NODE
			location_image: TYPED_EIFFEL_IMAGE[STRING]
			descriptor: STRING
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW string")
			end
			location ::= nt.node_at(0)
			location_image ::= location.image
			descriptor := once ""
			descriptor.copy(location_image.decoded)
			env.substitute(descriptor)
			last_locations.add_last(canonical_location(descriptor))
		end

	set_current_cluster_from_last_locations is
		require
			current_cluster = Void
			not last_locations.is_empty
		local
			i: INTEGER; must_scan_loadpath: BOOLEAN
		do
			from
				i := last_locations.lower
			until
				i > last_locations.upper
			loop
				if not files.is_directory(last_locations.item(i)) then
					dir.compute_short_name_of(last_locations.item(i))
					inspect
						dir.last_entry
					when "loadpath.se" then
						must_scan_loadpath := True
					else
						std_error.put_line(last_locations.item(i) + " is not a directory")
						die_with_code(1)
					end
				end
				i := i + 1
			end
			if must_scan_loadpath then
				scan_loadpath(last_locations)
			end

			create current_cluster.make(current_cluster_name, last_locations)
			all_clusters.add(current_cluster, current_cluster_name)
			from
				i := last_locations.lower
			until
				i > last_locations.upper
			loop
				cluster_per_location.add(current_cluster, last_locations.item(i))
				i := i + 1
			end
			last_locations := Void
		ensure
			current_cluster /= Void
			last_locations = Void
		end

	set_current_cluster_from_location (location: ABSTRACT_STRING) is
		require
			current_cluster = Void
			location /= Void
			dir.system_notation.is_absolute_path(location.out)
		local
			descriptor: STRING
		do
			if files.is_directory(location) then
				dir.compute_file_path_with(location, once "cluster.rc")
				if not dir.last_entry.is_empty and then files.file_exists(dir.last_entry) and then files.is_file(dir.last_entry) then
					set_current_cluster_from_cluster_rc(dir.last_entry.intern)
				else
					dir.compute_file_path_with(location, once "loadpath.se")
					if not dir.last_entry.is_empty and then files.file_exists(dir.last_entry) and then files.is_file(dir.last_entry) then
						set_current_cluster_from_loadpath_se(dir.last_entry.intern)
					else
						descriptor := once ""
						descriptor.make_from_string(location)
						dir.system_notation.to_directory_path(descriptor)
						set_current_cluster_from_directory(descriptor.intern)
					end
				end
			elseif files.is_file(location) then
				dir.compute_short_name_of(location)
				inspect
					dir.last_entry
				when "cluster.rc" then
					set_current_cluster_from_cluster_rc(location.intern)
				when "loadpath.se" then
					set_current_cluster_from_loadpath_se(location.intern)
				else
					std_error.put_line("Unknown file format: " + location)
					die_with_code(1)
				end
			else
				std_error.put_line("Strange file: " + location
										 + " is neither a directory nor a regular file - cannot create the cluster")
				breakpoint
				die_with_code(1)
			end
		ensure
			current_cluster /= Void
		end

	visit_version (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			version: EIFFEL_TERMINAL_NODE
			version_image: TYPED_EIFFEL_IMAGE[STRING]
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "KW string")
			end
			version ::= nt.node_at(1)
			version_image ::= version.image
			current_cluster.set_version(version_image.decoded.intern)
		end

	visit_needs (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			if not nt.is_empty then
				check
					nt.lower = 0
					nt.name_at(1).is_equal(once "Cluster_Configuration*")
				end
				nt.node_at(1).accept(Current)
			end
		end

	visit_cluster_configuration (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			needed_cluster: EIFFEL_TERMINAL_NODE
			needed_cluster_name: FIXED_STRING
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW cluster name")
				nt.name_at(1).is_equal(once "Cluster_Constraints")
			end
			needed_cluster ::= nt.node_at(0)
			create {FAST_ARRAY[LIBERTY_ETC_CONSTRAINT]} last_cluster_constraints.with_capacity(1)
			nt.node_at(1).accept(Current)
			needed_cluster_name := needed_cluster.image.image.intern
			current_cluster.add_needs(create {LIBERTY_ETC_NEEDS}.make(needed_cluster_name, all_clusters.fast_reference_at(needed_cluster_name), last_cluster_constraints))
			last_cluster_constraints := Void
		end

	visit_cluster_constraints (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			if not nt.is_empty then
				check
					nt.lower = 0
					nt.name_at(1).is_equal(once "Cluster_Version_Constraint")
				end
				nt.node_at(1).accept(Current)
			end
		end

	visit_cluster_version_constraint (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			version: EIFFEL_TERMINAL_NODE
			version_image: TYPED_EIFFEL_IMAGE[STRING]
		do
			check
				nt.name_at(1).is_equal(once "Version_Operator")
				nt.name_at(2).is_equal(once "KW string")
			end
			nt.node_at(1).accept(Current)
			version ::= nt.node_at(2)
			version_image ::= version.image
			last_cluster_constraints.add_last(create {LIBERTY_ETC_VERSION_CONSTRAINT}.make(last_version_operator, version_image.decoded.intern))
		end

	visit_version_operator (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			check
				nt.lower = 0
			end
			inspect
				nt.name_at(0)
			when "KW =" then
				last_version_operator := agent_version_eq
			when "KW <=" then
				last_version_operator := agent_version_le
			when "KW >=" then
				last_version_operator := agent_version_ge
			when "KW /=" then
				last_version_operator := agent_version_ne
			when "KW <" then
				last_version_operator := agent_version_lt
			when "KW >" then
				last_version_operator := agent_version_gt
			end
		end

	visit_assertion (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_assertion_level (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_debug (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_debug_configuration (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_debug_key (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_concurrency (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

feature {}
	cluster_per_location: DICTIONARY[LIBERTY_ETC_CLUSTER, FIXED_STRING]

	set_current_cluster_from_cluster_rc (cluster_rc: FIXED_STRING) is
		require
			dir.system_notation.is_absolute_path(cluster_rc.out)
			current_cluster = Void
		local
			etc: LIBERTY_ETC
			previous_directory: like current_directory
		do
			current_cluster := cluster_per_location.fast_reference_at(cluster_rc)
			if current_cluster = Void then
				check
					etc.visitor = Current
				end
				previous_directory := current_directory
				dir.compute_parent_directory_of(cluster_rc)
				current_directory := dir.last_entry.intern

				etc.configure_cluster_rc(cluster_rc)
				cluster_per_location.add(current_cluster, cluster_rc)

				current_directory := previous_directory
			end
		ensure
			current_cluster /= Void
			current_cluster = cluster_per_location.fast_reference_at(cluster_rc)
		end

	set_current_cluster_from_loadpath_se (loadpath_se: FIXED_STRING) is
		require
			dir.system_notation.is_absolute_path(loadpath_se.out)
			current_cluster = Void
		local
			locations: FAST_ARRAY[FIXED_STRING]
			i, n: INTEGER
		do
			std_error.put_line(once "loadpath.se support is limited and will be removed.")
			std_error.put_line(loadpath_se)
			std_error.put_line(once "Consider using a cluster.rc file instead.")

			current_cluster := cluster_per_location.fast_reference_at(loadpath_se)
			if current_cluster = Void then
				if all_clusters.fast_has(current_cluster_name) then
					errors.set(errors.level_fatal_error, "Invalid file content: duplicate cluster name " + current_cluster_name)
					check
						dead: False
					end
				end

				locations := {FAST_ARRAY[FIXED_STRING] << loadpath_se >> }
				from
				until
					n = locations.count
				loop
					i := i + 1
					if i > 500 then
						std_error.put_line("loadpath nesting too deep starting from " + loadpath_se)
						die_with_code(1)
					end
					n := locations.count
					scan_loadpath(locations)
				end
				create current_cluster.make(current_cluster_name, locations)
				all_clusters.add(current_cluster, current_cluster_name)
				cluster_per_location.add(current_cluster, loadpath_se)
			end
		ensure
			current_cluster /= Void
			current_cluster = cluster_per_location.fast_reference_at(loadpath_se)
		end

	scan_loadpath (locations: FAST_ARRAY[FIXED_STRING]) is
		require
			not locations.is_empty
		local
			i: INTEGER; location: STRING; file: FIXED_STRING
		do
			location := once ""
			from
				i := locations.lower
			until
				i > locations.upper
			loop
				location.make_from_string(locations.item(i))
				env.substitute(location)
				file := canonical_location(location)
				if files.is_directory(file) then
					i := i + 1
				elseif files.is_file(file) then
					locations.remove(i)
					import_loadpath(locations, file)
				else
					std_error.put_line("Strange file: " + locations.item(i)
											 + " is neither a directory nor a regular file - ignored")
					breakpoint
					locations.remove(i)
				end
			end
		end

	import_loadpath (locations: FAST_ARRAY[FIXED_STRING]; loadpath: FIXED_STRING) is
		require
			dir.system_notation.is_absolute_path(loadpath.out)
		local
			directory: FIXED_STRING
		do
			tfr.connect_to(loadpath)
			if not tfr.is_connected then
				std_error.put_line("Could not open " + loadpath)
				die_with_code(1)
			end

			dir.compute_parent_directory_of(loadpath)
			directory := dir.last_entry.intern

			from
				tfr.read_line
			until
				tfr.end_of_input
			loop
				import_loadpath_line(locations, directory, tfr.last_string)
				tfr.read_line
			end
			import_loadpath_line(locations, directory, tfr.last_string)
			tfr.disconnect
		end

	import_loadpath_line (locations: FAST_ARRAY[FIXED_STRING]; directory: FIXED_STRING; loadpath_line: STRING) is
		require
			dir.system_notation.is_absolute_path(directory.out)
		local
			loadpath_entry: STRING
		do
			if not is_comment(loadpath_line) then
				loadpath_entry := once ""
				loadpath_entry.make_from_string(loadpath_line)
				env.substitute(loadpath_entry)
				if dir.system_notation.is_absolute_path(loadpath_entry) then
					locations.add_last(loadpath_entry.intern)
				else
					dir.compute_file_path_with(directory, loadpath_entry)
					if files.file_exists(dir.last_entry) then
						locations.add_last(dir.last_entry.intern)
					else
						dir.compute_subdirectory_with(directory, loadpath_entry)
						locations.add_last(dir.last_entry.intern)
					end
				end
			end
		end

	is_comment (loadpath_line: STRING): BOOLEAN is
		local
			i: INTEGER; found: BOOLEAN
		do
			from
				Result := True
				i := loadpath_line.lower
			until
				found or else i > loadpath_line.upper
			loop
				inspect
					loadpath_line.item(i)
				when ' ', '%T' then
					check Result end
				when '-' then
					Result := i < loadpath_line.upper and then loadpath_line.item(i+1) = '-'
					found := True
				else
					Result := False
					found := True
				end
				i := i + 1
			end
		end

	set_current_cluster_from_directory (directory: FIXED_STRING) is
		require
			dir.system_notation.is_absolute_path(directory.out)
			current_cluster = Void
		do
			current_cluster := cluster_per_location.fast_reference_at(directory)
			if current_cluster = Void then
				create current_cluster.make(current_cluster_name, {FAST_ARRAY[FIXED_STRING] << directory >> })
				all_clusters.add(current_cluster, current_cluster_name)
				cluster_per_location.add(current_cluster, directory)
			end
		ensure
			current_cluster /= Void
			current_cluster = cluster_per_location.fast_reference_at(directory)
		end

	canonical_location (descriptor: STRING): FIXED_STRING is
		local
			buffer: STRING
		do
			buffer := once ""
			buffer.make_from_string(current_directory)
			dir.system_notation.to_absolute_path_in(buffer, descriptor)
			Result := buffer.intern
		end

feature {}
	agent_version_eq: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]] is
		once
			Result := agent version_eq
		end

	agent_version_le: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]] is
		once
			Result := agent version_le
		end

	agent_version_ge: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]] is
		once
			Result := agent version_ge
		end

	agent_version_ne: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]] is
		once
			Result := agent version_ne
		end

	agent_version_lt: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]] is
		once
			Result := agent version_lt
		end

	agent_version_gt: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]] is
		once
			Result := agent version_gt
		end

	version_eq (v1, v2: FIXED_STRING): BOOLEAN is
		do
			Result := v1.is_equal(v2)
		end

	version_le (v1, v2: FIXED_STRING): BOOLEAN is
		do
			Result := not version_lt(v2, v1)
		end

	version_ge (v1, v2: FIXED_STRING): BOOLEAN is
		do
			Result := not version_lt(v1, v2)
		end

	version_ne (v1, v2: FIXED_STRING): BOOLEAN is
		do
			Result := not v1.is_equal(v2)
		end

	version_lt (v1, v2: FIXED_STRING): BOOLEAN is
		local
			previous_dot1, dot1, previous_dot2, dot2: INTEGER
			finished: BOOLEAN
			version1, version2: INTEGER
		do
			from
			until
				finished
			loop
				dot1 := v1.index_of('.', previous_dot1 + 1)
				dot2 := v2.index_of('.', previous_dot2 + 1)

				if not v1.valid_index(dot1) then
					dot1 := v1.upper + 1
					finished := True
				end
				if not v2.valid_index(dot2) then
					dot2 := v2.upper + 1
					finished := True
				end

				version1 := extract_integer(v1, previous_dot1 + 1, dot1 - 1)
				version2 := extract_integer(v2, previous_dot2 + 1, dot2 - 1)
				if version1 < version2 then
					Result := True
					finished := True
				elseif version1 > version2 then
					check not Result end
					dot1 := 0
					dot2 := 0
					check
						not v1.valid_index(dot1)
						not v2.valid_index(dot2)
					end
					finished := True
				else
					previous_dot1 := dot1
					previous_dot2 := dot2
				end
			end

			if not Result then
				check finished end
				if v1.valid_index(dot1) then
					check not Result end
				elseif v2.valid_index(dot2) then
					Result := True
				else
					check not Result end
				end
			end
		end

	version_gt (v1, v2: FIXED_STRING): BOOLEAN is
		do
			Result := version_lt(v2, v1)
		end

	extract_integer (v: FIXED_STRING; low, up: INTEGER): INTEGER is
		require
			v.valid_index(low)
			v.valid_index(up)
			low <= up
		local
			i: INTEGER
		do
			from
				i := low
			until
				i > up
			loop
				Result := Result*10 + (v.item(i).code - '0'.code)
				i := i + 1
			end
		end

feature {}
	make (a_tool_name: ABSTRACT_STRING) is
		require
			a_tool_name /= Void
		do
			tool_name := a_tool_name.intern
			create all_clusters.make
			create {HASHED_DICTIONARY[LIBERTY_ETC_CLUSTER, FIXED_STRING]} cluster_per_location.make
			current_directory := dir.current_working_directory
		ensure
			tool_name = a_tool_name.intern
		end

	errors: LIBERTY_ERRORS
	env: LIBERTY_ENVIRONMENT
	all_clusters: HASHED_DICTIONARY[LIBERTY_ETC_CLUSTER, FIXED_STRING]
	current_directory: FIXED_STRING
	current_cluster_name: FIXED_STRING
	current_cluster: LIBERTY_ETC_CLUSTER

	last_locations: FAST_ARRAY[FIXED_STRING]
	last_cluster_constraints: COLLECTION[LIBERTY_ETC_CONSTRAINT]
	last_version_operator: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]]

	dir: BASIC_DIRECTORY
	files: FILE_TOOLS

	tfr: TEXT_FILE_READ is
		once
			create Result.make
		end

invariant
	all_clusters /= Void
	tool_name /= Void

end -- class LIBERTY_ETC_VISITOR_IMPL
