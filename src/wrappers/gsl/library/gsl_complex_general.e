indexing
	description: "complex number"
	copyright: "(C) 2006 - 2008"
	authors: "Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- TODO: the nature of a complex number is expanded, but it's not 
	-- easy to implement this. Probably imposible with current (2.2) 
	-- version of se. We'd need some notion of external field, which 
	-- would yield to embed external attibutes (here a struct: 
	-- gsl_complex) in the generated code for the expanded type.
	-- additionally we'd need the possibility to get the address of 
	-- the embeded value.

	-- I always used _imag as in the wrapped lib. Would you prefer 
	-- some other name? e. g. set_imaginary()?

   --  TODO: pluginize
   
deferred class GSL_COMPLEX_GENERAL[TYPE_->COMPARABLE]

inherit
	C_STRUCT
		export {GSL_COMPLEX_GENERAL}
			struct_size
		redefine
			out, copy, is_equal
		end
	
		EIFFEL_OWNED undefine out end 

feature {} -- Creating
	make_rect (a, b: TYPE_) is
			-- Creates complex number with value (a + bi)
		do
			allocate
			gsl_set_real(handle, a)
			gsl_set_imag(handle, b)
		end
	
	make_polar(r, theta: TYPE_) is
			-- Create compley with value (r * e^(i * theta))
		do
			allocate
			gsl_complex_polar(handle, r, theta)
		end

feature {ANY}
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
				or else (struct_size = other.struct_size and memcmp(handle, other.handle, struct_size) = 0)
		end

feature {ANY} -- copying
	copy(other: like Current) is
		local
			o: POINTER
		do
			check
				equal_sizes: struct_size = other.struct_size
			end
			o := memcpy(handle, other.handle, struct_size)
		end
	
feature {ANY} -- Printing
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

	gsl_complex_p_real (ptr: POINTER): TYPE_ is
		require
			not_null_ptr: ptr.is_not_null
		external "C macro signature (gsl_complex*) use <gsl/gsl_complex.h>"
		alias "GSL_COMPLEX_P_REAL"
		end
	
	gsl_complex_p_imag (ptr: POINTER): TYPE_ is
		require
			not_null_ptr: ptr.is_not_null
		external "C macro signature (gsl_complex*) use <gsl/gsl_complex.h>"
		alias "GSL_COMPLEX_P_IMAG"
		end

	gsl_set_complex (ptr: POINTER; a, b: TYPE_)  is
		require
			not_null_ptr: ptr.is_not_null
		deferred
		end

	gsl_set_real(ptr: POINTER; a: TYPE_) is
		require
			not_null_ptr: ptr.is_not_null
		deferred
		ensure
			value_set: gsl_complex_p_real(ptr) = a
		end

	gsl_set_imag(ptr: POINTER; b: TYPE_) is
		require
			not_null_ptr: ptr.is_not_null
		deferred
		ensure
			value_set: gsl_complex_p_imag(ptr) = b
		end

	gsl_complex_polar(ptr: POINTER; r, theta: TYPE_) is
		require
			not_null_ptr: ptr.is_not_null
		deferred
		end

invariant
	valid_handle: handle /= default_pointer
	
end
