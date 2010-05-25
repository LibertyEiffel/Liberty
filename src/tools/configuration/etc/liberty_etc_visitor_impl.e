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

feature {LIBERTY_ETC_FACTORY} -- Non-Terminals
	visit_master (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			t: EIFFEL_TERMINAL_NODE; fix_point: BOOLEAN
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

			from
				all_clusters.do_all(agent consolidate)
				check not fix_point end
			until
				fix_point
			loop
				fix_point := not all_clusters.exists(agent {LIBERTY_ETC_CLUSTER}.set_depth)
			end
		end

	visit_cluster_definition (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "Cluster")
			end
			nt.node_at(1).accept(Current)
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
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW cluster name")
				nt.name_at(1).is_equal(once "Location")
				nt.name_at(2).is_equal(once "Version")
				nt.name_at(3).is_equal(once "Cluster_Details")
			end
			cluster_name ::= nt.node_at(0)
			if current_cluster_name /= Void then
				-- Parsing a cluster file
				if not current_cluster_name.is_equal(cluster_name.image.image) then
					errors.set(errors.level_fatal_error, "Invalid file content: bad cluster name " + cluster_name.image.image
								  + " (expected " + current_cluster_name + ")")
					check
						dead: False
					end
				end
				nt.node_at(1).accept(Current)
				nt.node_at(2).accept(Current)
				nt.node_at(3).accept(Current)
			else
				-- Parsing the master file
				current_cluster_name := cluster_name.image.image.intern
				if all_clusters.fast_has(current_cluster_name) then
					errors.set(errors.level_fatal_error, "Invalid file content: duplicate cluster name " + current_cluster_name)
					check
						dead: False
					end
				end
				nt.node_at(1).accept(Current)
				nt.node_at(2).accept(Current)
				nt.node_at(3).accept(Current)
				current_cluster := Void
				current_cluster_name := Void
			end
		end

	visit_location (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			location: EIFFEL_TERMINAL_NODE
			location_image: TYPED_EIFFEL_IMAGE[STRING]
			descriptor: STRING
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "KW string")
			end
			location ::= nt.node_at(1)
			location_image ::= location.image
			descriptor := location_image.decoded
			env.substitute(descriptor)

			if files.is_directory(descriptor) then
				dir.compute_file_path_with(descriptor, once "cluster.rc")
				if not dir.last_entry.is_empty and then files.file_exists(dir.last_entry) and then files.is_file(dir.last_entry) then
					descriptor.copy(dir.last_entry)
					set_current_cluster_from_cluster_rc(descriptor)
				else
					dir.compute_file_path_with(descriptor, once "loadpath.se")
					if not dir.last_entry.is_empty and then files.file_exists(dir.last_entry) and then files.is_file(dir.last_entry) then
						descriptor.copy(dir.last_entry)
						set_current_cluster_from_loadpath_se(descriptor)
					else
						set_current_cluster_from_directory(descriptor)
					end
				end
			elseif files.is_file(descriptor) then
				dir.compute_short_name_of(descriptor)
				inspect
					dir.last_entry
				when "cluster.rc" then
					set_current_cluster_from_cluster_rc(descriptor)
				when "loadpath.se" then
					set_current_cluster_from_loadpath_se(descriptor)
				else
					std_error.put_line("Unknown file format: " + descriptor)
					die_with_code(1)
				end
			else
				std_error.put_line("Strange file (neither a file nor a directory): " + descriptor)
				die_with_code(1)
			end
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
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW cluster name")
				nt.name_at(1).is_equal(once "Cluster_Constraints")
			end
			needed_cluster ::= nt.node_at(0)
			create {FAST_ARRAY[LIBERTY_ETC_CONSTRAINT]} last_cluster_constraints.with_capacity(1)
			nt.node_at(1).accept(Current)
			current_cluster.add_needs(create {LIBERTY_ETC_NEEDS}.make(needed_cluster.image.image.intern, last_cluster_constraints))
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

	visit_cluster_details (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			if not nt.is_empty then
				check
					nt.lower = 0
					nt.name_at(0).is_equal(once "Needs")
					nt.name_at(1).is_equal(once "Concurrency")
					nt.name_at(2).is_equal(once "Assertion")
					nt.name_at(3).is_equal(once "Debug")
				end
				nt.node_at(0).accept(Current)
				nt.node_at(1).accept(Current)
				nt.node_at(2).accept(Current)
				nt.node_at(3).accept(Current)
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
	set_current_cluster_from_cluster_rc (cluster_rc: STRING) is
		do
			not_yet_implemented
		end

	set_current_cluster_from_loadpath_se (loadpath_se: STRING) is
		local
			locations: FAST_ARRAY[FIXED_STRING]
			i, n: INTEGER
		do
			locations := {FAST_ARRAY[FIXED_STRING] << loadpath_se.intern >> }
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
		end

	scan_loadpath (locations: FAST_ARRAY[FIXED_STRING]) is
		require
			not locations.is_empty
		local
			i: INTEGER; file: FIXED_STRING
		do
			from
				i := locations.lower
			until
				i > locations.upper
			loop
				file := locations.item(i)
				if files.is_directory(file) then
					i := i + 1
				elseif files.is_file(file) then
					locations.remove(i)
					import_loadpath(locations, file)
				else
					std_error.put_line("Strange file: " + locations.item(i)
											 + " is neither a directory nor a regular file - ignored")
					locations.remove(i)
				end
			end
		end

	import_loadpath (locations: FAST_ARRAY[FIXED_STRING]; loadpath: FIXED_STRING) is
		local
			dirname, basename: STRING
		do
			tfr.connect_to(loadpath)
			if not tfr.is_connected then
				std_error.put_line("Could not open " + loadpath)
				die_with_code(1)
			end

			dir.compute_parent_directory_of(loadpath)
			dirname := once ""
			dirname.copy(dir.last_entry)
			dir.compute_short_name_of(loadpath)
			basename := once ""
			basename.copy(dir.last_entry)

			from
				tfr.read_line
			until
				tfr.end_of_input
			loop
				import_loadpath_line(locations, dirname, tfr.last_string)
				tfr.read_line
			end
			import_loadpath_line(locations, dirname, tfr.last_string)
			tfr.disconnect
		end

	import_loadpath_line (locations: FAST_ARRAY[FIXED_STRING]; dirname, loadpath_line: STRING) is
		do
			if not should_ignore(loadpath_line) then
				if dir.system_notation.is_absolute_path(loadpath_line) then
					locations.add_last(loadpath_line.intern)
				else
					dir.compute_file_path_with(dirname, loadpath_line)
					if files.file_exists(dir.last_entry) then
						locations.add_last(dir.last_entry.intern)
					else
						dir.compute_subdirectory_with(dirname, loadpath_line)
						locations.add_last(dir.last_entry.intern)
					end
				end
			end
		end

	should_ignore (loadpath_line: STRING): BOOLEAN is
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
					if i < loadpath_line.upper and then loadpath_line.item(i+1) = '-' then
						found := True
					end
				else
					Result := False
					found := True
				end
				i := i + 1
			end
		end

	set_current_cluster_from_directory (directory: STRING) is
		do
			create current_cluster.make(current_cluster_name, {FAST_ARRAY[FIXED_STRING] << directory.intern >> })
			all_clusters.add(current_cluster, current_cluster_name)
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

	consolidate (cluster: LIBERTY_ETC_CLUSTER; cluster_name: FIXED_STRING) is
		do
			cluster.consolidate(all_clusters)
		end

feature {}
	make (a_tool_name: ABSTRACT_STRING) is
		require
			a_tool_name /= Void
		do
			tool_name := a_tool_name.intern
			create all_clusters.make
		ensure
			tool_name = a_tool_name.intern
		end

	errors: LIBERTY_ERRORS
	env: LIBERTY_ENVIRONMENT
	all_clusters: HASHED_DICTIONARY[LIBERTY_ETC_CLUSTER, FIXED_STRING]
	current_cluster_name: FIXED_STRING
	current_cluster: LIBERTY_ETC_CLUSTER

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
