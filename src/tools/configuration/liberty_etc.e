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
expanded class LIBERTY_ETC

create {ANY}
	make

feature {ANY}
	configure_for (a_program_cluster: STRING; a_visitor: like visitor) is
		require
			not is_configured
			a_visitor /= Void
		local
			done: BOOLEAN; i: INTEGER
			rc_file: STRING
		do
			visitor_memory.set_item(a_visitor)
			from
				i := roots.lower
			until
				done or else i > roots.upper
			loop
				rc_file := once ""
				rc_file.copy(roots.item(i))
				env.substitute(rc_file)
				dir.compute_file_path_with(rc_file, master_name)
				if not dir.last_entry.is_empty then
					rc_file.copy(dir.last_entry)
					if files.file_exists(rc_file) and then files.is_file(rc_file) then
						done := set_configuration_from(rc_file)
					end
				end
				i := i + 1
			end
			configure_program_cluster(a_program_cluster)
		ensure
			is_configured
			visitor = a_visitor
		end

	log is
		do
			clusters.do_all(agent show_cluster)
		end

	is_configured: BOOLEAN is
		do
			Result := visitor /= Void
		end

	clusters: MAP[LIBERTY_ETC_CLUSTER, FIXED_STRING] is
		require
			is_configured
		do
			Result := visitor.clusters
		ensure
			Result /= Void
		end

feature {}
	visitor: LIBERTY_ETC_VISITOR is
		do
			Result := visitor_memory.item
		end

	visitor_memory: REFERENCE[LIBERTY_ETC_VISITOR] is
		once
			create Result
		end

	show_cluster (a_cluster: LIBERTY_ETC_CLUSTER) is
		do
			if logging.is_trace then
				logging.trace.put_line(a_cluster.out)
			end
		end

	set_configuration_from (file: STRING): BOOLEAN is
			-- True if the configuration file was successfully read
		local
			conf: STRING
		do
			parser_file.connect_to(file)
			if parser_file.is_connected then
				conf := once ""
				conf.clear_count
				from
					parser_file.read_line
				until
					parser_file.end_of_input
				loop
					conf.append(parser_file.last_string)
					conf.extend('%N')
					parser_file.read_line
				end
				conf.append(parser_file.last_string)
				parser_file.disconnect
				parser_buffer.initialize_with(conf)

				grammar.reset
				parser.eval(parser_buffer, grammar.table, once "Master")
				if parser.error /= Void then
					errors.emit_syntax_error(parser.error, conf, file.intern)
				else
					grammar.root_node.accept(visitor)
					Result := True
				end
			end
		end

	configure_program_cluster (a_program_cluster: STRING) is
		do
			dir.compute_short_name_of(a_program_cluster)
			inspect
				dir.last_entry
			when "cluster.rc" then
				configure_program_cluster_rc(a_program_cluster)
			when "loadpath.se" then
				configure_program_loadpath(a_program_cluster)
			else
				std_error.put_line("Unknown program cluster format: " + a_program_cluster)
				die_with_code(1)
			end
		end

	configure_program_cluster_rc (a_program_cluster_rc: STRING) is
		local
			conf: STRING
		do
			parser_file.connect_to(a_program_cluster_rc)
			if parser_file.is_connected then
				conf := once ""
				conf.clear_count
				from
					parser_file.read_line
				until
					parser_file.end_of_input
				loop
					conf.append(parser_file.last_string)
					conf.extend('%N')
					parser_file.read_line
				end
				conf.append(parser_file.last_string)
				parser_file.disconnect
				parser_buffer.initialize_with(conf)

				grammar.reset
				parser.eval(parser_buffer, grammar.table, once "Cluster_Definition")
				if parser.error /= Void then
					errors.emit_syntax_error(parser.error, conf, a_program_cluster_rc.intern)
				else
					grammar.root_node.accept(visitor)
				end
			end
		end

	configure_program_loadpath (a_program_loadpath: STRING) is
		local
			conf: STRING
		do
			conf := once ""
			conf.copy(once "cluster PROGRAM_LOADPATH: %"")
			conf.append(a_program_loadpath)
			conf.append(once "%" version %"0.0%" end")
			parser_buffer.initialize_with(conf)

			grammar.reset
			parser.eval(parser_buffer, grammar.table, once "Cluster_Definition")
			if parser.error /= Void then
				errors.emit_syntax_error(parser.error, conf, "Generated cluster definition".intern)
			else
				grammar.root_node.accept(visitor)
			end
		end

	master_name: STRING is
		do
			Result := once ""
			Result.make_from_string(visitor.tool_name)
			Result.append(once ".rc")
		end

feature {}
	make is
		do
			roots := {FAST_ARRAY[STRING] << "${HOME}/.liberty", "/etc/liberty" >> }
		end

	grammar: LIBERTY_ETC_GRAMMAR is
		once
			create Result.make(create {LIBERTY_ETC_FACTORY}.make)
		end

	roots: TRAVERSABLE[STRING]

	parser_file: TEXT_FILE_READ is
		once
			create Result.make
		end

	parser_buffer: MINI_PARSER_BUFFER is
		once
			create Result
		end

	parser: DESCENDING_PARSER is
		once
			create Result.make
		end

	errors: LIBERTY_ERRORS
	env: LIBERTY_ENVIRONMENT
	dir: BASIC_DIRECTORY
	files: FILE_TOOLS
	logging: LOGGING

invariant
	not roots.is_empty

end -- class LIBERTY_ETC
