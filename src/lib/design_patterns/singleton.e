-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class SINGLETON
   --
   -- Implementation of the "Singleton" design pattern. The singleton pattern is a property of a type 
   -- (yes TYPE, not class) to have at most one single object created at runtime for the corresponding type.
   --
   -- Usage: insert SINGLETON, that's all.
   --
   -- For examples, look at the tools cluster of SmartEiffel.
   --
   -- WARNING: double-check if the object is really a singleton in the conceptual sense.
   --          The singleton pattern is often used in wrong place. See for example:
   --          http://www.theagiledeveloper.com/articles/2005/03/03/singleton-overuse-disclaimer
   --          http://blogs.msdn.com/scottdensmore/archive/2004/05/25/140827.aspx
   --          http://www.softwarereality.com/design/singleton.jsp
   --          or search "Singletonitis" or "singleton overuse".
   --

insert
   ANY
      redefine
         is_equal
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := other = Current
      end

feature {}
   is_real_singleton: BOOLEAN
      do
         if singleton_memory_pool.fast_has(generating_type) then
            Result := singleton_memory_pool.fast_at(generating_type) = Current.to_pointer
         else
            singleton_memory_pool.add(Current.to_pointer, generating_type)
            Result := True
         end
      ensure
         assertion_check_only: Result
      end

   singleton_memory_pool: HASHED_DICTIONARY[POINTER, STRING]
         -- This pool is unique in the whole system. A memory is kept 
         -- for each singleton type (type, not class) in the system.
      once
         create Result.make
      end

   current_is_not_an_expanded_type: BOOLEAN
         -- Check that the dynamic type of the SINGLETON is not an expanded type.
      local
         like_current: like Current
      do
         Result := like_current = Void
      end

invariant
   current_is_not_an_expanded_type
   is_real_singleton

end -- class SINGLETON
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
