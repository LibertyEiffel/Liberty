-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class NETWORK_RESOURCE_VALIDITY
--
-- Because URI checking for a network resource is quite complex
--

feature {}
   is_relative_uri (a_uri: STRING): BOOLEAN
      do
         Result := not is_absolute_uri(a_uri)
            and then notation.is_valid_path(a_uri)
      end

   is_absolute_uri (a_uri: STRING): BOOLEAN
         -- True if `a_uri' contains a correctly formatted network URI (i.e.  everything except the protocol
         -- scheme)
      require
         not a_uri.is_empty
      local
         i, j, k: INTEGER; s: STRING
      do
         if a_uri.has_prefix(once "//") and then a_uri.count > 2 then
            s := once ""
            s.copy(a_uri)
            j := a_uri.index_of(':', 3)
            if a_uri.valid_index(j) then
               k := a_uri.first_index_of('@')
               if j < k then
                  Result := a_uri.valid_index(k) and then k > j
                  j := a_uri.index_of(':', j + 1)
               else
                  -- look for user
                  Result := a_uri.valid_index(k)
               end
               i := k
            else
               i := 2
               Result := True
            end
            if Result then
               k := a_uri.index_of('/', i + 1)
               if a_uri.valid_index(k) then
                  if a_uri.valid_index(j) then
                     -- look for host
                     Result := k > j and then j > i
                     if Result then
                        -- look for port
                        s.copy(a_uri)
                        s.shrink(j + 1, k - 1)
                        Result := s.is_integer
                     end
                  else
                     -- look for host
                     Result := k > i
                  end
                  if Result then
                     i := a_uri.index_of('?', k + 1)
                     j := a_uri.index_of('#', k + 1)
                     if a_uri.valid_index(i) then
                        -- look for path
                        Result := i >= k
                        if a_uri.valid_index(j) then
                           -- look for arguments
                           Result := Result and then j > i
                           -- look for anchor
                           Result := Result and then a_uri.upper > j
                        else
                           -- look for arguments
                           Result := Result and then a_uri.upper > i
                        end
                     elseif a_uri.valid_index(j) then
                        -- look for path
                        Result := Result and then j >= k
                        -- look for anchor
                        Result := Result and then a_uri.upper > j
                     else
                        -- look for path
                        Result := Result and then a_uri.upper >= k
                     end
                  end
               else
                  -- fine: no path
               end
            end
         end
      end

feature {}
   notation: UNIX_DIRECTORY_NOTATION
      once
         create Result
      end

end -- class NETWORK_RESOURCE_VALIDITY
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
