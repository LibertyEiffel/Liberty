
-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_OVER_BASIC_BLOCKS

inherit 
	BIDIRECTIONAL_ITERATOR[LLVM_BASIC_BLOCK]
	WRAPPER_FACTORY[LLVM_BASIC_BLOCK]
insert CORE_EXTERNALS

creation from_value

feature {LLVM_VALUE}
	from_value (a_value: LLVM_VALUE) is
		require a_value/=Void
		do
			value:=a_value
		end

feature 
	value: LLVM_VALUE

	start is
		do
			item := wrapper_or_void(llvmget_first_basic_block(value.handle))
		end
	
	finish is
		do
			item := wrapper_or_void(llvmget_last_basic_block(value.handle))
		end

	next is
		do
			item := wrapper_or_void(llvmget_next_basic_block(item.handle))
		end
		
	previous is
		do
			item := wrapper_or_void(llvmget_previous_basic_block(item.handle))
		end

	is_off: BOOLEAN is
		do
			Result:=(item=Void)
		end

	item: LLVM_BASIC_BLOCK is attribute end

invariant value/=Void

end -- class ITERATOR_OVER_BASIC_BLOCKS 

--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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


