note
	description: "Standard Enumerations: Public enumerated types used throughout GTK+ "
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
		
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
		
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"

deferred class GTK_STANDARD_ENUMERATIONS

inherit ANY undefine is_equal, copy end

insert
	-- Note: enumeration implemented as separate classes are inserted 
	-- here. The enumeration that are wrapped here are still named 
	-- here as comments to ease splitting it into a separate class.

	-- Note: deprecated enumeration are not wrapped.

	GTK_ACCEL_FLAGS
		-- GtkAnchorType
		-- GtkArrowType
	GTK_ASSISTANT_PAGE_TYPE_ENUM
	GTK_ATTACH_OPTIONS
		-- GtkButtonBoxStyle
	GTK_CORNER_TYPE
		-- GtkCurveType
		-- GtkDeleteType
		-- GtkDirectionType
		-- GtkExpanderStyle
	GTK_ICON_SIZE
		-- GtkIMPreeditStyle
		-- GtkIMStatusStyle
	GTK_JUSTIFICATION
		-- GtkMetricType
		-- GtkMovementStep
	GTK_ORIENTATION
	GTK_PACK_TYPE
		-- GtkPathPriorityType
		-- GtkPathType
	GTK_POLICY_TYPE
	GTK_POSITION_TYPE
	GTK_RELIEF_STYLE
	GTK_RESIZE_MODE
		-- GtkScrollStep
	GTK_SCROLL_TYPE
	GTK_SELECTION_MODE
	GTK_SHADOW_TYPE
	GTK_STATE_TYPE
	GTK_TOOLBAR_STYLE
	GTK_UPDATE_TYPE
		-- GtkVisibility
	GTK_WINDOW_POSITION
	GTK_WINDOW_TYPE
	GTK_WRAP_MODE
	GTK_SORT_TYPE

feature {} -- enum GtkAnchorType

	is_valid_gtk_anchor_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type = gtk_anchor_center) or else
						(a_type = gtk_anchor_north) or else
						(a_type = gtk_anchor_north_west) or else
						(a_type = gtk_anchor_north_east) or else
						(a_type = gtk_anchor_south) or else
						(a_type = gtk_anchor_south_west) or else
						(a_type = gtk_anchor_south_east) or else
						(a_type = gtk_anchor_west) or else
						(a_type = gtk_anchor_east))
		end

	gtk_anchor_center: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_CENTER"
		end

	gtk_anchor_n,gtk_anchor_north: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_NORTH"
		end

	gtk_anchor_nw,gtk_anchor_north_west: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_NORTH_WEST"
		end

	gtk_anchor_ne,gtk_anchor_north_east: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_NORTH_EAST"
		end

	gtk_anchor_s,gtk_anchor_south: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_SOUTH"
		end

	gtk_anchor_sw,gtk_anchor_south_west: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_SOUTH_WEST"
		end

	gtk_anchor_se,gtk_anchor_south_east: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_SOUTH_EAST"
		end

	gtk_anchor_w,gtk_anchor_west: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_WEST"
		end

	gtk_anchor_e,gtk_anchor_east: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ANCHOR_EAST"
		end

feature {} -- enum GtkArrowType
	-- Used to indicate the direction in which a GtkArrow should point.

	is_valid_gtk_arrow_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type = gtk_arrow_up) or else
						(a_type = gtk_arrow_down) or else
						(a_type = gtk_arrow_left) or else
						(a_type = gtk_arrow_right))
		end

	gtk_arrow_up: INTEGER
			-- Represents an upward pointing arrow.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ARROW_UP"
		end

	gtk_arrow_down: INTEGER
			-- Represents a downward pointing arrow.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ARROW_DOWN"
		end

	gtk_arrow_left: INTEGER
			-- Represents a left pointing arrow.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ARROW_LEFT"
		end

	gtk_arrow_right: INTEGER
			-- Represents a right pointing arrow.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_ARROW_RIGHT"
		end

