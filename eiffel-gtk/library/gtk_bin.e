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

inherit
	GTK_CONTAINER
		-- Implemented Interfaces: GtkBin implements AtkImplementorIface.
	G_OBJECT_FACTORY [GTK_WIDGET] undefine copy, is_equal end

insert GTK_BIN_EXTERNALS
			
feature
	child: GTK_WIDGET is
			-- the child of the GTK_BIN, or Void if the bin contains no
			-- child widget. The widget does not have a reference added,
			-- so you do not need to unref it.
		do
			Result := wrapper(gtk_bin_get_child(handle))
		end

end
