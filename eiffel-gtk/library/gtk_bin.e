indexing
	description: "GtkBin - A container with just one child"
	long_description: "[
							 The GtkBin widget is a container with just one child. It is not very useful itself, but it is useful for deriving subclasses, since it provides common code needed for handling a single child widget.
							 ]"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"


deferred class GTK_BIN

inherit GTK_CONTAINER
	-- Implemented Interfaces: GtkBin implements AtkImplementorIface.
insert GTK_BIN_EXTERNALS

feature
	child: GTK_WIDGET is
			-- the child of the GTK_BIN, or Void if the bin contains no
			-- child widget. The widget does not have a reference added,
			-- so you do not need to unref it.
		local ptr: POINTER
		do
			ptr:=gtk_bin_get_child(handle)
			-- TODO: black magic to retrieve the Eiffel wrapper object if
			-- it exists or to create the correct Eiffel object from it!
			-- If it has already been wrapped it can be stored as a
			-- property. If it hasn't been already wrapped things get
			-- misty; a possible implementation of it is to link each
			-- GtkClass to its Eiffel counterpart.

		ensure implemented: False
		end
end
	
