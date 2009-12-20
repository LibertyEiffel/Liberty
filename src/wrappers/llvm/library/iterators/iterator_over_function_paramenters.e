-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
		deferred
class ITERATOR_OVER_FUNCTION_PARAMETERS
inherit BIDIRECTIONAL_ITERATOR[LLVM_VALUE]
insert LLVM_VALUE_FACTORY
creation {LLVM_FUNCTION} from_function

feature {LLVM_FUNCTION}
	from_function (a_function: LLVM_FUNCTION) is
		require a_function/=Void
		do
			function:=a_function
		end

	function: LLVM_FUNCTION
feature {ANY}
	is_off: BOOLEAN is
		do
			Result:=(item/=Void)
		end

	start is
		local p: POINTER
		do
			p:=wrapper(llvmget_first_param(function.handle))
			if p.is_not_null 
				then item:=wrapper(p)
			else item:=Void
			end
		end	

	finish is
			local p: POINTER
		do
			p:=wrapper(llvmget_last_param(function.handle))
			if p.is_not_null 
				then item:=wrapper(p)
			else item:=Void
			end
		end	

	next is
		local p: POINTER
		do
			p:=wrapper(llvmget_next_param(function.handle))
			if p.is_not_null 
				then item:=wrapper(p)
			else item:=Void
			end
		end	

	previous is
				local p: POINTER
		do
			p:=wrapper(llvmget_previous_param(function.handle))
			if p.is_not_null 
				then item:=wrapper(p)
			else item:=Void
			end
		end	

	item: LLVM_VALUE is attribute end 
end -- class ITERATOR_OVER_FUNCTION_PARAMETERS
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
