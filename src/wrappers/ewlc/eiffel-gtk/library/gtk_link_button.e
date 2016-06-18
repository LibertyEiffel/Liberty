note
	description: "GtkLinkButton -- A buttons bound to a URL."
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
			
class GTK_LINK_BUTTON
	-- A GtkLinkButton is a GtkButton with a hyperlink, similar to the one used
	-- by web browsers, which triggers an action when clicked. It is useful to
	-- show quick links to resources.

	-- A link button is created by calling either `make' or `make_with_label'. If
	-- using the former, the URI you pass to the constructor is used as a label
	-- for the widget.

	-- The URI bound to a GtkLinkButton can be set specifically using `set_uri',
	-- and retrieved using `uri'.

	-- GtkLinkButton offers a global hook, which is called when the used clicks
	-- on it: see `set_uri_hook'.
	
	-- GtkLinkButton was added in GTK+ 2.10.

inherit
	GTK_BUTTON
		rename make as make_button end
		-- TODO: GtkLinkButton implements AtkImplementorIface.
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make (an_uri: STRING)
			-- Creates a new GtkLinkButton with the `an_uri' as its text.
		require
			uri_not_void: an_uri /= Void
			valid_uri: -- TODO:
		do
			from_external_pointer (gtk_link_button_new(gtk_link_button_new(an_uri.to_external)))
		end
	
	make_with_label (an_uri, a_label: STRING)
			-- Creates a new GtkLinkButton containing `a_label' as the text of the 
			-- button pointing to `an_uri'.
		require
			uri_not_void: an_uri /= Void
			valid_uri: -- TODO:
			label_not_void: a_label /= Void
		do
			from_external_pointer (gtk_link_button_new_with_label (an_uri.to_external, a_label.to_external))
		end
	
feature {ANY}
	uri: STRING
			-- the URI of the link button.
		do
			-- The returned string is owned by the link button and should
			-- not be modified or freed.
			create {CONST_STRING} Result.from_external
			(gtk_link_button_get_uri (handle))
		ensure Result /= Void
		end

	set_uri (an_uri: STRING)
			-- Sets uri as the URI where the GtkLinkButton points.
		require
			uri_not_void: an_uri /= Void
		do
			gtk_link_button_set_uri(handle,an_uri.to_external)
		ensure set: uri.is_equal(an_uri)
		end
	
	-- GtkLinkButtonUriFunc ()
	
	-- void (*GtkLinkButtonUriFunc) (GtkLinkButton *button, const gchar *link,
	-- gpointer user_data);

	-- The type of a function which is called when the GtkLinkButton is clicked.
	-- button : 	the GtkLinkButton which was clicked
	-- link : 	the URI to which the clicked GtkLinkButton points
	-- user_data :
	
	-- gtk_link_button_set_uri_hook ()

	-- GtkLinkButtonUriFunc gtk_link_button_set_uri_hook (GtkLinkButtonUriFunc
	-- func, gpointer data, GDestroyNotify destroy);

-- Sets func as the function that should be invoked every time a user clicks a GtkLinkButton. This function is called before every callback registered for the "clicked" signal.

-- func : 	a function called each time a GtkLinkButton is clicked, or NULL
-- data : 	user data to be passed to func, or NULL
-- destroy : 	a GDestroyNotify that gets called when data is no longer needed, or NULL
-- Returns : 	the previously set hook function.

-- Since 2.10
-- Property Details
-- The "uri" property

--   "uri"                  gchararray            : Read / Write

-- The URI bound to this button.

-- Default value: "http://www.gtk.org"
-- Properties

--   "uri"                  gchararray            : Read / Write


feature {} -- External calls
	gtk_link_button_new  (an_uri: POINTER): POINTER
			-- GtkWidget* gtk_link_button_new (const gchar *uri);
		external "C use <gtk/gtk.h>"
		end

	 gtk_link_button_new_with_label (an_uri, a_label: POINTER): POINTER
			-- GtkWidget* gtk_link_button_new_with_label (const gchar
			-- *uri, const gchar *label);
		external "C use <gtk/gtk.h>"
		end

	
	gtk_link_button_get_uri (a_link_button: POINTER): POINTER
			-- const gchar* gtk_link_button_get_uri (GtkLinkButton
			-- *link_button);
		external "C use <gtk/gtk.h>"
		end

	gtk_link_button_set_uri (a_link_button, an_uri: POINTER)
			-- void gtk_link_button_set_uri (GtkLinkButton *link_button,
			-- const gchar *uri);
		external "C use <gtk/gtk.h>"
		end

	-- void (*GtkLinkButtonUriFunc) (GtkLinkButton *button, const gchar
	-- *link, gpointer user_data);
	
	gtk_link_button_set_uri_hook (a_func, some_data, a_destroy: POINTER): POINTER
			-- GtkLinkButtonUriFunc gtk_link_button_set_uri_hook
			-- (GtkLinkButtonUriFunc func, gpointer data, GDestroyNotify
			-- destroy);
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_LINK_BUTTON
