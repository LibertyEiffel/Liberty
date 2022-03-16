-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_APPLICATION

inherit
   UI_TYPED_BRIDGE_APPLICATION[WEB_JOB, WEB_WINDOW]

insert
   WEB_ITEM[UI_APPLICATION]
      redefine
         make
      end
   LOGGING

create {WEB_JOB}
   make

feature {ANY}
   new_server: SOCKET_SERVER
      do
         Result := access.server
      end

   reply (context: WEB_CONTEXT)
      require
         context /= Void
      do
         inspect
            context.http_method
         when "GET", "POST" then
            reply_get(context)
         when "HEAD" then
            context.set_head(True)
            reply_get(context)
         else
            context.set_status(405)
         end
      end

feature {}
   reply_get (context: WEB_CONTEXT)
      require
         context /= Void
      local
         win: like window
      do
         win := window(context)
         if win = Void then
            context.set_status(404)
         else
            win.reply(context)
         end
      end

feature {UI_APPLICATION}
   add (a_window: WEB_WINDOW)
      do
         windows.add(a_window, a_window.id)
      end

feature {}
   window (context: WEB_CONTEXT): WEB_WINDOW
      local
         map: JSON_OBJECT
         str: JSON_STRING
         path: STRING
         window_path: FIXED_STRING
         do_action: BOOLEAN
      do
         path := context.http_path.twin
         map ?= conf.item(once "map")
         if map /= Void then
            str ?= map.item(path)
            if str /= Void then
               Result := windows.fast_reference_at(str.string.as_utf8.intern)
            end
         end
         if Result = Void then
            if path.has_prefix(once "/") then
               path.remove_head(1)
            end
            if path.has_suffix(once ".html") then
               path.remove_tail(5)
            elseif path.has_suffix(once ".do") then
               path.remove_tail(3)
               do_action := True
            end
            window_path := path.intern

            log.trace.put_line(once ">>>> window path: #(1)" # window_path)

            Result := windows.fast_reference_at(window_path)
            if do_action then
               Result.save(context)
               Result.run(context)
            end
         end
      end

   address: IPV4_ADDRESS
      local
         ip: JSON_ARRAY
         ip_a, ip_b, ip_c, ip_d: JSON_NUMBER
         a, b, c, d: INTEGER
      do
         ip ?= conf.item(once "ip")
         if ip /= Void and then ip.count = 4 then
            ip_a ?= ip.item(ip.lower    )
            ip_b ?= ip.item(ip.lower + 1)
            ip_c ?= ip.item(ip.lower + 2)
            ip_d ?= ip.item(ip.lower + 3)
            if          ip_a /= Void and then ip_a.is_integer
               and then ip_b /= Void and then ip_b.is_integer
               and then ip_c /= Void and then ip_c.is_integer
               and then ip_d /= Void and then ip_d.is_integer
             then
               a := ip_a.to_integer.to_integer_32
               b := ip_b.to_integer.to_integer_32
               c := ip_c.to_integer.to_integer_32
               d := ip_d.to_integer.to_integer_32
               if          a >= 0 and then a <= 255
                  and then b >= 0 and then b <= 255
                  and then c >= 0 and then c <= 255
                  and then d >= 0 and then d <= 255
               then
                  create Result.make(a, b, c, d)
               end
            end
         end
      end

   access: TCP_ACCESS
      local
         port: JSON_NUMBER
      do
         port ?= conf.item(once "port")
         if port /= Void and then port.is_integer then
            create Result.make(address, port.to_integer.to_integer_32, False)
         end
      end

feature {}
   conf_section: STRING "web"

   windows: HASHED_DICTIONARY[WEB_WINDOW, FIXED_STRING]

   make (a_ui: like ui)
      do
         Precursor(a_ui)
         create windows.make
      end

invariant
   windows /= Void

end -- class WEB_APPLICATION
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
