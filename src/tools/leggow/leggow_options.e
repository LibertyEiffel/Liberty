deferred class LEGGOW_OPTIONS
    -- Command line options of Liberty Eiffel Generator of GObject Wrappers

insert ANY undefine copy, is_equal end -- to avoid clashes with those from classes using this 

feature {}
	library_argument: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
	once
		Result := options_factory.positional_string ("library","the name of the library to wrap")
	end

	all_dependecies_option: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
	once
		Result:=options_factory.option_boolean("r","recursive","Recursively build wrappers for all the required libraries")
	end

    add_prefix_option: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
    once
    Result:=options_factory.option_string("p","prefix","class_prefix", "Add a prefix to all generated classes")
	end

	directory_option: COMMAND_LINE_TYPED_ARGUMENT[DIRECTORY] 
	once
		Result := options_factory.option_directory ("d","directory", "output directory","Set the base directory of the wrappers clusters")
	end

    location_option: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
    once
        Result:=options_factory.option_string("l","location","plugin location", "the location of the plugin used byt generated classes")
	end

    module_name_option: COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING]
    once
        Result:=options_factory.option_string("m","module","module name", "The name of the plugin module used in the generated classess")
	end

	help_option: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
	once
		Result := options_factory.option_boolean("h", "help","Display this help information and exit")
	end

	verbose_option: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
	once
		Result:= options_factory.option_boolean("v","verbose","Display detailed information about what leggow is doing")
	end

	option_version: COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
	once
		Result := options_factory.option_boolean(Void, "version"," Display version and exit)")
	end

	options_factory: COMMAND_LINE_ARGUMENT_FACTORY


end -- class LEGGOW_OPTIONS
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2016-2022: Paolo REDAELLI
--
-- https://www.liberty-eiffel.org
--
