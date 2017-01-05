class TYPEDEFS
   -- A dictionary of C_TYPEDEFs accessible by their names
   -- The contained typedefs will be wrapped together as dummy queries into a deferred class
   -- When the wrappers generator command is invoked with the proper flag
   -- ("--standard-typedefs" ) it will also emit the queries for C types that
   -- have different sizes on different architectures and for the type
   -- definition of C99 standard.
   -- Each query is named like a C typedef and its Result type is the
   -- Eiffel equivalent of the fundamental type the typedef refers to.
   -- For example:
   -- gsize: INTEGER_64
   --    -- typedef unsigned long int gsize;
   -- do
   -- end
   -- Those queries shall never be invoked but rather used in other
   -- features as anchors like: do_stuff (a_size: like gsize)

inherit
   LINKED_LIST[C_TYPEDEF]

insert
   SHARED_SETTINGS
   SHARED_COLLECTIONS 

create {ANY}
   make

feature {ANY}
   file: OUTPUT_STREAM

   emit_wrappers
      local
         path: POSIX_PATH_NAME
      do
         create path.make_from_string(directory)
         path.add_last(settings.typedefs.as_lower + once ".e")
         log(once "Outputting anchor queries (for typedefs) into #(1) on `#(2)'.%N" 
		 	# settings.typedefs # path.to_string )

         create {TEXT_FILE_WRITE} file.connect_to(path.to_string)

         file.put_string(automatically_generated_header)
         file.put_string(deferred_class)
         file.put_string(settings.typedefs)
         file.put_new_line
         file.put_string(inherits_string)
         if settings.are_standard_typedefs_emitted then
            file.put_string(typedefs_features_header)
            emit_variable_sized_typedefs
            --      emit_standard_typedefs
         else
            file.put_string("%T" | settings.standard_typedefs_class | "%N%N")
         end

         file.put_string(typedefs_features_header)
         for_each(agent (a_typedef:C_TYPEDEF) do
            if a_typedef.is_to_be_emitted  then
                log("Wrapping typedef #(1)%N" # a_typedef.c_string_name)
                a_typedef.wrap_on(file) 
            else 
                log("Typedef '#(1)' (at line #(2)) is not to be emitted%N" # a_typedef.c_string_name # &a_typedef.line )
            end
         end(?))
         file.put_string(footer)
         file.disconnect
         file := Void
      end

   emit_variable_sized_typedefs
         -- Emit dummy queries useful for anchored declarations (i.e. "like
         -- long") for C types that can have different sizes on different
         -- architectures.
      do
         file.put_string("feature {ANY} -- variable-size types%N%
                %       long: INTEGER_#(1)%N%
                %               -- a query with the same type of c 'long int'. useful when dealing with%N%
                %               -- code that uses long int variable: just insert th class and mark%N%
                %               -- the type as 'like long'%N%
                %       do%N%
                %               -- empty by design%N%
                %       end%N%
                %%N%
                %   long_unsigned: NATURAL_#(2)%N%
                %               -- a query with the same type of c 'long unsigned int'. useful when dealing with%N%
                %               -- code that uses long int variable: just insert th class and mark%N%
                %               -- the type as 'like long_unsigned'%N%
                %       do%N%
                %               -- empty by design%N%
                %       end%N%N" # &long_int_size # &long_unsigned_int_size)
      end

   emit_standard_typedefs
      do
         file.put_string("feature {ANY} -- Memory related type definitions%N%
                        %       size_t: NATURAL_#(1)  do end%N%N%
                        %   ssize_t: INTEGER_#(2)  do end%N%N%
                        %       ptrdiff_t: INTEGER_#(3)  do end%N%N" # &size_t_size # &ssize_t_size # &ptrdiff_t_size)
         file.put_string("feature {ANY} -- Standard C type definitions%N%
                        %       -- All those queries are empty by design, meant to be used as anchored declarations%N%N%
                        %       -- Exact-width integer types%N%
                        %       -- Integer types having exactly the specified width %N%
                        %       int8_t: INTEGER_#(1)  do end%N%
                        %       uint8_t: NATURAL_#(2)  do end%N%
                        %       int16_t: INTEGER_#(3)  do end%N%
                        %       uint16_t: NATURAL_#(4)  do end%N%
                        %       int32_t: INTEGER_#(5)  do end%N%
                        %       uint32_t: NATURAL_#(6)  do end%N%
                        %       int64_t: INTEGER_#(7)  do end%N%
                        %       uint64_t: NATURAL_#(8)  do end%N%
                        %%N" # &int8_t_size # &uint8_t_size # &int16_t_size # &uint16_t_size # &int32_t_size # &uint32_t_size # &int64_t_size # &uint64_t_size)

         file.put_string("       -- Integer types capable of holding object pointers%N%
                        %       -- These allow you to declare variables of the same size as a pointer.%N%
                        %       intptr_t: INTEGER_#(1)  do end%N%
                        %       uintptr_t: NATURAL_#(2)  do end%N%
                        %%N" # &intptr_t_size # &uintptr_t_size)

         file.put_string("       -- Minimum-width integer types%N%
                        %       -- Integer types having at least the specified width%N%
                        %       int_least8_t: INTEGER_#(1)  do end%N%
                        %       uint_least8_t: NATURAL_#(2)  do end%N%
                        %       int_least16_t: INTEGER_#(3)  do end%N%
                        %       uint_least16_t: NATURAL_#(4)  do end%N%
                        %       int_least32_t: INTEGER_#(5)  do end%N%
                        %       uint_least32_t: NATURAL_#(6)  do end%N%
                        %       int_least64_t: INTEGER_#(7)  do end%N%
                        %       uint_least64_t: NATURAL_#(8)  do end%N%
                        %%N" # &int_least8_t_size # &uint_least8_t_size # &int_least16_t_size # &uint_least16_t_size # &int_least32_t_size # &uint_least32_t_size # &int_least64_t_size # &uint_least64_t_size)

         file.put_string("       -- Fastest minimum-width integer types%N%
                        %       -- Integer types being usually fastest having at least the specified width%N%
                        %       int_fast8_t: INTEGER_#(1)  do end%N%
                        %       uint_fast8_t: NATURAL_#(2)  do end%N%
                        %       int_fast16_t: INTEGER_#(3)  do end%N%
                        %       uint_fast16_t: NATURAL_#(4)  do end%N%
                        %       int_fast32_t: INTEGER_#(5)  do end%N%
                        %       uint_fast32_t: NATURAL_#(6)  do end%N%
                        %       int_fast64_t: INTEGER_#(7)  do end%N%
                        %       uint_fast64_t: NATURAL_#(8)  do end%N%
                        %%N" # &int_fast8_t_size # &uint_fast8_t_size # &int_fast16_t_size # &uint_fast16_t_size # &int_fast32_t_size # &uint_fast32_t_size # &int_fast64_t_size # &uint_fast64_t_size)

         file.put_string("       -- Greatest-width integer types%N%
                        %       -- Types designating integer data capable of representing any value of any integer type in the corresponding signed or unsigned category%N%
                        %       intmax_t: INTEGER_#(1)  do end%N%
                        %       uintmax_t: NATURAL_#(2)  do end%N%
                        %%N" # &intmax_t_size # &uintmax_t_size)
      end

feature {} -- Actual size queries
   long_int_size: INTEGER
      external "C inline"
      alias "(8 * sizeof(long int))"
      end

   long_unsigned_int_size: INTEGER
      external "C inline"
      alias "(8 * sizeof(long unsigned int))"
      end

   size_t_size: INTEGER
      external "C inline use <stddef.h>"
      alias "(8 * sizeof(size_t))"
      end

   ssize_t_size: INTEGER
      external "C inline use <stddef.h>"
      alias "(8 * sizeof(ssize_t))"
      end

   ptrdiff_t_size: INTEGER
      external "C inline use <stddef.h>"
      alias "(8 * sizeof(ptrdiff_t))"
      end

   int8_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int8_t))"
      end

   uint8_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint8_t))"
      end

   int16_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int16_t))"
      end

   uint16_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint16_t))"
      end

   int32_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int32_t))"
      end

   uint32_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint32_t))"
      end

   int64_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int64_t))"
      end

   uint64_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint64_t))"
      end

   intptr_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(intptr_t))"
      end

   uintptr_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uintptr_t))"
      end

   int_least8_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_least8_t))"
      end

   uint_least8_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_least8_t))"
      end

   int_least16_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_least16_t))"
      end

   uint_least16_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_least16_t))"
      end

   int_least32_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_least32_t))"
      end

   uint_least32_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_least32_t))"
      end

   int_least64_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_least64_t))"
      end

   uint_least64_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_least64_t))"
      end

   int_fast8_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_fast8_t))"
      end

   uint_fast8_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_fast8_t))"
      end

   int_fast16_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_fast16_t))"
      end

   uint_fast16_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_fast16_t))"
      end

   int_fast32_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_fast32_t))"
      end

   uint_fast32_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_fast32_t))"
      end

   int_fast64_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(int_fast64_t))"
      end

   uint_fast64_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uint_fast64_t))"
      end

   intmax_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(intmax_t))"
      end

   uintmax_t_size: INTEGER
      external "C inline use <stdint.h>"
      alias "(8 * sizeof(uintmax_t))"
      end

end -- class TYPEDEFS

-- Copyright (C) 2008-2017: Paolo Redaelli
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
