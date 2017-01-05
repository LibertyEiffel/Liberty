-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2017: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class EDC_GDA_DRIVER

inherit
   EDC_DRIVER
      redefine
         default_create
      end

insert
   SHARED_LIBGDA
      redefine
         default_create
      end
   SINGLETON
      redefine
         default_create
      end

feature {EDC_CONNECTION_FACTORY}
   valid_url (url: STRING): BOOLEAN
      do
         Result := url.has_prefix(once "gda://")
      end

   new_connection (url: STRING; info: DICTIONARY[STRING, STRING]): EDC_GDA_CONNECTION
      local
         provider_id, parameters: STRING; i: INTEGER; cnx: GDA_CONNECTION
      do
         provider_id := url.twin
         provider_id.remove_prefix(once "gda://")
         i := provider_id.index_of('/')
         if provider_id.valid_index(i) then
            parameters := provider_id.twin
            provider_id.shrink(1, i - 1)
            parameters.shrink(i + 1, parameters.count)
         else
            create parameters.make_empty
         end
         if info /= Void then
            from
               i := info.lower
            until
               i > info.upper
            loop
               if not parameters.is_empty then
                  parameters.extend(';')
               end
               parameters.append(info.key(i))
               parameters.extend('=')
               parameters.append(info.iten(i))
               i := i + 1
            end
         end
         cnx := gda.open_connection_from_string(provider_id, parameters, Void, Void, 0)
         create Result.make(cnx, gda)
      end

feature {}
   gda: GDA_CLIENT
      once
         create Result.make
      end

   default_create
      once
         libgda.init("EDC", "0.1", create {FAST_ARRAY[STRING]}.make(0))
      end

end -- class EDC_GDA_DRIVER
