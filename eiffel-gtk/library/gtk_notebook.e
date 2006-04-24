indexing
	description: "GtkNotebook -- A tabbed notebook container."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Description

			-- The GtkNotebook widget is a GtkContainer whose children
			-- are pages that can be switched between using tab labels
			-- along one edge.

			-- There are many configuration options for
			-- GtkNotebook. Among other things, you can choose on which
			-- edge the tabs appear (see `set_tab_pos'), whether, if
			-- there are too many tabs to fit the noteobook should be
			-- made bigger or scrolling arrows added (see
			-- `set_scrollable'), and whether there will be a popup menu
			-- allowing the users to switch pages. (see `enable_popup'
			-- and `disable_popup')

class GTK_NOTEBOOK
inherit GTK_CONTAINER
   -- GtkNotebook implements AtkImplementorIface.
insert 
	GTK_POSITION_TYPE
	GTK_PACK_TYPE
creation make

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkNotebook)"
		end

feature {NONE} -- Creation
	make is
			--    Creates a new GtkNotebook widget with no pages.
		do  
			handle := gtk_notebook_new
		end

	append_page (a_child, a_tab_label: GTK_WIDGET) is
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
			last_appended_page_index:=gtk_notebook_append_page (handle,
																				 a_child.handle,
																				 label_ptr)
		end

	append_page_menu (a_child, a_tab_label, a_menu_label: GTK_WIDGET) is
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
		require valid_child: a_child /= Void
		local label_ptr, menu_ptr: POINTER 
		do
			if a_tab_label /= Void then label_ptr := a_tab_label.handle end
			if a_menu_label /= Void then menu_ptr := a_menu_label.handle end
			last_appended_page_index:=gtk_notebook_append_page_menu (handle, a_child.handle
																						label_ptr, menu_ptr)
		end

	--    ---------------------------------------------------------------------------------------------------
	
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

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_remove_page ()

	--  void        gtk_notebook_remove_page        (GtkNotebook *notebook,
	--                                               gint page_num);

	--    Removes a page from the notebook given its index in the notebook.

	--    notebook : a GtkNotebook.
	--    page_num : the index of a notebook page, starting from 0. If -1, the last page will be removed.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_current_page

	--  #define gtk_notebook_current_page               gtk_notebook_get_current_page

	--   Warning

	--    gtk_notebook_current_page is deprecated and should not be used in newly-written code.

	--    Deprecated compatibility macro. Use gtk_notebook_get_current_page() instead.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_page_num ()

	--  gint        gtk_notebook_page_num           (GtkNotebook *notebook,
	--                                               GtkWidget *child);

	--    Finds the index of the page which contains the given child widget.

	--    notebook : a GtkNotebook
	--    child :    a GtkWidget
	--    Returns :  the index of the page containing child, or -1 if child is not in the notebook.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_page

	--  #define gtk_notebook_set_page                   gtk_notebook_set_current_page

	--   Warning

	--    gtk_notebook_set_page is deprecated and should not be used in newly-written code.

	--    Deprecated compatibility macro. Use gtk_notebook_set_current_page() instead.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_next_page ()

	--  void        gtk_notebook_next_page          (GtkNotebook *notebook);

	--    Switches to the next page. Nothing happens if the current page is the last page.

	--    notebook : a GtkNotebook

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_prev_page ()

	--  void        gtk_notebook_prev_page          (GtkNotebook *notebook);

	--    Switches to the previous page. Nothing happens if the current page is the first page.

	--    notebook : a GtkNotebook

	--    ---------------------------------------------------------------------------------------------------

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

	show_tabs is
			--  Show the tabs for the notebook.
		do
			gtk_notebook_set_show_tabs (handle, 1)
		ensure shown: are_tabs_shown=True
		end

	hide_tabs is
			-- Hide the tabs for the notebook.
		do
			gtk_notebook_set_show_tabs (handle, 0)
		ensure hidden: are_tabs_shown=False
		end

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_show_border ()

	--  void        gtk_notebook_set_show_border    (GtkNotebook *notebook,
	--                                               gboolean show_border);

	--    Sets whether a bevel will be drawn around the notebook pages. This only has a visual effect when
	--    the tabs are not shown. See gtk_notebook_set_show_tabs().

	--    notebook :    a GtkNotebook
	--    show_border : TRUE if a bevel should be drawn around the notebook.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_scrollable ()

	--  void        gtk_notebook_set_scrollable     (GtkNotebook *notebook,
	--                                               gboolean scrollable);

	--    Sets whether the tab label area will have arrows for scrolling if there are too many tabs to fit in
	--    the area.

	--    notebook :   a GtkNotebook
	--    scrollable : TRUE if scroll arrows should be added

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_tab_border ()

	--  void        gtk_notebook_set_tab_border     (GtkNotebook *notebook,
	--                                               guint border_width);

	--   Warning

	--    gtk_notebook_set_tab_border is deprecated and should not be used in newly-written code.

	--    Sets the width the border around the tab labels in a notebook. This is equivalent to calling
	--    gtk_notebook_set_tab_hborder (notebook, border_width) followed by gtk_notebook_set_tab_vborder
	--    (notebook, border_width).

	--    notebook :     a GtkNotebook
	--    border_width : width of the border around the tab labels.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_popup_enable ()

	--  void        gtk_notebook_popup_enable       (GtkNotebook *notebook);

	--    Enables the popup menu: if the user clicks with the right mouse button on the bookmarks, a menu
	--    with all the pages will be popped up.

	--    notebook : a GtkNotebook

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_popup_disable ()

	--  void        gtk_notebook_popup_disable      (GtkNotebook *notebook);

	--    Disables the popup menu.

	--    notebook : a GtkNotebook

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_current_page ()

	--  gint        gtk_notebook_get_current_page   (GtkNotebook *notebook);

	--    Returns the page number of the current page.

	--    notebook : a GtkNotebook
	--    Returns :  the index (starting from 0) of the current page in the notebook. If the notebook has no
	--               pages, then -1 will be returned.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_menu_label ()

	--  GtkWidget*  gtk_notebook_get_menu_label     (GtkNotebook *notebook,
	--                                               GtkWidget *child);

	--    Retrieves the menu label widget of the page containing child.

	--    notebook : a GtkNotebook
	--    child :    a widget contained in a page of notebook
	--    Returns :  the menu label, or NULL if the notebook page does not have a menu label other than the
	--               default (the tab label).

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_nth_page ()

	--  GtkWidget*  gtk_notebook_get_nth_page       (GtkNotebook *notebook,
	--                                               gint page_num);

	--    Returns the child widget contained in page number page_num.

	--    notebook : a GtkNotebook
	--    page_num : the index of a page in the noteobok, or -1 to get the last page.
	--    Returns :  the child widget, or NULL if page_num is out of bounds.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_n_pages ()

	--  gint        gtk_notebook_get_n_pages        (GtkNotebook *notebook);

	--    Gets the number of pages in a notebook.

	--    notebook : a GtkNotebook
	--    Returns :  the number of pages in the notebook.

	--    Since 2.2

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_tab_label ()

	--  GtkWidget*  gtk_notebook_get_tab_label      (GtkNotebook *notebook,
	--                                               GtkWidget *child);

	--    Returns the tab label widget for the page child. NULL is returned if child is not in notebook or if
	--    no tab label has specifically been set for child.

	--    notebook : a GtkNotebook
	--    child :    the page
	--    Returns :  the tab label

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_query_tab_label_packing ()

	--  void        gtk_notebook_query_tab_label_packing
	--                                              (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               gboolean *expand,
	--                                               gboolean *fill,
	--                                               GtkPackType *pack_type);

	--    Query the packing attributes for the tab label of the page containing child.

	--    notebook :  a GtkNotebook
	--    child :     the page
	--    expand :    location to store the expand value (or NULL)
	--    fill :      location to store the fill value (or NULL)
	--    pack_type : location to store the pack_type (or NULL)

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_homogeneous_tabs ()

	--  void        gtk_notebook_set_homogeneous_tabs
	--                                              (GtkNotebook *notebook,
	--                                               gboolean homogeneous);

	--   Warning

	--    gtk_notebook_set_homogeneous_tabs is deprecated and should not be used in newly-written code.

	--    Sets whether the tabs must have all the same size or not.

	--    notebook :    a GtkNotebook
	--    homogeneous : TRUE if all tabs should be the same size.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_menu_label ()

	--  void        gtk_notebook_set_menu_label     (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               GtkWidget *menu_label);

	--    Changes the menu label for the page containing child.

	--    notebook :   a GtkNotebook
	--    child :      the child widget
	--    menu_label : the menu label, or NULL for default

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_menu_label_text ()

	--  void        gtk_notebook_set_menu_label_text
	--                                              (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               const gchar *menu_text);

	--    Creates a new label and sets it as the menu label of child.

	--    notebook :  a GtkNotebook
	--    child :     the child widget
	--    menu_text : the label text

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_tab_hborder ()

	--  void        gtk_notebook_set_tab_hborder    (GtkNotebook *notebook,
	--                                               guint tab_hborder);

	--   Warning

	--    gtk_notebook_set_tab_hborder is deprecated and should not be used in newly-written code.

	--    Sets the width of the horizontal border of tab labels.

	--    notebook :    a GtkNotebook
	--    tab_hborder : width of the horizontal border of tab labels.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_tab_label ()

	--  void        gtk_notebook_set_tab_label      (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               GtkWidget *tab_label);

	--    Changes the tab label for child. If NULL is specified for tab_label, then the page will have the
	--    label 'page N'.

	--    notebook :  a GtkNotebook
	--    child :     the page
	--    tab_label : the tab label widget to use, or NULL for default tab label.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_tab_label_packing ()

	--  void        gtk_notebook_set_tab_label_packing
	--                                              (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               gboolean expand,
	--                                               gboolean fill,
	--                                               GtkPackType pack_type);

	--    Sets the packing parameters for the tab label of the page containing child. See
	--    gtk_box_pack_start() for the exact meaning of the parameters.

	--    notebook :  a GtkNotebook
	--    child :     the child widget
	--    expand :    whether to expand the bookmark or not
	--    fill :      whether the bookmark should fill the allocated area or not
	--    pack_type : the position of the bookmark

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_tab_label_text ()

	--  void        gtk_notebook_set_tab_label_text (GtkNotebook *notebook,
	--                                               GtkWidget *child,
	--                                               const gchar *tab_text);

	--    Creates a new label and sets it as the tab label for the page containing child.

	--    notebook : a GtkNotebook
	--    child :    the page
	--    tab_text : the label text

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_set_tab_vborder ()

	--  void        gtk_notebook_set_tab_vborder    (GtkNotebook *notebook,
	--                                               guint tab_vborder);

	--   Warning

	--    gtk_notebook_set_tab_vborder is deprecated and should not be used in newly-written code.

	--    Sets the width of the vertical border of tab labels.

	--    notebook :    a GtkNotebook
	--    tab_vborder : width of the vertical border of tab labels.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_menu_label_text ()

	--  const gchar* gtk_notebook_get_menu_label_text
	--                                              (GtkNotebook *notebook,
	--                                               GtkWidget *child);

	--    Retrieves the text of the menu label for the page containing child.

	--    notebook : a GtkNotebook
	--    child :    the child widget of a page of the notebook.
	--    Returns :  value: the text of the tab label, or NULL if the widget does not have a menu label other
	--               than the default menu label, or the menu label widget is not a GtkLabel. The string is
	--               owned by the widget and must not be freed.

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_scrollable ()

	--  gboolean    gtk_notebook_get_scrollable     (GtkNotebook *notebook);

	--    Returns whether the tab label area has arrows for scrolling. See gtk_notebook_set_scrollable().

	--    notebook : a GtkNotebook
	--    Returns :  TRUE if arrows for scrolling are present

	--    ---------------------------------------------------------------------------------------------------

	--   gtk_notebook_get_show_border ()

	--  gboolean    gtk_notebook_get_show_border    (GtkNotebook *notebook);

	--    Returns whether a bevel will be drawn around the notebook pages. See
	--    gtk_notebook_set_show_border().

	--    notebook : a GtkNotebook
	--    Returns :  TRUE if the bevel is drawn

	--    ---------------------------------------------------------------------------------------------------

	are_tabs_shown: BOOLEAN is
			-- Are the tabs shown? See `show_tabs'.
		do
			Result := (gtk_notebook_get_show_tabs(handle).to_boolean)
		end

	tab_label_text (a_child: GTK_WIDGET): STRING is
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
			if ptr.is_not_null then 
				create Result.from_external_copy (ptr) 
			end
		end

	--    ---------------------------------------------------------------------------------------------------

	tab_position: INTEGER is
			-- The edge at which the tabs for switching pages in the
			-- notebook are drawn.
		do
			Result:=gtk_notebook_get_tab_pos    (handle)
		ensure valid_position: is_valid_gtk_position_type (Result)
		end

	set_current_page (a_page_num: INTEGER) is
			-- Switches to the page number `a_page_num', the index of the
			-- page to switch to, starting from 0. If negative, the last
			-- page will be used. If greater than the number of pages in
			-- the notebook, nothing will be done.
		do
			gtk_notebook_set_current_page (handle, a_page_num)
		end
	
feature -- Properties
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
feature -- Signals

--  "change-current-page"
--              void        user_function      (GtkNotebook *notebook,
--                                              gint         arg1,
--                                              gpointer     user_data)      : Run last / Action
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
--  "switch-page"
--              void        user_function      (GtkNotebook     *notebook,
--                                              GtkNotebookPage *page,
--                                              guint            page_num,
--                                              gpointer         user_data)      : Run last

-- Signal Details

--   The "change-current-page" signal

--  void        user_function                  (GtkNotebook *notebook,
--                                              gint         arg1,
--                                              gpointer     user_data)      : Run last / Action

--    notebook :  the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

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

--    ---------------------------------------------------------------------------------------------------

--   The "switch-page" signal

--  void        user_function                  (GtkNotebook     *notebook,
--                                              GtkNotebookPage *page,
--                                              guint            page_num,
--                                              gpointer         user_data)      : Run last

--    Emitted when the user or a function changes the current page.

--    notebook :  the object which received the signal.
--    page :      the new current page
--    page_num :  the index of the page
--    user_data : user data set when the signal handler was connected.

feature {NONE} -- External calls
	gtk_notebook_new: POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_append_page (a_notebook, a_child, a_tab_label: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_append_page_menu (a_notebook, a_child, a_tab_label, a_menu_label: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_prepend_page (a_notebook, a_child, a_tab_label: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_prepend_page_menu (a_notebook, a_child, a_tab_label, a_menu_label: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_insert_page (a_notebook, a_child, a_tab_label: POINTER; a_position: INTEGER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_insert_page_menu (a_notebook, a_child, a_tab_label, a_menu_label: POINTER; a_position: INTEGER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_remove_page (a_notebook: POINTER; a_page_num: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_page_num (a_notebook, a_child: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_next_page (a_notebook: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_prev_page (a_notebook: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_reorder_child (a_notebook, a_child: POINTER; a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_pos (a_notebook: POINTER; a_position: INTEGER) is
		require valid_position: is_valid_gtk_position_type (a_position)
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_show_tabs (a_notebook: POINTER; show_tabs: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_show_border (a_notebook: POINTER; show_border: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_scrollable (a_notebook: POINTER; scrollable: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_border (a_notebook: POINTER; a_border_width: INTEGER) is
			-- Note: `a_border_width' shall be a NATURAL since its a guint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_popup_enable (a_notebook: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_popup_disable (a_notebook: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_current_page (a_notebook: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_menu_label (a_notebook, a_child: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_nth_page (a_notebook: POINTER; a_page_num: INTEGER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_get_n_pages (a_notebook: POINTER): INTEGER is --gint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_tab_label (a_notebook, a_child: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_query_tab_label_packing (a_notebook, a_child, expand, fill, pack_type: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_homogeneous_tabs (a_notebook: POINTER; homogeneous: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_menu_label (a_notebook, a_child, a_menu_label: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_menu_label_text (a_notebook, a_child, a_menu_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_hborder (a_notebook: POINTER; a_tab_hborder: INTEGER) is
			-- Note: `a_tab_hborder' shall be NATURAL since its a guint
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_label (a_notebook, a_child, a_tab_label: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_set_tab_label_packing (a_notebook, a_child: POINTER; expand, fill, pack_type: INTEGER) is
		require valid_pack_type: is_valid_pack_type (pack_type)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_set_tab_label_text (a_notebook, a_child, a_tab_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_set_tab_vborder (a_notebook: POINTER; a_tab_vborder) is
		-- Note: `a_tab_vborder' shall be NATURAL since its a guint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_get_menu_label_text (a_notebook, a_child: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_get_scrollable (a_notebook: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_get_show_border (a_notebook: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_get_show_tabs (a_notebook: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_notebook_get_tab_label_text (a_notebook, a_child: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_notebook_get_tab_pos (a_notebook: POINTER): INTEGER is -- GtkPositionType
		external "C use <gtk/gtk.h>"
		ensure valid_result: is_valid_gtk_position_type (Result)
		end
	
	gtk_notebook_set_current_page (a_notebook: POINTER; a_page_num: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
end