feature {} -- enum GtkButtonBoxStyle
	-- Used to dictate the style that a GtkButtonBox uses to layout the
	-- buttons it contains. (See also: GtkVButtonBox and
	-- GtkHButtonBox).
	is_valid_gtk_button_box_style (a_style :INTEGER): BOOLEAN
		do
			Result:=((a_style = gtk_buttonbox_default_style) or else
						(a_style = gtk_buttonbox_spread) or else
						(a_style = gtk_buttonbox_edge) or else
						(a_style = gtk_buttonbox_start) or else
						(a_style = gtk_buttonbox_end))
		end

	gtk_buttonbox_default_style: INTEGER
			-- Default packing.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONBOX_DEFAULT_STYLE"
		end

	gtk_buttonbox_spread: INTEGER
			-- Buttons are evenly spread across the ButtonBox.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONBOX_SPREAD"
		end

	gtk_buttonbox_edge: INTEGER
			-- Buttons are placed at the edges of the ButtonBox.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONBOX_EDGE"
		end

	gtk_buttonbox_start: INTEGER
			-- Buttons are grouped towards the start of box, (on the left
			-- for a HBox, or the top for a VBox).
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONBOX_START"
		end

	gtk_buttonbox_end: INTEGER
			-- Buttons are grouped towards the end of a box, (on the
			-- right for a HBox, or the bottom for a VBox).
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONBOX_END"
		end

feature {} -- enum GtkCurveType
	is_valid_gtk_curve_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type = gtk_curve_type_linear) or else
						(a_type = gtk_curve_type_spline) or else
						(a_type = gtk_curve_type_free))
		end

	gtk_curve_type_linear: INTEGER
			-- linear interpolation 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CURVE_TYPE_LINEAR"
		end

	gtk_curve_type_spline: INTEGER
			-- spline interpolation
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CURVE_TYPE_SPLINE"
		end

	gtk_curve_type_free: INTEGER
			-- free form curve 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CURVE_TYPE_FREE"
		end

feature {} -- enum GtkDeleteType

	is_valid_gtk_delete_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type = gtk_delete_chars) or else
						(a_type = gtk_delete_word_ends) or else
						(a_type = gtk_delete_words) or else
						(a_type = gtk_delete_display_lines) or else
						(a_type = gtk_delete_display_line_ends) or else
						(a_type = gtk_delete_paragraph_ends) or else
						(a_type = gtk_delete_paragraphs) or else
						(a_type = gtk_delete_whitespace))
		end

	gtk_delete_chars: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_CHARS"
		end

	gtk_delete_word_ends: INTEGER
			-- delete only the portion of the word to the left/right of
			-- cursor if we're in the middle of a word
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_WORD_ENDS"
		end

	gtk_delete_words: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_WORDS"
		end

	gtk_delete_display_lines: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_DISPLAY_LINES"
		end

	gtk_delete_display_line_ends: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_DISPLAY_LINE_ENDS"
		end

	gtk_delete_paragraph_ends: INTEGER
			-- like C-k in Emacs (or its reverse) 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_PARAGRAPH_ENDS"
		end

	gtk_delete_paragraphs: INTEGER
			-- C-k in pico, kill whole line 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_PARAGRAPHS"
		end

	gtk_delete_whitespace: INTEGER
			-- M-\ in Emacs 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DELETE_WHITESPACE"
		end

feature {} -- enum GtkDirectionType

	is_valid_gtk_direction_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type = gtk_dir_tab_forward) or else
						(a_type = gtk_dir_tab_backward) or else
						(a_type = gtk_dir_up) or else
						(a_type = gtk_dir_down) or else
						(a_type = gtk_dir_left) or else
						(a_type = gtk_dir_right))
		end

	gtk_dir_tab_forward: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIR_TAB_FORWARD"
		end

	gtk_dir_tab_backward: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIR_TAB_BACKWARD"
		end

	gtk_dir_up: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIR_UP"
		end

	gtk_dir_down: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIR_DOWN"
		end

	gtk_dir_left: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIR_LEFT"
		end

	gtk_dir_right: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIR_RIGHT"
		end

