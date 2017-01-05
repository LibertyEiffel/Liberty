-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INI_PARSER
   --
   -- .INI-like files parser
   --
   -- inifile -> key* [section]*
   --
   -- key -> identifier ':' value '%N'
   --
   -- section -> '[' identifier ']' '%N' key*
   --
   -- Eiffel-like comments are allowed at ends of lines and on empty lines
   --

inherit
   PARSER
      redefine skip1
      end

create {GLOBALS}
   serc, plugin

feature {ANY}
   file_path: STRING

feature {SERC, PLUGIN, INI_HANDLER} -- Parsing:
   a_inifile
      require
         parser_buffer.is_ready
      do
         if default_section /= Void then
            default_section.clear_count
         end
         if sections /= Void then
            sections.clear_count
         end

         drop_comments := True
         last_section := Void
         last_key := Void
         line := 1
         column := 1
         current_line := parser_buffer.item(line)
         file_path := parser_buffer.path
         if current_line.count = 0 then
            cc := '%N'
         else
            cc := current_line.first
         end
         skip_comments
         if cc /= '[' then
            a_keys
         end
         a_sections
         goto_next_line
         if cc /= end_of_text then
            error_handler.add_position(pos(line, column))
            fatal_error_except_for_install("Unexpected text continuation")
         elseif default_section = Void and then sections = Void then
            error_handler.add_position(pos(line, column))
            fatal_error_except_for_install("Invalid empty file")
         end
         parser_buffer.release
      ensure
         not parser_buffer.is_ready
      end

feature {SYSTEM_TOOLS}
   is_invalid: BOOLEAN

feature {ANY} -- Values in the default section:
   has (key: STRING): BOOLEAN
      do
         Result := default_section /= Void and then default_section.has(key)
      end

   item (key: STRING): STRING
      require
         has(key)
      do
         Result := default_section.at(key)
      end

   key_iterator: ITERATOR[STRING]
      do
         if default_section /= Void then
            Result := default_section.new_iterator_on_keys
         end
      end

feature {ANY} -- Values in sections:
   section_has (section, key: STRING): BOOLEAN
      local
         sec: like default_section
      do
         if sections /= Void then
            sec := sections.reference_at(section)
            Result := sec /= Void and then sec.has(key)
         end
      end

   section_item (section, key: STRING): STRING
      require
         section_has(section, key)
      do
         Result := sections.at(section).at(key)
      end

   sections_iterator: ITERATOR[STRING]
      do
         if sections /= Void then
            Result := sections.new_iterator_on_keys
         end
      end

   section_key_iterator (section: STRING): ITERATOR[STRING]
      local
         sec: DICTIONARY[STRING, STRING]
      do
         if sections /= Void then
            sec := sections.reference_at(section)
            if sec /= Void then
               Result := sec.new_iterator_on_keys
            end
         end
      end

feature {ANY}
   set_expand_var (expand: BOOLEAN)
         -- Should ${xxx} be expanded to an environment variable?
      do
         expand_var := expand
      ensure
         expand_var = expand
      end

   set_expand_execute (expand: BOOLEAN)
         -- Should $(xxx) be expanded to a program execution?
      do
         expand_execute := expand
      ensure
         expand_execute = expand
      end

feature {}
   serc
      local
         p: POSITION
      do
         id := p.id_ini_file
      end

   plugin
      local
         p: POSITION
      do
         id := p.id_plugin_file
         set_expand_var(True)
         set_expand_execute(True)
      end

   id: INTEGER_16

