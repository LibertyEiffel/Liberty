-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_JOB

inherit
   UI_JOB
      redefine
         application
      end

create {USER_INTERFACE}
   connect

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      do
         events.expect(server.event_connection)
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         Result := events.event_occurred(server.event_connection)
      end

   continue
      local
         stream: SOCKET_INPUT_OUTPUT_STREAM
         cnx: WEB_CONNECTION
      do
         stream := server.new_stream(True)
         if stream /= Void and then stream.is_connected then
            create cnx.make(application, stream)
            on_new_job.call([cnx])
         else
            log.warning.put_line(once "Could not connect to client!")
         end
      end

   done: BOOLEAN
      do
         Result := server = Void or else not server.can_connect
      end

   restart
      do
         server := application.new_server
      end

feature {UI_ITEM}
   new_bridge_application (ui: UI_APPLICATION): WEB_APPLICATION
      do
         create Result.make(ui)
      end

   new_bridge_window (ui: UI_WINDOW): WEB_WINDOW
      do
         create Result.make(ui)
      end

   new_bridge_panel (ui: UI_PANEL): WEB_PANEL
      do
         create Result.make(ui)
      end

   new_bridge_menu (ui: UI_MENU): WEB_MENU
      do
         create Result.make(ui)
      end

   new_bridge_text_field (ui: UI_TEXT_FIELD): WEB_TEXT_FIELD
      do
         create Result.make(ui)
      end

   new_bridge_button (ui: UI_BUTTON): WEB_BUTTON
      do
         create Result.make(ui)
      end

feature {}
   server: SOCKET_SERVER
   application: WEB_APPLICATION

end -- class WEB_JOB
--
-- Copyright (C) 2012-2018: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
