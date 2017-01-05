-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CLARG_CUSTOMS[D_]

inherit
   CLARG_WITH_ARGS[D_]
      rename
         optional as clarg_optional
         positional as clarg_positional
         decode as decode_
      end

create {COMMAND_LINE_ARGUMENT_FACTORY}
   optional, positional

feature {CLARG_PARSER}
   is_valid_data (arg: STRING): BOOLEAN
      local
         default_value: D_
      do
         if validate /= Void then
            Result := validate.item([arg])
         elseif default_value = Void then -- because of SmartEiffel's strict equality checks
            Result := decode.item([arg]) /= default_value
         else
            Result := True
         end
      end

feature {}
   decode_ (arg: STRING): D_
      do
         Result := decode.item([arg])
      end

feature {}
   optional (a_short, a_long, a_name, a_usage: ABSTRACT_STRING; a_validate: like validate; a_decode: like decode)
      require
         a_short /= Void implies a_short.count = 1
         a_short /= Void or else a_long /= Void
         a_name /= Void
         a_decode /= Void
      do
         clarg_optional(a_short, a_long, a_name, a_usage)
         validate := a_validate
         decode := a_decode
      ensure
         is_optional
         a_short /= Void implies short.is_equal(a_short)
         a_long /= Void implies long.is_equal(a_long)
         name.is_equal(a_name)
         a_usage /= Void implies usage.is_equal(a_usage)
         validate = a_validate
         decode = a_decode
      end

   positional (a_name, a_usage: ABSTRACT_STRING; a_validate: like validate; a_decode: like decode)
      require
         a_name /= Void
         a_decode /= Void
      do
         clarg_positional(a_name, a_usage)
         validate := a_validate
         decode := a_decode
      ensure
         is_positional
         name.is_equal(a_name)
         a_usage /= Void implies usage.is_equal(a_usage)
         validate = a_validate
         decode = a_decode
      end

   validate: PREDICATE[TUPLE[STRING]]
   decode: FUNCTION[TUPLE[STRING], D_]

invariant
   decode /= Void

end -- CLARG_CUSTOMS
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
