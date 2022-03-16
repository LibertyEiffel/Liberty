-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_WINDOW

inherit
   UI_TYPED_BRIDGE_WINDOW[WEB_JOB, WEB_PANEL, WEB_MENU]

insert
   WEB_ITEM[UI_WINDOW]
   LOGGING

create {WEB_JOB}
   make

feature {ANY}
   panel: WEB_PANEL
   menu: WEB_MENU

   title: UNICODE_STRING
      do
         Result := ui.title
      end

feature {UI_WINDOW}
   set_panel (a_panel: WEB_PANEL)
      do
         panel := a_panel
      end

   set_menu (a_menu: WEB_MENU)
      do
         menu := a_menu
      end

feature {WEB_APPLICATION}
   reply (context: WEB_CONTEXT)
      require
         context /= Void
      local
         tfr: TEXT_FILE_READ; s: STRING_OUTPUT_STREAM
         parsed: ABSTRACT_STRING
      do
         create tfr.connect_to(once "#(1).html" # id)
         if tfr.is_connected then
            log.info.put_line(once "Reading file #(1).html" # id)
            from
               create s.make
               tfr.read_line
            until
               tfr.end_of_input
            loop
               s.put_line(tfr.last_string)
               tfr.read_line
            end
            s.put_line(tfr.last_string)
            tfr.disconnect

            parsed := template_parser.parse(s.to_string, agent retrieve_name)
            if parsed = Void then
               context.set_status(500)
            else
               context.reply_stream.put_string(parsed)
            end
         else
            context.set_status(404)
         end
      end

feature {WEB_ITEM}
   save (context: WEB_CONTEXT)
         -- gather static data (field contents and so on)
      do
         menu.save(context)
         panel.save(context)
      end

   run (context: WEB_CONTEXT)
         -- execute actions (button clicks etc.)
      do
         menu.run(context)
         panel.run(context)
      end

   retrieve_name (a_name: STRING; a_extension: COLLECTION[STRING]): ABSTRACT_STRING
      do
         debug
            log.trace.put_line("**** retrieve_name(%"#(1)%")" # a_name)
         end
         inspect
            a_name
         when "action" then
            Result := once "#(1).do" # id
         when "title" then
            Result := title.to_utf8
         else
            Result := menu.retrieve_name(a_name, a_extension)
            if Result = Void then
               Result := panel.retrieve_name(a_name, a_extension)
               if Result = Void then
                  log.warning.put_line(once "Could not resolve %"#(1)%"" # a_name)
               end
            end
         end
      end

feature {}
   template_parser: WEB_TEMPLATE_PARSER
      once
         create Result.make
      end

end -- class WEB_WINDOW
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
