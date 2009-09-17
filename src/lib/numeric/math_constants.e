expanded class MATH_CONSTANTS
	--
	-- Platform-independent, universal, mathematical constants.
	-- Intended to be used as ancestor for classes that need these constants.
	--

feature {ANY} -- Maths constants:
	Pi: REAL is 3.1415926535897932384626

	Evalue: REAL is 2.7182818284590452353602

	Deg: REAL is 57.2957795130823208767981
			-- Degrees/Radian

	Phi: REAL is 1.6180339887498948482045
			-- Golden Ratio

end -- class MATH_CONSTANTS
