deferred class SHARED_SETTINGS
	-- Access to the `settings' singleton and commodity features like "proxy"
	-- setters, queries and logging facilities.
insert ANY 
	undefine 
		copy, 
		is_equal,
		out_in_tagged_out_memory
	end
feature {ANY}
	settings: SETTINGS is
			-- The singleton to access all the shared settings
		once
			create Result
		end 

	headers: WORDS is once create Result.make end
	
	directory: STRING is
		-- Shortcut for settings.directory
		do
			Result := settings.directory
		end

feature {ANY} -- Plugin
	include: TEXT_FILE_WRITE is
		once
			create Result.make
		end
	source:  TEXT_FILE_WRITE is
		once 
			create Result.make
		end


feature {ANY} -- Syntactic sugar
	verbose: BOOLEAN is
		do
			Result := settings.verbose
		end

	global: BOOLEAN is
		do
			Result := settings.global
		end

feature {} -- Type mangling
	dequalify (an_id: UNICODE_STRING): UNICODE_STRING is
		-- `an_id' without the type qualifier used by GccXml to mark the
		-- identification labels.

		-- "const", "reference" and "volatile" qualifier are represented in a
		-- CvQualifiedType node adding 'c', 'r' and 'v' to the identifies. i.e.
		-- if "int" has id "_422" a  "const int foo" argument type will be of
		-- type CvQualifiedType with it "_422c". The same rule is used - as far
		-- as I know - also for reference and volatile types.

		-- Result is identical to `an_id' if it does not end with 'c', 'r' and
		-- 'v'; otherwise it is a copy of `an_id' with the last character ('c',
		-- 'r' or 'v') removed. 
	require
		not_void: an_id /= Void
	do
		inspect an_id.last.to_character
		when 'c', 'r', 'v' then
		Result := an_id.substring(an_id.lower, an_id.upper - 1)
		else Result := an_id
		end
		--debug 
		-- 	log(once "dequalify(@(1))=@(2)",<<an_id.out,Result.out>>)
		--end
	end


feature {} -- Auxiliary features
	buffer: FORMATTER is
		-- Buffer to render the text of the feature currently being
		-- wrapped (a function call, a structure or an enumeration).
	once 
		create Result
	end

	formatter: FORMATTER is
		-- Shared formatter used to format various strings.
	once
		create Result
	end

feature {} -- Constants
	comment: STRING is "%N%T%T-- "

	variadic_function_note: STRING is " (variadic call) "

	unwrappable_function_note: STRING is "%T%T%T-- Unwrappable function%N%T%Tobsolete %"Unwrappable C function%"%N"

	expanded_class: STRING is "expanded class "

	deferred_class: STRING is "deferred class "

	inherits_string: STRING is "%N%Ninsert ANY undefine is_equal, copy end%N%N"

	queries_header: STRING is "feature {} -- Low-level queries%N%N"

	setters_header: STRING is "feature {} -- Low-level setters%N%N"

	externals_header: STRING is "feature {} -- External calls%N%N"

	typedefs_features_header: STRING is "feature {ANY} -- C type definitions (typedefs)%N"

	footer: STRING is "end%N"

	automatically_generated_header: STRING is "[
		-- This file have been created by wrapper-generator.
		-- Any change will be lost by the next execution of the tool.


		]"

	automatically_generated_c_file: STRING is "[
		/*
		** This file have been created by wrapper-generator.
		** Any change will be lost by the next execution of the tool.
		*/

		]"

	automatically_patched_header: STRING is 
		-- Label 
		"[
		-- This file have been automatically created combining the output file
		-- of eiffel-gcc-xml @(1)
		-- with the differences patches found into @(2)

		-- Any change will be lost by the next execution of the tool.

		]"

feature {} -- Logging
	logger: STRING_PRINTER is
		-- The formatter used to log messages
	once
		create Result.make(std_error)
	ensure Result/=Void
	end

	log_string (a_string: ABSTRACT_STRING) is
		-- If verbose print `a_string' to logger's output
	require a_string/=Void
	do
		if verbose then
			std_error.put_string(a_string)
		end
	end

	log_word (a_word: STRING) is
		-- If verboe print 'a_word' and a whitespace to logger's output 
	require a_word/=Void
	do
		if verbose then
			std_error.put_string(a_word)
			std_error.put_character(' ')
		end
	end

	log (a_message: TRAVERSABLE[CHARACTER]; some_arguments: TRAVERSABLE[ABSTRACT_STRING]) is
			-- Utility feature to replace "if verbose then logger.put_message(foo,bar) end" with "log(foo,bar)"
		require
			a_message /= Void
			some_arguments /= Void
		do
			if verbose then
				logger.put_message(a_message, some_arguments)
			end
		end
end -- class SHARED_SETTINGS

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