feature {} -- Parser:
   update_last_manifest_string (p: POSITION; once_flag, unicode_flag: BOOLEAN; string, source_view: STRING)
      do
         create last_manifest_string.make(p, once_flag, unicode_flag, string)
         last_manifest_string.set_source_view(source_view)
      end

   expand_var: BOOLEAN

   expand_execute: BOOLEAN

   may_expand_var
      do
         may_expand_var_into (buffer)
      end

   may_expand_var_into (buf: STRING)
      local
         value, cmd: STRING; c, l: INTEGER; stop: BOOLEAN; ch: CHARACTER
         process_factory: PROCESS_FACTORY; process: PROCESS; stream: INPUT_STREAM
      do
         if expand_var or else expand_execute then
            l := line
            c := column
            next_char
            cmd := strings.new
            if expand_var and then cc = '{' then
               from
                  next_char
               until
                  stop
               loop
                  inspect
                     cc
                  when '}' then
                     value := echo.getenv(cmd, file_path)
                     if value /= Void then
                        buf.append(value)
                        -- Recycling `value' may not be a good idea, we can't tell from getenv's
                        -- specification. So we don't recycle it.
                     end
                     stop := True
                  when end_of_text then
                     error_handler.add_position(pos(l, c))
                     error_handler.append(once "Bad Environment variable.%N%
                                          %(Closing %"}%" not found.)")
                     error_handler.print_as_fatal_error
                  else
                     cmd.extend(cc)
                     next_char
                  end
               end
            elseif expand_execute and then cc = '(' then
               from
                  next_char
               until
                  stop
               loop
                  inspect
                     cc
                  when ')' then
                     if cmd.is_empty then
                        error_handler.add_position(pos(l, c))
                        error_handler.append(once "Bad program.%N%
                                             %(No program name found.)")
                        error_handler.print_as_fatal_error
                     else
                        process := process_factory.create_process
                        process.set_direct_input(True)
                        process.set_direct_error(True)
                        process.execute_command_line(cmd, True)
                        if process.is_connected then
                           stream := process.output
                           from
                              stream.read_character
                           until
                              stream.end_of_input
                           loop
                              ch := stream.last_character
                              inspect ch
                              when '%N', '%R' then
                                 buf.extend(' ')
                              else
                                 buf.extend(ch)
                              end
                              stream.read_character
                           end
                           process.wait
                        else
                           error_handler.add_position(pos(l, c))
                           error_handler.append(once "Could not execute '")
                           error_handler.append(cmd)
                           error_handler.append(once "'. Maybe the program name is incorrect, or process execution %
                                                %is not yet supported on this platform.")
                           error_handler.print_as_fatal_error
                        end
                     end
                     stop := True
                  when '$' then
                     may_expand_var_into(cmd)
                     next_char
                  when end_of_text then
                     error_handler.add_position(pos(l, c))
                     error_handler.append(once "Bad program.%N%
                                          %(Closing %")%" not found.)")
                     error_handler.print_as_fatal_error
                  else
                     cmd.extend(cc)
                     next_char
                  end
               end
            else
               buf.extend('$')
               go_back_at(l, c)
            end
            strings.recycle(cmd)
         else
            buf.extend('$')
         end
      end

   last_section: STRING

   last_key: STRING

   a_sections
      local
         stop: BOOLEAN
      do
         from
            goto_next_line
         until
            stop
         loop
            stop := not a_section
         end
      end

   a_section: BOOLEAN
      do
         if skip_spaces and then skip1('[') and then skip_spaces then
            Result := a_identifier and then skip_spaces and then skip1(']') and then skip_spaces
            if Result then
               goto_next_line
               last_section := token_buffer.case_sensitive_aliased_string
               if sections = Void then
                  create sections.make
               end
               if not sections.has(last_section) then
                  sections.add(create {ORDERED_DICTIONARY[STRING, STRING]}.make, last_section)
               end
               a_keys
            end
         end
      end

   a_keys
      local
         stop: BOOLEAN
      do
         from
            goto_next_line
         until
            stop
         loop
            stop := not a_key
         end
      end

   a_key: BOOLEAN
      local
         dummy: BOOLEAN
      do
         if a_identifier and then skip_spaces then
            if not skip1(':') then
               error_handler.add_position(pos(line, column))
               error_handler.append(once "Inserted ':'")
               error_handler.print_as_warning
            end
            dummy := skip_spaces
            last_key := token_buffer.hashed_string.to_string.twin
            if last_value /= Void then
               echo.w_put_string(once "The key '")
               echo.w_put_string(last_key)
               echo.w_put_string(once "' is defined more than once")
               if last_section /= Void then
                  echo.w_put_string(once " in the section [")
                  echo.w_put_string(last_section)
                  echo.w_put_character(']')
               end
               echo.w_put_string(once ".%NIts retained value will be the last read.%N")
            end
            if cc = '%N' or else cc = end_of_text then
               Result := True
               set_value(once "")
            elseif cc = '"' and then a_manifest_string(True) then
               Result := True
               set_value(last_manifest_string.to_string)
            elseif a_string then
               Result := True
               set_value(token_buffer.hashed_string.to_string.twin)
            end
            if Result then
               goto_next_line
            end
         end
      end

   goto_next_line
      do
         from
         until
            not skip1('%N')
         loop
            skip_comments
         end
      end

   set_value (value: STRING)
      do
         if last_section = Void then
            if default_section = Void then
               create default_section.make
            end
            default_section.put(value, last_key)
         else
            sections.at(last_section).put(value, last_key)
         end
      end

   last_value: STRING
      do
         if last_section = Void then
            if default_section /= Void then
               Result := default_section.reference_at(last_key)
            end
         elseif sections.has(last_section) then
            Result := sections.at(last_section).reference_at(last_key)
         end
      end

feature {}
   a_identifier: BOOLEAN
         -- Case-sensitive identifiers, used for section names and key
         -- names. The dot is not eiffel-like, but useful in many cases.
      local
         stop: BOOLEAN
      do
         if cc.is_letter then
            from
               token_buffer.reset(line, column)
               token_buffer.extend(cc)
            until
               stop
            loop
               next_char
               inspect
                  cc
               when 'a' .. 'z' then
                  token_buffer.extend(cc)
               when 'A' .. 'Z' then
                  token_buffer.extend(cc)
               when '0' .. '9', '_', '.' then
                  token_buffer.extend(cc)
               else
                  stop := True
               end
            end
            Result := True
         end
      end

   a_string: BOOLEAN
         -- Some string
      local
         state, l, c: INTEGER
      do
         from
            token_buffer.reset(line, column)
            state := 0
         until
            cc = '%N' or else cc = end_of_text
         loop
            Result := True
            inspect
               state
            when 0 then
               -- reading "normal" characters
               inspect
                  cc
               when ' ', '%T' then
                  buffer.clear_count
                  buffer.extend(cc)
                  state := 1
               when '-' then
                  l := line
                  c := column
                  buffer.clear_count
                  state := 2
               else
                  token_buffer.extend(cc)
               end
            when 1 then
               -- reading spaces. They will be appended if some normal
               -- characters are still to be found after
               inspect
                  cc
               when ' ', '%T' then
                  buffer.extend(cc)
               when '-' then
                  l := line
                  c := column
                  state := 2
               else
                  token_buffer.append(buffer)
                  token_buffer.extend(cc)
                  state := 0
               end
            when 2 then
               -- just read a '-'. If a second is read, then it is a comment;
               -- the string is finished
               inspect
                  cc
               when '-' then
                  state := 3
               when ' ', '%T' then
                  token_buffer.append(buffer)
                  token_buffer.extend('-')
                  buffer.clear_count
                  buffer.extend(cc)
                  state := 1
               else
                  token_buffer.append(buffer)
                  token_buffer.extend('-')
                  token_buffer.extend(cc)
                  state := 0
               end
            when 3 then
               -- reading a comment
            end
            next_char
         end
      end

   skip_spaces: BOOLEAN
         -- returns always True
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            inspect
               cc
            when ' ', '%T' then
               next_char
            else
               stop := True
            end
         end
         Result := True
      ensure
         Result
      end

   skip1 (char: CHARACTER): BOOLEAN
         -- Redefined to not skip comments
      do
         if char = cc then
            start_line := line
            start_column := column
            Result := True
            next_char
         end
      end

   skip2 (c1, c2: CHARACTER): BOOLEAN
      do
         if c1 = cc then
            start_line := line
            start_column := column
            next_char
            if c2 = cc then
               Result := True
               next_char
               skip_comments
            else
               cc := c1
               column := start_column
            end
         end
      end

   fatal_error_except_for_install (msg: STRING)
      do
         if is_install then
            is_invalid := True
         else
            error_handler.add_position(current_position)
            error_handler.append(msg)
            error_handler.print_as_fatal_error
         end
      end

   pos (l, c: INTEGER): POSITION
      do
         Result.set_in_ini_file(l, c, id)
      end

feature {} -- Sections:
   default_section: ORDERED_DICTIONARY[STRING, STRING]

   sections: ORDERED_DICTIONARY[ORDERED_DICTIONARY[STRING, STRING], STRING]

invariant
   is_invalid implies is_install

end -- class INI_PARSER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
