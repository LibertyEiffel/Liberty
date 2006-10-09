indexing
	description: "Gnome Data Access full example."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class FULL_EXAMPLE

inherit GDA

insert 
	ARGUMENTS
	GDA_CONNECTION_OPTIONS_ENUM
creation make

feature 
	default_buffer_size: INTEGER is 1024

	make is
		do
			print ("Starting%N")

			gda.init ("Full eiffel-gda test", "0.1", command_arguments)

			save_data_source
			-- remove_data_source
			list_providers
			
			--gda.main (do_stuff)
			print ("Ending%N")
		end

	save_data_source is
		do
			-- config.save_data_source (a_name, a_provider,
			-- a_connection_string, a_description, Void, -- no username
			-- Void, -- no password False -- i.e.: not global )
		end

	list_providers is
		local iter: ITERATOR [GDA_PROVIDER_INFO]; info: GDA_PROVIDER_INFO
		do
			print ("Providers:")
			from iter:=config.providers.get_new_iterator; iter.start
			until iter.is_off
			loop
				info := iter.item
				print ("Id: `") print (info.id) print ("'%T")
				print ("location: `") print (info.location) print ("' `")
				print (info.description) print ("'%N")
				iter.next
			end
		end

	list_data_sources is
		do
		end

	client: GDA_CLIENT is
		once 
			create Result.make
		end

	connection: GDA_CONNECTION is
		once 
			Result := (client.get_new_connection 
						  ("dsn", "username","password",
							gda_connection_options_read_only))
		ensure not_void: Result /= Void
		end
end -- class FULL_EXAMPLE
