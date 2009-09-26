class EIFFEL_GCC_XML
	-- An application that processes the output of gccxml to produce
	-- low-level wrappers for functions, structures and enumerations.
	-- Function having argument structures passed by value are not
	-- handled.

insert
	ARGUMENTS
	FILE_TOOLS
	SHARED_SETTINGS
	NAME_CONVERTER

creation {ANY}
	make

feature {ANY}
	make is
		do
			process_arguments
			if maker = Void then
				print_usage
			else
				maker.process
			end
		end

	maker: CLASS_MAKER

	process_arguments is
		local
			input: INPUT_STREAM; 
			arg, header, location, avoided, module, descriptions, flags, typedefs: STRING;
			plugin: BOOLEAN i: INTEGER
		do
			check
				global = False
				verbose = False
			end
			plugin := False
			flags := once "flags"
			descriptions := once "descriptions"
			avoided := once "avoided"
			typedefs := once "TYPES"
			if argument_count = 0 then
				print_usage
				die_with_code(exit_success_code)
			else
				from
					i := 1
				until
					i > argument_count
				loop
					arg := argument(i)
					if arg.is_equal(once "--local") then settings.set_global(False)
					elseif arg.is_equal(once "--global") then settings.set_global(True)
					elseif arg.is_equal(once "--plugin") then
						plugin := True
						i := i + 1
						if i <= argument_count then
							location := argument(i)
							i := i + 1
							if i <= argument_count then module := argument(i)
							else
								std_error.put_line(once "No plugin module")
								print_usage
							end
						else
							std_error.put_line(once "No plugin location")
							print_usage
						end
					elseif arg.is_equal(once "--header") then
						i := i + 1
						if i <= argument_count then header := argument(i)
						else 
							std_error.put_line(once "No header argument")
							print_usage
						end
					elseif arg.is_equal(once "--use-naturals") then settings.use_naturals
					elseif arg.is_equal(once "--use-integers") then settings.use_integers
					elseif arg.is_equal(once "--apply-patches") then not_yet_implemented
					elseif arg.is_equal(once "--descriptions") then
						i := i + 1
						if i <= argument_count then descriptions := argument(i)
						else
							std_error.put_line(once "No description file given.")
							print_usage
						end
					elseif arg.is_equal(once "--flags") then
						i := i + 1
						if i <= argument_count then flags:=argument(i)
						else
							std_error.put_line(once "No flags file given")
							print_usage
						end
					elseif arg.is_equal(once "--avoided") then
						i := i + 1
						if i <= argument_count then avoided:=argument(i)
						else
							std_error.put_line(once "No avoided file given")
							print_usage
						end
					elseif arg.is_equal(once "--typedefs") then
						i := i+1
						if i <= argument_count then
							typedefs:=argument(i)
						else
							std_error.put_line(once "No typedefs file given")
							print_usage
						end
					elseif arg.is_equal(once "--verbose") or else 
						arg.is_equal(once "-v") then
						settings.set_verbose(True)
					elseif arg.is_equal(once "--directory") then
						i := i + 1
						if i <= argument_count then
							settings.set_directory(argument(i))
						else
							std_error.put_line(once "No directory given")
							print_usage
						end
					else
						if file_exists(arg) then
							-- Current arg should be the XML file. The following
							-- are headers to process.
							create {TEXT_FILE_READ} input.connect_to(arg)
							from i := i + 1
							until i > argument_count
							loop headers.add(argument(i));  i := i + 1
							end
						else
							std_error.put_string(once "Input file does not exist: ")
							std_error.put_line(arg)
							print_usage
						end
					end
					i := i + 1
				end

				if plugin then create {PLUGIN_CLASS_MAKER} maker.with_location_and_module(location, module)	
				else
					if header /= Void 
						then create {EXTERNALS_CLASS_MAKER} maker.with_header(header)
					else create {EXTERNALS_CLASS_MAKER} maker.without_header
					end
				end
								
				if input = Void then
					log_string(once "Using standard input.")
					maker.set_input(std_input)
				else maker.set_input(input)
				end
				if is_valid_class_name(typedefs) then maker.set_typedefs(typedefs)
				else 
					std_error.put_line(typedefs+once " is not a valid class name.")
					print_usage
				end 
				if verbose then
					if global then
						std_error.put_line(once "Generation wrappers for all the C features found.")
					else
						std_error.put_string(once "Generating low-level wrappers only for ")
						std_error.put_integer(headers.count)
						std_error.put_string(once " files: ")
						headers.do_all(agent put_comma_separated_string(std_error, ?))
						std_error.put_new_line
					end
					if plugin then std_error.put_line(once "Generating plugin wrappers.")
					else std_error.put_line(once "Generating external wrappers.")
					end
				end
				if file_exists(flags) then 
					log(once "Reading enumerations that will be forcefully wrapped as flags from '@(1)'.%N",<<flags>>)
					maker.read_flags_from(flags)
				end
 				if file_exists(descriptions) then
					log(once "Reading descriptions flags from '@(1)'.%N",<<descriptions>>)
					maker.read_descriptions_from(descriptions)
				end
 				if file_exists(avoided) then
					log(once "Reading list of avoided symbols from '@(1)'.%N",<<avoided>>)
					maker.read_avoided_from(avoided)
				end

			end
		ensure
			maker /= Void
			maker.input.is_connected
		end

	print_usage is
		do
			std_error.put_line(once "[
			  eiffel_gcc_xml [--verbose|-v] [--local] [--global] --plugin location module | --header header output.gcc-xml filenames....

			  --local produces functions, structures and enumeration
					  classes only for the given files. Otherwise all the
					  necessary file will be created. This is the default Only
					  the last global and local flag will be considered.

			  --global emits wrappers for every features found in the XML
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

			  --use-naturals
							 Wrap unsigned integers with NATURAL classes. This is the
							 default behaviour.

			  --use-integers
							 Wrap unsigned integers with INTEGER classes. Note that
							 this leads to silent overflows and trimming.

			  --directory dir
							 Put the generated class in `dir'. Otherwise everything is outputted to standard output

			  --flags flag-file
			             Read a list of enumeration that will be forcefully wrapped as 
						 a flag. In fact sometimes there is no way to distinguish when
						 an enumeration is used as-it-is or to contain flags. If this
	                     option is not used the program will look for the "flags" file.

			  --apply-patches (not yet implemented)
			             Apply the patches found in the output directory to the newly
						 generated classes, i.e. foo.e will be patched by foo.diff
			  
			  --descriptions descriptions-file
				 Apply the descriptions found in the description-file. Each line contains
				 the description of a class or of a class' feature. The syntax for a class 
				 description is `CLASS description', for a feature description is 
				 `CLASS.feature description' Trailing and leading spaces are trimmed; line
				 starting with `--' are ignored. If this option is not given the program
				 will look into file "descriptions".

			  --avoided a_file_name
			     Do not wrap the symbols found in `a_file_name'. If this option is not 
				 given the program will look into file "avoided".
			
		      --typedefs CLASS_NAME 
				  Wrap typedefs to fundamental types into class CLASS_NAME as
				  empty queries named with the typedef name and whose type's
				  the actual type referred by the typedef. These queries will
				  not be actually used but are useful as anchored types. If
				  this option is not given the class name will be TYPES.

			  -v --verbose
							 Turn on verbose output, printing information about the
							 ongoing operations.
			  ]")
			die_with_code(exit_success_code)
		end

	put_comma_separated_string (a_stream: OUTPUT_STREAM; a_str: STRING) is
		do
			a_stream.put_string(once "'")
			a_stream.put_string(a_str)
			a_stream.put_string(once "', ")
		end

end -- class EIFFEL_GCC_XML

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
