-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class JSON_REPOSITORY_IMPL[O_ -> STORABLE]

inherit
   REPOSITORY_IMPL[O_]
      redefine
         make
      end
   JSON_VISITOR

insert
   JSON_STRINGS

feature {} -- Implementation of update
   last_line: INTEGER
   last_column: INTEGER

   do_update (in_stream: INPUT_STREAM) is
      local
         text: JSON_TEXT
      do
         text := parser.parse_json_text(in_stream)
         if text /= Void then
            last_line := text.line
            last_column := text.column

            text.accept(Current)
         end
      end

   parser: JSON_PARSER

   last_name: STRING
   last_string: STRING
   last_number: INTEGER

feature {JSON_ARRAY}
   visit_array (json: JSON_ARRAY) is
      do
      end

feature {JSON_FALSE}
   visit_false (json: JSON_FALSE) is
      do
         check False end
      end

feature {JSON_NULL}
   visit_null (json: JSON_NULL) is
      do
         check False end
      end

feature {JSON_NUMBER}
   visit_number (json: JSON_NUMBER) is
      do
      end

feature {JSON_OBJECT}
   visit_object (json: JSON_OBJECT) is
      local
         error: STRING; layout: REPOSITORY_LAYOUT
         jobj: JSON_OBJECT; jarr: JSON_ARRAY; jstr: JSON_STRING; jnum: JSON_NUMBER
         type, vers: STRING
         ref: INTEGER
      do
         if json.members.has(json_type) and json.members.at(json_type).is_equal(json_repository) then
            jstr ::= json.members.at(json_version)
            vers := jstr.string.as_utf8
            if not vers.is_equal(version) then
               error := once ""
               error.copy(once "Incompatible versions: expected ")
               error.append(version)
               error.append(once " but got ")
               error.append(vers)
               fire_update_error(error, json.line, json.column)
            end
            layout := new_layout(once "repository")
            update_layouts.push(layout)
            open_repository(layout, json.line, json.column)
            jobj ::= json.members.at(json_data)
            jobj.members.do_all(agent (value: JSON_VALUE; string: JSON_STRING) is
                                do
                                   last_name := string.string.to_utf8
                                   value.accept(Current)
                                end)
            close_repository(json.line, json.column)
         elseif json.members.has(json_layout) then
            layout := new_layout(once "layout")
            update_layouts.push(layout)
            jstr ::= json.members.at(json_type)
            type := once ""
            type.copy(jstr.string.as_utf8)
            jnum ::= json.members.at(json_ref)
            ref := jnum.int.to_integer_32
            open_layout(type, ref, layout, json.line, json.column)
            jobj ::= json.members.at(json_data)
            jobj.members.do_all(agent (value: JSON_VALUE; string: JSON_STRING) is
                                do
                                   last_name := string.string.to_utf8
                                   value.accept(Current)
                                end)
            close_layout(json.line, json.column)
         elseif json.members.has(json_array) then
         elseif json.members.has(json_basic) then
         elseif json.members.has(json_embedded) then
         else
            check False end
         end
      end

feature {JSON_STRING}
   visit_string (json: JSON_STRING) is
      do
      end

feature {JSON_TRUE}
   visit_true (json: JSON_TRUE) is
      do
         check False end
      end

feature {} -- Default transient objects
   register_transient_objects is
      do
         transient.register(to_internals, once "Repository")
      end

   unregister_transient_objects is
      do
         transient.unregister(once "Repository")
      end

feature {}
   frozen version: STRING is "1"

   make is
      do
         if parser = Void then
            create parser.make(agent fire_update_error)
         end
         Precursor
      end

invariant
   parser /= Void

end -- class JSON_REPOSITORY_IMPL
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
