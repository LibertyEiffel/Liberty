-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class REGEX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	re_compile_fastmap (a_buffer: POINTER): INTEGER 

		-- function re_compile_fastmap (in `/usr/include/regex.h')
               -- re_compile_fastmap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_compile_fastmap"
               }"
               end

	re_compile_pattern (a_pattern: POINTER; a_length: like size_t; a_buffer: POINTER): POINTER 

		-- function re_compile_pattern (in `/usr/include/regex.h')
               -- re_compile_pattern
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_compile_pattern"
               }"
               end

	re_match (a_buffer: POINTER; a_string: POINTER; a_length: INTEGER; a_start: INTEGER; a_regs: POINTER): INTEGER 

		-- function re_match (in `/usr/include/regex.h')
               -- re_match
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_match"
               }"
               end

	re_match_2 (a_buffer: POINTER; a_string1: POINTER; a_length1: INTEGER; a_string2: POINTER; a_length2: INTEGER; a_start: INTEGER; a_regs: POINTER; a_stop: INTEGER): INTEGER 

		-- function re_match_2 (in `/usr/include/regex.h')
               -- re_match_2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_match_2"
               }"
               end

	re_search (a_buffer: POINTER; a_string: POINTER; a_length: INTEGER; a_start: INTEGER; a_range: INTEGER; a_regs: POINTER): INTEGER 

		-- function re_search (in `/usr/include/regex.h')
               -- re_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_search"
               }"
               end

	re_search_2 (a_buffer: POINTER; a_string1: POINTER; a_length1: INTEGER; a_string2: POINTER; a_length2: INTEGER; a_start: INTEGER; a_range: INTEGER; a_regs: POINTER; a_stop: INTEGER): INTEGER 

		-- function re_search_2 (in `/usr/include/regex.h')
               -- re_search_2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_search_2"
               }"
               end

	re_set_registers (a_buffer: POINTER; a_regs: POINTER; a_num_regs: NATURAL; a_starts: POINTER; an_ends: POINTER) 

		-- function re_set_registers (in `/usr/include/regex.h')
               -- re_set_registers
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_set_registers"
               }"
               end

	re_set_syntax (a_syntax: like long_unsigned): like long_unsigned 

		-- function re_set_syntax (in `/usr/include/regex.h')
               -- re_set_syntax
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_set_syntax"
               }"
               end

	re_syntax_options: like long_unsigned
               -- re_syntax_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "re_syntax_options"
               }"
               end

       address_of_re_syntax_options: POINTER
               -- Address of re_syntax_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&re_syntax_options"
               }"
               end

       set_re_syntax_options (a_value: like long_unsigned)
               -- Set variable re_syntax_options value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_re_syntax_options"
               }"
               end

	regcomp (a_preg: POINTER; a_pattern: POINTER; a_cflags: INTEGER): INTEGER 

		-- function regcomp (in `/usr/include/regex.h')
               -- regcomp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "regcomp"
               }"
               end

	regerror (an_errcode: INTEGER; a_preg: POINTER; an_errbuf: POINTER; an_errbuf_size: like size_t): like size_t 

		-- function regerror (in `/usr/include/regex.h')
               -- regerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "regerror"
               }"
               end

	regexec (a_preg: POINTER; a_string: POINTER; a_nmatch: like size_t; a_pmatch: POINTER; an_eflags: INTEGER): INTEGER 

		-- function regexec (in `/usr/include/regex.h')
               -- regexec
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "regexec"
               }"
               end

	regfree (a_preg: POINTER) 

		-- function regfree (in `/usr/include/regex.h')
               -- regfree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "regfree"
               }"
               end


end -- class REGEX_EXTERNALS
