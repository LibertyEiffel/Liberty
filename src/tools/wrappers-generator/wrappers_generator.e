class WRAPPERS_GENERATOR
	-- An application that processes the output of gccxml to produce low-level
	-- wrappers for functions, structures and enumerationsi and unions.
	-- Function having argument structures passed by value are not handled.

insert
	ARGUMENTS
	FILE_TOOLS
	SHARED_SETTINGS
	NAME_CONVERTER
	MEMORY

creation {ANY}
	make

feature {ANY}
	make is
		do
			process_arguments
			log(once "@(1) bytes allocated%NLoading XML file: ",<<allocated_bytes.out>>)
			create tree.make(input.url)
			log(once "done. @(1) bytes allocated%N",<<allocated_bytes.out>>)
			if directory = Void then
				log_string(once "Outputting everything on standard output.")
			end
			log_string(once "Making typedefs.%N")
			tree.typedefs.emit_wrappers
			log_string(once "Making enumerations classes.%N")
			tree.enumerations.do_all(agent {C_ENUM}.emit_wrapper)	

			log_string(once "Making external functions classes.%N")
			tree.files.do_all (agent {C_FILE}.emit_wrapper)
			-- log_string(once "Making structure accessing classes.%N")
			-- structures.do_all(agent examine_structure)
			-- log_string(once "Making union accessing classes.%N")
		end

	tree: GCCXML_TREE

	input: INPUT_STREAM

	process_arguments is
		-- Process arguments. If some argument is not understood `print_usage' is invoked and the program exits. 
		local
			arg, avoided, descriptions, flags, typedefs: STRING;
			i: INTEGER
		do
			check
				global = False
				verbose = False
			end
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

				if input = Void then
					log_string(once "Using standard input.")
					input := std_input
				end
				if is_valid_class_name(typedefs) then settings.set_typedefs(typedefs)
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
				end
				if file_exists(flags) then 
					log(once "TODO: Reading enumerations that will be forcefully wrapped as flags from '@(1)'.%N",<<flags>>)
					-- maker.read_flags_from(flags)
				end
 				if file_exists(descriptions) then
					log(once "TODO: Reading descriptions flags from '@(1)'.%N",<<descriptions>>)
					-- maker.read_descriptions_from(descriptions)
				end
 				if file_exists(avoided) then
					log(once "TODO: Reading list of avoided symbols from '@(1)'.%N",<<avoided>>)
					-- maker.read_avoided_from(avoided)
				end

			end
		end

	print_usage is
		do
			std_error.put_line
			(once "wrappers-generator [--verbose|-v] [--local] [--global] [--directory dir] output.gcc-xml filenames....%N%
			%%N%
			%	--local %N%
			%		produces functions, structures and enumeration%N%
			%		classes only for the given files. Otherwise all the%N%
			%		necessary file will be created. This is the default Only%N%
			%		the last global and local flag will be considered.%N%
			%%N%
			%	--global emits wrappers for every features found in the XML%N%
			%		file. For usual wrappers it is normally not needed.%N%
			%		Only the last global and local flag will be considered.%N%
			%%N%
			%  --use-naturals%N%
			%		Wrap unsigned integers with NATURAL classes. This is the%N%
			%		default behaviour.%N%
			%%N%
			%	--use-integers%N%
			%		Wrap unsigned integers with INTEGER classes. Note that%N%
			%		this leads to silent overflows and trimming.%N%
			%%N%
			%  --directory dir%N%
			%		Put the generated classes in `dir'. Otherwise everything is%N%
			%		outputted to standard output%N%
			%%N%
			%  --flags flag-file%N%
			%		Read a list of enumeration that will be forcefully wrapped as %N%
			%		a flag. In fact sometimes there is no way to distinguish when%N%
			%		an enumeration is used as-it-is or to contain flags. If this%N%
			%	    option is not used the program will look for the %"flags%" file.%N%
			%%N%
			%	--apply-patches (not yet implemented)%N%
			%		Apply the patches found in the output directory to the newly%N%
			%		generated classes, i.e. foo.e will be patched by foo.diff%N%
			%%N%
			%	--descriptions descriptions-file%N%
			%		Apply the descriptions found in the description-file. Each line contains%N%
			%		the description of a class or of a class' feature. The syntax for a class %N%
			%		description is `CLASS description', for a feature description is %N%
			%		`CLASS.feature description' Trailing and leading spaces are trimmed; line%N%
			%		starting with `--' are ignored. If this option is not given the program%N%
			%		will look into file %"descriptions%".%N%
			%%N%
			%	--avoided a_file_name%N%
			%		Do not wrap the symbols found in `a_file_name'. If this option is not %N%
			%		given the program will look into file %"avoided%".%N%
			%%N%
			%	--typedefs CLASS_NAME %N%
			%		Wrap typedefs to fundamental types into class CLASS_NAME as%N%
			%		empty queries named with the typedef name and whose type's%N%
			%		the actual type referred by the typedef. These queries will%N%
			%		not be actually used but are useful as anchored types. If%N%
			%		this option is not given the class name will be TYPES.%N%
			%%N%
			%	-v --verbose%N%
			%		Turn on verbose output, printing information about the%N%
			%		ongoing operations.%N")
			die_with_code(exit_success_code)
		end

	put_comma_separated_string (a_stream: OUTPUT_STREAM; a_str: STRING) is
		do
			a_stream.put_string(once "'")
			a_stream.put_string(a_str)
			a_stream.put_string(once "', ")
		end

end -- class WRAPPER_GENERATOR

-- Copyright 2008,2009 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
