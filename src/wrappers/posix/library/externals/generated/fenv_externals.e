-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FENV_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	feclearexcept (an_excepts: INTEGER): INTEGER 

		-- function feclearexcept (in `/usr/include/fenv.h')
               -- feclearexcept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feclearexcept"
               }"
               end

	fedisableexcept (an_excepts: INTEGER): INTEGER 

		-- function fedisableexcept (in `/usr/include/fenv.h')
               -- fedisableexcept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fedisableexcept"
               }"
               end

	feenableexcept (an_excepts: INTEGER): INTEGER 

		-- function feenableexcept (in `/usr/include/fenv.h')
               -- feenableexcept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feenableexcept"
               }"
               end

	fegetenv (an_envp: POINTER): INTEGER 

		-- function fegetenv (in `/usr/include/fenv.h')
               -- fegetenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fegetenv"
               }"
               end

	fegetexcept: INTEGER 

		-- function fegetexcept (in `/usr/include/fenv.h')
               -- fegetexcept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fegetexcept"
               }"
               end

	fegetexceptflag (a_flagp: POINTER; an_excepts: INTEGER): INTEGER 

		-- function fegetexceptflag (in `/usr/include/fenv.h')
               -- fegetexceptflag
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fegetexceptflag"
               }"
               end

	fegetround: INTEGER 

		-- function fegetround (in `/usr/include/fenv.h')
               -- fegetround
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fegetround"
               }"
               end

	feholdexcept (an_envp: POINTER): INTEGER 

		-- function feholdexcept (in `/usr/include/fenv.h')
               -- feholdexcept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feholdexcept"
               }"
               end

	feraiseexcept (an_excepts: INTEGER): INTEGER 

		-- function feraiseexcept (in `/usr/include/fenv.h')
               -- feraiseexcept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feraiseexcept"
               }"
               end

	fesetenv (an_envp: POINTER): INTEGER 

		-- function fesetenv (in `/usr/include/fenv.h')
               -- fesetenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fesetenv"
               }"
               end

	fesetexceptflag (a_flagp: POINTER; an_excepts: INTEGER): INTEGER 

		-- function fesetexceptflag (in `/usr/include/fenv.h')
               -- fesetexceptflag
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fesetexceptflag"
               }"
               end

	fesetround (a_rounding_direction: INTEGER): INTEGER 

		-- function fesetround (in `/usr/include/fenv.h')
               -- fesetround
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fesetround"
               }"
               end

	fetestexcept (an_excepts: INTEGER): INTEGER 

		-- function fetestexcept (in `/usr/include/fenv.h')
               -- fetestexcept
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fetestexcept"
               }"
               end

	feupdateenv (an_envp: POINTER): INTEGER 

		-- function feupdateenv (in `/usr/include/fenv.h')
               -- feupdateenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feupdateenv"
               }"
               end


end -- class FENV_EXTERNALS