feature {} -- enum GtkExpanderStyle
	-- Used to specify the style of the expanders drawn by a
	-- GtkTreeView.

	is_valid_gtk_expander_style (a_style :INTEGER): BOOLEAN
		do
			Result:=((a_style = gtk_expander_collapsed) or else
						(a_style = gtk_expander_semi_collapsed) or else
						(a_style = gtk_expander_semi_expanded) or else
						(a_style = gtk_expander_expanded))
		end

	gtk_expander_collapsed: INTEGER
			-- The style used for a collapsed subtree.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_EXPANDER_COLLAPSED"
		end

	gtk_expander_semi_collapsed: INTEGER
			-- Intermediate style used during animation.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_EXPANDER_SEMI_COLLAPSED"
		end

	gtk_expander_semi_expanded: INTEGER
			-- Intermediate style used during animation.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_EXPANDER_SEMI_EXPANDED"
		end

	gtk_expander_expanded: INTEGER
			-- The style used for an expanded subtree.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_EXPANDER_EXPANDED"
		end

feature {} -- enum GtkIMPreeditStyle

	is_valid_gtk_im_predict_style (a_style :INTEGER): BOOLEAN
		do
			Result:=((a_style=gtk_im_preedit_nothing) or else
						(a_style=gtk_im_preedit_callback) or else
						(a_style=gtk_im_preedit_none))
		end

	gtk_im_preedit_nothing: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IM_PREEDIT_NOTHING"
		end

	gtk_im_preedit_callback: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IM_PREEDIT_CALLBACK"
		end

	gtk_im_preedit_none: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IM_PREEDIT_NONE"
		end

feature {} -- enum GtkIMStatusStyle

	is_valid_gtk_im_status_style (a_style :INTEGER): BOOLEAN
		do
			Result:=((a_style=gtk_im_status_nothing) or else
						(a_style=gtk_im_status_callback) or else
						(a_style=gtk_im_status_none))
		end

	gtk_im_status_nothing: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IM_STATUS_NOTHING"
		end

	gtk_im_status_callback: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IM_STATUS_CALLBACK"
		end

	gtk_im_status_none: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IM_STATUS_NONE"
		end

feature {} -- enum GtkMetricType
	-- Used to indicate which metric is used by a GtkRuler.
	is_valid_gtk_metric_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type = gtk_pixels) or else
						(a_type = gtk_inches) or else
						(a_type = gtk_centimeters))
		end

	gtk_pixels: INTEGER
			-- Pixels.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PIXELS"
		end

	gtk_inches: INTEGER
			-- Inches.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_INCHES"
		end

	gtk_centimeters: INTEGER
			-- Centimeters.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CENTIMETERS"
		end

feature {} -- enum GtkMovementStep
	is_valid_movement_step (a_step :INTEGER): BOOLEAN
		do
			Result:=((a_step=gtk_movement_logical_positions) or else
						(a_step=gtk_movement_visual_positions) or else
						(a_step=gtk_movement_words) or else
						(a_step=gtk_movement_display_lines) or else
						(a_step=gtk_movement_display_line_ends) or else
						(a_step=gtk_movement_paragraphs) or else
						(a_step=gtk_movement_paragraph_ends) or else
						(a_step=gtk_movement_pages) or else
						(a_step=gtk_movement_buffer_ends) or else
						(a_step=gtk_movement_horizontal_pages))
		end

	gtk_movement_logical_positions: INTEGER
			-- move by forw/back graphemes 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_LOGICAL_POSITIONS"
		end

	gtk_movement_visual_positions: INTEGER
			-- move by left/right graphemes 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_VISUAL_POSITIONS"
		end

	gtk_movement_words: INTEGER
			-- move by forward/back words 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_WORDS"
		end

	gtk_movement_display_lines: INTEGER
			-- move up/down lines (wrapped lines) 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_DISPLAY_LINES"
		end

	gtk_movement_display_line_ends: INTEGER
			-- move up/down lines (wrapped lines) 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_DISPLAY_LINE_ENDS"
		end

	gtk_movement_paragraphs: INTEGER
			-- move up/down paragraphs (newline-ended lines) 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_PARAGRAPHS"
		end

	gtk_movement_paragraph_ends: INTEGER
			-- move to either end of a paragraph 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_PARAGRAPH_ENDS"
		end

	gtk_movement_pages: INTEGER
			-- move by pages 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_PAGES"
		end

	gtk_movement_buffer_ends: INTEGER
			-- move to ends of the buffer 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_BUFFER_ENDS"
		end

	gtk_movement_horizontal_pages: INTEGER
			-- move horizontally by pages
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MOVEMENT_HORIZONTAL_PAGES"
		end

