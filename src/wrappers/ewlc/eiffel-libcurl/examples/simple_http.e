note
	description: "Simple http example"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class SIMPLE_HTTP

inherit
	CURL_EXAMPLE redefine make end

create {ANY}
	make

feature {} -- Creation

	make
		do
			Precursor
			curl.set_option_string (curl_option_url, "curl.haxx.se")
			check curl.is_valid end
			
			curl.perform
			check curl.is_valid end
			
			print (http_response)
		end

end -- class SIMPLE_HTTP
