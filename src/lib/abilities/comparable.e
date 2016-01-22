-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class COMPARABLE
   --
   -- All classes handling COMPARABLE objects with a total order relation
   -- should inherit from this class.
   --

insert
   ANY
      redefine is_equal
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := not (Current < other) and then not (other < Current)
      ensure then
         trichotomy: Result = (not (Current < other) and not (other < Current))
      end

   infix "<" (other: like Current): BOOLEAN
         -- Is `Current' strictly less than `other'?
         --
         -- See also `>', `<=', `>=', `min', `max'.
      require
         other_exists: other /= Void
      deferred
      ensure
         asymmetric: Result implies not (other < Current)
      end

   infix "<=" (other: like Current): BOOLEAN
         -- Is `Current' less than or equal `other'?
         --
         -- See also `>=', `<', `>', `min', `max'.
      require
         other_exists: other /= Void
      do
         Result := not (other < Current)
      ensure
         definition: Result = (Current < other or is_equal(other))
      end

   infix ">" (other: like Current): BOOLEAN
         -- Is `Current' strictly greater than `other'?
         --
         -- See also `<', `>=', `<=', `min', `max'.
      require
         other_exists: other /= Void
      do
         Result := other < Current
      ensure
         definition: Result = (other < Current)
      end

   infix ">=" (other: like Current): BOOLEAN
         -- Is `Current' greater than or equal than `other'?
         --
         -- See also `<=', `>', `<', `min', `max'.
      require
         other_exists: other /= Void
      do
         Result := not (Current < other)
      ensure
         definition: Result = (other <= Current)
      end

   in_range (lower, upper: like Current): BOOLEAN
         -- Return True if `Current' is in range [`lower'..`upper']
         --
         -- See also `min', `max', `compare'.
      do
         Result := Current >= lower and then Current <= upper
      ensure
         Result = (Current >= lower and Current <= upper)
      end

   compare, three_way_comparison (other: like Current): INTEGER
         -- If current object equal to `other', 0
         -- if smaller,  -1; if greater, 1.
         --
         -- See also `min', `max', `in_range'.
      require
         other_exists: other /= Void
      do
         if Current < other then
            Result := -1
         elseif other < Current then
            Result := 1
         end
      ensure
         equal_zero: (Result = 0) = is_equal(other)
         smaller_negative: Result = -1 = (Current < other)
         greater_positive: Result = 1 = (Current > other)
      end

   min (other: like Current): like Current
         -- Minimum of `Current' and `other'.
         --
         -- See also `max', `in_range'.
      require
         other /= Void
      do
         if Current <= other then
            Result := Current
         else
            Result := other
         end
      ensure
         Result <= Current and then Result <= other
         compare(Result) = 0 or else other.compare(Result) = 0
      end

   max (other: like Current): like Current
         -- Maximum of `Current' and `other'.
         --
         -- See also `min', `in_range'.
      require
         other /= Void
      do
         if Current >= other then
            Result := Current
         else
            Result := other
         end
      ensure
         Result >= Current and then Result >= other
         compare(Result) = 0 or else other.compare(Result) = 0
	 end

	bounded_by (a_min, a_max: like Current): like Current
		-- A value that is equal to Current if it is between the limits set by
		-- a_min and a_max.

		-- Otherwise it's `a_min' if Current is smaller or `a_max' if Current
		-- is greater

		-- It's a shortcut for Current.min(a_max).max(a_min) also known as
		-- "clamp" in the widespread C library Glib 
	do
		if Current<a_min then Result:=a_min
		elseif Current>a_max then Result:=a_max
		else Result:=Current
		end
	ensure 
		correctness: Result.in_range(a_min,a_max)
	end

end -- class COMPARABLE
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
