note
	description: "GtkAssistant -- A widget used to guide users through multi-step."
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


class GTK_ASSISTANT
	-- A GtkAssistant is a widget used to represent a generally complex
	-- operation splitted in several steps, guiding the user through
	-- its pages and controlling the page flow to collect the necessary
	-- data.

inherit
	GTK_WINDOW
		undefine
			struct_size
		redefine
			make
		end
		-- GtkAssistant implements AtkImplementorIface.

	CANCEL_SIGNAL_RECEIVER
	
insert
	G_OBJECT_FACTORY [GTK_WIDGET]
	GTK_ASSISTANT_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkAssistant.
		do
			from_external_pointer(gtk_assistant_new)
		end
	
feature {ANY}
	current_page: INTEGER
			-- The index (starting from 0) of the current page in the
			-- assistant, if the assistant has no pages, it will be -1.
		do
			Result:=gtk_assistant_get_current_page (handle)
		ensure valid: Result >= -1
		end

	set_current_page (a_page_num: INTEGER)
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

	pages_n: INTEGER
			-- The number of pages in the assistant.
		do
			Result:=gtk_assistant_get_n_pages(handle)
		end

	item (a_page_num: INTEGER): GTK_WIDGET
			-- The child widget contained in page number `a_page_num';
			-- set it to -1 to get the last page; Result is Void
			-- `a_page_num' is out of bounds.
		local ptr: POINTER
		do
			ptr:=gtk_assistant_get_nth_page(handle, a_page_num)
			if ptr.is_not_null then
				Result:=wrapper(ptr)
				if Result=Void then
					debug
						print("Warning: GTK_ASSISTANT.item received a %
								%GtkWidget pointer of an unwrapped widget. %
								%Since we don't know which the correct effective wrapper %
								%class feature Result will be Void.%N")
					end
				end
			end
		end

	last_inserted_page: INTEGER
			-- The index (starting at 0) of the inserted page
	
	prepend (a_page: GTK_WIDGET)
			-- Prepends `a_page' to the assistant. `last_inserted_page' 
			-- will be updated.
		require page_not_void: a_page /= Void
		do
			last_inserted_page:=gtk_assistant_prepend_page(handle, a_page.handle)
		end

	append (a_page: GTK_WIDGET)
			-- Appends `a_page' to the assistant. `last_inserted_page' 
			-- will be updated.
		require page_not_void: a_page /= Void
		do
			last_inserted_page:=gtk_assistant_append_page(handle,a_page.handle)
		end

	insert_page (a_page: GTK_WIDGET; a_position: INTEGER)
			-- Inserts `a_page' in the assistant at `a_position',
			-- starting at 0; -1 to append the page to the assistant.
		require page_not_void: a_page /= Void
		do
			last_inserted_page:=gtk_assistant_insert_page(handle, a_page.handle, a_position)
		end

	-- GtkAssistantPageFunc ()
	
	-- gint (*GtkAssistantPageFunc) (gint current_page, gpointer data);
	
	-- A function used by gtk_assistant_set_forward_page_func() to know
	-- which is the next page given a current one. It's called both for
	-- computing the next page when the user presses the "forward"
	-- button and for handling the behavior of the "last" button.

	-- current_page : The page number used to calculate the next page.
	-- data : user data.  Returns : The next page number.

	--	TODO: set_forward_page (an_agent)
	
	-- void gtk_assistant_set_forward_page_func (GtkAssistant
	-- *assistant, GtkAssistantPageFunc page_func, gpointer data,
	-- GDestroyNotify destroy);

	-- Sets the page forwarding function to be page_func, this function
	-- will be used to determine what will be the next page when the
	-- user presses the forward button. Setting page_func to NULL will
	-- make the assistant to use the default forward function, which
	-- just goes to the next visible page.

	--    assistant : a GtkAssistant
	--    page_func : the GtkAssistantPageFunc, or NULL to use the default one
	--    data :      user data for page_func
	--    destroy :   destroy notifier for data
	
	set_page_type (a_page: GTK_WIDGET; a_type: INTEGER)
			-- Sets the page type for `a_page'. The page type determines the
			-- page behavior in the assistant.
		require
			page_not_void: a_page /= Void
			valid_page_type: is_valid_gtk_page_type(a_type)
		do
			gtk_assistant_set_page_type (handle, a_page.handle, a_type)
		end

	page_type (a_page: GTK_WIDGET): INTEGER
			-- The type of `a_page'.
		require page_not_void: a_page /= Void
		do
			Result := gtk_assistant_get_page_type (handle, a_page.handle)
		ensure valid_page_type: is_valid_gtk_page_type(Result)
		end

	set_page_title (a_page: GTK_WIDGET; a_title: STRING)
			-- Sets `a_title' for `a_page'. The title is displayed in the
			-- header area of the assistant when page is the current
			-- page.
		require
			page_not_void: a_page /= Void
			title_not_void: a_title/=Void
		do
			gtk_assistant_set_page_title(handle, a_page.handle, a_title.to_external)
		end

	page_title (a_page: GTK_WIDGET): STRING
			-- the title for `a_page'.
		require page_not_void: a_page /= Void
		do
			create {CONST_STRING} Result.from_external
			(gtk_assistant_get_page_title(handle, a_page.handle))
		end

	set_page_header_image (a_page: GTK_WIDGET; a_pixbuf: GDK_PIXBUF)
			-- Sets a header image for page. This image is displayed in
			-- the header area of the assistant when page is the current
			-- page.
		require
			page_not_void: a_page /= Void
			pixbuf_not_void: a_pixbuf /= Void
		do
			gtk_assistant_set_page_header_image(handle, a_page.handle, a_pixbuf.handle)
		end

	page_header_image (a_page: GTK_WIDGET): GDK_PIXBUF
			-- The header image for page; Void if there's no header image
			-- for the page.
		local factory: G_OBJECT_EXPANDED_FACTORY[GDK_PIXBUF]
		do
			Result := factory.wrapper_or_void
			(gtk_assistant_get_page_header_image
			(handle, a_page.handle))
		end

	set_page_side_image (a_page: GTK_WIDGET; a_pixbuf: GDK_PIXBUF)
		-- Sets a header image for `a_page'. This image is displayed
		-- in the side area of the assistant when page is the current
		-- page.
	require
		page_not_void: a_page /= Void
		pixbuf_not_void: a_pixbuf /= Void
	do
		gtk_assistant_set_page_side_image(handle, a_page.handle, a_pixbuf.handle)
	end

	page_side_image (a_page: GTK_WIDGET): GDK_PIXBUF
			-- The side image for page, or Void if there's no side image
			-- for the page.
		require page_not_void: a_page /= Void
		local factory: G_OBJECT_EXPANDED_FACTORY[GDK_PIXBUF]
		do
			Result:=factory.wrapper_or_void(gtk_assistant_get_page_side_image(handle, a_page.handle))
		end
	
	set_page_complete (a_page: GTK_WIDGET; is_complete: BOOLEAN)
			-- Sets whether page contents are complete. This will make
			-- assistant update the buttons state to be able to continue
			-- the task.
		require page_not_void: a_page /= Void
		do
			gtk_assistant_set_page_complete (handle, a_page.handle, is_complete.to_integer)
		end

	is_page_complete (a_page: GTK_WIDGET): BOOLEAN
			-- Is `a_page' complete?
		require page_not_void: a_page /= Void
		do
			Result:=(gtk_assistant_get_page_complete (handle,a_page.handle)).to_boolean
		end

	add_action_widget (a_child: GTK_WIDGET)
			-- Adds `a_child' to the action area of a GtkAssistant.
		require child_not_void: a_child /= Void
		do
			gtk_assistant_add_action_widget (handle, a_child.handle)
		end
	
	remove_action_widget (a_child: GTK_WIDGET)
			-- Removes `a_child' from the action area of a GtkAssistant.
		require child_not_void: a_child /= Void
		do
			gtk_assistant_remove_action_widget(handle, a_child.handle)
		end

	update_buttons_state
			-- Forces assistant to recompute the buttons state. GTK+
			-- automatically takes care of this in most situations,
			-- e.g. when the user goes to a different page, or when the
			-- visibility or completeness of a page changes. One
			-- situation where it can be necessary to call this function
			-- is when changing a value on the current page affects the
			-- future page flow of the assistant.
		do
			gtk_assistant_update_buttons_state(handle)
		end

feature {ANY} -- Child Properties
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
	--  "cancel"    void        user_function      (GtkAssistant *assistant,
	--                                              gpointer      user_data)      : Run last
	--  "close"     void        user_function      (GtkAssistant *assistant,
	--                                              gpointer      user_data)      : Run last
	--  "prepare"   void        user_function      (GtkAssistant *assistant,
	--                                              GtkWidget    *page,
	--                                              gpointer      user_data)      : Run last

	-- Signal Details

feature {ANY} -- The "apply" signal

	apply_signal_name: STRING is "apply"

	enable_on_apply
			-- Connects "apply" signal to `on_apply' feature.
		do
			connect (Current, apply_signal_name, $on_apply)
		end

	on_apply
			-- Built-in activate signal handler; empty by design; redefine it.
		
			-- The ::apply signal is emitted when the apply button is
			-- clicked. The default behavior of the GtkAssistant is to
			-- switch to the page after the current page, unless the
			-- current page is the last one.
			
			-- A handler for the ::apply signal should carry out the
			-- actions for which the wizard has collected data. If the
			-- action takes a long time to complete, you might consider
			-- to put a page of type GTK_ASSISTANT_PAGE_PROGRESS after
			-- the confirmation page and handle this operation within the
			-- ::prepare signal of the progress page.
		do
		end

	connect_agent_to_apply_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_ASSISTANT]])
		require
			valid_procedure: a_procedure /= Void
		local
			apply_callback: APPLY_CALLBACK 
		do
			create apply_callback.make
			apply_callback.connect (Current, a_procedure)
		end

