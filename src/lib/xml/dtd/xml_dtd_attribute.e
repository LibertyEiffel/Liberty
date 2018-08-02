-- See the Copyright notice at the end of this file.
--
class XML_DTD_ATTRIBUTE

insert
   RECYCLABLE
      rename default as any_default
      end

create {XML_DTD_ELEMENT}
   make

feature {XML_DTD_ELEMENT} -- validation
   is_valid (attributes: DICTIONARY[UNICODE_STRING, UNICODE_STRING]): BOOLEAN
      local
         value: UNICODE_STRING
      do
         value := attributes.reference_at(name)
         if value = Void then
            Result := is_implied
         else
            Result := list = Void or else list.is_empty or else list.has(value)
         end
      end

   default: UNICODE_STRING

feature {XML_DTD_ELEMENT} -- building
   name: UNICODE_STRING

   list_value (value: UNICODE_STRING)
      do
         if list = Void then
            create {HASHED_SET[UNICODE_STRING]} list.make
         end
         list.add(value)
      end

   cdata
      do
         check
            list /= Void implies list.is_empty
         end
      end

   id
      do
         check
            list /= Void implies list.is_empty
         end
      end

   idref
      do
         check
            list /= Void implies list.is_empty
         end
      end

   idrefs
      do
         check
            list /= Void implies list.is_empty
         end
      end

   nmtoken
      do
         check
            list /= Void implies list.is_empty
         end
      end

   nmtokens
      do
         check
            list /= Void implies list.is_empty
         end
      end

   entity
      do
         check
            list /= Void implies list.is_empty
         end
      end

   entities
      do
         check
            list /= Void implies list.is_empty
         end
      end

   notation
      do
         check
            list /= Void implies list.is_empty
         end
      end

   required
      do
         is_required := True
      end

   implied
      do
         is_required := False
      end

   valid_fixed_value (value: like default): BOOLEAN
      do
         Result := list = Void or else list.is_empty or else list.has(value)
      end

   fixed (value: like default)
      require
         valid_fixed_value(value)
      do
         is_required := True
         if list = Void then
            create {HASHED_SET[UNICODE_STRING]} list.make
         end
         list.add(value)
         default := value
      end

   default_value (value: like default)
      do
         is_required := False
         check
            list /= Void implies list.has(value)
         end
         default := value
      end

feature {}
   list: SET[UNICODE_STRING]

   is_required: BOOLEAN

   is_implied: BOOLEAN
      do
         Result := not is_required
      end

feature {XML_DTD_ELEMENT}
   make (a_name: like name)
      require
         not a_name.is_empty
      do
         name := a_name
         implied
      ensure
         name = a_name
         is_implied
      end

feature {RECYCLING_POOL}
   recycle
      do
         if list /= Void then
            list.clear_count
         end
         is_required := False
      ensure
         list = Void or else list.is_empty
         not is_required
      end

invariant
   not name.is_empty

end -- class XML_DTD_ATTRIBUTE
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
