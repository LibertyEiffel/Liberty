-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class FILENAMES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	filename_cmp (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- filename_cmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	filename_eq (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- filename_eq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	filename_hash (a_s: POINTER): NATURAL 
               -- filename_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	filename_ncmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 
               -- filename_ncmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class FILENAMES_EXTERNALS
