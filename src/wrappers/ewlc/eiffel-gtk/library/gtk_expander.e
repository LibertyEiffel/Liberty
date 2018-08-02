note
	description: "GtkExpander -- A container which can hide its child."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

class GTK_EXPANDER
	-- A GtkExpander allows the user to hide or show its child by clicking on an
	-- expander triangle similar to the triangles used in a GtkTreeView.

	-- Normally you use an expander as you would use any other descendant of
	-- GtkBin; you create the child widget and use gtk_container_add() to add it
	-- to the expander. When the expander is toggled, it will take care of
	-- showing and hiding the child automatically.

	-- Special Usage: There are situations in which you may prefer to show and
	-- hide the expanded widget yourself, such as when you want to actually
	-- create the widget at expansion time. In this case, create a GtkExpander
	-- but do not add a child to it. The expander widget has an expanded property
	-- which can be used to monitor its expansion state. You should watch this
	-- property with a signal connection as follows:

	--  expander = gtk_expander_new_with_mnemonic ("_More Options");
	--  g_signal_connect (expander, "notify::expanded", G_CALLBACK
	--  (expander_callback), NULL);

	--  ...
	
	-- static void -- expander_callback (GObject *object, GParamSpec *param_spec,
	-- gpointer user_data) -- { -- GtkExpander *expander;
	
	-- expander = GTK_EXPANDER (object);

	-- if (gtk_expander_get_expanded (expander)) { /* Show or create widgets */ }
	-- else { /* Hide or destroy widgets */ } -- }

inherit
	GTK_BIN -- rename make as make_bin end

		-- Implemented Interfaces: GtkExpander implements AtkImplementorIface.
	
insert G_OBJECT_FACTORY [GTK_WIDGET]	

create {ANY} make, make_with_mnemonic, from_external_pointer

feature {} -- Creation

	make (a_label: STRING)
			-- Creates a new expander using 'a_label' as the text of the
			-- label.
		
			-- Note: better make as in Eiffel tradition or new as in GTK
			-- API? Paolo 2006-04-27
		require valid_label: a_label /= Void
		do
			from_external_pointer(gtk_expander_new(a_label.to_external))
		end

	make_with_mnemonic (a_label: STRING)
			-- Creates a new expander using label as the text of the
			-- label. If characters in label are preceded by an
			-- underscore, they are underlined.  If you need a literal
			-- underscore character in a label, use '__' (two
			-- underscores). The first underlined character represents a
			-- keyboard accelerator called a mnemonic. Pressing Alt and
			-- that key activates the button.

		
			-- Note: better make_with_mnemonic as in Eiffel tradition or
			-- new_with_mnemonic as in GTK API? Paolo 2006-04-27
		require valid_label: a_label /= Void
		do
			from_external_pointer(gtk_expander_new_with_mnemonic(a_label.to_external))
		end

