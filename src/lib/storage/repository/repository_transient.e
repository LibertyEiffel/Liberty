-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class REPOSITORY_TRANSIENT
   --
   -- Allows one to register transient objects (ones not to be saved by a REPOSITORY). Those objects are not
   -- committed (they are replaced by a tag called "transient reference" in the saved stream); nor are they
   -- restored (if a "transient reference" is found it is replaced with the registered object).
   --
   -- Usual usage:
   --   (create {REPOSITORY_TRANSIENT}).register(to_internals)
   --
   -- '''Caveat''': if you have cycles involving both transient and normal objects, those cycles won't be
   -- detected (at commit) and won't be restored (at update). In a nutshell, ''don't do that''.
   --

insert
   INTERNALS_HANDLER

feature {ANY}
   register (transient_object: INTERNALS; transient_reference: STRING)
         -- Register a `transient_object' with the given `transient_reference'.
      require
         not transient_object.type_is_expanded
         transient_object.object_as_pointer /= default_pointer
         not transient_reference.is_empty
         not has_object(transient_reference)
      local
         ref: STRING; t: REPOSITORY_TRANSIENT_OBJECT
      do
         ref := strings.new_twin(transient_reference)
         if transient_objects_pool.is_empty then
            create t.set(transient_object, ref)
         else
            t := transient_objects_pool.item
            t.set(transient_object, ref)
         end
         transient.put(ref, t)
      ensure
         has_object(transient_reference)
      end

   unregister (transient_reference: STRING)
         -- Unregister the `transient_reference'.
      require
         has_object(transient_reference)
      local
         t: REPOSITORY_TRANSIENT_OBJECT
      do
         t := transient.key_at(transient_reference)
         check
            t /= Void
         end
         transient.remove(t)
         strings.recycle(t.key)
         transient_objects_pool.recycle(t)
      ensure
         not has_object(transient_reference)
      end

   has_object (a_transient_reference: STRING): BOOLEAN
         -- True if the `transient_reference'" is registered.
      do
         Result := transient.has_value(a_transient_reference)
      end

feature {REPOSITORY_IMPL}
   reference (a_object: INTERNALS): STRING
      require
         not a_object.type_is_expanded
         a_object.object_as_pointer /= default_pointer
      local
         dummy: like dummy_transient_object
      do
         dummy := dummy_transient_object
         dummy.set(a_object, once "")
         Result := transient.reference_at(dummy)
         dummy.reset
      ensure
         Result /= Void implies not Result.is_empty
         Result /= Void implies a_object.object_as_pointer = object(Result).object_as_pointer
      end

feature {REPOSITORY_LAYOUT}
   object (a_reference: STRING): INTERNALS
      require
         not a_reference.is_empty
         has_object(a_reference)
      do
         Result := transient.key_at(a_reference).internals
      end

feature {}
   transient: HASHED_BIJECTIVE_DICTIONARY[STRING, REPOSITORY_TRANSIENT_OBJECT]
         -- The key is the transient object, to speed up the most frequent operations which are `reference'
         -- and `object'.
      once
         create Result.with_capacity(2)
      end

   transient_objects_pool: RECYCLING_POOL[REPOSITORY_TRANSIENT_OBJECT]
      once
         create Result.make
      end

   dummy_transient_object: REPOSITORY_TRANSIENT_OBJECT
      once
         create Result.make
      end

   strings: STRING_RECYCLING_POOL
      once
         create Result.make
      end

end -- class REPOSITORY_TRANSIENT
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
