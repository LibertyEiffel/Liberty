indexing
	description: "GtkAssistant -- A widget used to guide users through multi-step."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

			-- Description: A GtkAssistant is a widget used to represent
			-- a generally complex operation splitted in several steps,
			-- guiding the user through its pages and controlling the
			-- page flow to collect the necessary data.

class GTK_ASSISTANT

inherit
	GTK_WINDOW

		-- GtkAssistant implements AtkImplementorIface.
	
insert GTK_ASSISTANT_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
	make is
			-- Creates a new GtkAssistant.
		do
			from_external_pointer(gtk_assistant_new)
		end
	
feature
	current_page: INTEGER is
			-- The index (starting from 0) of the current page in the
			-- assistant, if the assistant has no pages, it will be -1.
		do
			Result:=gtk_assistant_get_current_page (handle)
		ensure valid >= -1
		end

	set_current_page (a_page_num: INTEGER) is
			-- Switches the page to `a_page_num'. Note that this will
			-- only be necessary in custom buttons, as the assistant flow
			-- can be set with `set_forward_page_func'.
		
			-- `a_page_num': index of the page to switch to, starting
			-- from 0. If negative, the last page will be used. If
			-- greater than the number of pages in the assistant, nothing
			-- will be done.
		do
			gtk_assistant_set_current_page (handle, a_page_num)
		end

	pages_n: INTEGER is
			-- The number of pages in the assistant.
		do
			Result:=gtk_assistant_get_n_pages(handle)
		end

	item (a_page_num: INTEGER): GTK_WIDGET is
			-- The child widget contained in page number page_num.
		
			--    page_num : The index of a page in the assistant, or -1
			--    to get the last page; Returns : The child widget, or
			--    NULL if page_num is out of bounds.
		local ptr: POINTER
		do
			ptr:=gtk_assistant_get_nth_page(handle, a_page_num)
		ensure implemented: False
		end

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_prepend_page ()

--  gint        gtk_assistant_prepend_page      (GtkAssistant *assistant,
--                                               GtkWidget *page);

--    Prepends a page to the assistant.

--    assistant : a GtkAssistant
--    page :      a GtkWidget
--    Returns :   the index (starting at 0) of the inserted page

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_append_page ()

--  gint        gtk_assistant_append_page       (GtkAssistant *assistant,
--                                               GtkWidget *page);

--    Appends a page to the assistant.

--    assistant : a GtkAssistant
--    page :      a GtkWidget
--    Returns :   the index (starting at 0) of the inserted page

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_insert_page ()

--  gint        gtk_assistant_insert_page       (GtkAssistant *assistant,
--                                               GtkWidget *page,
--                                               gint position);

--    Inserts a page in the assistant at a given position.

--    assistant : a GtkAssistant
--    page :      a GtkWidget
--    position :  the index (starting at 0) at which to insert the page, or -1
--                to append the page to the assistant
--    Returns :   the index (starting from 0) of the inserted page

--    Since 2.10

--    --------------------------------------------------------------------------

--   GtkAssistantPageFunc ()

--  gint        (*GtkAssistantPageFunc)         (gint current_page,
--                                               gpointer data);

--    A function used by gtk_assistant_set_forward_page_func() to know which is
--    the next page given a current one. It's called both for computing the next
--    page when the user presses the "forward" button and for handling the
--    behavior of the "last" button.

--    current_page : The page number used to calculate the next page.
--    data :         user data.
--    Returns :      The next page number.

--    --------------------------------------------------------------------------

--   gtk_assistant_set_forward_page_func ()

--  void        gtk_assistant_set_forward_page_func
--                                              (GtkAssistant *assistant,
--                                               GtkAssistantPageFunc page_func,
--                                               gpointer data,
--                                               GDestroyNotify destroy);

--    Sets the page forwarding function to be page_func, this function will be
--    used to determine what will be the next page when the user presses the
--    forward button. Setting page_func to NULL will make the assistant to use
--    the default forward function, which just goes to the next visible page.

--    assistant : a GtkAssistant
--    page_func : the GtkAssistantPageFunc, or NULL to use the default one
--    data :      user data for page_func
--    destroy :   destroy notifier for data

--    Since 2.10

--    --------------------------------------------------------------------------

--   enum GtkAssistantPageType

--  typedef enum
--  {
--    GTK_ASSISTANT_PAGE_CONTENT,
--    GTK_ASSISTANT_PAGE_INTRO,
--    GTK_ASSISTANT_PAGE_CONFIRM,
--    GTK_ASSISTANT_PAGE_SUMMARY,
--    GTK_ASSISTANT_PAGE_PROGRESS
--  } GtkAssistantPageType;

--    An enum for determining the page role inside the GtkAssistant. It's used
--    to handle buttons sensitivity and visibility.

--    Note that an assistant needs to end its page flow with a page of type
--    GTK_ASSISTANT_PAGE_CONFIRM or GTK_ASSISTANT_PAGE_SUMMARY to be correct.

--    GTK_ASSISTANT_PAGE_CONTENT  The page has regular contents.
--    GTK_ASSISTANT_PAGE_INTRO    The page contains an introduction to the
--                                assistant task.
--    GTK_ASSISTANT_PAGE_CONFIRM  The page lets the user confirm or deny the
--                                changes.
--    GTK_ASSISTANT_PAGE_SUMMARY  The page informs the user of the changes done.
--    GTK_ASSISTANT_PAGE_PROGRESS Used for tasks that take a long time to
--                                complete, blocks the assistant until the page
--                                is marked as complete.

--    --------------------------------------------------------------------------

--   gtk_assistant_set_page_type ()

--  void        gtk_assistant_set_page_type     (GtkAssistant *assistant,
--                                               GtkWidget *page,
--                                               GtkAssistantPageType type);

--    Sets the page type for page. The page type determines the page behavior in
--    the assistant.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    type :      the new type for page

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_get_page_type ()

--  GtkAssistantPageType gtk_assistant_get_page_type
--                                              (GtkAssistant *assistant,
--                                               GtkWidget *page);

--    Gets the page type of page.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    Returns :   the page type of page.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_set_page_title ()

--  void        gtk_assistant_set_page_title    (GtkAssistant *assistant,
--                                               GtkWidget *page,
--                                               const gchar *title);

--    Sets a title for page. The title is displayed in the header area of the
--    assistant when page is the current page.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    title :     the new title for page

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_get_page_title ()

--  const gchar* gtk_assistant_get_page_title   (GtkAssistant *assistant,
--                                               GtkWidget *page);

--    Gets the title for page.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    Returns :   the title for page.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_set_page_header_image ()

--  void        gtk_assistant_set_page_header_image
--                                              (GtkAssistant *assistant,
--                                               GtkWidget *page,
--                                               GdkPixbuf *pixbuf);

--    Sets a header image for page. This image is displayed in the header area
--    of the assistant when page is the current page.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    pixbuf :    the new header image page

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_get_page_header_image ()

--  GdkPixbuf*  gtk_assistant_get_page_header_image
--                                              (GtkAssistant *assistant,
--                                               GtkWidget *page);

--    Gets the header image for page.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    Returns :   the header image for page, or NULL if there's no header image
--                for the page.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_set_page_side_image ()

--  void        gtk_assistant_set_page_side_image
--                                              (GtkAssistant *assistant,
--                                               GtkWidget *page,
--                                               GdkPixbuf *pixbuf);

--    Sets a header image for page. This image is displayed in the side area of
--    the assistant when page is the current page.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    pixbuf :    the new header image page

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_get_page_side_image ()

--  GdkPixbuf*  gtk_assistant_get_page_side_image
--                                              (GtkAssistant *assistant,
--                                               GtkWidget *page);

--    Gets the header image for page.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    Returns :   the side image for page, or NULL if there's no side image for
--                the page.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_set_page_complete ()

--  void        gtk_assistant_set_page_complete (GtkAssistant *assistant,
--                                               GtkWidget *page,
--                                               gboolean complete);

--    Sets whether page contents are complete. This will make assistant update
--    the buttons state to be able to continue the task.

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    complete :  the completeness status of the page

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_get_page_complete ()

--  gboolean    gtk_assistant_get_page_complete (GtkAssistant *assistant,
--                                               GtkWidget *page);

--    Gets whether page is complete..

--    assistant : a GtkAssistant
--    page :      a page of assistant
--    Returns :   TRUE if page is complete.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_add_action_widget ()

--  void        gtk_assistant_add_action_widget (GtkAssistant *assistant,
--                                               GtkWidget *child);

--    Adds a widget to the action area of a GtkAssistant.

--    assistant : a GtkAssistant
--    child :     a GtkWidget

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_remove_action_widget ()

--  void        gtk_assistant_remove_action_widget
--                                              (GtkAssistant *assistant,
--                                               GtkWidget *child);

--    Removes a widget from the action area of a GtkAssistant.

--    assistant : a GtkAssistant
--    child :     a GtkWidget

--    Since 2.10

--    --------------------------------------------------------------------------

--   gtk_assistant_update_buttons_state ()

--  void        gtk_assistant_update_buttons_state
--                                              (GtkAssistant *assistant);

--    Forces assistant to recompute the buttons state.

--    GTK+ automatically takes care of this in most situations, e.g. when the
--    user goes to a different page, or when the visibility or completeness of a
--    page changes.

--    One situation where it can be necessary to call this function is when
--    changing a value on the current page affects the future page flow of the
--    assistant.

--    assistant : a GtkAssistant

--    Since 2.10

-- Child Properties


--    "complete"             gboolean              : Read / Write
--    "header-image"         GdkPixbuf             : Read / Write
--    "page-type"            GtkAssistantPageType  : Read / Write
--    "sidebar-image"        GdkPixbuf             : Read / Write
--    "title"                gchararray            : Read / Write

-- Child Property Details

--   The "complete" child property

--    "complete"             gboolean              : Read / Write

--    Setting the "complete" child property to TRUE marks a page as complete
--    (i.e.: all the required fields are filled out). GTK+ uses this information
--    to control the sensitivity of the navigation buttons.

--    Default value: FALSE

--    Since 2.10

--    --------------------------------------------------------------------------

--   The "header-image" child property

--    "header-image"         GdkPixbuf             : Read / Write

--    The image that is displayed next to the page.

--    Set this to NULL to make the sidebar disappear.

--    Since 2.10

--    --------------------------------------------------------------------------

--   The "page-type" child property

--    "page-type"            GtkAssistantPageType  : Read / Write

--    The type of the assistant page.

--    Default value: GTK_ASSISTANT_PAGE_CONTENT

--    Since 2.10

--    --------------------------------------------------------------------------

--   The "sidebar-image" child property

--    "sidebar-image"        GdkPixbuf             : Read / Write

--    Sidebar image for the assistant page.

--    --------------------------------------------------------------------------

--   The "title" child property

--    "title"                gchararray            : Read / Write

--    The title that is displayed in the page header.

--    If title and header-image are both NULL, no header is displayed.

--    Default value: NULL

--    Since 2.10

-- Style Properties


--    "content-padding"      gint                  : Read
--    "header-padding"       gint                  : Read

-- Style Property Details

--   The "content-padding" style property

--    "content-padding"      gint                  : Read

--    Number of pixels around the content pages.

--    Allowed values: >= 0

--    Default value: 1

--    --------------------------------------------------------------------------

--   The "header-padding" style property

--    "header-padding"       gint                  : Read

--    Number of pixels around the header.

--    Allowed values: >= 0

--    Default value: 6

-- Signals


--  "apply"     void        user_function      (GtkAssistant *assistant,
--                                              gpointer      user_data)      : Run last
--  "cancel"    void        user_function      (GtkAssistant *assistant,
--                                              gpointer      user_data)      : Run last
--  "close"     void        user_function      (GtkAssistant *assistant,
--                                              gpointer      user_data)      : Run last
--  "prepare"   void        user_function      (GtkAssistant *assistant,
--                                              GtkWidget    *page,
--                                              gpointer      user_data)      : Run last

-- Signal Details

--   The "apply" signal

--  void        user_function                  (GtkAssistant *assistant,
--                                              gpointer      user_data)      : Run last

--    The ::apply signal is emitted when the apply button is clicked. The
--    default behavior of the GtkAssistant is to switch to the page after the
--    current page, unless the current page is the last one.

--    A handler for the ::apply signal should carry out the actions for which
--    the wizard has collected data. If the action takes a long time to
--    complete, you might consider to put a page of type
--    GTK_ASSISTANT_PAGE_PROGRESS after the confirmation page and handle this
--    operation within the ::prepare signal of the progress page.

--    assistant : the GtkAssistant
--    user_data : user data set when the signal handler was connected.

--    Since 2.10

--    --------------------------------------------------------------------------

--   The "cancel" signal

--  void        user_function                  (GtkAssistant *assistant,
--                                              gpointer      user_data)      : Run last

--    The ::cancel signal is emitted when then the cancel button is clicked.

--    assistant : the GtkAssistant
--    user_data : user data set when the signal handler was connected.

--    Since 2.10

--    --------------------------------------------------------------------------

--   The "close" signal

--  void        user_function                  (GtkAssistant *assistant,
--                                              gpointer      user_data)      : Run last

--    The ::close signal is emitted either when the close button of a summary
--    page is clicked, or when the apply button in the last page in the flow (of
--    type GTK_ASSISTANT_PAGE_CONFIRM) is clicked.

--    assistant : the GtkAssistant
--    user_data : user data set when the signal handler was connected.

--    Since 2.10

--    --------------------------------------------------------------------------

--   The "prepare" signal

--  void        user_function                  (GtkAssistant *assistant,
--                                              GtkWidget    *page,
--                                              gpointer      user_data)      : Run last

--    The ::prepared signal is emitted when a new page is set as the assistant's
--    current page, before making the new page visible. A handler for this
--    signal can do any preparation which are necessary before showing page.

--    assistant : the GtkAssistant
--    page :      the current page
--    user_data : user data set when the signal handler was connected.

--    Since 2.10

end -- class GTK_ASSISTANT
