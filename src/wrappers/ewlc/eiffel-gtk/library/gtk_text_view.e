note
	description: "Multiline text view widget"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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
	
	gtk_description: "[
						You may wish to begin by reading the text widget conceptual overview
						which gives an overview of all the objects and data types related to
						the text widget and how they work together.
					]"

class GTK_TEXT_VIEW

inherit GTK_CONTAINER rename window as widget_window  end

	-- TODO: GtkTextView implements AtkImplementorIface.

insert
	GTK_TEXT_VIEW_EXTERNALS
	G_OBJECT_FACTORY [GTK_TEXT_BUFFER]
	GTK_TEXT_WINDOW_TYPE
	GTK_WRAP_MODE

create {ANY}
	make, make_with_buffer, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new GTK_TEXT_VIEW. If you don't call
			-- `set_buffer' before using the text view, an empty
			-- default buffer will be created for you. Get
			-- the buffer with `get_buffer'. If you want to
			-- specify your own buffer, consider `make_with_buffer'.
		require
			gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_text_view_new)
		end

	make_with_buffer (a_buffer: GTK_TEXT_BUFFER)
			-- Creates a new GTK_TEXT_VIEW widget displaying the buffer
			-- `a_buffer'. One buffer can be shared among many widgets.
			-- The text view adds its own reference count to the buffer;
			-- it does not take over an existing reference.
		require
			gtk_initialized: gtk.is_initialized
			buffer_not_void: a_buffer /= Void
		do
			from_external_pointer (gtk_text_view_new_with_buffer (a_buffer.handle))
		end

feature {ANY} -- Queries

	has_scrolled: BOOLEAN
			-- Has last `scroll_to_iter' have produced a scrolling?

	have_been_cursor_moved: BOOLEAN
			-- Had last feature call moved the cursor?

	was_iter_moved: BOOLEAN
			--  was iter moved? Used in `forward_display_line'

feature {ANY} -- Operations

	set_buffer (a_buffer: GTK_TEXT_BUFFER)
			-- Sets `a_buffer' as the buffer being displayed.
			-- The previous buffer displayed by the text view is unreferenced,
			-- and a reference is added to `a_buffer'.
			-- If you owned a reference to `a_buffer' before passing it
			-- to this function, you must remove that reference yourself;
			-- GTK_TEXT_VIEW will not "adopt" it.
		require
			buffer_not_null: a_buffer /= Void
		do
			gtk_text_view_set_buffer (handle, a_buffer.handle)
			cached_buffer := Void
		ensure
			buffer_is_set: buffer /= Void -- XXX: is this ok?
		end

feature {ANY} -- Access

	buffer: GTK_TEXT_BUFFER
			-- The GTK_TEXT_BUFFER being displayed by this text view.
		local
			c_buff: POINTER
		do
			if cached_buffer = Void then
				-- The reference count on the buffer returned by
				-- gtk_text_view_get_buffer is not incremented; the caller
				-- of this function won't own a new reference.
				cached_buffer:= unreffed_wrapper (gtk_text_view_get_buffer (handle))
			else
				check
					cached_buffer_doesnt_change:
					cached_buffer.handle = gtk_text_view_get_buffer (handle) 
				end
			end
			Result := cached_buffer
		end

feature {} -- Auxiliar

	cached_buffer: GTK_TEXT_BUFFER
		-- This buffer is used as a cache for values returned from `buffer'.
		-- If you don't use this the GtkTextView seems to (sometimes) switch
		-- it's buffer without warning, breaking callbacks and other code.

feature {ANY} -- Properties

--  "accepts-tab"          gboolean              : Read / Write
	--  "buffer"               GtkTextBuffer         : Read / Write
	
	-- NOTE: already wrapped "cursor-visible"
	
	-- NOTE: already wrapped "editable
	
--  "indent"               gint                  : Read / Write
--  "justification"        GtkJustification      : Read / Write
	--  "left-margin"          gint                  : Read / Write
	
	--  NOTE: already wrapped "overwrite"
	
--  "pixels-above-lines"   gint                  : Read / Write
--  "pixels-below-lines"   gint                  : Read / Write
--  "pixels-inside-wrap"   gint                  : Read / Write
--  "right-margin"         gint                  : Read / Write
--  "tabs"                 PangoTabArray         : Read / Write
--  "wrap-mode"            GtkWrapMode           : Read / Write

feature {ANY} -- Style properties:
--  "error-underline-color" GdkColor              : Read

