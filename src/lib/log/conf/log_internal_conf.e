-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_INTERNAL_CONF
	--
	-- The internal logging configuration manager
	--

inherit
	EIFFEL_NON_TERMINAL_NODE_IMPL_VISITOR
	EIFFEL_TERMINAL_NODE_IMPL_VISITOR
	EIFFEL_LIST_NODE_IMPL_VISITOR

insert
	SINGLETON

create {LOG_CONFIGURATION}
	make

feature {}
	root: LOGGER
	loggers: HASHED_DICTIONARY[LOGGER, FIXED_STRING]
	outputs: HASHED_DICTIONARY[OUTPUT_STREAM, FIXED_STRING]

feature {EIFFEL_NON_TERMINAL_NODE_IMPL}
	visit_eiffel_non_terminal_node_impl (node: EIFFEL_NON_TERMINAL_NODE_IMPL) is
		do
			pass.call([node])
		end

feature {}
	do_pass_1 (when_error: PROCEDURE[TUPLE[STRING]]; node: EIFFEL_NON_TERMINAL_NODE_IMPL) is
			-- Create outputs and loggers
		local
			output_name: FIXED_STRING; output: OUTPUT_STREAM
			logger_name: FIXED_STRING; logger: LOGGER
		do
			inspect
				node.name
			when "Configuration" then
				node.node_at(3).accept(Current)
				node.node_at(4).accept(Current)
				node.node_at(2).accept(Current)
				root := loggers.reference_at(root_logger)
			when "Root" then
				node.node_at(1).accept(Current)
				root_logger := last_class_name.intern
			when "Outputs" then
				node.node_at(1).accept(Current)
			when "Output" then
				node.node_at(1).accept(Current)
				output_name := last_entity_name.intern
				output := outputs.fast_reference_at(output_name)
				if output = Void then
					node.node_at(4).accept(Current)
					create {TEXT_FILE_WRITE} output.connect_to(last_string)
					if output.is_connected then
						outputs.put(output, output_name)
					end
				end
			when "Loggers" then
				node.node_at(1).accept(Current)
			when "Logger" then
				node.node_at(0).accept(Current)
				logger_name := last_class_name.intern
				node.node_at(4).accept(Current)
				last_entity_name := Void
				node.node_at(5).accept(Current)
				if last_entity_name = Void then
					output := null_output
				else
					output_name := last_entity_name.intern
					output := outputs.reference_at(output_name)
				end
				create logger.make(output, logger_name)
				loggers.put(logger, logger_name)
			when "Logger_Output" then
				node.node_at(1).accept(Current)
			when "Level" then
				node.node_at(0).accept(Current)
			end
		end

	do_pass_2 (when_error: PROCEDURE[TUPLE[STRING]]; node: EIFFEL_NON_TERMINAL_NODE_IMPL) is
			-- Attach loggers' parents
		local
			root_name, logger_name: FIXED_STRING; logger, parent: LOGGER
		do
			inspect
				node.name
			when "Configuration" then
				node.node_at(2).accept(Current)
				root_name := last_class_name.intern
				root := loggers.fast_reference_at(root_name)
				node.node_at(4).accept(Current)
			when "Root" then
				node.node_at(1).accept(Current)
				root_logger := last_class_name.intern
			when "Loggers" then
				node.node_at(1).accept(Current)
			when "Logger" then
				node.node_at(2).accept(Current)
			when "Parent" then
				node.node_at(0).accept(Current)
				logger_name := last_class_name.intern
				logger := loggers.fast_reference_at(logger_name)
				if logger /= root then
					last_class_name := Void
					node.node_at(1).accept(Current)
					if last_class_name /= Void then
						parent := loggers.fast_reference_at(last_class_name.intern)
						if parent /= Void then
							logger.set_parent(parent)
						else
							logger.set_parent(root)
						end
					else
						logger.set_parent(root)
					end
				end
			end
		end

feature {EIFFEL_TERMINAL_NODE_IMPL}
	visit_eiffel_terminal_node_impl (node: EIFFEL_TERMINAL_NODE_IMPL) is
		local
			string: TYPED_EIFFEL_IMAGE[STRING]
		do
			inspect
				node.name
			when "KW class name" then
				last_class_name := node.image.image
			when "KW entity name" then
				last_entity_name := node.image.image
			when "KW string" then
				string ::= node.image
				last_string := image.decoded
			when "KW error" then
				last_level := levels.error
			when "KW warn" then
				last_level := levels.warn
			when "KW info" then
				last_level := levels.info
			when "KW trace" then
				last_level := levels.trace
			else
				-- nothing (syntax sugar)
			end
		end

