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
   the_table: PARSE_TABLE[DESCENDING_PARSE_CONTEXT]
      once
         Result := {PARSE_TABLE[DESCENDING_PARSE_CONTEXT] <<
                                                            -- Non terminals

                                                            "Configuration", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW log", "KW configuration",
                                                                                                                                "Root", "Outputs", "Loggers",
                                                                                                                                "KW end", "KW end of file" >> }, agent build_root(?, ?) >> };
                                                            "Root", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW root", "KW class name" >> }, Void >> };
                                                            "Outputs", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW output", "Output*" >> }, Void >> };
                                                            "Output*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Output*");
                                                                                                   {FAST_ARRAY[STRING] << "Output", "Output*" >> }, agent build_continue_list("Output", 0, "Output*");
                                                                                                   {FAST_ARRAY[STRING] << "Output", "KW ;", "Output*" >> }, agent build_continue_list("Output", 1, "Output*") >> };
                                                            "Output", {DESCENDING_NON_TERMINAL << --{FAST_ARRAY[STRING] << "KW entity name", "KW is", "KW url", "KW string" >> }, Void;
                                                                                                  {FAST_ARRAY[STRING] << "KW entity name", "KW is", "KW console", "File_Options" >> }, Void;
                                                                                                  {FAST_ARRAY[STRING] << "KW entity name", "KW is", "KW file", "KW string", "File_Options" >> }, Void >> };
                                                            "File_Options", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                        {FAST_ARRAY[STRING] << "File_Option+", "KW end" >> }, Void >> };
                                                            "File_Option+", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "File_Option" >> }, agent build_new_list("File_Option", "File_Option+");
                                                                                                        {FAST_ARRAY[STRING] << "File_Option", "File_Option+" >> }, agent build_continue_list("File_Option", 0, "File_Option+");
                                                                                                        {FAST_ARRAY[STRING] << "File_Option", "KW ,", "File_Option+" >> }, agent build_continue_list("File_Option", 1, "File_Option+");
                                                                                                        {FAST_ARRAY[STRING] << "File_Option", "KW ;", "File_Option+" >> }, agent build_continue_list("File_Option", 1, "File_Option+"); >> };
                                                            "File_Option", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW format", "KW string" >> }, Void;
                                                                                                       {FAST_ARRAY[STRING] << "KW rotated", "KW each", "Rotation", "Retention" >> }, Void;
                                                                                                       {FAST_ARRAY[STRING] << "KW zipped", "KW using", "KW string" >> }, Void >> };
                                                            "Rotation", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW day" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW week" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW month" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW year" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW hour" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW minute" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW days" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW weeks" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW months" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW years" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW hours" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW minutes" >> }, Void;

                                                                                                    {FAST_ARRAY[STRING] << "KW byte" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW kilobyte" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW megabyte" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW gigabyte" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW bytes" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW kilobytes" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW megabytes" >> }, Void;
                                                                                                    {FAST_ARRAY[STRING] << "KW number", "KW gigabytes" >> }, Void >> };
                                                            "Retention", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                     {FAST_ARRAY[STRING] << "KW keeping", "KW number" >> }, Void >> };
                                                            "Loggers", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW logger", "Logger*" >> }, Void >> };
                                                            "Logger*", {DESCENDING_NON_TERMINAL << epsilon, agent build_empty_list("Logger*");
                                                                                                   {FAST_ARRAY[STRING] << "Logger", "Logger*" >> }, agent build_continue_list("Logger", 0, "Logger*");
                                                                                                   {FAST_ARRAY[STRING] << "Logger", "KW ;", "Logger*" >> }, agent build_continue_list("Logger", 1, "Logger*") >> };
                                                            "Logger", {DESCENDING_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class name", "KW is", "Parent", "Logger_Output",
                                                                                                                         "Level", "KW end" >> }, Void >> };
                                                            "Parent", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                  {FAST_ARRAY[STRING] << "KW like", "KW class name", "KW with" >> }, Void >> };
                                                            "Level", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                 {FAST_ARRAY[STRING] << "KW level", "KW trace" >> }, Void;
                                                                                                 {FAST_ARRAY[STRING] << "KW level", "KW info" >> }, Void;
                                                                                                 {FAST_ARRAY[STRING] << "KW level", "KW warning" >> }, Void;
                                                                                                 {FAST_ARRAY[STRING] << "KW level", "KW error" >> }, Void; >> };
                                                            "Logger_Output", {DESCENDING_NON_TERMINAL << epsilon, Void;
                                                                                                         {FAST_ARRAY[STRING] << "KW output", "KW entity name" >> }, Void >> };

                                                            -- Symbols

                                                            "KW ;",             create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ";", Void),  Void);
                                                            "KW ,",             create {DESCENDING_TERMINAL}.make(agent parse_symbol(?, ",", Void),  Void);

                                                            -- Identifiers

                                                            "KW class name",    create {DESCENDING_TERMINAL}.make(agent parse_class_name(?), Void);
                                                            "KW entity name",   create {DESCENDING_TERMINAL}.make(agent parse_entity_name(?), Void);
                                                            "KW string",        create {DESCENDING_TERMINAL}.make(agent parse_string(?), Void);
                                                            "KW number",        create {DESCENDING_TERMINAL}.make(agent parse_number(?), Void);

                                                            -- Keywords

                                                            "KW configuration", create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "configuration"), Void);
                                                            "KW console",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "console"), Void);
                                                            "KW each",          create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "each"), Void);
                                                            "KW end",           create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "end"), Void);
                                                            "KW end of file",   create {DESCENDING_TERMINAL}.make(agent parse_end(?), Void);
                                                            "KW error",         create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "error"), Void);
                                                            "KW file",          create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "file"), Void);
                                                            "KW format",        create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "format"), Void);
                                                            "KW info",          create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "info"), Void);
                                                            "KW is",            create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "is"), Void);
                                                            "KW keeping",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "keeping"), Void);
                                                            "KW level",         create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "level"), Void);
                                                            "KW like",          create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "like"), Void);
                                                            "KW log",           create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "log"), Void);
                                                            "KW logger",        create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "logger"), Void);
                                                            "KW output",        create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "output"), Void);
                                                            "KW root",          create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "root"), Void);
                                                            "KW rotated",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "rotated"), Void);
                                                            "KW trace",         create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "trace"), Void);
                                                            "KW url",           create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "url"), Void); -- reserved but not yet used
                                                            "KW using",         create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "using"), Void);
                                                            "KW warning",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "warning"), Void);
                                                            "KW with",          create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "with"), Void);
                                                            "KW zipped",        create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "zipped"), Void);

                                                            -- Units

                                                            "KW day",        create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "day"), Void);
                                                            "KW week",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "week"), Void);
                                                            "KW month",      create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "month"), Void);
                                                            "KW year",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "year"), Void);
                                                            "KW hour",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "hour"), Void);
                                                            "KW minute",     create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "minute"), Void);
                                                            "KW byte",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "byte"), Void);
                                                            "KW kilobyte",   create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "kilobyte"), Void);
                                                            "KW megabyte",   create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "megabyte"), Void);
                                                            "KW gigabyte",   create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "gigabyte"), Void);

                                                            "KW days",       create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "days"), Void);
                                                            "KW weeks",      create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "weeks"), Void);
                                                            "KW months",     create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "months"), Void);
                                                            "KW years",      create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "years"), Void);
                                                            "KW hours",      create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "hours"), Void);
                                                            "KW minutes",    create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "minutes"), Void);
                                                            "KW bytes",      create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "bytes"), Void);
                                                            "KW kilobytes",  create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "kilobytes"), Void);
                                                            "KW megabytes",  create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "megabytes"), Void);
                                                            "KW gigabytes",  create {DESCENDING_TERMINAL}.make(agent parse_keyword(?, "gigabytes"), Void);

                                                            >> }
      end

end -- class LOG_GRAMMAR
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
