deferred class XML_PARSER_TOOLS

insert
   UNICODE_CHARACTERS

feature {ANY}
   line: INTEGER is
      do
         Result := buffer.line
      end

   column: INTEGER is
      do
         Result := buffer.column
      end

feature {}
   buffer: UNICODE_PARSER_BUFFER is
      deferred
      end

   skip_blanks is
      require
         buffer.is_connected
      do
         from
         until
            buffer.end_of_input or else not is_separator(current_character)
         loop
            buffer.next
         end
      end

   end_of_input: BOOLEAN is
      require
         buffer.is_connected
      do
         Result := buffer.end_of_input
      end

   next is
      require
         buffer.is_connected
         not end_of_input
      do
         buffer.next
      end

   previous is
      require
         buffer.is_connected
         buffer.index > 0
      do
         buffer.previous
      end

   current_character: INTEGER is
      require
         buffer.is_connected
         not end_of_input
      do
         Result := buffer.code
      end

   skip (character: CHARACTER): BOOLEAN is
      require
         buffer.is_connected
      do
         if not end_of_input then
            skip_blanks
            if current_character = character.code then
               Result := True
               next
            end
         end
      end

   skip2 (char1, char2: CHARACTER): BOOLEAN is
      require
         buffer.is_connected
      do
         if skip(char1) then
            if skip(char2) then
               Result := True
            else
               previous
            end
         end
      end

   skip_word (word: STRING): BOOLEAN is
      require
         buffer.is_connected
         not word.is_empty
      local
         w: INTEGER; p: UNICODE_PARSER_POSITION
      do
         p := buffer.save_position
         skip_blanks
         from
            w := word.lower
            Result := True
         until
            not Result or else w > word.upper
         loop
            Result := skip(word.item(w))
            w := w + 1
         end
         if not Result then
            buffer.restore_position(p)
         end
      end

   is_identifier_start (unicode: INTEGER): BOOLEAN is
      require
         buffer.is_connected
      do
         Result := is_letter(unicode)
         if not Result then
            inspect
               unicode
            when 95, 58 then --  '_', ':'
               Result := True
            else
               check not Result end
            end
         end
      end

   is_identifier_part (unicode: INTEGER): BOOLEAN is
      require
         buffer.is_connected
      do
         Result := is_letter(unicode) or else is_digit(unicode) or else is_combining_char(unicode) or else is_extender(unicode)
         if not Result then
            inspect
               unicode
            when 95, 58, 45, 46 then -- '_', ':', '-', '.'
               Result := True
            else
               check not Result end
            end
         end
      end

   read_identifier: UNICODE_STRING is
      require
         buffer.is_connected
      local
         done: BOOLEAN
      do
         skip_blanks
         from
            if end_of_input then
               done := True
            else
               Result := once U""
               Result.clear_count
               if is_identifier_start(current_character) then
                  Result.extend(current_character)
                  next
               else
                  done := True
               end
            end
         until
            done
         loop
            if end_of_input then
               done := True
            else
               if is_identifier_part(current_character) then
                  Result.extend(current_character)
                  next
               else
                  done := True
               end
            end
         end
         if Result.is_empty then
            Result := Void
         end
      end

   read_string: UNICODE_STRING is
      require
         buffer.is_connected
         current_character = '%''.code or else current_character = '"'.code
      local
         done: BOOLEAN; limit: INTEGER; p: UNICODE_PARSER_POSITION
      do
         p := buffer.save_position
         from
            Result := once U""
            Result.clear_count
            limit := current_character
            next
         until
            done
         loop
            if end_of_input then
               Result := Void
               buffer.restore_position(p)
               done := True
            elseif current_character = limit then
               next
               done := True
            else
               Result.extend(current_character)
               next
            end
         end
      end

   read_identifier_as_string: STRING is
      require
         buffer.is_connected
      local
         s: UNICODE_STRING
      do
         s := read_identifier
         if s /= Void then
            Result := once ""
            Result.clear_count
            s.utf8_encode_in(Result)
         end
      end

   read_string_as_string: STRING is
      require
         buffer.is_connected
      local
         s: UNICODE_STRING
      do
         s := read_string
         if s /= Void then
            Result := once ""
            Result.clear_count
            s.utf8_encode_in(Result)
         end
      end

invariant
   readable_url: (buffer /= Void and then buffer.is_connected) implies buffer.url.read

end -- class XML_PARSER_TOOLS
