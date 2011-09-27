-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COMPLEX_GENERAL[A_SIZE->NUMERIC]
   --
   -- (This class is here to prepare the new support for COMPLEX: COMPLEX_32, COMPLEX_64, etc.)
   --

inherit NUMERIC redefine fill_tagged_out_memory end

feature {ANY}
	set_i is
		-- Set Current to the imaginary unit
	do
		real := real.zero
		imaginary := imaginary.one
	end

	set,set_cartesian (a_real_part, an_imaginary_part: A_SIZE) is
		do
			real:=a_real_part
			imaginary := an_imaginary_part
		end

	set_polar (a_modulus, a_phase: A_SIZE) is
		do
			not_yet_implemented
		end
feature 
	infix "+" (other: like Current): like Current is
		do
			Result.set(real+other.real, imaginary+other.imaginary)
		end

	infix "-" (other: like Current): like Current is
		do
			Result.set(real-other.real, imaginary-other.imaginary)
		end

	infix "*" (other: like Current): like Current is
		do
			Result.set
			(real*other.real - imaginary*other.imaginary,
			imaginary*other.real + real*other.imaginary)
		end

	infix "/" (other: like Current): like Current is
		local den: A_SIZE
		do
			den := other.squared_modulus
			Result.set
			(real*other.real - imaginary*other.imaginary,
			imaginary*other.real + real*other.imaginary)
		end

	infix "^" (e: INTEGER): like Current is
		local idx: INTEGER
		do
			from Result:=one; idx:=e
			until idx=0
			loop
				Result := Result*Current
				idx:=idx-1
			end
		end

	prefix "+": like Current is 
		do
			Result := Current
		end

	prefix "-": like Current is 
		do
			Result.set(-real,-imaginary)
		end

	divisible (other: like Current): BOOLEAN is
		do
			Result := other/=zero
		end

	hash_code: INTEGER is
		do
			not_yet_implemented
		end

	sign: INTEGER_8 is
		do
			not_yet_implemented
			-- See http://en.wikipedia.org/wiki/Sign_function sign is NOT an INTEGER_8 for a complex but like Current!
		end

	zero: like Current is
		do
			Result.set(real.zero, imaginary.zero)
		end

	one: like Current is
		do
			Result.set(real.one, imaginary.zero)
		end

	i: like Current is
			-- Imaginary unit
		do
			Result.set_i
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := real=other.real and then imaginary=other.imaginary
		end

	conjugate: like Current is
		do
			Result.set(real,-imaginary)
		end

feature {ANY} -- Cartesian representation
	real, imaginary: A_SIZE

feature {ANY} -- Polar representation
	modulus: A_SIZE is
		do
			not_yet_implemented -- Result := squared_modulus.sqrt 
		ensure non_negative: Result.sign /= -1
		end 

	phase: A_SIZE is
		do
			not_yet_implemented
		end

	squared_modulus: A_SIZE is
		do
			Result := real*real + imaginary*imaginary
			-- Note: NUMERIC does not have infix "^" (an_exponent: INTEGER): like Current...
		ensure non_negative: Result.sign /= -1
		end
feature {ANY} -- Object Printing:
   fill_tagged_out_memory is
      do
		  tagged_out_memory.append("real:")
		  real.fill_tagged_out_memory
		  tagged_out_memory.append(" imaginary:")
		  imaginary.fill_tagged_out_memory
      end 

end -- class COMPLEX_GENERAL
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
