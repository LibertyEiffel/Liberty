indexing
	description: "Callback for `change-current-page' signal."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
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