feature {ANY} --   The "cancel" signal

	-- void user_function (GtkAssistant *assistant, gpointer user_data)
	-- : Run last

	-- The ::cancel signal is emitted when then the cancel button is
	-- clicked.

	--    assistant : the GtkAssistant
	--    user_data : user data set when the signal handler was connected.

	--    Since 2.10

	--    --------------------------------------------------------------------------

feature {ANY} --   The "close" signal

	-- void user_function (GtkAssistant *assistant, gpointer user_data)
	-- : Run last

	-- The ::close signal is emitted either when the close button of a
	-- summary page is clicked, or when the apply button in the last
	-- page in the flow (of type GTK_ASSISTANT_PAGE_CONFIRM) is
	-- clicked.

	--    assistant : the GtkAssistant
	--    user_data : user data set when the signal handler was connected.

	--    Since 2.10

	--    --------------------------------------------------------------------------

feature {ANY} --   The "prepare" signal

	-- void user_function (GtkAssistant *assistant, GtkWidget *page,
	-- gpointer user_data) : Run last

	-- The ::prepared signal is emitted when a new page is set as the
	-- assistant's current page, before making the new page visible. A
	-- handler for this signal can do any preparation which are
	-- necessary before showing page.

	--    assistant : the GtkAssistant
	--    page :      the current page
	--    user_data : user data set when the signal handler was connected.

	--    Since 2.10

end -- class GTK_ASSISTANT