feature {ANY} 
	set_expanded
			-- Reveales the child widget to be revealed
		do
			gtk_expander_set_expanded (handle, 1)
			ensure is_expanded: is_expanded
		end

	unset_expanded
			-- Hides the child widget.
		do
			gtk_expander_set_expanded (handle, 0)
		ensure unexpanded: not is_expanded
		end

	is_expanded: BOOLEAN
			-- IS the child widget shown to the user?
		do
			Result:=gtk_expander_get_expanded(handle).to_boolean
		end

	set_spacing (a_spacing: INTEGER)
			-- Sets the spacing field of expander, wbhich is the number of
			-- pixels to place between expander and the child.
		do 
			gtk_expander_set_spacing (handle, a_spacing)
		end

	spacing: INTEGER
			-- the spacing field of expander, wbhich is the number of
			-- pixels to place between expander and the child.
		do
			Result:=gtk_expander_get_spacing(handle)
		end

	set_label (a_label: STRING)
			-- Sets the text of the label of the expander to `a_label'.
			-- This will also clear any previously set labels.
		require valid_label: a_label /= Void
		do
			gtk_expander_set_label (handle, a_label.to_external)
		end

	label: STRING
			-- The text from the label of the expander, as set by --
			-- `set_label'. If the label text has not been set the return
			-- value will be Void. This will be the case if you create an
			-- empty button with make to use as a container.
		local ptr: POINTER
		do
			ptr:=gtk_expander_get_label(handle)
			-- Note: gtk_expander_get_label returns a pointer owned by
			-- the widget and must not be modified or freed.
			if ptr.is_not_null then 
				create Result.from_external_copy (ptr)
			end
		end

	set_use_underline
			-- Put an underline in the text of the expander label
			-- indicating the character used for the mnemonic accelerator
			-- key.
		do
			gtk_expander_set_use_underline (handle, 1)
		ensure set: is_underline_used
		end

	unset_use_underline
			-- Remove the underline under the mnemonic accelerator key
		do
			gtk_expander_set_use_underline (handle, 0)
		ensure unset: not is_underline_used
		end

	is_underline_used: BOOLEAN
			-- Does an embedded underline in the expander label indicates
			-- a mnemonic? See `set_use_underline'.
		do
			Result:=gtk_expander_get_use_underline(handle).to_boolean
		end


	set_use_markup
			-- Sets whether the text of the label contains markup in
			-- Pango's text markup language. See `set_markup'.
		do
			gtk_expander_set_use_markup (handle, 1)
		ensure set: is_markup_used
		end

	unset_use_markup
			-- Do not use Pango markups in the label
		do
			gtk_expander_set_use_markup (handle, 0)
		ensure unset: not is_markup_used
		end

	is_markup_used: BOOLEAN
			-- Is the label's text interpreted as marked up with the
			-- Pango text markup language? See `set_use_markup'.
		do
			Result:=(gtk_expander_get_use_markup(handle).to_boolean)
		end

	set_label_widget (a_widget: GTK_WIDGET)
			-- Set the label widget for the expander. This is the widget
			-- that will appear emCbedded alongside the expander arrow.
		require valid_widget: a_widget /= Void
		do
			gtk_expander_set_label_widget (handle, a_widget.handle)
		end

	label_widget: GTK_WIDGET
			-- The label widget for the frame. 'set_label_widget'. Can 
			-- be Void
		do
			Result := wrapper (gtk_expander_get_label_widget (handle))
		end


--    Since 2.4

feature {ANY} -- Properties
	
--    "expanded"             gboolean              : Read / Write / Construct
--    "label"                gchararray            : Read / Write / Construct
--    "label-widget"         GtkWidget             : Read / Write
--    "spacing"              gint                  : Read / Write
--    "use-markup"           gboolean              : Read / Write / Construct
--    "use-underline"        gboolean              : Read / Write / Construct

-- Style Properties


--    "expander-size"        gint                  : Read
  --    "expander-spacing"     gint                  : Read



--  "activate"  void        user_function      (GtkExpander *expander,
--                                              gpointer     user_data)      : Run last / Action

--   The "spacing" property

--    "spacing"              gint                  : Read / Write

--    Space to put between the label and the child.

--    Allowed values: >= 0

--    Default value: 0

--    -----------------------------------------------------------------------

--   The "use-markup" property

--    "use-markup"           gboolean              : Read / Write / Construct

--    The text of the label includes XML markup. See pango_parse_markup().

--    Default value: FALSE

--    -----------------------------------------------------------------------

--   The "use-underline" property

--    "use-underline"        gboolean              : Read / Write / Construct

--    If set, an underline in the text indicates the next character should be
--    used for the mnemonic accelerator key.

--    Default value: FALSE

-- Style Property Details

--   The "expander-size" style property

--    "expander-size"        gint                  : Read

--    Size of the expander arrow.

--    Allowed values: >= 0

--    Default value: 10

--    -----------------------------------------------------------------------

--   The "expander-spacing" style property

--    "expander-spacing"     gint                  : Read

--    Spacing around expander arrow.

--    Allowed values: >= 0

--    Default value: 2

feature {ANY}  --   The "activate" signal
	activate_signal_name: STRING is "activate"

	on_activate
		do
			-- Empty by default
		end

	enable_on_activate
		do
			connect (Current, activate_signal_name, $on_activate)
		end

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkExpander)"
		end

feature {} -- External calls 
	gtk_expander_new (a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_expander_new_with_mnemonic (a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_set_expanded (an_expander: POINTER; an_expanded: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_get_expanded (an_expander: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_set_spacing (an_expander: POINTER; a_spacing: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_get_spacing (an_expander: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_set_label (an_expander, a_label: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_get_label (an_expander: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_set_use_underline (an_expander: POINTER; a_use_underline: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_get_use_underline (an_expander: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_set_use_markup (an_expander: POINTER; a_use_markup: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_expander_get_use_markup (an_expander: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_expander_set_label_widget (an_expander, a_label_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_expander_get_label_widget (an_expander: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
end
