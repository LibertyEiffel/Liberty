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

insert 
	ARGUMENTS
	GDA_CONNECTION_OPTIONS_ENUM
	SHARED_GDA_CONFIG
	SHARED_LIBGDA
	
creation make

feature 
	default_buffer_size: INTEGER is 1024

	make is
		do
			print ("Starting%N")

			libgda.init ("Full eiffel-gda test", "0.1", command_arguments)

			list_providers
			list_data_sources

			print("Using connection ")
			print (connection.server_version) print(" ")
			print(connection.dsn) print(" ")
			print(connection.connection_string) print(" ")
			print(connection.provider) print(" ")
			print(connection.username) print(" ")
			print(connection.password) print(" ")
			print("%N")
					
			print ("Ending%N")
		end


	list_providers is
		local iter: ITERATOR [GDA_PROVIDER_INFO]; info: GDA_PROVIDER_INFO
		do
			print ("Providers:%N")
			from
				iter := gda_config.providers.get_new_iterator
				iter.start
			until
				iter.is_off
			loop
				info := iter.item
				print ("Id: `")
				print (info.id)
				print ("' ")
				-- print ("location: `") print (info.location) print ("'
				print (" `")
				print (info.description)
				print ("'%N")
				iter.next
			end
		end

	list_data_sources is
		local iter: ITERATOR [GDA_DATA_SOURCE_INFO]; source: GDA_DATA_SOURCE_INFO
		do
			print ("Data sources:%N")
			from
				iter := gda_config.data_sources.get_new_iterator
				iter.start
			until
				iter.is_off
			loop
				source := iter.item
				print("name: "); print(source.name); print(", ")
				print("provider: "); print(source.provider); print(", ")
				print("connection_string: `"); print(source.connection_string); print("', ")
				print("description: `") print(source.description); print("', ")
				print("username: %""); print(source.username); print("%", ")
				print("password: %""); print(source.password) 
				
				if source.is_global then
					print ("%" is global%N")
				else
					print ("%" is not global.%N")
				end
				
				iter.next
			end
		end

	client: GDA_CLIENT is
		once 
			create Result.make
		end

	connection: GDA_CONNECTION is
			-- Connection to an example SQLite database
		once
			if not gda_config.has_data_source(database_name) then 
				print ("Creating example database%N")
				gda_config.save_data_source (database_name, provider, connection_string,
												 description, username, password,
												 False -- Not global
												 )
			end
			Result := (client.get_new_connection 
						  (database_name, username, password,
							0 -- No options such as	gda_connection_options_read_only
							))
		ensure 
			not_void: Result /= Void
			-- read_only: (Result.options &&
			-- gda_connection_options_read_only ).to_boolean TODO: this
			-- is bad to read. It would be nice to provide
			-- GDA_CONNECTION.is_read_only and similars.
		end

feature --
	database_name: STRING is "eiffel-gda-example"
	provider: STRING is "SQLite"
	connection_string: STRING is "DB_NAME='example.sqlite'"
	description: STRING is "Example database for eiffel-gda"
	username: STRING is ""
	password: STRING is ""

feature -- Warnings
	warning is
		once
			print ("There was a little bug: gda_config_save_data_source() does not create the configuration directory ~/.libgda, so you have to do it.")
		end
end -- class FULL_EXAMPLE
