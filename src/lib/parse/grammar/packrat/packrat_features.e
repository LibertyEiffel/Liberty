-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_FEATURES

insert
   PACKRAT
   PACKRAT_INTERNAL

feature {}
   reset_features
      do
         create position
      end

feature {}
   parse_any (buffer: MINI_PARSER_BUFFER): PACKRAT_IMAGE
      do
         if not buffer.end_reached then
            Result := new_image(buffer.current_character)
            next_character(buffer)
            buffer.clear_mark
         end
      end

   parse_regex (buffer: MINI_PARSER_BUFFER; regex: REGULAR_EXPRESSION): PACKRAT_IMAGE
         -- the regex must parse exactly one character
      local
         string: STRING
      do
         if not buffer.end_reached then
            string := once ""
            string.clear_count
            string.extend(buffer.current_character)
            if regex.match(string) then
               Result := new_image(buffer.current_character)
               next_character(buffer)
            end
         end
      end

   parse_string (buffer: MINI_PARSER_BUFFER; string: STRING): PACKRAT_IMAGE
      local
         old_position: like position; i: INTEGER; valid: BOOLEAN
      do
         old_position := position
         from
            valid := not buffer.end_reached
            i := string.lower
         until
            not valid or else i > string.upper
         loop
            if buffer.end_reached or else buffer.current_character /= string.item(i) then
               valid := False
            else
               next_character(buffer)
               i := i + 1
            end
         end
         if valid then
            create Result.make(string, old_position)
         else
            restore(buffer, old_position)
         end
         buffer.clear_mark
      end

feature {} -- low-level image memory
   flyweight: AVL_DICTIONARY[STRING, CHARACTER]
      once
         Result := {AVL_DICTIONARY[STRING, CHARACTER] <<
                                                        "a", 'a';
                                                        "b", 'b';
                                                        "c", 'c';
                                                        "d", 'd';
                                                        "e", 'e';
                                                        "f", 'f';
                                                        "g", 'g';
                                                        "h", 'h';
                                                        "i", 'i';
                                                        "j", 'j';
                                                        "k", 'k';
                                                        "l", 'l';
                                                        "m", 'm';
                                                        "n", 'n';
                                                        "o", 'o';
                                                        "p", 'p';
                                                        "q", 'q';
                                                        "r", 'r';
                                                        "s", 's';
                                                        "t", 't';
                                                        "u", 'u';
                                                        "v", 'v';
                                                        "w", 'w';
                                                        "x", 'x';
                                                        "y", 'y';
                                                        "z", 'z';

                                                        "(", '(';
                                                        ")", ')';
                                                        "[", '[';
                                                        "]", ']';
                                                        "*", '*';
                                                        "+", '+';
                                                        "?", '?';
                                                        "!", '!';
                                                        "&", '&';
                                                        "/", '/';
                                                        "%'", '%'';
                                                        " ", ' ';
                                                        "%N", '%N';
                                                        "%T", '%T';
                                                        >> }
      end

feature {} -- buffer moves
   next_character (buffer: MINI_PARSER_BUFFER)
      do
         position := position.next(buffer)
      end

   restore (buffer: MINI_PARSER_BUFFER; a_position: like position)
      do
         position := a_position
         buffer.set_current_index(position.index)
      end

   position: PACKRAT_POSITION

   new_image (char: CHARACTER): PACKRAT_IMAGE
      local
         image: STRING
      do
         image := flyweight.reference_at(char)
         if image = Void then
            image := "."
            image.put(char, image.lower)
            flyweight.put(image, char)
         end
         create Result.make(image, position)
      end

end -- class PACKRAT_FEATURES
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
