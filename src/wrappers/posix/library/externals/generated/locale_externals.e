-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class LOCALE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	duplocale (a_dataset: POINTER): POINTER 

		-- function duplocale (in `/usr/include/locale.h')
               -- duplocale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "duplocale"
               }"
               end

	freelocale (a_dataset: POINTER) 

		-- function freelocale (in `/usr/include/locale.h')
               -- freelocale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "freelocale"
               }"
               end

	localeconv: POINTER 

		-- function localeconv (in `/usr/include/locale.h')
               -- localeconv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "localeconv"
               }"
               end

	newlocale (a_category_mask: INTEGER; a_locale: POINTER; a_base: POINTER): POINTER 

		-- function newlocale (in `/usr/include/locale.h')
               -- newlocale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "newlocale"
               }"
               end

	setlocale (a_category: INTEGER; a_locale: POINTER): POINTER 

		-- function setlocale (in `/usr/include/locale.h')
               -- setlocale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setlocale"
               }"
               end

	uselocale (a_dataset: POINTER): POINTER 

		-- function uselocale (in `/usr/include/locale.h')
               -- uselocale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "uselocale"
               }"
               end


end -- class LOCALE_EXTERNALS
