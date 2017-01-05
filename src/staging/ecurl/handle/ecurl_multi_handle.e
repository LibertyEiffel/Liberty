-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ECURL_MULTI_HANDLE

inherit
   ECURL_HANDLE

insert
   ECURL_PLUGIN
   DISPOSABLE
   RECYCLABLE
   ECURL_HANDLER

create {ANY}
   make

feature {ANY}
   is_useable: BOOLEAN
      local
         i: INTEGER
      do
         from
            i := handles.lower
         until
            Result or else i > handles.upper
         loop
            Result := handles.item(i).is_useable
            i := i + 1
         end
      end

   in_use: BOOLEAN
      do
         Result := performer_value /= Void
      end

   performer: ECURL_MULTI_PERFORMER
      do
         Result := performer_value
         if Result = Void then
            performer_value := performer_memory
            if performer_value = Void then
               create performer_memory.make(Current)
               performer_value := performer_memory
            end
            Result := performer_value
         end
      end

feature {ANY} -- Attach "easy" handles
   attach (a_handle: ECURL_EASY_HANDLE)
      require
         can_attach(a_handle)
      do
         handles.add(a_handle, a_handle.handle)
         a_handle.multi_attach(Current)
      end

   detach (a_handle: ECURL_EASY_HANDLE)
      require
         can_detach(a_handle)
      do
         handles.fast_remove(a_handle.handle)
         a_handle.multi_detach
      end

   can_attach (a_handle: ECURL_EASY_HANDLE): BOOLEAN
      do
         Result := a_handle /= Void and then not a_handle.multi_attached
         check
            Result implies not handles.fast_has(a_handle.handle)
         end
      end

   can_detach (a_handle: ECURL_EASY_HANDLE): BOOLEAN
      do
         Result := a_handle /= Void and then a_handle.multi_attached and then handles.fast_reference_at(a_handle.handle) = a_handle
      end

feature {ECURL_MULTI_PERFORMER}
   perform_done (a_handle: POINTER; error_code: INTEGER)
      local
         easy_handle: ECURL_EASY_HANDLE
      do
         easy_handle := handles.fast_reference_at(a_handle)
         check easy_handle /= Void end
         easy_handle.multi_perform_done(error_code)
      end

feature {ECURL_HANDLER}
   make
         -- Initialize the cUrl handle.
      require
         not is_useable
      do
         handle := curl_multi_init
         if handles = Void then
            create handles.with_capacity(4)
         else
            check handles.is_empty end
         end
      end

   cleanup
      require
         is_useable
      local
         i: INTEGER
      do
         from
            i := handles.lower
         until
            i > handles.upper
         loop
            handles.item(i).cleanup
            i := i + 1
         end
         handles.clear_count
         curl_multi_cleanup(handle)
         handle := handle.default
         performer_value := Void
      end

   handle: POINTER

feature {RECYCLING_POOL}
   recycle
      do
         if is_useable then
            check
               please_cleanup: False
            end
            cleanup
         end
      end

feature {}
   dispose
      do
         recycle
      end

   handles: HASHED_DICTIONARY[ECURL_EASY_HANDLE, POINTER]
   performer_value, performer_memory: ECURL_MULTI_PERFORMER

invariant
   handles /= Void

end -- class ECURL_MULTI_HANDLE
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
