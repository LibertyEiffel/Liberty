-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ECURL_MULTI_PERFORMER
   --
   -- Just add that JOB to your LOOP_STACK and let it work for you!
   --

inherit
   JOB
   EVENTS_EXPECTER
   EVENT_DESCRIPTOR
      rename
         expect as ed_expect,
         occurred as ed_occurred
      end

insert
   ECURL_PLUGIN
   ECURL_HANDLER

create {ECURL_MULTI_HANDLE}
   make

feature {ANY}
   on_error: PROCEDURE[TUPLE[INTEGER, ECURL_HANDLE]]

   set_on_error (a_on_error: like on_error) assign on_error
      do
         on_error := a_on_error
      ensure
         on_error = a_on_error
      end

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      do
         events.expect(Current)
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         Result := events.event_occurred(Current)
      end

   continue
      local
         err, nbhandles, nbmsg: INTEGER
         msg, easy_handle: POINTER
      do
         err := curl_multi_perform(handle.handle, $nbhandles)
         if err = Curle_ok then
            from
               msg := curl_multi_info_read(handle.handle, $nbmsg);
            variant
               nbmsg
            until
               msg.is_null
            loop
               easy_handle := ecurl_multi_info_easy_handle(msg)
               if ecurl_multi_info_easy_done(msg) then
                  err := ecurl_multi_info_easy_code(msg)
                  handle.perform_done(easy_handle, err)
               end
               msg := curl_multi_info_read(handle.handle, $nbmsg);
            end
         elseif on_error /= Void then
            on_error.call([err, handle])
         end
      end

   done: BOOLEAN

   restart
      do
         done := False
      end

feature {EVENTS_SET}
   ed_expect (events: EVENTS_SET)
      do
         events.when_expecter(Current)
      end

   ed_occurred (events: EVENTS_SET): BOOLEAN
      do
         Result := events.has_expecter(Current)
      end

feature {EVENTS_SET}
   expect (read_set, write_set, exception_set: POINTER)
      do
         curl_multi_fdset(handle.handle, read_set, write_set, exception_set, $expected_highest)
      end

   happened (read_set, write_set, exception_set: POINTER): BOOLEAN
      do
         Result := True
      end

   expected_read, expected_write, expected_exception: BOOLEAN True
   expected_highest: INTEGER

feature {}
   make (a_handle: like handle)
      require
         a_handle /= Void
      do
         handle := a_handle
      ensure
         handle = a_handle
      end

   handle: ECURL_MULTI_HANDLE

invariant
   handle /= Void

end -- class ECURL_MULTI_PERFORMER
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
