indexing
	description: "   libgda -- Library initialization."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class LIBGDA

insert
	SINGLETON
	
creation  {SHARED_LIBGDA}
	make
	
feature {} -- creation
	make is
		do
		end
	
feature {} -- size
	is_initialized: BOOLEAN
			-- Has the Gnome Data Access library been initialized?
	
	init (an_application_id, a_version: STRING; some_arguments: FAST_ARRAY [STRING]) is
			-- Initializes the GDA library.  `an_application_id': name of
			-- the program. `a_version': revision number of the program.
			-- `some_arguments': list of arguments, usually argv from 
			-- main(). TODO: `some_arguments' is currently ignored. 
			-- Support it.
		require
			id_not_void: an_application_id /= Void
			version_not_void: a_version /= Void
			arguments_not_void: some_arguments /= Void
		once
			-- nargs :   number of arguments, usually argc from main().
			-- args :    list of arguments, usually argv from main().
			gda_init (an_application_id.to_external, a_version.to_external,
						 some_arguments.count, some_arguments.to_external)
			is_initialized := True
		end
	
	run is
			-- Runs the GDA main loop, which is nothing more than the
			-- Bonobo main loop, but with internally added stuff specific
			-- for applications using libgda.
		
			-- You can specify a function to be called after everything
			-- has been correctly initialized (that is, for initializing
			-- your own stuff).

			-- TODO: support for `an_initialization_function', a function to
			-- be called when everything has been initialized.
		do
			gda_main_run (default_pointer, default_pointer)
		end

	quit is
			-- Exits the main loop.
		do
			gda_main_quit
		end
	
feature {} -- External calls
	gda_init (app_id, version: POINTER; nargs: INTEGER; args: POINTER) is
			--  void gda_init (const gchar *app_id, const gchar *version, gint nargs, gchar *args[])
		external "C use <libgda/libgda.h>"
		end
	
	--  void (*GdaInitFunc) (gpointer user_data)
	
	gda_main_run (init_func, user_data: POINTER) is
			--  void gda_main_run (GdaInitFunc init_func, gpointer user_data)
		external "C use <libgda/libgda.h>"
		end

	gda_main_quit is
			--  void gda_main_quit (void)
		external "C use <libgda/libgda.h>"
		end

end
