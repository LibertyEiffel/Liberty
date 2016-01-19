class QUARK_EXAMPLE

create {ANY} make
feature {ANY}
	quark, another, unexisting: G_QUARK
	make is
		do
			create quark.from_string (once "Ciccio")
			create another.from_string (once "Ciccio")
			
			(once "Quark for string `").print_on(std_output)
			quark.to_string.print_on(std_output)
			(once "' is ").print_on(std_output)
			quark.quark.print_on(std_output)
			(once "%N").print_on(std_output)

			(once "Also the different string `").print_on(std_output)
			another.to_string.print_on(std_output)
			(once "' has quark ").print_on(std_output)
			another.quark.print_on(std_output)
			(once "%N").print_on(std_output)

			(once "While string `Bombolo' ").print_on(std_output)
			create unexisting.try_string (once "Bombolo")
			if unexisting.is_valid then
				(once " has a quark! Something's wrong!%N").print_on(std_output)
			else
				(once " doesn't have a quark (correctly)%N").print_on(std_output)
			end
		end
end	

-- Copyright (C) 2005, 2009 Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hopeOA that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 
				
