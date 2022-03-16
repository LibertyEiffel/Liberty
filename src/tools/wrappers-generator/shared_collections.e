deferred class SHARED_COLLECTIONS
   -- Shared collections of various kinds of XML nodes

insert
   ANY
      undefine 
	  	copy, 
        default_create,
		is_equal, 
		out_in_tagged_out_memory
	end
feature {}
   files: HASHED_DICTIONARY[C_FILE, UNICODE_STRING]
      once
         create Result.make
      end

   files_by_name: HASHED_DICTIONARY[C_FILE, ABSTRACT_STRING]
      once
         create Result.make
      end

   headers: HASHED_SET[ABSTRACT_STRING]
      once
         create Result.make
      end

   functions: LINKED_LIST[C_FUNCTION]
      once
         create Result.make
      end

   namespaces: HASHED_DICTIONARY[C_NAMESPACE, UNICODE_STRING]
      once
         create Result.make
      end

   symbols: HASHED_DICTIONARY[NAMED_NODE, ABSTRACT_STRING]
      once
         create Result.make
      end

   typedefs: TYPEDEFS
      once
         create Result.make
      end

   types: HASHED_DICTIONARY[C_TYPE, UNICODE_STRING]
         -- perhaps its a dictionary of WRAPPER_FEATURE or WRAPPABLE_NODE
      once
         create Result.make
      end

   variables: LINKED_LIST[C_VARIABLE]
      once
         create Result.make
      end

   composed_types: HASHED_DICTIONARY[COMPOSED_NODE, UNICODE_STRING]
      once
         create Result.make
      end

feature {}
   flag_enums: WORDS
         -- Enumerations that will be forcefully wrapped as a flag.
      once
         create Result.make
      end

   avoided_symbols: WORDS
         -- Symbols that will not be wrapped.
      once
         create Result.make
      end

feature {}
   -- Buffers
   -- Temporary buffers used to build enumerations and structures external classes
   queries: FORMATTER
      once
         create Result
      end

   setters: FORMATTER
      once
         create Result
      end

   low_level_values: FORMATTER
      once
         create Result
      end

   validity_query: FORMATTER
      once
         create Result
      end

end -- class SHARED_COLLECTIONS
-- Copyright (C) 2008-2022: Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
