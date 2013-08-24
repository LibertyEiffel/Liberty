-- See the Copyright notice at the end of this file.
--
expanded class XML_DTD_PUBLIC_REPOSITORY
   --
   -- This class allows you to register public DTD files as local files (useful when the network is not
   -- available, or for performance reasons, or for any other reason).
   --

insert
   URL_VALIDITY

feature {ANY}
   register (public_id: UNICODE_STRING; a_url: STRING) is
         -- Register the public DTD `public_id' as having a local couterpart file in the given `local_path'.
      require
         valid_public_id: not public_id.is_empty
         valid_url: valid_url(a_url)
         not_registered: not is_registered(public_id)
      local
         url: URL
      do
         create url.absolute(a_url)
         -- We twin the `public_id' string to be sure the client cannot modify the registered version (the
         -- hashed dictionary would not like that)
         dtd.add(url, public_id.twin)
      ensure
         registered: is_registered(public_id)
      end

   is_registered (public_id: UNICODE_STRING): BOOLEAN is
         -- Does the given `public_id' have a registered URL?
      require
         valid_public_id: not public_id.is_empty
      do
         Result := dtd.has(public_id)
      end

feature {XML_DTD_PARSER}
   public_dtd (public_id: UNICODE_STRING; a_url: URL): URL is
         -- Opens the given `public_id' either by network connection to the `url' or, if the `public_id'
         -- `is_registered', by reading the registered URL.
      require
         not public_id.is_empty
         not is_registered(public_id) implies a_url /= Void
      do
         last_error_memory.set_item(Void)
         if is_registered(public_id) then
            Result := dtd.at(public_id)
         else
            Result := a_url
         end
         if Result /= Void then
            Result.set_error_handler(agent_error)
         end
      ensure
         Result = Void implies last_error /= Void
         not is_registered(public_id) implies Result = a_url
      end

   last_error: STRING is
         -- Meaningful only if the last call to `public_dtd' returned Void
      do
         Result := last_error_memory.item
      end

feature {}
   last_error_memory: REFERENCE[STRING] is
      once
         create Result
      end

   dtd: HASHED_DICTIONARY[URL, UNICODE_STRING] is
         -- The registered URLs
      once
         create Result.make
      end

   agent_error: PROCEDURE[TUPLE[STRING]] is
      once
         Result := agent set_error(?)
      end

   set_error (a_error: STRING) is
      do
         last_error_memory.set_item(a_error)
      end

end -- class XML_DTD_PUBLIC_REPOSITORY
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
