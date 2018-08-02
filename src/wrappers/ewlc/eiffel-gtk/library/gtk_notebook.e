note
	description: "GtkNotebook -- A tabbed notebook container."
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

class GTK_NOTEBOOK
	-- The GtkNotebook widget is a GtkContainer whose children are
	-- pages that can be switched between using tab labels along one
	-- edge.

	-- There are many configuration options for GtkNotebook. Among
	-- other things, you can choose on which edge the tabs appear (see
	-- `set_tab_pos'), whether, if there are too many tabs to fit the
	-- noteobook should be made bigger or scrolling arrows added (see
	-- `set_scrollable'), and whether there will be a popup menu
	-- allowing the users to switch pages. (see `enable_popup' and
	-- `disable_popup').

inherit GTK_CONTAINER
	-- GtkNotebook implements AtkImplementorIface.

insert
	G_OBJECT_FACTORY [GTK_WIDGET]
	GTK_NOTEBOOK_EXTERNALS

create {ANY} make, from_external_pointer

feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkNotebook)"
		end

feature {} -- Creation
	make
			-- Creates a new GtkNotebook widget with no pages.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_notebook_new)
		end

feature {ANY} -- page handling
	last_appended_page_index: INTEGER
			-- Index of the last appended/inserted page

	append_page (a_child, a_tab_label: GTK_WIDGET)
			-- Appends a page to notebook. `a_child' the GtkWidget to use
			-- as the contents of the page. `a_tab_label' : the GtkWidget
			-- to be used as the label for the page, or Void to use the
			-- default label, 'page N'. `last_appended_page_index'
			-- contains the index (starting from 0) of the appended page
			-- in the notebook, or -1 if function fails.
		require valid_child: a_child /= Void
		local label_ptr: POINTER
		do
			if a_tab_label /= Void then label_ptr := a_tab_label.handle end
			last_appended_page_index := gtk_notebook_append_page (handle,
																					a_child.handle,
																					label_ptr)
		end

	append_page_menu (a_child, a_tab_label, a_menu_label: GTK_WIDGET)
			-- Appends a page to notebook, specifying the widget to use
			-- as the label in the popup menu. 

			-- `a_child': the GtkWidget to use as the contents of the
			-- page.

			-- `a_tab_label': the GtkWidget to be used as the label for the
			-- page, or Void to use the default label, 'page N'.

			-- `a_menu_label' : the widget to use as a label for the
			-- page-switch menu, if that is enabled. If Void, and
			-- `a_tab_label' is a GtkLabel or Void, then the menu label
			-- will be a newly created label with the same text as
			-- tab_label; if `a_tab_label' is not a GtkLabel,
			-- `a_menu_label' must be specified if the page-switch menu
			-- is to be used.  

			-- `last_appended_page_index' contains the index (starting
			-- from -- 0) of the appended page in the notebook, or -1 if
			-- function fails.
		require child_not_void: a_child /= Void
		local label_ptr, menu_ptr: POINTER
		do
			if a_tab_label /= Void then label_ptr := a_tab_label.handle end
			if a_menu_label /= Void then menu_ptr := a_menu_label.handle end
			last_appended_page_index := (gtk_notebook_append_page_menu (handle,
																							a_child.handle,
																							label_ptr, menu_ptr))
		end

	
	--   gtk_notebook_prepend_page ()
	
	--  gint        gtk_notebook_prepend_page       (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               GtkWidget *tab_label);

	--    Prepends a page to notebook.

	--    notebook :  a GtkNotebook
	--    child :     the GtkWidget to use as the contents of the page.
	--    tab_label : the GtkWidget to be used as the label for the page, or NULL to use the default label,
	--                'page N'.
	--    Returns :   the index (starting from 0) of the prepended page in the notebook, or -1 if function
	--                fails

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_prepend_page_menu ()

	--  gint        gtk_notebook_prepend_page_menu  (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               GtkWidget *tab_label,
	--                                               GtkWidget *menu_label);

	--    Prepends a page to notebook, specifying the widget to use as the label in the popup menu.

	--    notebook :   a GtkNotebook
	--    child :      the GtkWidget to use as the contents of the page.
	--    tab_label :  the GtkWidget to be used as the label for the page, or NULL to use the default label,
	--                 'page N'.
	--    menu_label : the widget to use as a label for the page-switch menu, if that is enabled. If NULL,
	--                 and tab_label is a GtkLabel or NULL, then the menu label will be a newly created label
	--                 with the same text as tab_label; If tab_label is not a GtkLabel, menu_label must be
	--                 specified if the page-switch menu is to be used.
	--    Returns :    the index (starting from 0) of the prepended page in the notebook, or -1 if function
	--                 fails

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_insert_page ()

	--  gint        gtk_notebook_insert_page        (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               GtkWidget *tab_label,
	--                                               gint position);

	--    Insert a page into notebook at the given position.

	--    notebook :  a GtkNotebook
	--    child :     the GtkWidget to use as the contents of the page.
	--    tab_label : the GtkWidget to be used as the label for the page, or NULL to use the default label,
	--                'page N'.
	--    position :  the index (starting at 0) at which to insert the page, or -1 to append the page after
	--                all other pages.
	--    Returns :   the index (starting from 0) of the inserted page in the notebook, or -1 if function
	--                fails

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_insert_page_menu ()

	--  gint        gtk_notebook_insert_page_menu   (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               GtkWidget *tab_label,
	--                                               GtkWidget *menu_label,
	--                                               gint position);

	--    Insert a page into notebook at the given position, specifying the widget to use as the label in the
	--    popup menu.

	--    notebook :   a GtkNotebook
	--    child :      the GtkWidget to use as the contents of the page.
	--    tab_label :  the GtkWidget to be used as the label for the page, or NULL to use the default label,
	--                 'page N'.
	--    menu_label : the widget to use as a label for the page-switch menu, if that is enabled. If NULL,
	--                 and tab_label is a GtkLabel or NULL, then the menu label will be a newly created label
	--                 with the same text as tab_label; If tab_label is not a GtkLabel, menu_label must be
	--                 specified if the page-switch menu is to be used.
	--    position :   the index (starting at 0) at which to insert the page, or -1 to append the page after
	--                 all other pages.
	--    Returns :    the index (starting from 0) of the inserted page in the notebook, or -1 if function
	--                 fails

	remove_page (page_num: INTEGER)
			-- Removes a page from the notebook given its index.
		require
			page_num >= 0
		do
			gtk_notebook_remove_page (handle, page_num)
		end


	--   gtk_notebook_page_num ()

	--  gint        gtk_notebook_page_num           (GtkNotebook *notebook,
	--                                               GtkWidget *child);

	--    Finds the index of the page which contains the given child widget.

	--    notebook : a GtkNotebook
	--    child :    a GtkWidget
	--    Returns :  the index of the page containing child, or -1 if child is not in the notebook.

	--    ---------------------------------------------------------------------------------------------------

	next_page
			-- Switches to the next page. Nothing happens if the current page is the last page.
		do
			gtk_notebook_next_page (handle)
		end

	prev_page, previous_page
			-- Switches to the previous page. Nothing happens if the current page is the first page.
		do
			gtk_notebook_prev_page (handle)
		end

	--   gtk_notebook_reorder_child ()

	--  void        gtk_notebook_reorder_child      (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               gint position);

	--    Reorders the page containing child, so that it appears in position position. If position is greater
	--    than or equal to the number of children in the list or negative, child will be moved to the end of
	--    the list.

	--    notebook : a GtkNotebook
	--    child :    the child to move
	--    position : the new position, or -1 to move to the end

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_tab_pos ()

	--  void        gtk_notebook_set_tab_pos        (GtkNotebook *notebook,
	--                                               GtkPositionType pos);

	--    Sets the edge at which the tabs for switching pages in the notebook are drawn.

	--    notebook : a GtkNotebook.
	--    pos :      the edge to draw the tabs at.

	--    ---------------------------------------------------------------------------------------------------

	show_tabs
			--  Show the tabs for the notebook.
		do
			gtk_notebook_set_show_tabs (handle, 1)
		ensure shown: are_tabs_shown=True
		end

	hide_tabs
			-- Hide the tabs for the notebook.
		do
			gtk_notebook_set_show_tabs (handle, 0)
		ensure hidden: are_tabs_shown=False
		end

	show_border
			-- Show a bevel will be drawn around the notebook pages. This
			-- only has a visual effect when the tabs are not shown. 
		do
			gtk_notebook_set_show_border (handle,1)
		end

	hide_border
			-- Hide the bevel that is drawn around the notebook
			-- pages. This bevel is visible only when the tabs are not
			-- shown.
		do
			gtk_notebook_set_show_border (handle,0)
		end

	set_scrollable
			-- Sets the tab label area to show arrows for scrolling if
			-- there are too many tabs to fit in the area.
		do
			gtk_notebook_set_scrollable (handle,1)
		end

	unset_scrollable
			-- Unset scrollable. See 'set_scrollable'
		do
			gtk_notebook_set_scrollable (handle,1)
		end

	enable_popup
			-- Enables the popup menu: if the user clicks with the right
			-- mouse button on the bookmarks, a menu with all the pages
			-- will be popped up.
		do
			gtk_notebook_popup_enable (handle)
		end

	disable_popup
			--    Disables the popup menu.q
		do
			gtk_notebook_popup_disable (handle)
		end

	current_page_index: INTEGER
			-- The page number of the current page, starting from 0. If
			-- the notebook has no pages, then -1 will be returned.
		do
			Result:= gtk_notebook_get_current_page (handle)
		end

	menu_label (a_child: GTK_WIDGET): GTK_WIDGET
			-- The menu label widget of the page containing `a_child'.
			-- Void if the notebook page does not have a menu label other
			-- than the default (the tab label).
		require valid_child: a_child /= Void
		do
			Result := wrapper_or_void (gtk_notebook_get_menu_label (handle, a_child.handle))
		end

	nth_page (a_page_num: INTEGER): GTK_WIDGET
			-- The child widget contained in page number
			-- `a_page_num'. Set `a_page__num' to -1 to get the last
			-- page.  Void if `a_page_num' is out of bounds.
		do
			Result := wrapper_or_void (gtk_notebook_get_nth_page (handle, a_page_num))
		end

	n_pages: INTEGER
			-- the number of pages in the notebook.
		do
			Result := gtk_notebook_get_n_pages (handle)
		end

	tab_label (a_child: GTK_WIDGET): GTK_WIDGET
			-- The tab label widget for the page child. Void if child is
			-- not in notebook or if no tab label has specifically been
			-- set for child.
		require valid_child: a_child /= Void
		do
			-- Note: see also the note in `set_tab_label_text' postcondition
			Result := wrapper_or_void (gtk_notebook_get_tab_label (handle, a_child.handle))
		end

	tab_label_packing  (a_child: GTK_WIDGET): TUPLE[BOOLEAN,BOOLEAN,INTEGER]
		require valid_child: a_child /= Void
		local an_expand, a_fill, a_pack_type: INTEGER
		do
			gtk_notebook_query_tab_label_packing
			(handle, a_child.handle, an_expand.to_pointer,
			 a_fill.to_pointer, a_pack_type.to_pointer)
			-- Query the packing attributes for the tab label of the page
			-- containing child. `notebook' : a GtkNotebook child : the
			-- page expand : location to store the expand value (or NULL)
			-- fill : location to store the fill value (or NULL)
			-- pack_type : location to store the pack_type (or NULL)
			create Result.make_3 (an_expand.to_boolean,
										 a_fill.to_boolean, a_pack_type)
		end
	
	set_menu_label (a_child, a_menu_label: GTK_WIDGET)
			-- Changes the menu label for the page containing child.
		require
			valid_child: a_child /= Void
			valid_label: a_menu_label /= Void
		do
			gtk_notebook_set_menu_label (handle, a_child.handle,
												  a_menu_label.handle)
		end

	set_default_menu_label (a_child: GTK_WIDGET)
			-- Set the menu label for the page containing child to the default.
		require valid_child: a_child /= Void
		do
			gtk_notebook_set_menu_label (handle, a_child.handle, default_pointer)
		end

	set_menu_label_text (a_child: GTK_WIDGET; a_text: STRING)
			--    Creates a new label and sets it as the menu label of child.
		require
			valid_child: a_child /= Void
			valid_text: a_text /= Void
		do
			gtk_notebook_set_menu_label_text  (handle, a_child.handle, a_text.to_external)
		end

	set_tab_label (a_child, a_tab_label: GTK_WIDGET)
			-- Changes the tab label for child. If NULL is specified for
			-- tab_label, then the page will have the label 'page N'.
		require
			valid_child: a_child /= Void
			valid_label: a_tab_label /= Void
		do
			gtk_notebook_set_tab_label (handle, a_child.handle,
												 a_tab_label.handle)
		end

	set_default_tab_label (a_child: GTK_WIDGET)
			-- Changes the tab label for child to the default label 'page N'.
		require
			valid_child: a_child /= Void
		do
			gtk_notebook_set_tab_label (handle, a_child.handle, default_pointer)
		end

	set_tab_label_packing (a_child: GTK_WIDGET; expand,fill: BOOLEAN;
								  a_pack_type: INTEGER)
			-- Sets the packing parameters for the tab label of the page
			-- containing child. See GTK_BOX.pack_start for the exact
			-- meaning of the parameters. `expand': whether to expand the
			-- bookmark or not; `fill': whether the bookmark should fill
			-- the allocated area or not `a_pack_type': the position of
			-- the bookmark
			
		require
			valid_child: a_child /= Void
			valid_packing: is_valid_gtk_pack_type (a_pack_type)
		do
			gtk_notebook_set_tab_label_packing (handle, a_child.handle,
												expand.to_integer,
												fill.to_integer,
												a_pack_type)
		end

	set_tab_label_text (a_child: GTK_WIDGET; a_tab_text: STRING)
			-- Creates a new label and sets it as the tab label for the
			-- page containing child.
		require
			valid_child: a_child /= Void
			valid_tab_text: a_tab_text /= Void
		do
			gtk_notebook_set_tab_label_text (handle, a_child.handle,
											a_tab_text.to_external)
			debug
				print ("TODO: check if in GTK_NOTEBOOK.set_tab_label_text shall the wrapper of the newly created label be created also?")
			end
		ensure
			label_wrapper_exists: tab_label (a_child) /= Void
		end

	menu_label_text (a_child: GTK_WIDGET): STRING
			-- The text of the menu label for the page containing
			-- child. Void if the widget does not have a menu label other
			-- than the default menu label, or the menu label widget is
			-- not a GtkLabel
		require valid_child: a_child /= Void
		local ptr: POINTER
		do
			ptr:=gtk_notebook_get_menu_label_text (handle, a_child.handle)
			-- gtk_notebook_get_menu_label_text returns the text of the
			-- tab label, or NULL . The string is owned by the widget and
			-- must not be freed.
			if ptr.is_not_null then create Result.from_external_copy (ptr) end
		end

	is_scrollable: BOOLEAN
			-- Does the tab label area has arrows for scrolling?. See set_scrollable.
		do
			Result:=(gtk_notebook_get_scrollable(handle).to_boolean)
		end

	is_border_shown: BOOLEAN
			--    Returns whether a bevel will be drawn around the notebook pages. See
			--    gtk_notebook_set_show_border().
		do
			Result:=gtk_notebook_get_show_border(handle).to_boolean
		end

	--    notebook : a GtkNotebook
	--    Returns :  TRUE if the bevel is drawn

	--    ---------------------------------------------------------------------------------------------------

	are_tabs_shown: BOOLEAN
			-- Are the tabs shown? See `show_tabs'.
		do
			Result := (gtk_notebook_get_show_tabs(handle).to_boolean)
		end

	tab_label_text (a_child: GTK_WIDGET): STRING
			-- The text of the tab label for the page containing 
			-- `a_child'. Void if the tab label is not a GtkLabel
		require valid_child: a_child/=Void
		local ptr: POINTER
		do
			ptr:= gtk_notebook_get_tab_label_text(handle, a_child.handle)
			-- gtk_notebook_get_tab_label_text returns the text of the
			-- tab label, or NULL if the tab label widget is not a
			-- GtkLabel. The string is owned by the widget and must not
			-- be freed.
			if ptr.is_not_null then create Result.from_external_copy (ptr) end
		end

	tab_position: INTEGER
			-- The edge at which the tabs for switching pages in the
			-- notebook are drawn.
		do
			Result:=gtk_notebook_get_tab_pos    (handle)
		ensure valid_position: is_valid_gtk_position_type (Result)
		end

	set_current_page (a_page_num: INTEGER)
			-- Switches to the page number `a_page_num', the index of the
			-- page to switch to, starting from 0. If negative, the last
			-- page will be used. If greater than the number of pages in
			-- the notebook, nothing will be done.
		do
			gtk_notebook_set_current_page (handle, a_page_num)
		end

feature {ANY} -- Properties
--    "enable-popup"         gboolean              : Read / Write
--    "homogeneous"          gboolean              : Read / Write
--    "page"                 gint                  : Read / Write
--    "scrollable"           gboolean              : Read / Write
--    "show-border"          gboolean              : Read / Write
--    "show-tabs"            gboolean              : Read / Write
--    "tab-border"           guint                 : Write
--    "tab-hborder"          guint                 : Read / Write
--    "tab-pos"              GtkPositionType       : Read / Write
--    "tab-vborder"          guint                 : Read / Write

-- Child Properties


--    "menu-label"           gchararray            : Read / Write
--    "position"             gint                  : Read / Write
--    "tab-expand"           gboolean              : Read / Write
--    "tab-fill"             gboolean              : Read / Write
--    "tab-label"            gchararray            : Read / Write
--    "tab-pack"             GtkPackType           : Read / Write

-- Style Properties


--    "has-backward-stepper" gboolean              : Read
--    "has-forward-stepper"  gboolean              : Read
--    "has-secondary-backward-stepper" gboolean              : Read
--    "has-secondary-forward-stepper" gboolean              : Read

-- Property Details

--   The "enable-popup" property

--    "enable-popup"         gboolean              : Read / Write

--    If TRUE, pressing the right mouse button on the notebook pops up a menu that you can use to go to a
--    page.

--    Default value: FALSE

--    ---------------------------------------------------------------------------------------------------

--   The "homogeneous" property

--    "homogeneous"          gboolean              : Read / Write

--    Whether tabs should have homogeneous sizes.

--    Default value: FALSE

--    ---------------------------------------------------------------------------------------------------

--   The "page" property

--    "page"                 gint                  : Read / Write

--    The index of the current page.

--    Allowed values: >= 0

--    Default value: 0

--    ---------------------------------------------------------------------------------------------------

--   The "scrollable" property

--    "scrollable"           gboolean              : Read / Write

--    If TRUE, scroll arrows are added if there are too many tabs to fit.

--    Default value: FALSE

--    ---------------------------------------------------------------------------------------------------

--   The "show-border" property

--    "show-border"          gboolean              : Read / Write

--    Whether the border should be shown or not.

--    Default value: TRUE

--    ---------------------------------------------------------------------------------------------------

--   The "show-tabs" property

--    "show-tabs"            gboolean              : Read / Write

--    Whether tabs should be shown or not.

--    Default value: TRUE

--    ---------------------------------------------------------------------------------------------------

--   The "tab-border" property

--    "tab-border"           guint                 : Write

--    Width of the border around the tab labels.

--    Default value: 2

--    ---------------------------------------------------------------------------------------------------

--   The "tab-hborder" property

--    "tab-hborder"          guint                 : Read / Write

--    Width of the horizontal border of tab labels.

--    Default value: 2

--    ---------------------------------------------------------------------------------------------------

--   The "tab-pos" property

--    "tab-pos"              GtkPositionType       : Read / Write

--    Which side of the notebook holds the tabs.

--    Default value: GTK_POS_TOP

--    ---------------------------------------------------------------------------------------------------

--   The "tab-vborder" property

--    "tab-vborder"          guint                 : Read / Write

--    Width of the vertical border of tab labels.

--    Default value: 2

-- Child Property Details

--   The "menu-label" child property

--    "menu-label"           gchararray            : Read / Write

--    The string displayed in the child's menu entry.

--    Default value: NULL

--    ---------------------------------------------------------------------------------------------------

--   The "position" child property

--    "position"             gint                  : Read / Write

--    The index of the child in the parent.

--    Allowed values: >= -1

--    Default value: 0

--    ---------------------------------------------------------------------------------------------------

--   The "tab-expand" child property

--    "tab-expand"           gboolean              : Read / Write

--    Whether to expand the child's tab or not.

--    Default value: TRUE

--    ---------------------------------------------------------------------------------------------------

--   The "tab-fill" child property

--    "tab-fill"             gboolean              : Read / Write

--    Whether the child's tab should fill the allocated area or not.

--    Default value: TRUE

--    ---------------------------------------------------------------------------------------------------

--   The "tab-label" child property

--    "tab-label"            gchararray            : Read / Write

--    The string displayed on the child's tab label.

--    Default value: NULL

--    ---------------------------------------------------------------------------------------------------

--   The "tab-pack" child property

--    "tab-pack"             GtkPackType           : Read / Write

--    A GtkPackType indicating whether the child is packed with reference to the start or end of the
--    parent.

--    Default value: GTK_PACK_START

-- Style Property Details

--   The "has-backward-stepper" style property

--    "has-backward-stepper" gboolean              : Read

--    The "has-backward-stepper" property determines whether the standard backward arrow button is
--    displayed.

--    Default value: TRUE

--    Since 2.4

--    ---------------------------------------------------------------------------------------------------

--   The "has-forward-stepper" style property

--    "has-forward-stepper"  gboolean              : Read

--    The "has-forward-stepper" property determines whether the standard forward arrow button is
--    displayed.

--    Default value: TRUE

--    Since 2.4

--    ---------------------------------------------------------------------------------------------------

--   The "has-secondary-backward-stepper" style property

--    "has-secondary-backward-stepper" gboolean              : Read

--    The "has-secondary-backward-stepper" property determines whether a second backward arrow button is
--    displayed on the opposite end of the tab area.

--    Default value: FALSE

--    Since 2.4

--    ---------------------------------------------------------------------------------------------------

--   The "has-secondary-forward-stepper" style property

--    "has-secondary-forward-stepper" gboolean              : Read

--    The "has-secondary-forward-stepper" property determines whether a second forward arrow button is
--    displayed on the opposite end of the tab area.

--    Default value: FALSE

--    Since 2.4
feature {ANY} -- Signals

--  "focus-tab" gboolean    user_function      (GtkNotebook    *notebook,
--                                              GtkNotebookTab *arg1,
--                                              gpointer        user_data)      : Run last / Action
--  "move-focus-out"
--              void        user_function      (GtkNotebook      *notebook,
--                                              GtkDirectionType *arg1,
--                                              gpointer          user_data)      : Run last / Action
--  "select-page"
--              gboolean    user_function      (GtkNotebook *notebook,
--                                              gboolean     arg1,
--                                              gpointer     user_data)      : Run last / Action
-- Signal Details

feature {ANY} --   The "change-current-page" signal
	change_current_page_signal_name: STRING is "change-current-page"
		--  "change-current-page"
		--              void        user_function      (GtkNotebook *notebook,
		--                                              gint         arg1,
		--                                              gpointer     user_data)      : Run last / Action

	on_change_current_page (a_page_number: INTEGER)
		do
		end

	enable_on_change_current_page
			-- Connects "change-current-page" signal to `on_change_current_page' feature.
		do
			connect (Current, change_current_page_signal_name, $on_change_current_page)
		end

	connect_agent_to_change_current_page_signal (a_procedure: PROCEDURE [ANY, TUPLE[INTEGER, GTK_NOTEBOOK]])
			--  void        user_function                  (GtkNotebook *notebook,
			--                                              gint         arg1,
			--                                              gpointer     user_data)      : Run last / Action
			--    notebook :  the object which received the signal.
			--    arg1 :
			--    user_data : user data set when the signal handler was connected.
		require valid_procedure: a_procedure /= Void
		local change_current_page_callback: CHANGE_CURRENT_PAGE_CALLBACK
		do
			create change_current_page_callback.make
			change_current_page_callback.connect (Current, a_procedure)
		end

