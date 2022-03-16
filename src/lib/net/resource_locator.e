-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class RESOURCE_LOCATOR
   --
   -- Implementation of URL
   --

insert
   RECYCLABLE
      redefine
         is_equal
      end

feature {ANY}
   uri: STRING
      deferred
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := uri.is_equal(other.uri)
      end

feature {URL_VALIDITY}
   valid_uri (a_uri: STRING): BOOLEAN
      deferred
      end

feature {URL} -- URL data:
   absolute_uri (a_uri: STRING): BOOLEAN
      require
         valid_uri(a_uri)
      deferred
      end

   relative_uri (a_uri: STRING): BOOLEAN
      require
         valid_uri(a_uri)
      do
         Result := not absolute_uri(a_uri)
      end

   set_relative (a_uri: STRING)
      require
         relative_uri(a_uri)
      deferred
      end

end -- class RESOURCE_LOCATOR
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
