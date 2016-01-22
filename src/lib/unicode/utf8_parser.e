-- See the Copyright notice at the end of this file.
--
expanded class UTF8_PARSER
   --
   -- The purpose of the UTF8_PARSER is to analyse STRINGs encoded with
   -- UTF-8 format in order to create corresponding UNICODE_STRING objects.
   --
   -- Any sequence is decoded, "invalid" character is used where UTF-8
   -- sequence is wrong.

insert
   STRING_HANDLER

feature {ANY}
   decode (utf8_string: STRING; unicode_string: UNICODE_STRING)
         -- Decode the `utf8_string' and append it in `unicode_string'.
         -- After this call the `first_error' attribute may be non Void
         -- to explain the error encountered during the `utf8_string'
         -- decoding.
         -- In case of error, the `first_error_index' is also used to
         -- indicate the position of the first error into the original
         -- `utf8_string', `first_error_character' indicate the
         -- position of the first error character added in `unicode_string'.
      require
         utf8_string /= Void
         unicode_string /= Void
      local
         i, k, seq_length: INTEGER; v: INTEGER; storage: NATIVE_ARRAY[CHARACTER]; maxi: INTEGER
      do
         from
            first_error := Void
            storage := utf8_string.storage
            maxi := utf8_string.count - 1
         until
            i > maxi
         loop
            v := storage.item(i).code
            i := i + 1
            inspect
               v
            when 0 .. 127 then
               unicode_string.extend(v)
               k := 0
            when 192 .. 223 then
               v := v - 192
               k := 2
            when 224 .. 239 then
               v := v - 224
               k := 3
            when 240 .. 247 then
               v := v - 240
               k := 4
            else
               unicode_string.extend(65533)
               if first_error = Void then
                  first_error := once "Invalid byte as first character of %
                  %UTF-8 sequence."
                  first_error_index := i
                  first_error_character := unicode_string.count
               end
               k := 0
            end
            from
               seq_length := k
            until
               k <= 1
            loop
               if i <= maxi and then storage.item(i).code.in_range(128, 191) then
                  v := v * 64 + storage.item(i).code - 128
                  i := i + 1
                  k := k - 1
               else
                  unicode_string.extend(65533)
                  if first_error = Void then
                     first_error := once ""
                     first_error.clear_count
                     if i <= maxi then
                        first_error.append(once "Invalid byte in UTF-8 %
                   %sequence. This character is %
                   % number ")
                     else
                        first_error.append(once " Missing character number ")
                     end
                     (seq_length - k + 2).append_in(first_error)
                     first_error.append(once " in ")
                     seq_length.append_in(first_error)
                     first_error.append(once " bytes sequence.")
                     first_error_index := i
                     first_error_character := unicode_string.count
                  end
                  k := 0
               end
            end
            if k = 1 then
               if v < 128 or else v < 2048 and then seq_length > 2 or else v < 65536 and then seq_length > 3 then
                  unicode_string.extend(65533)
                  if first_error = Void then
                     first_error := once "Overlong sequence, must be refused %
               %by any UTF-8 complient decoder for%
               % security reasons."
                     first_error_index := i - seq_length + 1
                     first_error_character := unicode_string.count
                  end
               elseif not unicode_string.valid_unicode(v) then
                  unicode_string.extend(65533)
                  if first_error = Void then
                     first_error := once ""
                     first_error.copy(once "Invalid unicode value: 0x")
                     v.to_hexadecimal_in(first_error)
                     first_error.append(once ". Please check unicode charts.")
                     first_error_index := i - seq_length + 1
                     first_error_character := unicode_string.count
                  end
               else
                  unicode_string.extend(v)
               end
            end
         end
      end

   first_error: STRING
         -- When `first_error' is not Void, this means that an error
         -- has occured during the last `decode' call. In such a
         -- situation, `first_error' is an explanation of the error.

   first_error_index: INTEGER
         -- Meaningful only when `first_error' is not Void to indicate
         -- the position of the error in `utf8_string' (see `decode').

   first_error_character: INTEGER
         -- Meaningful only when `first_error' is not Void to indicate
         -- the position of the first error character added to
         -- `unicode_string' (see `decode').

end -- class UTF8_PARSER
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