feature {ANY} --   The "switch-page" signal
	switch_page_signal_name: STRING is "switch-page"
		--  "switch-page"
		--              void        user_function      (GtkNotebook     *notebook,
		--                                              GtkNotebookPage *page,
		--                                              guint            page_num,
		--                                              gpointer         user_data)      : Run last

	on_switch_page (a_page_number: INTEGER)
		do
		end

	enable_on_switch_page
			-- Connects "switch-page" signal to `on_switch_page' feature.
			--    Emitted when the user or a function changes the current page.
		do
			connect (Current, switch_page_signal_name, $on_switch_page)
		end

	connect_agent_to_switch_page_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_NOTEBOOK_PAGE, INTEGER, GTK_NOTEBOOK]])
			--  void        user_function                  (GtkNotebook     *notebook,
			--                                              GtkNotebookPage *page,
			--                                              guint            page_num,
			--                                              gpointer         user_data)      : Run last
			--    notebook :  the object which received the signal.
			--    page :      the new current page
			--    page_num :  the index of the page
			--    user_data : user data set when the signal handler was connected.
		require valid_procedure: a_procedure /= Void
		local switch_page_callback: SWITCH_PAGE_CALLBACK
		do
			create switch_page_callback.make
			switch_page_callback.connect (Current, a_procedure)
		end

--    ---------------------------------------------------------------------------------------------------

--   The "focus-tab" signal

--  gboolean    user_function                  (GtkNotebook    *notebook,
--                                              GtkNotebookTab *arg1,
--                                              gpointer        user_data)      : Run last / Action

--    notebook :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.
--    Returns :

--    ---------------------------------------------------------------------------------------------------

--   The "move-focus-out" signal

--  void        user_function                  (GtkNotebook      *notebook,
--                                              GtkDirectionType *arg1,
--                                              gpointer          user_data)      : Run last / Action

--    notebook :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

--    ---------------------------------------------------------------------------------------------------

--   The "select-page" signal

--  gboolean    user_function                  (GtkNotebook *notebook,
--                                              gboolean     arg1,
--                                              gpointer     user_data)      : Run last / Action

--    notebook :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.
--    Returns :
end
