-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_OVER_GLOBAL_VARIABLES

inherit
   BIDIRECTIONAL_ITERATOR[LLVM_GLOBAL_VARIABLE]
   WRAPPER_FACTORY[LLVM_GLOBAL_VARIABLE]

insert CORE_EXTERNALS

create {LLVM_MODULE} from_module

feature {LLVM_VALUE}
   from_module (a_module: like module)
      require a_module/=Void
      do
         module:=a_module
      end

feature {ANY}
   module: LLVM_MODULE

   start
      do
         item := wrapper_or_void(llvmget_first_global(module.handle))
      end

   finish
      do
         item := wrapper_or_void(llvmget_last_global(module.handle))
      end

   next
      do
         item := wrapper_or_void(llvmget_next_global(item.handle))
      end

   previous
      do
         item := wrapper_or_void(llvmget_previous_global(item.handle))
      end

   is_off: BOOLEAN
      do
         Result:=(item=Void)
      end

   item: LLVM_GLOBAL_VARIABLE is attribute end

   generation, iterable_generation: INTEGER is 0
feature {ANY}
   wrapper (p: POINTER): LLVM_GLOBAL_VARIABLE
      do
         create Result.from_external_pointer(p)
      end
invariant module/=Void

end -- class ITERATOR_OVER_GLOBAL_VARIABLES

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


-- This file is part of LLVM wrappers for Liberty Eiffel.
--
-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
