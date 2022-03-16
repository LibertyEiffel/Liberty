-- See the Copyright notice at the end of this file.
--
class HTML_PARSER
   --
   -- This HTML parser reads HTML from an INPUT_STREAM  and builds some HTML_ELEMENT objects known
   -- collectively as the `roots'. A correctly built HTML file should have only one root but this parser
   -- is more laxist.
   --

create {ANY}
   parse

feature {ANY}
   roots: FAST_ARRAY[HTML_ELEMENT]

feature {}
   parse (in: INPUT_STREAM)
      local
         elt: HTML_ELEMENT
      do
         create roots.make(0)
         from
            next_character(in)
         until
            in.end_of_input
         loop
            elt := a_element(in)
            if elt /= Void then
               roots.add_last(elt)
            end
         end
      end

   current_node: HTML_NODE

   a_element (in: INPUT_STREAM): HTML_ELEMENT
      local
         c: CHARACTER
      do
         if not in.end_of_input then
            c := a_character(in)
            if c = '<' then
               Result := a_node(in)
            else
               Result := a_text(in)
            end
         end
      end

   a_node (in: INPUT_STREAM): HTML_NODE
      local
         c: CHARACTER; stop, no_children, closing_element, comment: BOOLEAN; name: STRING; s: INTEGER
         child: HTML_ELEMENT; cnode: like current_node
      do
         cnode := current_node
         from
            next_character(in)
            name := once ""
            name.clear_count
            stop := in.end_of_input
            if not stop then
               inspect a_character(in)
               when'/' then
                  closing_element := True
                  next_character(in)
               when '!' then
                  comment := True
                  next_character(in)
               else
               end
            end
         until
            stop
         loop
            c := a_character(in)
            if c.is_letter_or_digit then
               name.extend(c.to_lower)
               next_character(in)
               if in.end_of_input then
                  stop := True
               end
            else
               stop := True
            end
         end
         if closing_element then
            from
            until
               in.end_of_input or else a_character(in) = '>'
            loop
               next_character(in)
            end
            if not in.end_of_input then
               next_character(in)
            end
            from
            until
               current_node = Void or else current_node.name.same_as(name)
            loop
               current_node := current_node.parent
            end
            if current_node /= Void then
               current_node := current_node.parent
            end
            check
               Result = Void
            end
         elseif comment then
            from
               s := 0
            until
               in.end_of_input or else s < 0
            loop
               inspect s
               when 0 then
                  if a_character(in) = '-' then
                     s := 1
                     next_character(in)
                  else
                     s := -1
                  end
               when 1 then
                  if a_character(in) = '-' then
                     s := 2
                     next_character(in)
                  else
                     s := -1
                  end
               when 2 then
                  if a_character(in) = '-' then
                     s := 3
                  end
                  next_character(in)
               when 3 then
                  if a_character(in) = '-' then
                     s := 4
                  else
                     s := 2
                  end
                  next_character(in)
               when 4 then
                  if a_character(in) = '-' then
                     s := 5
                  else
                     s := 2
                  end
                  next_character(in)
               when 5 then
                  if a_character(in) = '>' then
                     s := -1
                  else
                     s := 2
                     next_character(in)
                  end
               end
            end
         else
            create Result.make(name.twin, cnode)
            from
               skip_blanks(in)
            until
               in.end_of_input or else a_character(in) = '>' or else a_character(in) = '/'
            loop
               a_attribute(in, Result)
               skip_blanks(in)
            end
            if not in.end_of_input and then a_character(in) = '/' then
               no_children := True
               next_character(in)
            else
               inspect
                  name
               when "br", "frame", "hr", "input" then
                  no_children := True
               else
               end
            end
            if not in.end_of_input and then a_character(in) = '>' then
               next_character(in)
            end
            if not no_children then
               current_node := Result
               from
                  stop := in.end_of_input
               until
                  stop
               loop
                  child := a_element(in)
                  stop := child = Void or else current_node /= Result or else current_node = Void or else in.end_of_input
                  check
                     child /= Void implies Result.child(Result.children_count) = child
                  end
               end
               current_node := cnode
            end
         end
      end

   a_attribute (in: INPUT_STREAM; node: HTML_NODE)
      local
         c, stop_char: CHARACTER; nat, val: STRING; stop: BOOLEAN
      do
         from
            nat := once ""
            nat.clear_count
            stop := in.end_of_input
            check
               not stop
            end
         until
            stop
         loop
            if in.end_of_input then
               stop := True
            else
               c := a_character(in)
               if c.is_letter then
                  nat.extend(c)
                  next_character(in)
               else
                  stop := True
               end
            end
         end
         skip_blanks(in)
         if not in.end_of_input and then c = '=' then
            val := once ""
            val.clear_count
            next_character(in)
            skip_blanks(in)
            stop := in.end_of_input
            if not stop then
               c := a_character(in)
               if c = '%'' or else c = '%"' then
                  from
                     stop_char := c
                     next_character(in)
                  until
                     stop
                  loop
                     if in.end_of_input then
                        stop := True
                     else
                        c := a_character(in)
                        if c = stop_char then
                           stop := True
                        else
                           val.extend(c)
                        end
                        next_character(in)
                     end
                  end
               else
                  from
                     val.extend(c)
                     next_character(in)
                  until
                     stop
                  loop
                     if in.end_of_input then
                        stop := True
                     else
                        c := a_character(in)
                        if not c.is_separator and then c /= '/' and then c /= '>' then
                           val.extend(c)
                           next_character(in)
                        else
                           stop := True
                        end
                     end
                  end
               end
            end
         end
         if val = Void then
            node.add_attribute(nat.twin, Void)
         else
            node.add_attribute(nat.twin, val.twin)
         end
      end

   skip_blanks (in: INPUT_STREAM)
      local
         stop: BOOLEAN
      do
         from
            stop := in.end_of_input
            check
               not stop
            end
         until
            stop
         loop
            if a_character(in).is_separator then
               next_character(in)
            else
               stop := True
            end
         end
      end

   a_text (in: INPUT_STREAM): HTML_TEXT
      local
         c: CHARACTER; text: STRING; stop: BOOLEAN
      do
         from
            text := once ""
            text.clear_count
            text.extend(a_character(in))
            stop := in.end_of_input
            check
               not stop
            end
         until
            stop
         loop
            next_character(in)
            if in.end_of_input then
               stop := True
            else
               c := a_character(in)
               if c = '<' then
                  stop := True
               else
                  text.extend(c)
               end
            end
         end
         if not text.is_empty then
            create Result.make(text.twin, current_node)
         end
      end

   a_character (in: INPUT_STREAM): CHARACTER
      do
         Result := in.last_character
      end

   next_character (in: INPUT_STREAM)
      do
         in.read_character
      end

end -- class HTML_PARSER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
