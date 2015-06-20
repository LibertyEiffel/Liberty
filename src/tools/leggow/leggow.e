class LEGGOW
	-- Liberty Eiffel Generator of GObjects Wrappers build fully
	-- usable high-level wrappers from the data provided by the
	-- GObject-Introspection infrastructure
	-- https://developer.gnome.org/gi/stable/gi-overview.html
	
	-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
	-- See the Copyright notice at the end of this file.

	-- Please note that at least in the initial releases of this tool I will
	-- mix proper Eiffel design with some low-level calls to the GObject type
	-- system, in order to avoid circular dependecies that may be difficoult to fix.

-- inherit 
-- 	GI_ARG_VISITOR
-- 	GI_CLASS_VISITOR
-- 	GI_CONSTANT_VISITOR
-- 	GI_ENUM_VISITOR
-- 	GI_FIELD_VISITOR
-- 	GI_FUNCTION_VISITOR
-- 	GI_INTERFACE_VISITOR
-- 	GI_OBJECT_VISITOR
-- 	GI_PROPERTY_VISITOR
-- 	GI_SIGNAL_VISITOR
-- 	GI_STRUCT_VISITOR
-- 	GI_UNION_VISITOR
-- 	GI_VFUNC_VISITOR

insert
	-- COMMAND_LINE_TOOLS
	LOGGING
	GTYPE_EXTERNALS 

creation {} main

feature {} -- program entry point
	main is
		do
			parse_arguments
			g_type_init
			library_name := "Gtk"
			namespace := repository.load(library_name,Void)
			repository.loaded_namespaces.print_on(std_output)
			"%NDependencies: ".print_on(std_output);
			repository.dependencies(library_name).print_on(std_output);
			"%N".print_on(std_output);
			repository.namespace_iterator(library_name).do_all(agent {GI_BASE_INFO}.emit_wrapper) --emit(?))
		end

	emit (an_info: GI_BASE_INFO) is
		-- 
	do
		an_info.emit_wrapper
	end

   parse_arguments is
      -- local
      --   i: INTEGER; arg: STRING
      do
         -- level := once "warning"
         -- from i := 1 until i > argument_count
         -- loop
         --    arg := argument(i)
         --    if is_verbose_flag(arg) then level := once "info"
         --    elseif flag_match(once "debug", arg) then level := once "trace"
         --    elseif is_version_flag(arg) then
         --       check
         --          version_flag
         --       end
         --    elseif is_help_flag(arg) then
         --       check
         --          help_flag
         --       end
         --    else
		 --    	-- "Unknown argument or option '#(1)' # arg
         --       die_with_code(exit_failure_code)
         --    end
         --    i := i + 1
         -- end
      end

feature {ANY} -- Program wide enviroment
	repository: GI_REPOSITORY is
		-- The Glib-Object Introspection repository of known libraries/namespaces.
		once
			create Result
		end
   namespace: GI_TYPELIB 
   		-- The initial namespace to wrap
   
   library_name: STRING
   	    -- The name of the library to wrap


feature {ANY}
   command_line_name: STRING is "leggow"
   -- Please note that the query `command_name' contains the name actually used to invoke the current command

   version: STRING is "2013-04-02"

   command_line_help_summary: STRING is "[
      Usage: leggow options 

      Option summary:
        -requisites         Build also all the requisites of library

      Information:
        -help               Display this help information (no test run)
        -version            Display Liberty Eiffel version information (no test run)
        -verbose            Display detailed information about what eiffeltest is doing

      ]"


end -- class LEGGOW
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
-- Copyright(C) 2013: Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
