deferred class NAME_CONVERTER
	-- Query features to discover if a symbol name does comply to SmartEiffel's
	-- naming rules and to convert arbitrary C symbols into valid Eiffel names
	-- of classes or features.

insert
	PLATFORM
	EXCEPTIONS

feature {} -- Auxiliary features
	eiffel_feature (a_name: STRING): STRING is
		-- Translate `a_name' content into a proper feature name for the
		-- Gnu-Eiffel language.  "CamelCase" is translated into "camel_case",
		-- "ENOO" is translated into "enoo". Eventual underscores in front of
		-- `a_name' are removed: "__foo" becomes "foo"; symbols starting with
		-- underscores folloed by a number are prefixed with "a_"; reserved
		-- language names and names of features of class ANY are escaped.
	require 
		name_not_void: a_name /= Void
		name_not_empty: not a_name.is_empty

	do
		create Result.copy(a_name)
		-- Remove header underscores.
		from until Result.first /= '_'
		loop Result.remove_first
		end
		-- If first character is a number prepend an `a_'
		if Result.first.is_digit then
			Result.prepend(once "a_")
		end
		insert_underscores(Result)
		-- Remove spurious underscores and the end
		from until Result.last/='_' loop Result.remove_last end
		multiple_underscores_remover.substitute_all_in(Result)
		Result.to_lower
		Result := adapt(Result)
	end

 	eiffel_argument (a_name: STRING): STRING is
			-- Translate `a_name' content into a proper argument placeholderi for
			-- the Gnu-Eiffel language.  "CamelCase" is translated into
			-- "a_camel_case", "ENOO" is translated into "an_enoo". Eventual
			-- underscores in front of `a_name' are removed: "__foo" becomes
			-- "a_foo". See also `eiffel_feature'.
		require
			name_not_void: a_name /= Void
		do
			Result := eiffel_feature(a_name)
			inspect Result.first
			when 'a', 'e', 'o', 'i', 'u' then Result.prepend(once "an_")
			else Result.prepend(once "a_")
			end
			-- The following call should be unnecessary, since we hade already
			-- prepended an English preposition that does not appear in any
			-- SmartEiffel keywords.
			-- Result := adapt(Result)
		end

	insert_underscores (a_string: STRING) is
		-- Insert an underscore ('_') at each case switch of `a_string' except
		-- at first and second character (from lower to upper and from upper to
		-- lower )
	require
		a_string/=Void
		not a_string.is_empty
	local i: INTEGER
	do
		from i:=a_string.lower+2
		until i>a_string.upper loop
			if 	a_string.item(i-1).is_upper /= a_string.item(i).is_upper then
				a_string.insert_character('_',i)
				i:=i+2
			else i:=i+1
			end
		end
	end
	
	multiple_underscores_remover: REGULAR_EXPRESSION is
			-- Replace all multiple occurences of underscore "_" with a single one
		local
			builder: REGULAR_EXPRESSION_BUILDER
		once
			Result := builder.convert_perl_pattern("(\_\_+)")
			Result.prepare_substitution("_")
		end

	is_public_name (a_name: STRING): BOOLEAN is
			-- Does `a_name' start with an alphabetical character? Names
			-- starting with underscores or other strange characters are
			-- usually considered private in C/C++ languages.
		require
			not_void: a_name /= Void
			meaningful_length: a_name.count > 1
		do
			Result := a_name.first.is_letter
		end
	
	is_valid_class_name (a_name: STRING): BOOLEAN is
			-- Does `a_name' represents a valid Eiffel class name? i.e. does it
			-- start with an upper-case letter and contain only upper-case
			-- letters, underscores and numbers?
		require
			a_name /= Void
		local
			i: INTEGER; c: CHARACTER
		do
			Result := a_name.first.is_upper
			from
				i := 2
			until
				Result = False or else i <= a_name.upper
			loop
				c := a_name @ i
				Result := c.is_upper or else c.is_digit or else c = '_'
				i := i + 1
			end
		end

	adapt (a_name: STRING): STRING is
			-- A valid, adapted identifier for an Eiffel feature labelled
			-- `a_name'. Can be either `a_name' itself or a new string
			-- containing an adapatation. Reserved words and those of
			-- features belonging to ANY are "escaped", appending "_external".
		require 
			name_not_void: a_name /= Void
			valid_name: a_name.first /= '_'
		do
			if keywords.has(a_name) or else any_features.has(a_name) then
				Result := a_name + once "_external"
			else
				Result := a_name
			end
		ensure Result/=Void
		end

feature {} -- Constants 
	class_path: POSIX_PATH_NAME is
		-- Shared path buffer used in 'class_name_from_header'.
	once
		create Result.make_empty
	end

	keywords: HASHED_SET[STRING] is
		once
			Result := {HASHED_SET[STRING] << "indexing", "class", "deferred", "expanded", "separate", "end", "inherit", "insert", "creation", "feature", "rename", "redefine", "undefine", "select", "export", "require", "local", "do", "once", "ensure", "alias", "external", "attribute", "if", "then", "else", "elseif", "when", "from", "until", "loop", "check", "debug", "invariant", "variant", "rescue", "obsolete" >> }
		end

	any_features: HASHED_SET[STRING] is
			-- The names of the features contained in class ANY. 
		once
			-- The following "static" definition of the features of ANY
			-- is somehow unacceptable in a perfect world. Yet computing
			-- it each and every time would enlarge the memory usage of
			-- the program wildly, not counting the runtime requirements.
			Result := {HASHED_SET[STRING] << "generating", "generator", "same_dynamic_type", "is_equal", "standard_is_equal", "is_deep_equal", "twin", "copy", "standard_twin", "standard_copy", "deep_twin", "default", "is_default", "print_on", "tagged_out", "out", "out_in_tagged_out_memory", "tagged_out_memory", "fill_tagged_out_memory", "to_pointer", "is_basic_expanded_type", "object_size" >> }
		end

end -- class NAME_CONVERTER

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
