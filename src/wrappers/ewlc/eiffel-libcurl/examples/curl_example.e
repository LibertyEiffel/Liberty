note
	description: "Simple curl example used as parent for other examples"
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

class CURL_EXAMPLE

insert
	CURL_OPTION

feature {} -- Creation

	make
		do
			create curl.make
			check curl.is_valid end
			
			curl.set_option_verbose (1000)
			curl.set_option_post (1)
			
			curl.set_read_callback (agent read_from_string)
			curl.set_write_callback (agent write_to_string)
			
			create http_call.make_empty
			create http_response.make_empty
			str_iter := http_call.get_new_iterator
		end

feature {}

	curl: CURL

	http_call, http_response: STRING

	str_iter: ITERATOR [CHARACTER]

feature {} -- Callbacks

	read_from_string (array: NATIVE_ARRAY [CHARACTER]; size, nmemb: INTEGER): INTEGER
		require
			curl.is_valid
			array.is_not_null
			size >= 0 and nmemb >= 0
		local
			i: INTEGER
		do
			from i := 0
			until i >= nmemb or str_iter.is_off
			loop
				array.put (str_iter.item, i)
				str_iter.next
				i := i+1
			end
			Result := size * i
		ensure
			Result >= 0
			curl.is_valid
		end

	write_to_string (array: NATIVE_ARRAY [CHARACTER]; size, nmemb: INTEGER): INTEGER
		require
			curl.is_valid
			array.is_not_null
			size >= 0 and nmemb >= 0
			http_response /= Void
		local
			i: INTEGER
		do
			from i := 0 until i >= nmemb loop
				http_response.extend (array.item (i))
				i := i+1
			end
			Result := size * i
		ensure
			Result >= 0
			curl.is_valid
		end

end -- class CURL_EXAMPLE
