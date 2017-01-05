deferred class OPAQUE_TYPE
   -- A wrapper that is not is completely defined in its underlying C interface.
   
   -- Such types must be handled by reference, usually using a pointer. Not
   -- knowing their actual size it cannot be allocated ineither created by an
   -- Eiffel wrapper.

   -- See also http://en.wikipedia.org/wiki/Opaque_data_type

inherit
   WRAPPER

feature {ANY}
   copy (another: like Current)
      do
         handle := another.handle
      end

   is_equal (another: like Current): BOOLEAN
      do
         Result := handle = another.handle
      end

feature {WRAPPER, WRAPPER_HANDLER}
   struct_size: like size_t
      do
         breakpoint
         std_error.put_string("Trying to access the structure size of the opaque type '")
         std_error.put_string(generating_type)
         std_error.put_string(".%N%N")
         crash
      end

end -- class OPAQUE_TYPE

-- Copyright (C) 2013-2017: Paolo Redaelli

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 
