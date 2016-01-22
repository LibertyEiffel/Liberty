-- See the Copyright notice at the end of this file.
--
class HTML_NODE

inherit
   HTML_ELEMENT

insert
   HTML_HANDLER

create {HTML_PARSER}
   make

feature {ANY}
   name: STRING

   attributes_count: INTEGER
      do
         Result := attributes.count
      end

   children_count: INTEGER
      do
         Result := children.count
      end

   html_attribute (i: INTEGER): HTML_ATTRIBUTE
      require
         i.in_range(1, attributes_count)
      do
         Result := attributes.item(i - 1)
      end

   child (i: INTEGER): HTML_ELEMENT
      require
         i.in_range(1, children_count)
      do
         Result := children.item(i - 1)
      end

feature {HTML_ELEMENT}
   really_append_in (buffer: STRING; stop_at_dot, stopped: BOOLEAN): BOOLEAN
      local
         i: INTEGER
      do
         Result := stopped
         if not Result then
            buffer.extend('<')
            buffer.append(name)
            from
               i := attributes.lower
            until
               i > attributes.upper
            loop
               buffer.extend(' ')
               attributes.item(i).append_in(buffer)
               i := i + 1
            end
            if children.count = 0 then
               buffer.append(once "/>")
            else
               buffer.extend('>')
               from
                  i := children.lower
               until
                  Result or else i > children.upper
               loop
                  Result := children.item(i).really_append_in(buffer, stop_at_dot, Result)
                  i := i + 1
               end
               buffer.append(once "</")
               buffer.append(name)
               buffer.extend('>')
            end
         end
      end

   really_to_html_stream (html: HTML_OUTPUT_STREAM; stop_at_dot, stopped: BOOLEAN): BOOLEAN
      local
         i: INTEGER
      do
         Result := stopped
         if not Result then
            from
               i := attributes.lower
            until
               i > attributes.upper
            loop
               attributes.item(i).to_html_stream(html)
               i := i + 1
            end
            if children.count = 0 then
               html.open_close_tag(name)
            else
               html.open_tag(name)
               from
                  i := children.lower
               until
                  Result or else i > children.upper
               loop
                  Result := children.item(i).really_to_html_stream(html, stop_at_dot, Result)
                  i := i + 1
               end
               check
                  html.last_tag = name
               end
               html.close_tag(name)
            end
         end
      end

feature {HTML_ELEMENT}
   add_child (a_child: HTML_ELEMENT)
      do
         children.add_last(a_child)
      end

feature {HTML_PARSER}
   add_attribute (attr_name, attr_value: STRING)
      local
         attr: HTML_ATTRIBUTE
      do
         create attr.make(attr_name, attr_value)
         attributes.add_last(attr)
      end

feature {}
   make (a_name: like name; a_parent: like parent)
      do
         name := a_name
         parent := a_parent
         create attributes.make(0)
         create children.make(0)
         if parent /= Void then
            parent.add_child(Current)
         end
      end

   attributes: FAST_ARRAY[HTML_ATTRIBUTE]

   children: FAST_ARRAY[HTML_ELEMENT]

end -- class HTML_NODE
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
