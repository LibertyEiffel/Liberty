indexing
	description: "comlex number"
	copyright: "(C) 2006 "
	authors: "Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	-- TODO: use all the return values of the functions. Currently discarded.

	-- TODO: the nature of a complex number is expanded, but it's not 
	-- easy to implement this. Probably imposible with current (2.2) 
	-- version of se. We'd need some notion of external field, which 
	-- would yield to embed external attibutes (here a struct: 
	-- gsl_complex) in the generated code for the expanded type.
	-- additionally we'd need the possibility to get the address of 
	-- the embeded value.

	-- TODO: it could be a good idea to redefine copy, to copy the 
	-- external struct, too. This would lead to a "more" expanded 
	-- GSL_COMPLEX

	-- TODO: creation of some arbitrary complex seem inefficient with 
	-- all these calls to make, perhabs we can "inline" the call to calloc

	-- I always used _imag as in the wrapped lib. Would you prefer 
	-- some other name? e. g. set_imaginary()?

	-- what is the story about out, fill_tagged_out_memory, to_string 
	-- and friends?
	
deferred class GSL_COMPLEX_GENERAL[TYPE_->COMPARABLE]

inherit C_STRUCT
		redefine
			out
		end
	
feature {NONE} -- Creating
-- TODO: implement this?
--	make_zero is
--			-- Create a complex number with value (0 + 0i)
--		do
--			make
--			set_real(0)
--			set_real
--		end

	make_rect (a, b: TYPE_) is
			-- Creates complex number with value (a + bi)
		do
			make
			-- TODO: should we call gsl_set_real(a) here? -> speedup
			set_real(a)
			set_imag(b)
		end
	
	make_polar(r, theta: TYPE_) is
			-- Create compley with value (r * e^(i * theta))
		do
			make
			gsl_complex_polar(handle, r, theta)
		end

feature
	real: TYPE_ is
			-- the real part of `Current'
		do
			Result := gsl_complex_p_real(handle)
		end
	
	imag: TYPE_ is
			-- imaginary part of `Current'
		do
			Result := gsl_complex_p_imag(handle)
		end

	set_real(a: TYPE_) is
			-- set the real part of `Current' to `a'
		do
			gsl_set_real(handle, a)
		end
	
	set_imag(b: TYPE_) is
			-- set the real part of `Current' to `b'
		do
			gsl_set_imag(handle, b)
		end

	is_equal(other: like Current): BOOLEAN is
		do
			Result := handle = other.handle
				or else (size = other.size and memcmp(handle, other.handle, size) = 0)
		end
	-- todo: copy
feature  -- Arithmetic operations

	add (other: like Current) is
			-- adds `other' to Current
		local
			res: INTEGER
		do
			-- TODO
		ensure
			nyi: False
		end

	sub (other: like Current) is
			-- Subtract  `other' from Current
		do
			-- tODO
		ensure
			nyi: False
		end

feature -- Printing
	-- TODO: implement in nice way
	out: STRING is
			-- String representation of `Current'
		local
			z: TYPE_
		do
			string_buffer.clear_count
			string_buffer.append(real.out)
			if imag >= z then
				string_buffer.append("+")
			end
			string_buffer.append(imag.out)
			string_buffer.append("i")
			Result := string_buffer.twin
		end
	
feature {}
	string_buffer: STRING is
		once
			create Result.make(128)
		end

feature {} -- External calls

--TODO: postconditions
	gsl_complex_p_real (ptr: POINTER): TYPE_ is
		external "C macro signature (gsl_complex*) use <gsl/gsl_complex.h>"
		alias "GSL_COMPLEX_P_REAL"
		end
	
	gsl_complex_p_imag (ptr: POINTER): TYPE_ is
		external "C macro signature (gsl_complex*) use <gsl/gsl_complex.h>"
		alias "GSL_COMPLEX_P_IMAG"
		end

	gsl_set_complex (ptr: POINTER; a, b: TYPE_)  is
		deferred
		end

	gsl_set_real(ptr: POINTER; a: TYPE_) is
		deferred
		end

	gsl_set_imag(ptr: POINTER; b: TYPE_) is
		deferred
		end

	gsl_complex_polar(ptr: POINTER; r, theta: TYPE_) is
		deferred
		end

	-- TODO: what is size_t exactly? NATURAL?
	memcmp(a, b: POINTER; len: INTEGER): INTEGER is
		external "C"
		end
	
invariant
	valid_handle: handle /= default_pointer
	
end
