-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class UI_TYPED_BRIDGE_APPLICATION[J_ -> UI_JOB,
                                           W_ -> UI_TYPED_BRIDGE_WINDOW[J_,
                                                                        UI_TYPED_BRIDGE_PANEL[J_, UI_TYPED_BRIDGE_WIDGET[J_]],
                                                                        UI_TYPED_BRIDGE_MENU[J_, UI_TYPED_BRIDGE_MENU_ITEM[J_]]]]

inherit
   UI_BRIDGE_APPLICATION
   UI_TYPED_BRIDGE_COLLECTION[J_, W_]

insert
   JSON_HANDLER
   LOGGING

feature {}
   conf: JSON_OBJECT
      do
         Result := conf_
         if Result = Void then
            Result := read_conf
            conf_ := Result
         end
      end

   conf_: JSON_OBJECT

   read_conf: JSON_OBJECT
      local
         filename: STRING
         tfr: TEXT_FILE_READ
         text: JSON_TEXT
         app: JSON_OBJECT
         parser: JSON_PARSER
      do
         filename := once ""
         filename.make_from_string(id)
         filename.append(once ".app")
         create tfr.connect_to(filename)
         if tfr.is_connected then
            create parser.make(agent log.error.put_line)
            text := parser.parse_json_text(tfr)
            if text /= Void and app ?:= text then
               app ::= text
               if app.item(conf_section) /= Void and then Result ?:= app.item(conf_section) then
                  Result ::= app.item(conf_section)
               else
                  log.error.put_line("Invalid application descriptor #(1): missing %"#(2)%" item" # filename # conf_section)
               end
            else
               log.error.put_line("Invalid application descriptor #(1)" # filename)
            end
            tfr.disconnect
         else
            log.error.put_line("Application descriptor #(1) not found" # filename)
         end
      end

   conf_section: STRING
      deferred
      end

   id: FIXED_STRING
      deferred
      ensure
         interned: Result.intern = Result
      end

feature {UI_APPLICATION}
   add (a_window: W_)
      deferred
      end

end -- class UI_TYPED_BRIDGE_APPLICATION
--
-- Copyright (C) 2012-2022: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
