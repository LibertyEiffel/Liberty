-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class MATH_CONSTANTS
   --
   -- Platform-independent, universal, mathematical constants.
   -- Intended to be used as ancestor for classes that need these constants.
   --

feature {ANY} -- Maths constants:
   Pi: REAL 3.1415926535897932384626
         -- Pi

         Pi_2: REAL 1.5707963267948966192313
         -- Pi divided by 2

	Pi_4: REAL 0.7853981633974483096156
         -- Pi divided by 4

   Inv_pi: REAL 0.31830988618379067153
         -- Inverse pi		 

   Sqr_2pi: REAL 2.50662827463100050241
         -- Square root of 2 pi
         
   Tau: REAL 6.2831852707795864769252
         -- Tau (2Pi)
         
   Sqr_Tau: REAL 2.50662827463100050241
         -- Square root of Tau
         
   Evalue: REAL 2.7182818284590452353602
         -- e (Euler's number)

   Inv_evalue: REAL 0.36787944117144232159
         -- Inverse e
         
   Deg: REAL 57.2957795130823208767981
         -- Degrees/Radian

   Phi: REAL 1.6180339887498948482045
         -- Golden Ratio

   Cheb: REAL 0.59017029950804811302
         -- Chebyshev constant

   Zeta_2: REAL 1.64493406684822643647
         -- Riemann Function

		 
end -- class MATH_CONSTANTS
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