feature {EIFFEL_LIST_NODE_IMPL}
	visit_eiffel_list_node_impl (node: EIFFEL_LIST_NODE_IMPL) is
		local
			i: INTEGER
		do
			from
				i := node.lower
			until
				i > node.upper
			loop
				node.item(i).accept(Current)
				i := i + 1
			end
		end

feature {LOG_CONFIGURATION}
	load (a_stream: INPUT_STREAM; when_error: PROCEDURE[TUPLE[STRING]]) is
		local
			conf: STRING; evaled: BOOLEAN
			on_error: like when_error
		do
			if when_error = Void then
				on_error := agent fatal_error
			else
				on_error := when_error
			end

			if loggers = Void then
				create loggers.make
				check
					outputs = Void
				end
				create outputs.make
			else
				loggers.clear_count
				outputs.clear_count
			end

			conf := once ""
			conf.clear_count
			from
				a_stream.read_line
			until
				a_stream.end_of_input
			loop
				conf.append(a_stream.last_string)
				conf.extend('%N')
				a_stream.read_line
			end
			conf.append(a_stream.last_string)
			parser_buffer.initialize_with(conf)

			grammar.reset
			if parser.eval(parser_buffer, grammar.table, once "Configuration") then
				if parser.error /= Void then
					on_error.call([parser.error.message])
				else
					pass := agent do_pass_1(on_error, ?)
					grammar.root_node.accept(Current)
					pass := agent do_pass_2(on_error, ?)
					grammar.root_node.accept(Current)
				end
			else
				if when_error /= Void then
					when_error.call(["Unknown error while loading log configuration"])
				else
					std_error.put_line("Unknown error while loading log configuration")
					die_with_code(1)
				end
			end
		end

	logger (a_tag: FIXED_STRING) is
		require
			a_tag.intern = a_tag
		local
			i: INTEGER; parent: LOGGER; parent_tag: FIXED_STRING
		do
			Result := loggers.fast_reference_at(a_tag)
			if Result = Void then
				i := a_tag.first_index_of('[')
				if a_tag.valid_index(i) then
					parent_tag := a_tag.substring(a_tag.lower, i - 1).intern
					parent := loggers.fast_reference_at(parent_tag)
					if parent = Void then
						create parent.make(parent_tag)
						parent.set_parent(root)
						loggers.put(parent, parent_tag)
					end
				else
					parent := root
				end
				check
					parent /= Void
				end
				create Result.make(a_tag)
				Result.set_parent(parent)
				loggers.put(Result, a_tag)
			end
		ensure
			Result /= Void
		end

	fatal_error (message: STRING) is
		do
			std_error.put_line(message)
			die_with_code(1)
		end

feature {LOGGER}
	add_logger (a_logger: LOGGER) is
		require
			a_logger /= Void
			not has_logger(a_logger)
		do
			known_loggers.add_last(a_logger)
		end

	has_logger (a_logger: LOGGER): BOOLEAN is
		require
			a_logger /= Void
		do
			Result := known_loggers.fast_has(a_logger)
		end

feature {}
	make is
		local
			ft: FILE_TOOLS
			in: TEXT_FILE_READ
		do
			if ft.file_exists("log.rc") then
				create in.connect_to("log.rc")
				if in.is_connected then
					load(in)
					in.disconnect
				end
			end
		end

	known_loggers: COLLECTION[LOGGER]
	last_class_name: STRING
	last_entity_name: STRING
	last_string: STRING
	last_level: LOG_LEVEL
	pass: PROCEDURE[TUPLE[EIFFEL_NON_TERMINAL_NODE_IMPL]]

	levels: LOG_LEVELS

	grammar: LOG_GRAMMAR is
		once
			create Result.make(create {LOG_NODE_FACTORY}.make)
		end

	parser_buffer: MINI_PARSER_BUFFER is
		once
			create Result
		end

	parser: DESCENDING_PARSER is
		once
			create Result.make
		end

	null_output: NULL_OUTPUT_STREAM is
		once
			create Result
		end

end -- class LOG_INTERNAL_CONF
