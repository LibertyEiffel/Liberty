class C_FILE
	-- An header file that will be wrapped as a wrapper class containing all the functions and variables defined in that file.

inherit  
	IDENTIFIED_NODE
	STORABLE_NODE
	WRAPPER_CLASS
		redefine
			class_name
		end

insert 
	NAME_CONVERTER 
	FILE_TOOLS

creation make

feature 
	store is
		do
			files.put(Current,id)
			check
				is_named
			end
			symbols.put(Current,c_string_name)
			files_by_name.put(Current,c_string_name)
			create features.make
		end
	
	is_to_be_emitted: BOOLEAN is
		do
			Result := file_exists(c_string_name) and (global or else headers.has(c_string_name))
		end

	emit_wrapper is
		-- Emits into a deferred class named like the file itself the wrappers
		-- for all the function and the variable contained into Current file.
	local path: POSIX_PATH_NAME
	do
		if is_to_be_emitted then
			if on_standard_output then
		 		log(once "Outputting wrapper for functions in file @(1) on standard output.%N",
		 		<<c_string_name>>)
		 		output := std_output
		 	else
		 		create path.make_from_string(directory)
		 		path.add_last(class_name.as_lower+once ".e")
		 		-- if path.is_file then
		 		-- 	log(once "Copying existing file @(1) onto @(1).orig.%N",<<path.to_string>>)
		 		-- 	copy_to(path.to_string, path.to_string+once ".orig")
		 		-- end
		 		log(once "Outputting wrapper for functions found in file @(1) on @(2).%N",
		 		<<c_name.as_utf8, path.to_string>>)
		 		create {TEXT_FILE_WRITE} output.connect_to(path.to_string)
		 	end
		 	emit_header_on(output)
			features.do_all(agent {WRAPPER_FEATURE}.wrap_on(output))
			emit_footer_on(output)
			output.disconnect
		else log(once "Skipping file '@(1)'.%N",<<c_string_name>>)
		end
	end
	
	emit_header_on (a_stream: OUTPUT_STREAM) is
			-- Put on `output' the header on an "external" class named 'class_name'
			-- from the beginning until the "feature {} -- External calls" label
			-- included
		require a_stream/=Void
		do
			 a_stream.put_string(automatically_generated_header)
			 a_stream.put_string(deferred_class)
			 a_stream.put_line(class_name) 
			 -- emit_description_on(class_descriptions.reference_at(class_name),a_stream)
			 a_stream.put_string(inherits_string)
			 a_stream.put_line(once "		-- TODO: insert typedefs class")
			 -- a_stream.put_message(once "%T@(1)%N",<<typedefs_class_name>>)
			 a_stream.put_string(externals_header) --line
		end

	emit_footer_on (a_stream: OUTPUT_STREAM) is
		require a_stream/=Void
		do
			a_stream.put_string(once "%Nend -- class ")
			a_stream.put_line  (class_name)
		end

	suffix: STRING is "_EXTERNALS"

	class_name: STRING is
		-- the name of the Eiffel class that wraps Current. CamelCase is converted into CAMEL_CASE, `suffix' is added at the end, eventual trailing underscores are removed.
	local path: POSIX_PATH_NAME
	do
		if stored_class_name=Void then 
			-- The Eiffel class name for `c_name'; extension is removed,
			-- CamelCase is converted into CAMEL_CASE, dashes are converted to
			-- underscores, `suffix' is added at the endi, eventual; i.e.:
			-- class_name_from_header("/usr/include/foo/bar/maman.h").is_equal("MAMAN_EXTERNALS")
			create path.make_from_string(c_string_name)
			stored_class_name := path.last
			stored_class_name.remove_tail(path.extension.count)
			insert_underscores(stored_class_name)
			-- Remove trailing underscores
			from until stored_class_name.first/='_' loop stored_class_name.remove_first end
			-- Remove spurious underscores at the end
			from until stored_class_name.last/='_' loop stored_class_name.remove_last end
			stored_class_name.replace_all('-','_')
			stored_class_name.to_upper
			stored_class_name.append(suffix)
		end
		Result := stored_class_name
	end
feature -- Content
	features: LINKED_LIST[WRAPPER_FEATURE]
	-- the functions and variables defined in Current file.

-- invariant name.is_equal(once U"File")
end -- class C_FILE

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
