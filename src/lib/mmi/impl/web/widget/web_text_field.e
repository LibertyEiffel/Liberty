-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_TEXT_FIELD

inherit
   UI_TYPED_BRIDGE_TEXT_FIELD[WEB_JOB]
   WEB_WIDGET[UI_TEXT_FIELD]

create {WEB_JOB}
   make

feature {WEB_ITEM}
   save (context: WEB_CONTEXT)
      local
         value: STRING
      do
         value := context.argument(id)
         if value /= Void then
            ui.set_value(value)
         end
      end

   run (context: WEB_CONTEXT)
      do
      end

   retrieve_name (a_name: STRING; a_extension: COLLECTION[STRING]): ABSTRACT_STRING
      do
         if a_name.is_equal(once "value") then
            Result := ui.value
         end
      end

end -- class WEB_TEXT_FIELD
--
-- Copyright (C) 2012-2017: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
