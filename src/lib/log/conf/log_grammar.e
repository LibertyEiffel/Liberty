-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_GRAMMAR

insert
	EIFFEL_GRAMMAR
		redefine
			the_table
		end

create {LOG_INTERNAL_CONF}
	make

feature {}
	the_table: PARSE_TABLE is
		once
			Result := {PARSE_TABLE <<
											 -- Non terminals

											 "Configuration", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW log", "KW configuration",
																																 "Root", "Outputs", "Loggers",
																																 "KW end", "KW end of file" >> }, agent build_root >> };
											 "Root", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW root", "KW class name" >> }, Void >> };
											 "Outputs", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW output", "Output*" >> }, Void >> };
											 "Output*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Output*");
																						  {FAST_ARRAY[STRING] << "Output", "Output*" >> }, agent build_continue_list("Output", 0, "Output*");
																						  {FAST_ARRAY[STRING] << "Output", "KW ;", "Output*" >> }, agent build_continue_list("Output", 1, "Output*") >> };
											 "Output", {PARSE_NON_TERMINAL << --{FAST_ARRAY[STRING] << "KW entity name", "KW is", "KW url", "KW string" >> }, Void;
																						 {FAST_ARRAY[STRING] << "KW entity name", "KW is", "KW file", "KW string" >> }, Void >> };
											 "Loggers", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW logger", "Logger*" >> }, Void >> };
											 "Logger*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Logger*");
																						  {FAST_ARRAY[STRING] << "Logger", "Logger*" >> }, agent build_continue_list("Logger", 0, "Logger*");
																						  {FAST_ARRAY[STRING] << "Logger", "KW ;", "Logger*" >> }, agent build_continue_list("Logger", 1, "Logger*") >> };
											 "Logger", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class name", "KW is", "Parent", "Logger_Output",
																														"Level", "KW end" >> }, Void >> };
											 "Parent", {PARSE_NON_TERMINAL << epsilon, Void;
																						 {FAST_ARRAY[STRING] << "KW like", "KW class name", "KW with" >> }, Void >> };
											 "Level", {PARSE_NON_TERMINAL << epsilon, Void;
																						{FAST_ARRAY[STRING] << "KW level", "KW trace" >> }, Void;
																						{FAST_ARRAY[STRING] << "KW level", "KW info" >> }, Void;
																						{FAST_ARRAY[STRING] << "KW level", "KW warning" >> }, Void;
																						{FAST_ARRAY[STRING] << "KW level", "KW error" >> }, Void; >> };
											 "Logger_Output", {PARSE_NON_TERMINAL << epsilon, Void;
																								  {FAST_ARRAY[STRING] << "KW output", "KW entity name" >> }, Void >> };

											 -- Symbols

											 "KW ;",             create {PARSE_TERMINAL}.make(agent parse_symbol(?, ";", Void),  Void);
											 "KW ,",             create {PARSE_TERMINAL}.make(agent parse_symbol(?, ",", Void),  Void);

											 -- Identifiers

											 "KW class name",    create {PARSE_TERMINAL}.make(agent parse_class_name, Void);
											 "KW entity name",   create {PARSE_TERMINAL}.make(agent parse_entity_name, Void);
											 "KW string",        create {PARSE_TERMINAL}.make(agent parse_string, Void);

											 -- Keywords

											 "KW configuration", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "configuration"), Void);
											 "KW end",           create {PARSE_TERMINAL}.make(agent parse_keyword(?, "end"), Void);
											 "KW end of file",   create {PARSE_TERMINAL}.make(agent parse_end, Void);
											 "KW error",         create {PARSE_TERMINAL}.make(agent parse_keyword(?, "error"), Void);
											 "KW file",          create {PARSE_TERMINAL}.make(agent parse_keyword(?, "file"), Void);
											 "KW info",          create {PARSE_TERMINAL}.make(agent parse_keyword(?, "info"), Void);
											 "KW is",            create {PARSE_TERMINAL}.make(agent parse_keyword(?, "is"), Void);
											 "KW level",         create {PARSE_TERMINAL}.make(agent parse_keyword(?, "level"), Void);
											 "KW like",          create {PARSE_TERMINAL}.make(agent parse_keyword(?, "like"), Void);
											 "KW log",           create {PARSE_TERMINAL}.make(agent parse_keyword(?, "log"), Void);
											 "KW logger",        create {PARSE_TERMINAL}.make(agent parse_keyword(?, "logger"), Void);
											 "KW output",        create {PARSE_TERMINAL}.make(agent parse_keyword(?, "output"), Void);
											 "KW root",          create {PARSE_TERMINAL}.make(agent parse_keyword(?, "root"), Void);
											 "KW trace",         create {PARSE_TERMINAL}.make(agent parse_keyword(?, "trace"), Void);
											 "KW url",           create {PARSE_TERMINAL}.make(agent parse_keyword(?, "url"), Void); -- reserved but not yet used
											 "KW warning",       create {PARSE_TERMINAL}.make(agent parse_keyword(?, "warning"), Void);
											 "KW with",          create {PARSE_TERMINAL}.make(agent parse_keyword(?, "with"), Void);
											 >> }
		end

end -- class LOG_GRAMMAR
