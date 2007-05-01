indexing
	description: "GtkBin - A container with just one child"
	long_description: "[
							 The GtkBin widget is a container with just
							 one child. It is not very useful itself,
							 but it is useful for deriving subclasses,
							 since it provides common code needed for
							 handling a single child widget.
					 ]"
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_BIN

inherit GTK_CONTAINER
	-- Implemented Interfaces: GtkBin implements AtkImplementorIface.

insert
	G_OBJECT_RETRIEVER [GTK_WIDGET]
		rename
			retrieve_eiffel_wrapper_from_gobject_pointer as retrieve_widget_wrapper_from_pointer
			eiffel_wrapper_from_gobject_pointer as widget_wrapper_from_pointer
		end
	GTK_BIN_EXTERNALS

feature
	child: GTK_WIDGET is
			-- the child of the GTK_BIN, or Void if the bin contains no
			-- child widget. The widget does not have a reference added,
			-- so you do not need to unref it.
		local a_widget_ptr: POINTER
		do
			a_widget_ptr := gtk_bin_get_child(handle)
			Result := widget_wrapper_from_pointer (a_widget_ptr)
			debug
				if Result=Void then
					print ("Warning GTK_BIN.child encountered an unwrapped gobject!%
                      % Returning Void insted.%N")
				end
			end
		end

end
