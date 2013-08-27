deferred class SHARED_COLLECTIONS
	-- Shared collections of various kinds of XML nodes
insert ANY 
	undefine 
		copy, 
		is_equal,
		out_in_tagged_out_memory
	end

feature {ANY}
	files: HASHED_DICTIONARY[C_FILE, UNICODE_STRING] is once create Result.make end
	files_by_name: HASHED_DICTIONARY[C_FILE, STRING] is once create Result.make end
	functions: LINKED_LIST[C_FUNCTION] is once create Result.make end
	namespaces: HASHED_DICTIONARY[C_NAMESPACE, UNICODE_STRING] is once create Result.make end
	symbols: HASHED_DICTIONARY[NAMED_NODE, STRING] is once create Result.make end
	typedefs: TYPEDEFS is once create Result.make end
	types: HASHED_DICTIONARY[TYPED_NODE, UNICODE_STRING] is once create Result.make end
	variables: LINKED_LIST[C_VARIABLE] is once create Result.make end
	composed_types: HASHED_DICTIONARY[COMPOSED_NODE, UNICODE_STRING] is once create Result.make end

feature {ANY}
	flags: WORDS is
		-- Enumerations that will be forcefully wrapped as a flag.
	once
		create Result.make
	end

	avoided: WORDS is
		-- Symbols that will not be wrapped.
	once
		create Result.make
	end

feature {} -- Buffers
	-- Temporary buffers used to build enumerations and structures external classes
	queries: FORMATTER is once create Result end 

	setters: FORMATTER is once create Result end 

	low_level_values: FORMATTER is once create Result end 

	validity_query: FORMATTER is once create Result end 

end -- class SHARED_COLLECTIONS
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