feature {ANY}
	scroll_to_mark (a_mark: GTK_TEXT_MARK; within_margin: REAL;
					  use_align: BOOLEAN; an_x_align, an_y_align: REAL)
			-- Scrolls Current so that `a_mark' is on the screen in the
			-- position indicated by `an_x_align' and `an_y_align'. An
			-- alignment of 0.0 indicates left or top, 1.0 indicates
			-- right or bottom, 0.5 means center. If use_align is False,
			-- the text scrolls the minimal distance to get the mark
			-- onscreen, possibly not scrolling at all. The effective
			-- screen for purposes of this function is reduced by a
			-- margin of size within_margin.

			-- `within_margin' : margin as a [0.0,0.5) fraction of screen size
			
			-- `use_align' : whether to use alignment arguments (if
			-- FALSE, just get the mark onscreen)
			
			-- `an_x_align' horizontal alignment of mark within visible
			-- area.
			
			-- `an_y_align' vertical alignment of mark within visible
			-- area
		require mark_not_void: a_mark /= Void
		do
			gtk_text_view_scroll_to_mark (handle, a_mark.handle, within_margin,
													use_align.to_integer, an_x_align, an_y_align)
		end

	scroll_to_iter (an_iter: GTK_TEXT_ITER; within_margin: REAL;
					  use_align: BOOLEAN; an_x_align, an_y_align: REAL)
			-- Scrolls text_view so that iter is on the screen in the
			-- position indicated by xalign and yalign. An alignment of
			-- 0.0 indicates left or top, 1.0 indicates right or bottom,
			-- 0.5 means center. If use_align is FALSE, the text scrolls
			-- the minimal distance to get the mark onscreen, possibly
			-- not scrolling at all. The effective screen for purposes of
			-- this function is reduced by a margin of size
			-- within_margin. NOTE: This function uses the
			-- currently-computed height of the lines in the text
			-- buffer. Note that line heights are computed in an idle
			-- handler; so this function may not have the desired effect
			-- if it's called before the height computations. To avoid
			-- oddness, consider using `scroll_to_mark' which saves a
			-- point to be scrolled to after line validation.

			-- `within_margin' : margin as a [0.0,0.5) fraction of screen size
		
			-- `use_align': whether to use alignment arguments (if FALSE,
			-- just get the mark onscreen)
		
			-- `an_x_align': horizontal alignment of mark within visible
			-- area.
		
			-- `an_y_align': vertical alignment of mark within visible
			-- area

			-- `has_scrolled' will be True if scrolling occurred
		require iter_not_void: an_iter /= Void
		do
			has_scrolled := ( gtk_text_view_scroll_to_iter
									(handle, an_iter.handle, within_margin,
									 use_align.to_integer, an_x_align, an_y_align) ).to_boolean
		end

	mark_onscreen (a_mark: GTK_TEXT_MARK)
			-- Scrolls text view the minimum distance such that `a_mark'
			-- is contained within the visible area of the widget.
		require mark_not_void: a_mark /= Void
		do
			gtk_text_view_scroll_mark_onscreen (handle, a_mark.handle)
		end

	move_mark_onscreen (a_mark: GTK_TEXT_MARK): BOOLEAN
			-- Moves a mark within the buffer so that it's located within
			-- the currently-visible text area.
		
			-- Returns : TRUE if the mark moved (wasn't already onscreen)
		require mark_not_void: a_mark /= Void
		do
			Result := (gtk_text_view_move_mark_onscreen (handle, a_mark.handle)).to_boolean
		end

	place_cursor_onscreen
			-- Moves the cursor to the currently visible region of the
			-- buffer, if it isn't there already.
			-- `have_been_cursor_moved' will be true if the cursor had to
			-- be moved.
		do
			have_been_cursor_moved:= gtk_text_view_place_cursor_onscreen (handle).to_boolean
		end

	visible_rect: GDK_RECTANGLE
			-- the currently-visible region of the buffer, in buffer
			-- coordinates. Convert to window coordinates with
			-- `buffer_to_window_coords'.
		do
			create Result.make
			gtk_text_view_get_visible_rect (handle, Result.handle)
		end

	iter_location (an_iterator: GTK_TEXT_ITER): GDK_RECTANGLE
			-- A rectangle which roughly contains the character at
			-- `an_iterator'. The rectangle position is in buffer
			-- coordinates; use `buffer_to_window_coords' to convert
			-- these coordinates to coordinates for one of the windows in
			-- the text view.
		require iterator_not_void: an_iterator/=Void
		do
			create Result.make
			gtk_text_view_get_iter_location (handle, an_iterator.handle, Result.handle)
		end

	set_iter_line_at_y (an_iterator: GTK_TEXT_ITER; a_y: INTEGER)
			-- Sets `an_iterator' at the start of the line containing the
			-- coordinate `an_y'. `an_y' is in buffer coordinates,
			-- convert from window coordinates with
			-- `window_to_buffer_coords'.
			
			-- TODO: retrieve the location for top coordinate of the line
		require iterator_not_void: an_iterator/=Void
		do
			gtk_text_view_get_line_at_y (handle, an_iterator.handle, a_y,
												  default_pointer -- gint *line_top
												 )
			-- Gets the GtkTextIter at the start of the line containing
			-- the coordinate y. y is in buffer coordinates, convert from
			-- window coordinates with
			-- gtk_text_view_window_to_buffer_coords(). If non-NULL,
			-- line_top will be filled with the coordinate of the top
			-- edge of the line.
		end

	-- TODO: uncomment this once the TUPLE bug get solved.
	-- 	line_y_range (an_iterator): TUPLE [INTEGER, INTEGER] is
	-- 			-- Gets the y coordinate of the top of the line containing
	-- 			-- iter, and the height of the line. The coordinate is a
	-- 			-- buffer coordinate; convert to window coordinates with
	-- 			-- `buffer_to_window_coords'.
	-- 		require iterator_not_void: an_iterator/=Void
	-- 		local y,height: INTEGER
	-- 		do
	-- 			gtk_text_view_get_line_yrange (handle, an_iterator.handle,
	-- 													 $y, $height)
	-- 			create Result.make_2 (y,height)
	-- 		end

	iter_at_location (an_x, an_y: INTEGER): GTK_TEXT_ITER
			-- Retrieves the iterator at buffer coordinates `an_x' and
			-- `an_y'. Buffer coordinates are coordinates for the entire
			-- buffer, not just the currently-displayed portion. If you
			-- have coordinates from an event, you have to convert those
			-- to buffer coordinates with `window_to_buffer_coords'.
		do
			create Result.make
			gtk_text_view_get_iter_at_location (handle, Result.handle, an_x, an_y)
		ensure result_not_void: Result /= Void
		end
	
	iter_at_position (an_x, an_y: INTEGER): TUPLE[GTK_TEXT_ITER,INTEGER]
			-- the iterator pointing to the character at buffer
			-- coordinates `an_x' and `an_y' and the number of characters
			-- in the grapheme (0 represents the trailing edge of the
			-- grapheme) Buffer coordinates are coordinates for the
			-- entire buffer, not just the currently-displayed
			-- portion. If you have coordinates from an event, you have
			-- to convert those to buffer coordinates with
			-- `window_to_buffer_coords'.
		
			-- Note that this is different from `iter_at_location', which
			-- returns cursor locations, i.e. positions between
			-- characters.
		local an_iter: GTK_TEXT_ITER; a_trailing: INTEGER
		do
			create an_iter.make
			gtk_text_view_get_iter_at_position (handle, an_iter.handle,
															$a_trailing, an_x, an_y)
			create Result.make_2(an_iter, a_trailing)
		ensure
			not_void: Result /= Void
			iter_not_void: Result.item_1 /= Void
		end

	buffer_to_window_coords (a_window_type: INTEGER;
									 buffer_x, buffer_y: INTEGER): TUPLE[INTEGER, INTEGER]
			-- Converts coordinate (buffer_x, buffer_y) to coordinates
			-- for the window of `a_widndow_type' (except gtk_text_window_private). Result is
			-- [window_x,window_y].
			
			-- Note that you can't convert coordinates for a nonexisting
			-- window (see `set_border_window_size').
			
			-- 	win :       a GtkTextWindowType 
		require
			valid_window_type: is_valid_gtk_text_window_type (a_window_type)
			window_type_is_not_private: a_window_type /= gtk_text_window_private
		local window_x, window_y: INTEGER
		do
			gtk_text_view_buffer_to_window_coords
			(handle, a_window_type, buffer_x, buffer_y, $window_x, $window_y)
			create Result.make_2 (window_x, window_y)
		end

	window_to_buffer_coords (a_window_type: INTEGER;
								  window_x, window_y: INTEGER): TUPLE[INTEGER, INTEGER]
			-- Converts coordinates on the window identified by win to
			-- buffer coordinates, storing the result in
			-- (buffer_x,buffer_y).
			
			-- Note that you can't convert coordinates for a nonexisting
			-- window (see `set_border_window_size').
		require
			valid_window_type: is_valid_gtk_text_window_type (a_window_type)
			window_type_is_not_private: a_window_type /= gtk_text_window_private
		local buffer_x, buffer_y: INTEGER
		do
			gtk_text_view_window_to_buffer_coords
			(handle, a_window_type, window_x, window_y, $buffer_x, $buffer_y)
			create Result.make_2 (buffer_x, buffer_y)
		end

	window (a_text_window_type: INTEGER) : GDK_WINDOW
			-- The GDK_WINDOW corresponding to an area of the text view;
			-- possible windows include the overall widget window, child
			-- windows on the left, right, top, bottom, and the window
			-- that displays the text buffer. Windows are Void and
			-- nonexistent if their width or height is 0, and are
			-- nonexistent before the widget has been realized.
		require valid_window_type: is_valid_gtk_text_window_type (a_text_window_type)
		local factory: G_OBJECT_EXPANDED_FACTORY [GDK_WINDOW]
		do
			Result := factory.wrapper (gtk_text_view_get_window (handle, a_text_window_type))
		end

	window_type (a_window: GDK_WINDOW): INTEGER
			-- Usually used to find out which window an event corresponds
			-- to. If you connect to an event signal on text_view, this
			-- function should be called on event->window to see which
			-- window it was.
		do
			Result := gtk_text_view_get_window_type (handle, a_window.handle)
		ensure is_valid_gtk_text_window_type (Result)
		end

	set_border_window_size (a_window_type: INTEGER; a_size: INTEGER)
			-- Sets the width of `gtk_text_window_left' or
			-- `gtk_text_window_right', or the height of
			-- `gtk_text_window_top' or
			-- `gtk_text_window_bottom'. Automatically destroys the
			-- corresponding window if the size is set to 0, and creates
			-- the window if the size is set to non-zero. This function
			-- can only be used for the "border windows," it doesn't work
			-- with `gtk_text_window_widget', `gtk_text_window_text', or
			-- `gtk_text_window_private'.
		require
			valid_type: is_valid_gtk_text_window_type (a_window_type)
			correct_type: ((a_window_type /= gtk_text_window_widget) and
								(a_window_type /= gtk_text_window_text) and
								(a_window_type /= gtk_text_window_private))
		do
			gtk_text_view_set_border_window_size (handle, a_window_type, a_size)
		end

	border_window_size (a_window_type: INTEGER): INTEGER
			-- the width of the specified border window. See
			-- `set_border_window_size'.
		require
			valid_type: is_valid_gtk_text_window_type (a_window_type)
		do
			Result := gtk_text_view_get_border_window_size (handle, a_window_type)
		end

feature {ANY} -- Iterator moving command
	forward_display_line (an_iterator: GTK_TEXT_ITER)
			-- Moves `an_iterator' forward by one display (wrapped)
			-- line. A display line is different from a
			-- paragraph. Paragraphs are separated by newlines or other
			-- paragraph separator characters. Display lines are created
			-- by line-wrapping a paragraph. If wrapping is turned off,
			-- display lines and paragraphs will be the same. Display
			-- lines are divided differently for each view, since they
			-- depend on the view's width; paragraphs are the same in all
			-- views, since they depend on the contents of the
			-- GtkTextBuffer.
		
			-- `was_iter_moved' will be True if iter was moved and is not
			-- on the end iterator
		require iterator_not_void: an_iterator/=Void
		do
			was_iter_moved := gtk_text_view_forward_display_line (handle, an_iterator.handle).to_boolean
		end

	backward_display_line (an_iter: GTK_TEXT_ITER)
			-- Moves `an_iter' backward by one display (wrapped) line. A
			-- display line is different from a paragraph. Paragraphs are
			-- separated by newlines or other paragraph separator
			-- characters. Display lines are created by line-wrapping a
			-- paragraph. If wrapping is turned off, display lines and
			-- paragraphs will be the same. Display lines are divided
			-- differently for each view, since they depend on the view's
			-- width; paragraphs are the same in all views, since they
			-- depend on the contents of the GtkTextBuffer.

			-- `was_iter_moved' will be True if iter was moved and is not
			-- on the end iterator
		require iterator_not_void: an_iter/=Void
		do
			was_iter_moved := gtk_text_view_backward_display_line(handle,an_iter.handle).to_boolean
		end

	forward_display_line_end (an_iter: GTK_TEXT_ITER)
			-- Moves `an_iter' forward to the next display line end. A
			-- display line is different from a paragraph. Paragraphs are
			-- separated by newlines or other paragraph separator
			-- characters. Display lines are created by line-wrapping a
			-- paragraph. If wrapping is turned off, display lines and
			-- paragraphs will be the same. Display lines are divided
			-- differently for each view, since they depend on the view's
			-- width; paragraphs are the same in all views, since they
			-- depend on the contents of the GtkTextBuffer.
		
			-- `was_iter_moved' will be True if iter was moved and is not
			-- on the end iterator.
		require iterator_not_void: an_iter/=Void
		do
			was_iter_moved:=gtk_text_view_forward_display_line_end(handle,an_iter.handle).to_boolean
		end

	backward_display_line_start (an_iter: GTK_TEXT_ITER)
			-- Moves `an_iter' backward to the next display line start. A
			-- display line is different from a paragraph. Paragraphs are
			-- separated by newlines or other paragraph separator
			-- characters. Display lines are created by line-wrapping a
			-- paragraph. If wrapping is turned off, display lines and
			-- paragraphs will be the same. Display lines are divided
			-- differently for each view, since they depend on the view's
			-- width; paragraphs are the same in all views, since they
			-- depend on the contents of the GtkTextBuffer.

			-- `was_iter_moved' will be True if iter was moved and is not
			-- on the end iterator.
		require iterator_not_void: an_iter/=Void
		do
			was_iter_moved:=gtk_text_view_backward_display_line_start(handle,an_iter.handle).to_boolean
		end

feature {ANY} -- Iterator queries

	does_start_display_line (an_iter: GTK_TEXT_ITER): BOOLEAN
			-- Does `an_iter' begin a display (wrapped) line? See
			-- `forward_display_line' for an explanation of display lines
			-- vs. paragraphs.
		do
			Result:=gtk_text_view_starts_display_line(handle, an_iter.handle).to_boolean
		end

--   gtk_text_view_move_visually ()

--  gboolean    gtk_text_view_move_visually     (GtkTextView *text_view,
-- 															 GtkTextIter *iter,
-- 															 gint count);

-- 	Move the iterator a given number of characters visually, treating it as
-- 	the strong cursor position. If count is positive, then the new strong
-- 	cursor position will be count positions to the right of the old cursor
-- 	position. If count is negative then the new strong cursor position will
-- 	be count positions to the left of the old cursor position.

-- 	In the presence of bidirection text, the correspondence between logical
-- 	and visual order will depend on the direction of the current run, and
-- 	there may be jumps when the cursor is moved off of the end of a run.

-- 	text_view : a GtkTextView
-- 	iter :      a GtkTextIter
-- 	count :     number of characters to move (negative moves left, positive
-- 					moves right)
-- 	Returns :   TRUE if iter moved and is not on the end iterator

-- 	-----------------------------------------------------------------------

--   gtk_text_view_add_child_at_anchor ()

--  void        gtk_text_view_add_child_at_anchor
-- 															(GtkTextView *text_view,
-- 															 GtkWidget *child,
-- 															 GtkTextChildAnchor *anchor);

-- 	Adds a child widget in the text buffer, at the given anchor.

-- 	text_view : a GtkTextView
-- 	child :     a GtkWidget
-- 	anchor :    a GtkTextChildAnchor in the GtkTextBuffer for text_view

-- 	-----------------------------------------------------------------------

--   gtk_text_view_add_child_in_window ()

--  void        gtk_text_view_add_child_in_window
-- 															(GtkTextView *text_view,
-- 															 GtkWidget *child,
-- 															 GtkTextWindowType which_window,
-- 															 gint xpos,
-- 															 gint ypos);

-- 	Adds a child at fixed coordinates in one of the text widget's windows.
-- 	The window must have nonzero size (see
-- 	gtk_text_view_set_border_window_size()). Note that the child
-- 	coordinates are given relative to the GdkWindow in question, and that
-- 	these coordinates have no sane relationship to scrolling. When placing
-- 	a child in GTK_TEXT_WINDOW_WIDGET, scrolling is irrelevant, the child
-- 	floats above all scrollable areas. But when placing a child in one of
-- 	the scrollable windows (border windows or text window), you'll need to
-- 	compute the child's correct position in buffer coordinates any time
-- 	scrolling occurs or buffer changes occur, and then call
-- 	gtk_text_view_move_child() to update the child's position.
-- 	Unfortunately there's no good way to detect that scrolling has
-- 	occurred, using the current API; a possible hack would be to update all
-- 	child positions when the scroll adjustments change or the text buffer
-- 	changes. See bug 64518 on bugzilla.gnome.org for status of fixing this
-- 	issue.

-- 	text_view :    a GtkTextView
-- 	child :        a GtkWidget
-- 	which_window : which window the child should appear in
-- 	xpos :         X position of child in window coordinates
-- 	ypos :         Y position of child in window coordinates

-- 	-----------------------------------------------------------------------

--   gtk_text_view_move_child ()

--  void        gtk_text_view_move_child        (GtkTextView *text_view,
-- 															 GtkWidget *child,
-- 															 gint xpos,
-- 															 gint ypos);

-- 	Updates the position of a child, as for
-- 	gtk_text_view_add_child_in_window().

-- 	text_view : a GtkTextView
-- 	child :     child widget already added to the text view
-- 	xpos :      new X position in window coordinates
-- 	ypos :      new Y position in window coordinates

-- 	-----------------------------------------------------------------------

feature {ANY} -- Wrap mode

	set_wrap_mode (a_mode: INTEGER)
			-- 	Sets the line wrapping for the view.
		require valid_mode: is_valid_gtk_wrap_mode (a_mode)
		do
			gtk_text_view_set_wrap_mode     (handle, a_mode)
		end

	wrap_mode: INTEGER
			-- the line wrapping for the view.
		do
			Result := gtk_text_view_get_wrap_mode (handle)
		ensure valid_mode: is_valid_gtk_wrap_mode (Result)
		end

feature {ANY} -- Editabilty

	set_editable
			-- Makes Current GtkTextView editable. You can override this
			-- default setting with tags in the buffer, using the
			-- "editable" attribute of tags.
		do
			gtk_text_view_set_editable (handle, 1)
		ensure editable: is_editable
		end

	set_uneditable
			-- Makes Current GtkTextView not editable. You can override this
			-- default setting with tags in the buffer, using the
			-- "editable" attribute of tags.
		do
			gtk_text_view_set_editable (handle, 0)
		ensure uneditable: not is_editable
		end

	is_editable: BOOLEAN
			-- Is Current GTK_TEXT_VIEW editable? Tags in the buffer may
			-- override this setting for some ranges of text.
		do
			Result := (gtk_text_view_get_editable (handle).to_boolean)
		end

feature {ANY} -- Cursor visibility

	set_cursor_visible
			-- Displays the insertion point.
		do
			gtk_text_view_set_cursor_visible (handle, 1)
		ensure visible_cursor: is_cursor_visible
		end

	set_cursor_invisible
			-- Hides the insertion point. A buffer with no editable text
			-- probably shouldn't have a visible cursor, so you may want
			-- to turn the cursor off.
		do
			gtk_text_view_set_cursor_visible (handle, 0)
		ensure invisible_cursor: not is_cursor_visible
		end

	is_cursor_visible: BOOLEAN
			-- Is  the cursor being displayed?
		do
			Result := gtk_text_view_get_cursor_visible (handle).to_boolean
		end

feature {ANY}

	set_overwrite
			-- Turns the GtkTextView overwrite mode on.
		do
			gtk_text_view_set_overwrite (handle, 1)
		ensure overwrite_set: is_overwrite_set
		end

	unset_overwrite
			-- Turns the GtkTextView overwrite mode off.
		do
			gtk_text_view_set_overwrite (handle, 0)
		ensure overwrite_unset: not is_overwrite_set
		end


	is_overwrite_set: BOOLEAN
			-- Is the GtkTextView is in overwrite mode?
		do
			Result := gtk_text_view_get_overwrite (handle).to_boolean
		end


feature {ANY} -- Pixels above and below lines
	set_pixels_above_lines (a_setting: INTEGER)
			-- Sets the default number of blank pixels above paragraphs
			-- in text_view. Tags in the buffer may override the
			-- defaults.
		do
			gtk_text_view_set_pixels_above_lines (handle, a_setting)
		ensure
			set: pixels_above_lines = a_setting
		end

	pixels_above_lines: INTEGER
			-- the default number of pixels to put above paragraphs.
		do
			Result:=gtk_text_view_get_pixels_above_lines(handle)
		end

	set_pixels_below_lines (a_setting: INTEGER)
			-- Sets the default number of pixels of blank space to put
			-- below paragraphs in text_view. May be overridden by tags
			-- applied to text_view's buffer.
		do
			gtk_text_view_set_pixels_below_lines(handle,a_setting)
		ensure
			set: pixels_below_lines = a_setting
		end

	pixels_below_lines: INTEGER
			-- default number of blank pixels below paragraphs
		do
			Result := gtk_text_view_get_pixels_below_lines(handle)
		end

	set_pixels_inside_wrap (a_setting: INTEGER)
			-- Sets the default number of pixels of blank space to leave
			-- between display/wrapped lines within a paragraph. May be
			-- overridden by tags in text_view's buffer.
		do
			gtk_text_view_set_pixels_inside_wrap(handle,a_setting)
		ensure
			set: pixels_inside_wrap = a_setting
		end

	pixels_inside_wrap: INTEGER
			-- the default number of pixels of blank space between
			-- wrapped lines
		do
			Result:=gtk_text_view_get_pixels_inside_wrap(handle)
		end

	set_justification (a_justification: INTEGER)
			-- Sets the default justification of text in text view. Tags
			-- in the view's buffer may override the default.
		require valid_justification: is_valid_gtk_justification(a_justification)
		do
			gtk_text_view_set_justification (handle,a_justification)
		ensure set: a_justification = justification
		end

	justification: INTEGER
			-- the default justification of paragraphs in text view. Tags
			-- in the buffer may override the default.
		do
			Result:=gtk_text_view_get_justification(handle)
		ensure valid: is_valid_gtk_justification(Result)
		end

	set_left_margin (a_left_margin: INTEGER)
			-- Sets the default left margin for text in text view. Tags
			-- in the buffer may override the default. Margin in
			-- expressed in pixels.
		do
			gtk_text_view_set_left_margin (handle, a_left_margin)
		ensure set: a_left_margin = left_margin
		end

	left_margin: INTEGER
			-- the default left margin size of paragraphs in the text
			-- view. Tags in the buffer may override the default.  Margin
			-- is expressed in pixels.
		do
			Result:=gtk_text_view_get_left_margin(handle)
		end

	set_right_margin (a_right_margin: INTEGER)
			-- Sets the default right margin for text in text view. Tags
			-- in the buffer may override the default. Margin in
			-- expressed in pixels.
		do
			gtk_text_view_set_right_margin (handle, a_right_margin)
		ensure set: a_right_margin = right_margin
		end

	right_margin: INTEGER
			-- the default right margin size of paragraphs in the text
			-- view. Tags in the buffer may override the default.  Margin
			-- is expressed in pixels.
		do
			Result:=gtk_text_view_get_right_margin(handle)
		end

	set_indent (an_indent: INTEGER)
			-- Sets the default indentation (in pixels) for paragraphs in
			-- text view. Tags in the buffer may override the default.
		do
			gtk_text_view_set_indent(handle, an_indent)
		end

	indent: INTEGER
			-- The default indentation (in pixels) of paragraphs in text
			-- view. Tags in the view's buffer may override the
			-- default. The indentation may be negative.
		do
			Result:=gtk_text_view_get_indent(handle)
		end

	--   gtk_text_view_set_tabs ()

	--  void        gtk_text_view_set_tabs          (GtkTextView *text_view,
	-- 															 PangoTabArray *tabs);

	-- 	Sets the default tab stops for paragraphs in text_view. Tags in the
	-- 	buffer may override the default.

	-- 	text_view : a GtkTextView
	-- 	tabs :      tabs as a PangoTabArray

	-- 	-----------------------------------------------------------------------

	--   gtk_text_view_get_tabs ()

	--  PangoTabArray* gtk_text_view_get_tabs       (GtkTextView *text_view);

	-- 	Gets the default tabs for text_view. Tags in the buffer may override
	-- 	the defaults. The returned array will be NULL if "standard" (8-space)
	-- 	tabs are used. Free the return value with pango_tab_array_free().

	-- 	text_view : a GtkTextView
	-- 	Returns :   copy of default tab array, or NULL if "standard" tabs are
	-- 					used; must be freed with pango_tab_array_free().

	-- 	-----------------------------------------------------------------------

	--   gtk_text_view_set_accepts_tab ()

	--  void        gtk_text_view_set_accepts_tab   (GtkTextView *text_view,
	-- 															 gboolean accepts_tab);

	-- 	Sets the behavior of the text widget when the Tab key is pressed. If
	-- 	accepts_tab is TRUE a tab character is inserted. If accepts_tab is
	-- 	FALSE the keyboard focus is moved to the next widget in the focus
	-- 	chain.

	-- 	text_view :   A GtkTextView
	-- 	accepts_tab : TRUE if pressing the Tab key should insert a tab
	-- 					  character, FALSE, if pressing the Tab key should move the
	-- 					  keyboard focus.

	-- 	Since 2.4

	-- 	-----------------------------------------------------------------------

	--   gtk_text_view_get_accepts_tab ()

	--  gboolean    gtk_text_view_get_accepts_tab   (GtkTextView *text_view);

	-- 	Returns whether pressing the Tab key inserts a tab characters.
	-- 	gtk_text_view_set_accepts_tab().

	-- 	text_view : A GtkTextView
	-- 	Returns :   TRUE if pressing the Tab key inserts a tab character, FALSE
	-- 					if pressing the Tab key moves the keyboard focus.

	-- 	Since 2.4

	-- 	-----------------------------------------------------------------------

	default_attributes: GTK_TEXT_ATTRIBUTES
			-- 	Obtains a copy of the default text attributes. These are the attributes
			-- 	used for text unless a tag overrides them. You'd typically pass the
			-- 	default attributes in to TEXT_ITER:attributes() in order to get
			-- 	the attributes in effect at a given text position.
			--
			-- 	The return value is a copy owned by the caller of this function, and
			-- 	should be freed.
			-- 	text_view : a GtkTextView
			-- 	Returns :   a new GtkTextAttributes
		do
			create Result.from_external_pointer (gtk_text_view_get_default_attributes (handle))
		end

	-- 	-----------------------------------------------------------------------

	--   GTK_TEXT_VIEW_PRIORITY_VALIDATE

	--  #define GTK_TEXT_VIEW_PRIORITY_VALIDATE (GDK_PRIORITY_REDRAW + 5)

	-- 	The priority at which the text view validates onscreen lines in an idle
	-- 	job in the background.

feature {ANY} -- TODO: Property Details

--   The "accepts-tab" property

-- 	"accepts-tab"          gboolean              : Read / Write

-- 	Whether Tab will result in a tab character being entered.

-- 	Default value: TRUE

-- 	-----------------------------------------------------------------------

--   The "buffer" property

-- 	"buffer"               GtkTextBuffer         : Read / Write

-- 	The buffer which is displayed.

-- 	-----------------------------------------------------------------------

--   The "cursor-visible" property

-- 	"cursor-visible"       gboolean              : Read / Write

-- 	If the insertion cursor is shown.

-- 	Default value: TRUE

-- 	-----------------------------------------------------------------------

--   The "editable" property

-- 	"editable"             gboolean              : Read / Write

-- 	Whether the text can be modified by the user.

-- 	Default value: TRUE

-- 	-----------------------------------------------------------------------

--   The "indent" property

-- 	"indent"               gint                  : Read / Write

-- 	Amount to indent the paragraph, in pixels.

-- 	Allowed values: >= 0

-- 	Default value: 0

-- 	-----------------------------------------------------------------------

--   The "justification" property

-- 	"justification"        GtkJustification      : Read / Write

-- 	Left, right, or center justification.

-- 	Default value: GTK_JUSTIFY_LEFT

-- 	-----------------------------------------------------------------------

--   The "left-margin" property

-- 	"left-margin"          gint                  : Read / Write

-- 	Width of the left margin in pixels.

-- 	Allowed values: >= 0

-- 	Default value: 0

-- 	-----------------------------------------------------------------------

--   The "overwrite" property

-- 	"overwrite"            gboolean              : Read / Write

-- 	Whether entered text overwrites existing contents.

-- 	Default value: FALSE

-- 	-----------------------------------------------------------------------

--   The "pixels-above-lines" property

-- 	"pixels-above-lines"   gint                  : Read / Write

-- 	Pixels of blank space above paragraphs.

-- 	Allowed values: >= 0

-- 	Default value: 0

-- 	-----------------------------------------------------------------------

--   The "pixels-below-lines" property

-- 	"pixels-below-lines"   gint                  : Read / Write

-- 	Pixels of blank space below paragraphs.

-- 	Allowed values: >= 0

-- 	Default value: 0

-- 	-----------------------------------------------------------------------

--   The "pixels-inside-wrap" property

-- 	"pixels-inside-wrap"   gint                  : Read / Write

-- 	Pixels of blank space between wrapped lines in a paragraph.

-- 	Allowed values: >= 0

-- 	Default value: 0

-- 	-----------------------------------------------------------------------

--   The "right-margin" property

-- 	"right-margin"         gint                  : Read / Write

-- 	Width of the right margin in pixels.

-- 	Allowed values: >= 0

-- 	Default value: 0

-- 	-----------------------------------------------------------------------

--   The "tabs" property

-- 	"tabs"                 PangoTabArray         : Read / Write

-- 	Custom tabs for this text.

-- 	-----------------------------------------------------------------------

--   The "wrap-mode" property

-- 	"wrap-mode"            GtkWrapMode           : Read / Write

-- 	Whether to wrap lines never, at word boundaries, or at character
-- 	boundaries.

-- 	Default value: GTK_WRAP_NONE

-- Style Property Details

--   The "error-underline-color" style property

-- 	"error-underline-color" GdkColor              : Read

-- 	Color with which to draw error-indication underlines.

feature {} -- TODO: Signals

--   The "backspace" signal

--  void        user_function                  (GtkTextView *textview,
-- 															gpointer     user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "copy-clipboard" signal

--  void        user_function                  (GtkTextView *textview,
-- 															gpointer     user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "cut-clipboard" signal

--  void        user_function                  (GtkTextView *textview,
-- 															gpointer     user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "delete-from-cursor" signal

--  void        user_function                  (GtkTextView   *textview,
-- 															GtkDeleteType *arg1,
-- 															gint           arg2,
-- 															gpointer       user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	arg1 :
-- 	arg2 :
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

feature {ANY} --   The "insert-at-cursor" signal
	connect_agent_to_insert_at_cursor_signal (a_procedure: PROCEDURE[ANY, TUPLE [STRING, GTK_TEXT_VIEW]])
			-- 	textview :  the object which received the signal.
			-- 	arg1 :
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			insert_at_cursor_callback: INSERT_AT_CURSOR_CALLBACK
		do
			create insert_at_cursor_callback.make
			insert_at_cursor_callback.connect (Current, a_procedure)
		end
	
-- 	-----------------------------------------------------------------------

feature {ANY} -- The "move-cursor" signal

	connect_agent_to_move_cursor_signal (a_procedure: PROCEDURE[ANY, TUPLE [INTEGER, INTEGER, BOOLEAN, GTK_TEXT_VIEW]])
			-- 	The ::move-cursor signal is a keybinding signal which gets emitted when
			-- 	the user initiates a cursor movement.

			-- 	Applications should not connect to it, but may emit it with
			-- 	g_signal_emit_by_name() if they need to control scrolling
			-- 	programmatically.

			-- 	widget :           the object which received the signal
			-- 	step :             the granularity of the move, as a GtkMovementStep
			-- 	count :            the number of step units to move
			-- 	extend_selection : True if the move should extend the selection
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			move_cursor_callback: MOVE_CURSOR_CALLBACK
		do
			create move_cursor_callback.make
			move_cursor_callback.connect (Current, a_procedure)
		end

-- 	-----------------------------------------------------------------------

--   The "move-focus" signal

--  void        user_function                  (GtkTextView      *textview,
-- 															GtkDirectionType *arg1,
-- 															gpointer          user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	arg1 :
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "move-viewport" signal

--  void        user_function                  (GtkTextView   *textview,
-- 															GtkScrollStep *arg1,
-- 															gint           arg2,
-- 															gpointer       user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	arg1 :
-- 	arg2 :
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "page-horizontally" signal

--  void        user_function                  (GtkTextView *textview,
-- 															gint         arg1,
-- 															gboolean     arg2,
-- 															gpointer     user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	arg1 :
-- 	arg2 :
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

feature {ANY} -- The "paste-clipboard" signal

	connect_agent_to_paste_clipboard_signal (a_procedure: PROCEDURE[ANY, TUPLE [GTK_TEXT_VIEW]])
			-- The ::paste-clipboard signal is a keybinding signal which gets
			-- emitted to paste the contents of the clipboard into the text view.
			--
			-- The default bindings for this signal are Ctrl-v and Shift-Insert.
			--
			-- 	textview :  the object which received the signal.
			-- 	user_data : user data set when the signal handler was connected.
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			paste_clipboard_callback: PASTE_CLIPBOARD_CALLBACK
		do
			create paste_clipboard_callback.make
			paste_clipboard_callback.connect (Current, a_procedure)
		end

-- 	-----------------------------------------------------------------------

--   The "populate-popup" signal

--  void        user_function                  (GtkTextView *textview,
-- 															GtkMenu     *arg1,
-- 															gpointer     user_data)      : Run last

-- 	textview :  the object which received the signal.
-- 	arg1 :
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "select-all" signal

--  void        user_function                  (GtkTextView *textview,
-- 															gboolean     arg1,
-- 															gpointer     user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	arg1 :
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "set-anchor" signal

--  void        user_function                  (GtkTextView *textview,
-- 															gpointer     user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "set-scroll-adjustments" signal

--  void        user_function                  (GtkTextView   *textview,
-- 															GtkAdjustment *arg1,
-- 															GtkAdjustment *arg2,
-- 															gpointer       user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	arg1 :
-- 	arg2 :
-- 	user_data : user data set when the signal handler was connected.

-- 	-----------------------------------------------------------------------

--   The "toggle-overwrite" signal

--  void        user_function                  (GtkTextView *textview,
-- 															gpointer     user_data)      : Run last / Action

-- 	textview :  the object which received the signal.
-- 	user_data : user data set when the signal handler was connected.

feature {ANY} -- struct size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextView)"
		end

end -- class GTK_TEXT_VIEW
