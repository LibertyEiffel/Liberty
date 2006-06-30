indexing
	description: "Callback for `change-current-page' signal."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,  GTK+ team and others
					
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
	date: "$Date:$"
	revision: "$Revision:$"

class CHANGE_CURRENT_PAGE_CALLBACK

inherit
	G_SIGNALS
	WRAPPER undefine from_external_pointer end

creation make

feature
	make (a_notebook: GTK_NOTEBOOK; a_procedure: PROCEDURE[TUPLE[GTK_NOTEBOOK]]) is
		require valid_notebook: a_notebook/=Void
		do
			notebook := a_notebook
			procedure := a_procedure
			id:=g_signal_connect_swapped(notebook.handle,(once "change-current-page").to_external,
												  $hidden_callback, Current.to_pointer)
			print ("CHANGE_CURRENT_PAGE_CALLBACK created for "+notebook.to_pointer.to_string+"%N")
		end

	id: INTEGER
			-- callback id number
	notebook: GTK_NOTEBOOK
			-- object connected to signal callback
	procedure: PROCEDURE[TUPLE[GTK_NOTEBOOK]]

feature {NONE} -- Implementation
	hidden_callback is
		do
			procedure.call ([notebook])
		end
end
