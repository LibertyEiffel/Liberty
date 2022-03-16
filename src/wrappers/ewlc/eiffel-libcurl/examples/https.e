note
	description: "Https example"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006-2022: Soluciones Informaticas Libres S.A. (Except)
					
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

class HTTPS

inherit
	CURL_EXAMPLE redefine make end

create {ANY}
	make

feature {} -- Creation

	make
		local
			the_curl: CURL
		do
			Precursor
			the_curl := curl
			curl.set_option_string (curl_option_url, "https://login.yahoo.com/")
			check curl.is_valid end
			
			-- These should be used to connect to a server with a self signed certificated:
--			curl.set_option_string (curl_option_ssl_cert, "server private key filename.pem")
--			check curl.is_valid end
			-- Optionally, signed by a CA:
--			curl.set_option_string (curl_option_ca_info, "certificate authority key filename.pem")
--			check curl.is_valid end
			-- Or to avoid security checks:
			curl.set_option_integer (curl_option_ssl_verify_peer, 0)
--			check curl.is_valid end

			-- In our example we will not need any authentication information because the URL
			-- used has a certificate issued by a well known CA
			
			curl.perform
			check curl.is_valid end
			
			print (http_response)
			
		end

end -- class HTTPS
