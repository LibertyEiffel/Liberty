-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_TEMPLATE_PARSER

insert
   SINGLETON
   LOGGING
      undefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   parse (source: ABSTRACT_STRING; a_replace: like replace): ABSTRACT_STRING
      require
         a_replace /= Void
      local
         buffer: MINI_PARSER_BUFFER
      do
         replace := a_replace

         check
            data.is_empty
            replaced.is_empty
         end
         data.add_last("")
         create buffer.initialize_with(source)
         if parser.eval(buffer, table, once "grammar") then
            parse_error := parser.error
            if parse_error = Void then
               check
                  data.count = 1
               end
               Result := data.last
            end
         else
            parse_error := parser.error
         end
         data.clear_count
         replace := Void
      ensure
         data.is_empty
      end

   parse_error: PARSE_ERROR

feature {}
   reduce_non_terminal (a_name: FIXED_STRING)
      require
         replace /= Void
      local
         data_last, data_prefix, data_postfix: ABSTRACT_STRING
      do
         inspect
            a_name
         when "grammar" then
         when "data" then
         when "replacementPrefix" then
            data.add_last("")
            last_string := Void
         when "replacementStart" then
            last_string := Void
         when "replacementEnd" then
            replaced.add_last(replace.item([name, extension]))
            name := Void
            extension := Void
            data.add_last("")
            last_string := Void
         when "replacementPostfix" then
            data_postfix := data.last
            data.remove_last
            data_prefix := data.last
            data.remove_last
            if replaced.last /= Void then
               data_last := data.last
               data.remove_last
               data.add_last(once "#(1)#(2)#(3)#(4)" # data_last # data_prefix # replaced.last # data_postfix)
            end
            replaced.remove_last
            last_string := Void
         when "replacement" then
         when "raw" then
            if last_string /= Void then
               data_last := data.last
               data.remove_last
               data.add_last(once "#(1)#(2)" # data_last # last_string)
               last_string := Void
            end
         when "name" then
            name := id
            id := Void
         when "extension" then
            if extension = Void then
               create extension.make(0)
            end
            extension.add_last(id)
            id := Void
         when "id" then
            if last_string /= Void then
               if id = Void then
                  id := last_string
               else
                  id.append(last_string)
               end
               last_string := Void
            end
         end
      end

   reduce_terminal (a_name: FIXED_STRING; a_image: PARSER_IMAGE)
      local
         p_image: PACKRAT_IMAGE
      do
         p_image ::= a_image
         if last_string = Void then
            last_string := ""
         end
         last_string.append(p_image.image)
      end

   id, name: STRING
   extension: FAST_ARRAY[STRING]
   last_string: STRING

   data, replaced: FAST_ARRAY[ABSTRACT_STRING]

feature {}
   make
      do
         create data.make(0)
         create replaced.make(0)
      end

   replace: FUNCTION[TUPLE[STRING, COLLECTION[STRING]], ABSTRACT_STRING]

   table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
      local
         grammar: PACKRAT_GRAMMAR
         source: STRING
      once
         create grammar.make
         source := "[
                    grammar <- (data)*
                    data <- replacement / raw
                    replacement <- replacementPrefix (!'(' data / '(' !'#' data)* replacementStart name (&'|' extension)* replacementEnd (!']' data)* replacementPostfix
                    replacementPrefix <- '['
                    replacementPostfix <- ']'
                    replacementStart <- '(#'
                    replacementEnd <- ')'
                    raw <- .
                    name <- id
                    extension <- '|' id
                    id <- [a-zA-Z0-9_.]+
                    ]"
         log.info.put_line("parsing grammar...")

         Result := grammar.parse_table(source)
         Result.set_default_tree_builders(agent reduce_non_terminal, agent reduce_terminal) -- ouch: that's why this class is a singleton
         Result.pretty_print_on(log.trace)

         log.info.put_line("grammar parsed.")
      end

   parser: PACKRAT_PARSER
      once
         create Result
      end

end -- class WEB_TEMPLATE_PARSER
--
-- Copyright (C) 2012-2016: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
