class WRAPPERS_GENERATOR
	-- An application that processes the output of gccxml to produce low-level
	-- wrappers for functions, structures and enumerationsi and unions.
	-- Function having argument structures passed by value are not handled.

insert
	ARGUMENTS
	FILE_TOOLS
	SHARED_SETTINGS
	NAME_CONVERTER

create {ANY}
	make

feature {ANY}
	make is
		do
			log_string(once "wrappers generator rel 0.2%N")
			process_arguments
			log_string(once "Loading XML file: ")
			create tree.make(input.url)
			log_string(once "done.%N")
			open_plugin_files
			if file_exists(avoided) and then is_file(avoided) then
				log(once "Reading list of avoided symbols from '@(1)'.%N",<<avoided>>)
				tree.read_avoided_from(avoided)
			end
			if file_exists(moved) and then is_file(moved) then
				log(once "Reading symbols to be moved/renamed from '@(1)'.%N",<<moved>>)
				tree.read_moved_from(moved)
			end
			if file_exists(flags) and then is_file(flags) then
				log(once "Reading enumerations that will be forcefully wrapped as flags from '@(1)'.%N",<<flags>>)
				tree.read_flags_from(flags)
			end
			if file_exists(descriptions) and then is_file(descriptions) then
				log(once "Reading descriptions flags from '@(1)'.%N",<<descriptions>>)
				tree.read_descriptions_from(descriptions)
			end

			log_string(once "Making wrappers.%N")
			tree.emit_wrappers
			-- tree.namespaces.do_all(agent {GCCXML_NODE}.emit_wrappers)
			close_plugin_files
		end

	tree: GCCXML_TREE

	input: INPUT_STREAM

	path: POSIX_PATH_NAME
	-- PAth of the input XML file (made by gccxml).

	preprocessor_label: STRING

	avoided: STRING 
		-- The name of the file containing the symbols that will not be wrapped.

	renamed: STRING
		-- The name of the file containing symbols that will be renamed and their final name.

	moved: STRING 
		-- The name of the file containing symbols that will be moved -
		-- possibly while being renamed - into a different class from the
		-- default one; each symbol is coupled with its final place and name.

	flags: STRING
		-- The name of the file containing symbols that will be forcefully
		-- wrapped as flags.

	descriptions: STRING
		-- The name of the file that contains the descriptions of the features.

	process_arguments is
		-- Process arguments. If some argument is not understood `print_usage' is invoked and the program exits. 
		local
			arg, gccxml_prefix: STRING;
			i: INTEGER
		do
			check
				global = False
				verbose = False
			end
			-- Setting defaults
			flags := once "flags"
			descriptions := once "descriptions"
			avoided := once "avoided"
			renamed := once "renamed"
			moved := once "moved"

			if argument_count = 0 then
				print_usage
				die_with_code(exit_success_code)
			else
				from i := 1
				until i > argument_count
				loop
					arg := argument(i)
					if arg.is_equal(once "--local") then settings.set_global(False)
					elseif arg.is_equal(once "--global") then settings.set_global(True)
					elseif arg.is_equal(once "--standard-typedefs") then settings.set_standard_typedefs(True)
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
					elseif arg.is_equal(once "--moved") then
						not_yet_implemented
						i := i + 1
						if i <= argument_count then moved:=argument(i)
						else
							std_error.put_line(once "No moved functions file given")
							print_usage
						end
					elseif arg.is_equal(once "--verbose") or else 
						arg.is_equal(once "-v") then
						settings.set_verbose(True)
					-- TODO: re-enable grouping output on standard output
					-- elseif arg.is_equal(once "--on-standard-output") then
					-- 	settings.set_directory(Void)
					else
						if file_exists(arg) then
							-- Current arg should be the XML file. The following
							-- are headers to process.
							create path.make_from_string(arg)
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
					log_string(once "Using standard input. Prefix will be the basename of the current directory.")
					create path.make_current
					input := std_input
				end
				
				gccxml_prefix := path.last.twin
				gccxml_prefix.remove_tail(path.extension.count)
				settings.set_typedefs (eiffel_class_name(gccxml_prefix,"_TYPES"))
				preprocessor_label := eiffel_class_name(gccxml_prefix,"_LIBERTY_PLUGIN")

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
			end
		end

	open_plugin_files is
		local cwd,plugin: DIRECTORY; file: FILE; bd: BASIC_DIRECTORY;
		do	
			create cwd.scan_current_working_directory
			if not cwd.has_file(once "plugin") then 
				if not bd.create_new_directory(once "plugin") then
					log_string("Couldn't create plugin directory")
					die_with_code(exit_failure_code)
				end
			end
			file := cwd.file("plugin")
			if not file.is_directory then
				log_string("%'plugin' is not a directory")
				die_with_code(exit_failure_code)
			end
			
			plugin := file.as_directory
			if not plugin.has_file(once "c") then 
				if not bd.create_new_directory(once "plugin/c") then
					log_string("Couldn't create plugin/c directory")
					die_with_code(exit_failure_code)
				end
			end
			file := plugin.file(once "c")
			if not file.is_directory then
				log_string("%'plugin/c' is not a directory")
				die_with_code(exit_failure_code)
			end

			-- TODO: check that both pdirectory exists.
			include.connect_to(once "plugin/c/plugin.h")
			include.put_string(automatically_generated_c_file)
			source.connect_to(once "plugin/c/plugin.c")
			source.put_string(automatically_generated_c_file)
			--source.put_string("#include %"plugin.h%"")
			source.put_line("#ifndef "+preprocessor_label+"%N%
			%#	define "+preprocessor_label)
		ensure 
			include.is_connected
			source.is_connected
		end

	close_plugin_files is
		do
			source.put_line("#endif")
			source.disconnect
			include.disconnect
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
			%	--flags flag-file%N%
			%		Read a list of enumeration that will be forcefully wrapped as %N%
			%		a flag. In fact sometimes there is no way to distinguish when%N%
			%		an enumeration is used as-it-is or to contain flags. If this%N%
			%	    option is not used the program will look for the %"flags%" file.%N%
			%%N%
			%	--moved moved-file%N%
			%		Read from `moved-file' a list of functions with the Liberty class they%N%
			%		wrapped in; sometimes actual function declaration is not made in a public%N%
			%		header but in hidden places, i.e. memcpy. If this option is not given the%N%
			%		program will look into file %"moved%".%N%
			%%N%
			%	--descriptions descriptions-file%N%
			%		Apply the descriptions found in the description-file. Each line contains%N%
			%		the description of a class or of a class' feature. The syntax for a class %N%
			%		description is `CLASS description', for a feature description is %N%
			%		`CLASS.feature description' Trailing and leading spaces are trimmed; line%N%
			%		starting with `--' are ignored. If this option is not given the program%N%
			%		will look into file %"descriptions%".%N%
			%%N%
			%	--standard-typedefs%N%
			%		Emit dummy queries useful for anchored declarations (i.e. %"like long%")%N%
			%		for C types that can have different sizes on different architectures and for%N%
			%		the typedefs defined in the C99 standard.%N%
			%		%N%
			%%N%
			%	--avoided a_file_name%N%
			%		Do not wrap the symbols found in `a_file_name'. If this option is not %N%
			%		given the program will look into file %"avoided%".%N%
			%%N%
			%	-v --verbose%N%
			%		Turn on verbose output, printing information about the%N%
			%		ongoing operations.%N%
			%%N%
			% The basename of the provided XML file made by gccxml will be used %N%
			% as prefix for the typedef class and proprocessor symbol.%N")
			die_with_code(exit_success_code)
		end

	put_comma_separated_string (a_stream: OUTPUT_STREAM; a_str: STRING) is
		do
			a_stream.put_string(once "'")
			a_stream.put_string(a_str)
			a_stream.put_string(once "', ")
		end

end -- class WRAPPER_GENERATOR

-- Copyright 2008,2009,2010 Paolo Redaelli

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
