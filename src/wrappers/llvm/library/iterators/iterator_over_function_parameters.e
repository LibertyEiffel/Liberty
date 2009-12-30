-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_OVER_FUNCTION_PARAMETERS
inherit 
	BIDIRECTIONAL_ITERATOR[LLVM_VALUE]
	WRAPPER_HANDLER
insert 
	LLVM_VALUE_FACTORY
	CORE_EXTERNALS
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
		do
			item:=wrapper_or_void(llvmget_first_param(function.handle))
		end	

	finish is
		do
			item:=wrapper_or_void(llvmget_last_param(function.handle))
		end	

	next is
		do
			item:=wrapper_or_void(llvmget_next_param(function.handle))
		end	

	previous is
		do
			item:=wrapper_or_void(llvmget_previous_param(function.handle))
		end	

	item: LLVM_VALUE is attribute end 

	-- This feature is unnecessary when inheriting from LLVM_VALUE_FACTORY: wrapper (p: POINTER): LLVM_VALUE is do create Result.from_external_pointer(p) end

invariant function/=Void
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
