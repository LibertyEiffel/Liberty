indexing
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
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

class EIFFEL_GCC_XML
	
	-- Implementation notes: types are identified by id.
insert 
	ARGUMENTS
	FILE_TOOLS

creation make

feature 
	make is
		do
			process_arguments
			if maker=Void then print_usage
			else maker.process
			end
		end

	maker: CLASS_MAKER

	process_arguments is
		local 
			input: INPUT_STREAM
			headers: HASHED_SET[STRING]
			arg, header, location, module, directory: STRING
			global, verbose, plugin: BOOLEAN
			i: INTEGER
		do
			global:=False; plugin:=False
			create headers.make
			from i:=1 until i>argument_count loop 
				arg := argument(i)
				if arg.is_equal(once "--local") then global:=False
				elseif arg.is_equal(once "--global") then global:=True
				elseif arg.is_equal(once "--plugin") then
					plugin:=True
					i:=i+1
					if i<=argument_count then
						location:=argument(i)
						i:=i+1
						if i<=argument_count then
							module:=argument(i)
							create {PLUGIN_CLASS_MAKER} maker.with_location_and_module (location, module)
						else print_usage
						end
					else print_usage
					end
					not_yet_implemented
				elseif arg.is_equal(once "--header") then
					i:=i+1
					if i<=argument_count then header := argument(i)
					else print_usage
					end
				elseif (arg.is_equal(once "--verbose") or else 
						  arg.is_equal(once "-v")) then verbose:=True
				elseif arg.is_equal(once "--directory") then 
					i:=i+1
					if i<=argument_count then directory := argument(i)
					else print_usage
					end
				elseif file_exists(arg) then 
					-- Current arg should be the XML file. The following 
					-- are headers to process.
					create {TEXT_FILE_READ} input.connect_to(arg)
					from i:=i+1 until i>argument_count loop
						headers.add(argument(i))
						i:=i+1
					end
				else print_usage
				end
				i:=i+1
			end

			if maker=Void then  
				if header/=Void then  create {EXTERNALS_CLASS_MAKER} maker.with_header(header)
				else create {EXTERNALS_CLASS_MAKER} maker.without_header
				end
			end

			maker.set_verbose(verbose)
			maker.set_global(global)

			if directory/=Void then maker.set_directory(directory) end
			if input=Void then
				if verbose then std_output.put_line(once "Using standard input.") end
				maker.set_input(std_input)
			else maker.set_input(input)
			end
		
			if verbose then
				if global then std_output.put_line(once "Generating low-level wrappers for the C features found.")
				else  std_output.put_line(once "Generating low-level wrappers only for the given files.")
				end
				if plugin then std_output.put_line(once "Generating plugin wrappers.")
				else std_output.put_line(once "Generating external wrappers.")
				end
				if not headers.is_empty then
					std_output.put_integer(headers.count)
					std_output.put_string(once " headers: ")
					headers.do_all(agent put_comma_separated_string(std_output,?))
					std_output.put_new_line
				end
			end
		ensure
			maker/=Void
			maker.input.is_connected
		end

	print_usage is
		do
			std_error.put_line 
			(once 
			 "[
			  eiffel_gcc_xml [--verbose|-v] [--local] [--global] [--plugin location module | --header header] output.gcc-xml filenames....
			  
			  --local    produces functions, structures and enumeration 
							 classes only for the given files. Otherwise all the 
							 necessary file will be created. This is the default
							 Only the last global and local flag will be considered.
			  
			  --global   emits wrappers for every features found in the XML 
							 file. For usual wrappers it is normally not needed.
							 Only the last global and local flag will be considered.

			  --plugin location module
							 Emits classes that uses the plugin mechanism instead 
							 of the more traditional C external clauses. location 
							 and module arguments are mandatory; it often useful 
							 to quote them.

			  --header file 
							 Use file as header file in external features instead 
							 of the file where the feature actually reside. Useful
							 for many libraries which provides a single header that
							 includes all the library features.

			  --directory dir
							 Put the generated class in `dir'.

			  -v --verbose   
							 Turn on verbose output, printing information about the
							 ongoing operations.
			  ]")
			die_with_code (exit_success_code)
		end

	put_comma_separated_string (a_stream: OUTPUT_STREAM; a_str: STRING) is
		do
			a_stream.put_string(a_str)
			a_stream.put_string(once ", ")
		end
			
end 
