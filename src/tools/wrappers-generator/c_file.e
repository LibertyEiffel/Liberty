class C_FILE

inherit  
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	STORABLE_NODE
	WRAPPED_BY_A_CLASS

insert 
	NAME_CONVERTER 
	FILE_TOOLS

creation make

feature 
	store is
		do
			files.put(Current,id)
		end

	emit_wrapper is
		-- Emits into a deferred class named like the file itself the wrappers
		-- for all the function and the variable contained into Current file.
	local 
		file_functions: LINKED_LIST[C_FUNCTION]
		header: STRING; path: POSIX_PATH_NAME
	do
		header := c_name.to_utf8
		if is_to_be_emitted(header) then
			if on_standard_output then
		 		log(once "Outputting wrapper for functions in file @(1) on standard output.%N",
		 		<<header>>)
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

			file_functions := functions.reference_at(id)
			if file_functions/=Void then
				file_functions.do_all(agent {C_FUNCTION}.wrap_on(output))
			end


			emit_footer_on(output)
			output.disconnect
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
			 a_stream.put_string(struct_inherits) --line
			 a_stream.put_line(once "		-- TODO: insert typedefs class")
			 -- a_stream.put_message(once "insert @(1)%N",<<typedefs_class_name>>)
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
