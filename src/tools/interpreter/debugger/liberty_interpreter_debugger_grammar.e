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
class LIBERTY_INTERPRETER_DEBUGGER_GRAMMAR

inherit
   EIFFEL_GRAMMAR
      redefine
         the_table
      end

create {LIBERTY_INTERPRETER_DEBUGGER}
   make

feature {}
   the_table: PARSE_TABLE is
      once
         Result := {PARSE_TABLE << "Entry", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW show", "Show", "KW end of line" >> }, agent build_root;
                                                                   {FAST_ARRAY[STRING] << "KW up", "Up" >> }, agent build_root;
                                                                   {FAST_ARRAY[STRING] << "KW down", "Down" >> }, agent build_root;
                                                                   {FAST_ARRAY[STRING] << "KW continue", "KW end of line" >> }, agent build_root;
                                                                   {FAST_ARRAY[STRING] << "KW step", "Step", "KW end of line" >> }, agent build_root;
                                                                   {FAST_ARRAY[STRING] << "KW quit", "KW end of line" >> }, agent build_root >> };
                                   "Show", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW stack" >> }, Void;
                                                                  {FAST_ARRAY[STRING] << "KW frame" >> }, Void >> };
                                   "Step", {PARSE_NON_TERMINAL << epsilon, Void;
                                                                  {FAST_ARRAY[STRING] << "KW in" >> }, Void;
                                                                  {FAST_ARRAY[STRING] << "KW out" >> }, Void;
                                                                  {FAST_ARRAY[STRING] << "KW number" >> }, Void >> };
                                   "Up", {PARSE_NON_TERMINAL << epsilon, Void;
                                                                {FAST_ARRAY[STRING] << "KW number" >> }, Void >> };
                                   "Down", {PARSE_NON_TERMINAL << epsilon, Void;
                                                                  {FAST_ARRAY[STRING] << "KW number" >> }, Void >> };

                                   "KW continue",    create {PARSE_TERMINAL}.make(agent parse_keyword(?, "continue"), Void);
                                   "KW down",        create {PARSE_TERMINAL}.make(agent parse_keyword(?, "down"),    Void);
                                   "KW frame",       create {PARSE_TERMINAL}.make(agent parse_keyword(?, "frame"),    Void);
                                   "KW in",          create {PARSE_TERMINAL}.make(agent parse_keyword(?, "in"),       Void);
                                   "KW out",         create {PARSE_TERMINAL}.make(agent parse_keyword(?, "out"),      Void);
                                   "KW quit",        create {PARSE_TERMINAL}.make(agent parse_keyword(?, "quit"),     Void);
                                   "KW show",        create {PARSE_TERMINAL}.make(agent parse_keyword(?, "show"),     Void);
                                   "KW stack",       create {PARSE_TERMINAL}.make(agent parse_keyword(?, "stack"),    Void);
                                   "KW step",        create {PARSE_TERMINAL}.make(agent parse_keyword(?, "step"),     Void);
                                   "KW up",          create {PARSE_TERMINAL}.make(agent parse_keyword(?, "up"),    Void);

                                   "KW number",      create {PARSE_TERMINAL}.make(agent parse_number, Void);

                                   "KW end of line", create {PARSE_TERMINAL}.make(agent parse_end, Void) >> };
      end

end -- class LIBERTY_INTERPRETER_DEBUGGER_GRAMMAR
