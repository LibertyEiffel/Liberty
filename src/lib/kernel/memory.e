-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class MEMORY
   --
   -- Facilities for tuning up the garbage collection, and
   -- everything about memory control.
   --

feature {ANY} -- Garbage collector information and tuning:
   frozen collecting: BOOLEAN
         -- Is garbage collection enabled?
      external "built_in"
      end

   frozen collection_off
         -- Disable garbage collection.
      external "built_in"
      end

   frozen collection_on
         -- Enable garbage collection.
      external "built_in"
      end

   frozen full_collect
         -- Force a full collection cycle if garbage collection
         -- enabled (i.e. `collecting' is True); do nothing otherwise.
      external "built_in"
      end

   frozen collector_counter: INTEGER
         -- The number of collections actually performed or -1 when the
         -- system is not using any garbage collector (i.e. when
         -- the system is compiled using the -no_gc flag).
      external "built_in"
      ensure
         Result >= -1
      end

feature {ANY} -- Liberty Eiffel Garbage collector information and tuning:
   frozen smart_eiffel_collector: BOOLEAN
         -- Is the Liberty Eiffel garbage collector really used?
      do
         Result := collector_counter >= 0
      ensure
         Result = (collector_counter >= 0)
      end

   frozen low_memory_strategy: BOOLEAN
         -- Is the low memory strategy in use? When this strategy is used,
         -- the garbage collector try to use as few memory as possible.
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("R=(se_gc_strategy==SE_GC_LOW_MEMORY_STRATEGY);%N")
         c_inline_c("#endif%N")
      end

   frozen set_low_memory_strategy
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("se_gc_strategy=SE_GC_LOW_MEMORY_STRATEGY;%N%
          %gc_update_ceils();%N")
         c_inline_c("#endif%N")
      ensure
         low_memory_strategy
      end

   frozen high_memory_strategy: BOOLEAN
         -- Is the high memory strategy in use? When this strategy is used,
         -- the garbage collector assume that more memory can be allocated
         -- if necessary.
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("R=(se_gc_strategy==SE_GC_HIGH_MEMORY_STRATEGY);%N")
         c_inline_c("#endif%N")
      end

   frozen set_high_memory_strategy
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("se_gc_strategy=SE_GC_HIGH_MEMORY_STRATEGY;%N%
          %gc_update_ceils();%N")
         c_inline_c("#endif%N")
      ensure
         high_memory_strategy
      end

   frozen default_memory_strategy: BOOLEAN
         -- Is the default memory strategy in use? This is the default initial
         -- mode for the garbage collector (somewhere between `low_memory_strategy'
         -- and `high_memory_strategy').
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("R=(se_gc_strategy==SE_GC_DEFAULT_MEMORY_STRATEGY);%N")
         c_inline_c("#endif%N")
      end

   frozen set_default_memory_strategy
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("se_gc_strategy=SE_GC_DEFAULT_MEMORY_STRATEGY;%N%
          %gc_update_ceils();%N")
         c_inline_c("#endif%N")
      ensure
         default_memory_strategy
      end

   frozen allocated_bytes: INTEGER
         -- Total number of allocated bytes of memory in the heap.
      require
         smart_eiffel_collector
      external "built_in"
      end

   frozen allow_gc_before_exit
         -- Allow the SmartEiffel GC to run before the process exists. That is the default state when the
         -- Liberty Eiffel GC is used and contracts are checked.
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("gc_set_dispose_before_exit(1);%N")
         c_inline_c("#endif%N")
      end

   frozen forbid_gc_before_exit
         -- Forbid the Liberty Eiffel GC to run at the end of the process run. That is the default state when
         -- the Liberty Eiffel GC is used but the contracts are not checked.
      require
         smart_eiffel_collector
      do
         c_inline_c("#ifdef SE_GC_LIB%N")
         c_inline_c("gc_set_dispose_before_exit(0);%N")
         c_inline_c("#endif%N")
      end

end -- class MEMORY
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