feature {} -- enum GtkPathPriorityType
	is_valid_gtk_path_priority_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type=gtk_path_prio_lowest) or else
						(a_type=gtk_path_prio_gtk) or else
						(a_type=gtk_path_prio_application) or else
						(a_type=gtk_path_prio_theme) or else
						(a_type=gtk_path_prio_rc) or else
						(a_type=gtk_path_prio_highest))
		end

	gtk_path_prio_lowest: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_PRIO_LOWEST"
		end

	gtk_path_prio_gtk: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_PRIO_GTK"
		end

	gtk_path_prio_application: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_PRIO_APPLICATION"
		end

	gtk_path_prio_theme: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_PRIO_THEME"
		end

	gtk_path_prio_rc: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_PRIO_RC"
		end

	gtk_path_prio_highest: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_PRIO_HIGHEST"
		end

 
feature {} -- enum GtkPathType
	is_valid_gtk_path_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type=gtk_path_widget) or else
						(a_type=gtk_path_widget_class) or else
						(a_type=gtk_path_class))
		end

	gtk_path_widget: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_WIDGET"
		end

	gtk_path_widget_class: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_WIDGET_CLASS"
		end

	gtk_path_class: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PATH_CLASS"
		end

feature {} -- enum GtkScrollStep
	is_valid_gtk_scroll_step_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type=gtk_scroll_steps) or else
						(a_type=gtk_scroll_pages) or else
						(a_type=gtk_scroll_ends) or else
						(a_type=gtk_scroll_horizontal_steps) or else
						(a_type=gtk_scroll_horizontal_pages) or else
						(a_type=gtk_scroll_horizontal_ends))
		end

	gtk_scroll_steps: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_STEPS"
		end

	gtk_scroll_pages: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_PAGES"
		end

	gtk_scroll_ends: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_ENDS"
		end

	gtk_scroll_horizontal_steps: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_HORIZONTAL_STEPS"
		end

	gtk_scroll_horizontal_pages: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_HORIZONTAL_PAGES"
		end

	gtk_scroll_horizontal_ends: INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SCROLL_HORIZONTAL_ENDS"
		end

feature {} -- enum GtkVisibility
	-- Used by GtkCList and GtkCTree to indicate whether a row is
	-- visible. Note: AFAIK it should be deprecated. Check this. Paolo
	-- 2006-08-15
	is_valid_gtk_visibility_type (a_type :INTEGER): BOOLEAN
		do
			Result:=((a_type=gtk_visibility_none) or else
						(a_type=gtk_visibility_partial) or else
						(a_type=gtk_visibility_full))
		end


	gtk_visibility_none: INTEGER
			-- The row is not visible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_VISIBILITY_NONE"
		end

	gtk_visibility_partial: INTEGER
			-- The row is partially visible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_VISIBILITY_PARTIAL"
		end

	gtk_visibility_full: INTEGER
			-- The row is fully visible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_VISIBILITY_FULL"
		end

end -- class GTK_STANDARD_ENUMERATIONS
