indexing
	description: "GDA - Gnome Data Access"
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "3.0.2"

	license: "LGPL v2 or later"

deferred class GDA

insert 
	WRAPPER_HANDLER
	LIBGDA_EXTERNALS
	ARGUMENTS

feature {ANY}-- Initialization

	initialization (application_id, version: STRING) is
		--   Initializes the GDA library.
	
		--   application_id :  name of the program.
		--   version : revision number of the program
	do
		gda_init (null_or_string(application_id),
		null_or_string(version),
		argument_count,
		command_arguments.to_external)
		-- TODO: support providing an argument list.  nargs :   number of arguments, usually argc from main().
		--   args :    list of arguments, usually argv from main().
	end
	
	--  gda_get_default_dict ()
	--
	-- GdaDict*            gda_get_default_dict                (void);
	--
	--   Get the default dictionary.
	--
	--   Returns : a not NULL pointer to the default GdaDict dictionary
	--
	
	run is 
		-- Runs the GDA main loop, which is nothing more than the glib main loop,
		-- but with internally added stuff specific for applications using libgda.
	do
		gda_main_run (default_pointer, default_pointer) 
		-- TODO: Implement support for init_func  You can specify a function to
		-- be called after everything has been correctly initialized (that is,
		-- for initializing your own stuff).
	
		--   init_func : function to be called when everything has been initialized.
		--   user_data : data to be passed to the init function.
	end
	
	quit is
		--   Exits the main loop.
	do
		gda_main_quit
	end

end -- class GDA
