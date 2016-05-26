-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class WORDEXP_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	wordexp (a_words: POINTER; a_pwordexp: POINTER; a_flags: INTEGER): INTEGER 

		-- function wordexp (in `/usr/include/wordexp.h')
               -- wordexp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wordexp"
               }"
               end

	wordfree (a_wordexp: POINTER) 

		-- function wordfree (in `/usr/include/wordexp.h')
               -- wordfree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wordfree"
               }"
               end


end -- class WORDEXP_EXTERNALS
