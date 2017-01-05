-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class XML_REPOSITORY_IMPL[O_ -> STORABLE]
   --
   -- Implementation of the XML store and retrieval
   --
   -- Schema:
   --
   --   <!DOCTYPE repository [
   --
   --   <!ELEMENT repository (layout | reference | embedded | basic)* >
   --   <!ATTLIST repository version CDATA #REQUIRED >
   --
   --   <!ELEMENT layout (reference | embedded | basic | array)* >
   --   <!ATTLIST layout type CDATA #REQUIRED >
   --   <!ATTLIST layout ref ID #REQUIRED >
   --
   --   <!ELEMENT reference (EMPTY) >
   --   <!ATTLIST reference name CDATA >
   --   <!ATTLIST reference ref IDREF #REQUIRED >
   --   <!ATTLIST reference transient (true|false) #REQUIRED >
   --
   --   <!ELEMENT embedded (reference | embedded | basic | array)* >
   --   <!ATTLIST embedded name CDATA >
   --   <!ATTLIST embedded type CDATA #REQUIRED >
   --
   --   <!ELEMENT basic (EMPTY) >
   --   <!ATTLIST basic name CDATA >
   --   <!ATTLIST basic type CDATA #REQUIRED >
   --   <!ATTLIST basic value CDATA #REQUIRED >
   --
   --   <!ELEMENT array (reference | embedded | basic)* >
   --   <!ATTLIST array name CDATA >
   --   <!ATTLIST array type CDATA #REQUIRED >
   --   <!ATTLIST array capacity CDATA #REQUIRED >
   --
   --   ] >
   --
inherit
   XML_CALLBACKS
   REPOSITORY_IMPL[O_]

insert
   UNICODE_CHARACTERS

feature {} -- Implementation of update
   update_name: STRING ""

   update_ref: STRING ""

   update_type: STRING ""

   update_value: STRING ""

   update_capacity: STRING ""

   update_version: STRING ""

   xml: XML_PARSER
      once
         create Result.make
      end

   do_update (in_stream: INPUT_STREAM)
      do
         xml.connect_to(in_stream.url)
         xml.parse(Current)
      end

   last_line: INTEGER
      do
         Result := xml.line
      end

   last_column: INTEGER
      do
         Result := xml.column
      end

feature {}
   open_nodes: FAST_ARRAY[STRING]
      once
         create Result.with_capacity(4)
      end

feature {XML_PARSER}
   with_attribute (attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; line, column: INTEGER)
      local
         error: STRING
      do
         inspect
            attribute_name.as_utf8
         when "name" then
            update_name.copy(attribute_value.as_utf8)
         when "type" then
            update_type.copy(attribute_value.as_utf8)
         when "ref" then
            update_ref.copy(attribute_value.as_utf8)
         when "value" then
            update_value.copy(attribute_value.as_utf8)
         when "capacity" then
            update_capacity.copy(attribute_value.as_utf8)
         when "version" then
            update_version.copy(attribute_value.as_utf8)
         else
            error := once ""
            error.copy(once "Unknown attribute: ")
            attribute_name.utf8_encode_in(error)
            fire_update_error(error, line, column)
         end
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER)
      local
         n, s, error: STRING; layout: REPOSITORY_LAYOUT
      do
         n := node_name.as_utf8
         s := strings.new_twin(n)
         open_nodes.add_last(s)
         layout := new_layout(n)
         update_layouts.push(layout)
         inspect
            n
         when "repository" then
            if not update_version.is_equal(version) then
               error := once ""
               error.copy(once "Incompatible versions: expected ")
               error.append(version)
               error.append(once " but got ")
               error.append(update_version)
               fire_update_error(error, line, column)
            end
            open_repository(layout, line, column)
         when "layout" then
            open_layout(update_type, update_ref.to_integer, layout, line, column)
         when "reference" then
            open_reference(update_name, update_ref.to_integer, layout, line, column)
         when "embedded" then
            open_embedded(update_name, update_type, layout, line, column)
         when "basic" then
            open_basic(update_name, update_type, update_value, layout, line, column)
         when "array" then
            open_array(update_name, update_type, update_capacity.to_integer, layout, line, column)
         else
            error := once ""
            error.copy(once "Unknown node: ")
            node_name.utf8_encode_in(error)
            fire_update_error(error, line, column)
         end
         clear_attributes
      end

   close_node (node_name: UNICODE_STRING; line, column: INTEGER)
      local
         error: STRING
      do
         strings.recycle(open_nodes.last)
         open_nodes.remove_last
         inspect
            node_name.as_utf8
         when "repository" then
            close_repository(line, column)
         when "layout" then
            close_layout(line, column)
         when "reference" then
            close_reference(line, column)
         when "embedded" then
            close_embedded(line, column)
         when "basic" then
            close_basic(line, column)
         when "array" then
            close_array(line, column)
         else
            error := once ""
            error.copy(once "Unknown node: ")
            node_name.utf8_encode_in(error)
            fire_update_error(error, line, column)
         end
      end

   open_close_node (node_name: UNICODE_STRING; line, column: INTEGER)
      do
         open_node(node_name, line, column)
         close_node(node_name, line, column)
      end

   current_node: UNICODE_STRING
      do
         Result := once U""
         Result.clear_count
         if not Result.utf8_decode_from(open_nodes.last) then
            Result := Void
         end
      end

   xml_header (line, column: INTEGER)
      do
         clear_attributes
      end

   processing_instruction (a_target, a_data: UNICODE_STRING)
      do
         fire_update_error(once "Unexpected processing instruction", last_line, last_column)
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING
      do
         fire_update_error(once "Unexpected entity", line, column)
      end

   open_entity_url (a_entity: UNICODE_STRING; a_url: URL)
         -- XML_REPOSITORY doesn't use entity urls
      do
         fire_update_error(once "Unexpected entityurl", last_line, last_column)
      end

   close_entity_url (a_entity: UNICODE_STRING; a_url: URL)
      do
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER)
      local
         i: INTEGER; break: BOOLEAN
      do
         from
            i := a_data.lower
         until
            i > a_data.upper or else break
         loop
            if not is_separator(a_data.item(i)) then
               fire_update_error(once "Separator expected", line, column)
            end
            i := i + 1
         end
      end

   parse_error (line, column: INTEGER; message: STRING)
      do
         at_error := True
         fire_update_error(message, line, column)
      end

   at_error: BOOLEAN

feature {} -- Internals
   frozen version: STRING "1"

   clear_attributes
      do
         update_name.clear_count
         update_ref.clear_count
         update_type.clear_count
         update_value.clear_count
         update_capacity.clear_count
         update_version.clear_count
      end

   strings: STRING_RECYCLING_POOL
      once
         create Result.make
      end

feature {} -- Default transient objects
   register_transient_objects
      do
         transient.register(to_internals, once "Repository")
      end

   unregister_transient_objects
      do
         transient.unregister(once "Repository")
      end

end -- class XML_REPOSITORY_IMPL
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
