note
	description: "GtkButton -- A widget that creates a signal when clicked on"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,  GTK+ team and others
					
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
	revision "$REvision:$"

class GTK_BUTTON
	-- The GtkButton widget is generally used to attach a function to
	-- that is called when the button is pressed. The various signals
	-- and how to use them are outlined below.
	
	-- The GtkButton widget can hold any valid child widget. That is it
	-- can hold most any other standard GtkWidget. The most commonly
	-- used child is the GtkLabel.

inherit GTK_BIN

insert
	GTK_BUTTON_EXTERNALS
		-- Implemented Interfaces GtkButton implements
		-- AtkImplementorIface.

create {ANY}
	make,
	with_label,
	with_mnemonic,
	from_stock,
	from_external_pointer
	
feature {} -- Creation

	make
			-- Creates a new GtkButton widget. To add a child widget to
			-- the button, use `add' (of GTK_CONTAINER)
		do
			from_external_pointer (gtk_button_new)
		end

	with_label (a_label: STRING)
			-- Creates a GtkButton widget with a GtkLabel child
			-- containing the given text (`a_label')
		require valid_label: a_label/=Void
		do
			from_external_pointer(gtk_button_new_with_label (a_label.to_external))
		end

	with_mnemonic (a_label: STRING)
			-- Creates a new GtkButton containing a label. If characters
			-- in label are preceded by an underscore, they are
			-- underlined. If you need a literal underscore character in
			-- a label, use '__' (two underscores). The first underlined
			-- character represents a keyboard accelerator called a
			-- mnemonic. Pressing Alt and that key activates the button.
		require valid_label: a_label/=Void
		do
			from_external_pointer(gtk_button_new_with_mnemonic (a_label.to_external))
		end

	from_stock (a_stock: STRING)
			-- Creates a new GtkButton containing the image and text from
			-- a stock item. TODO: implement GTK_STOCK_ITEMS wrapping
			-- preprocessor macros like GTK_STOCK_OK and GTK_STOCK_APPLY
			-- (stock ids).
			
			-- If stock_id is unknown, then it will be treated as a
			-- mnemonic label (as for make_with_mnemonic()).
		require stock_not_void: a_stock/=Void
			valid_stock: True -- TODO
		do
			from_external_pointer (gtk_button_new_from_stock (a_stock.to_external))
		end

feature {ANY}
	pressed
		-- Emits a GtkButton::pressed signal to Current GtkButton.
		do
			gtk_button_pressed (handle)
		end

	released
			-- Emits a GtkButton::released signal to the Current GtkButton.
		do
			gtk_button_released (handle)
		end

	clicked
			-- Emits a GtkButton::clicked signal to the Current GtkButton.
		do
			gtk_button_clicked (handle)
		end

	enter
			-- Emits a GtkButton::enter signal to the given GtkButton.
		do
			gtk_button_enter (handle)
		end

	leave
			-- Emits a GtkButton::leave signal to the given GtkButton.
		do
			gtk_button_leave (handle)
		end

feature {ANY} -- Button's relief
	set_relief (a_relief: INTEGER)
			-- Sets the relief style of the edges of the given GtkButton
			-- widget. Three styles exist, `gtk_relief_normal',
			-- `gtk_relief_half', `gtk_relief_none'. The default style is, as
			-- one can guess, `gtk_relief_normal'.
		require valid_relief_style: is_valid_gtk_relief_style (a_relief)
		do
			gtk_button_set_relief (handle, a_relief)
		end

	relief: INTEGER
			-- the current relief style of the Current GtkButton.
		do
			Result := gtk_button_get_relief (handle)
		ensure valid_relief_style: is_valid_gtk_relief_style (Result)
		end

	is_relief_normal: BOOLEAN
			-- Is the relief style normal?
		do
			Result := (relief = gtk_relief_normal)
		end
	
	set_relief_normal
			-- Set relief style to normal
		do
			set_relief (gtk_relief_normal)
		ensure relief_set: is_relief_normal
		end
	
	is_relief_half: BOOLEAN
			-- Is the relief style half?
		do
			Result := (relief = gtk_relief_half)
		end
	
	set_relief_half
			-- Set relief style to half
		do
			set_relief (gtk_relief_half)
		ensure relief_set: is_relief_half
		end
	
	is_relief_none: BOOLEAN
			-- Is the relief style none?
		do
			Result := (relief = gtk_relief_none)
		end
	
	set_relief_none
			-- Set relief style to none
		do
			set_relief (gtk_relief_none)
		ensure relief_set: is_relief_none
		end

feature {ANY} -- Label

	label: STRING
			-- the text from the label of the button, as set by
			-- `set_label'. If the label text has not been set the return
			-- value will be Void. This will be the case if you create an
			-- empty button with `make' to use as a container.
		local ptr: POINTER
		do
			check Result=Void end
			ptr:=gtk_button_get_label(handle)
			if ptr.is_not_null
			then create Result.from_external_copy (ptr)
			end
		end

	set_label (a_label: STRING)
			-- Sets the text of the label of the button to
			-- `a_label'. This text is also used to select the stock item
			-- if `set_use_stock' is used. This will also clear any
			-- previously set labels.
		require valid_label: a_label/=Void
		do
			gtk_button_set_label (handle,a_label.to_external)
		end

	is_stock_item: BOOLEAN
			-- Is the button label a stock item?
		do
			Result:=(gtk_button_get_use_stock(handle)).to_boolean
		end

	set_stock_item
			-- Use the label as a stock id to select the stock item for
			-- the button.
		do
			gtk_button_set_use_stock (handle,1)
		end

	unset_stock_item
			-- Use the label as a normal string. See `set_stock_item'
		do
			gtk_button_set_use_stock (handle,0)
		end

	is_using_underline: BOOLEAN
			-- Is there an embedded underline in the button label
			-- indicating the mnemonic character? See
			-- `set_use_underline'.
		do
			Result:=(gtk_button_get_use_underline(handle)).to_boolean
		end

	set_use_underline
			-- Put an underline in the text of the button label
			-- indicating the mnemonic accelerator key.
		do
			gtk_button_set_use_underline    (handle,1)
		end

	unset_use_underline
			-- Put an underline in the text of the button label
			-- indicating the mnemonic accelerator key.
		do
			gtk_button_set_use_underline    (handle,1)
		end

	
	set_focus_on_click
			-- the button grab focus when clicked with the mouse.
		obsolete "Use set_focus_on_click_bool, which will soon take place of current set_focus_on_click"
		do
			gtk_button_set_focus_on_click   (handle,1)
		ensure is_focused_on_click
		end

	unset_focus_on_click
			-- the button doesn't grab focus when clicked with the
			-- mouse. Making mouse clicks not grab focus is useful in
			-- places like toolbars where you don't want the keyboard
			-- focus removed from the main area of the application.
		obsolete "Use set_focus_on_click_bool, which will soon take place of current set_focus_on_click"
		do
			gtk_button_set_focus_on_click   (handle,0)
		ensure not is_focused_on_click
		end

	is_focused_on_click: BOOLEAN
			-- Does the button grabs focus when it is clicked with the mouse? See unset_focus_on_click.
		do
			Result:=(gtk_button_get_focus_on_click(handle)).to_boolean
		end

	set_alignment (an_x_alignment,an_y_alignment: REAL)
			-- Sets the alignment of the child. This property has no
			-- effect unless the child is a GtkMisc or a GtkAligment.
			-- `an_x_alignment', `an_y_alignment' are the horizontal and
			-- vertical position of the child, 0.0 is left/top aligned,
			-- 1.0 is right/bottom aligned.
		require
			valid_x: an_x_alignment.in_range (0.0,1.0)
			valid_y: an_y_alignment.in_range (0.0,1.0)
		do
			gtk_button_set_alignment (handle, an_x_alignment,an_y_alignment)
		end

	alignments: TUPLE[REAL,REAL]
			-- The x and y alignments.
		local x_al,y_al: REAL
		do
			gtk_button_get_alignment (handle, x_al.to_pointer, y_al.to_pointer)
			create Result.make_2 (x_al,y_al)
		ensure
			valid_x: Result.item_1.in_range (0.0,1.0)
			valid_y: Result.item_2.in_range (0.0,1.0)
		end

	set_image (a_widget: GTK_WIDGET)
			-- Set the image of button to the given widget. Note that it
			-- depends on the gtk-button-images setting whether the image
			-- will be displayed or not, you don't have to call
			-- `show' on image yourself.
		require
			a_widget /= Void
		do
			gtk_button_set_image (handle, a_widget.handle)
		end

	image: GTK_WIDGET
			-- The widget that is currently set as the image of
			-- button. This may have been explicitly set by `set_image'
			-- or constructed by `from_stock'.
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_WIDGET]
		do
			Result := factory.wrapper (gtk_button_get_image (handle))
		end

-- Since 2.10

--	set_image_position (a_position: INTEGER) is
--			-- Sets the position of the image relative
--			-- to the text inside the button.
--		require
--			is_valid_gtk_position_type (a_position)
--		do
--			gtk_button_set_image_position (handle, a_position)
--		end
--
--	image_position: INTEGER is
--			-- Gets the position of the image relative
--			-- to the text inside the button.
--		do
--			Result := gtk_button_get_image_position (handle)
--		ensure
--			is_valid_gtk_position_type (Result)
--		end

feature {ANY} -- Properties 
	focus_on_click: BOOLEAN
			-- Does the button grab focus when it is clicked with the
			-- mouse?
		
			-- Default value: TRUE
		do
			Result:=boolean_property(focus_on_click_property_name)
		end

feature {ANY} -- Properties setters
	set_focus_on_click_bool (a_setting: BOOLEAN)
		do
			set_boolean_property(focus_on_click_property_name, a_setting)
		ensure set: focus_on_click = a_setting
		end

-- The "relief" property

--   "relief"               GtkReliefStyle        : Read / Write

-- The border relief style.

-- Default value: GTK_RELIEF_NORMAL
-- The "use-stock" property

--   "use-stock"            gboolean              : Read / Write / Construct

-- If set, the label is used to pick a stock item instead of being displayed.

-- Default value: FALSE
-- The "use-underline" property

--   "use-underline"        gboolean              : Read / Write / Construct

-- If set, an underline in the text indicates the next character should be used for the mnemonic accelerator key.

-- Default value: FALSE
-- The "xalign" property

--   "xalign"               gfloat                : Read / Write

-- If the child of the button is a GtkMisc or GtkAlignment, this property can be used to control it's horizontal alignment. 0.0 is left aligned, 1.0 is right aligned.

-- Allowed values: [0,1]

-- Default value: 0.5

-- Since 2.4
-- The "yalign" property

--   "yalign"               gfloat                : Read / Write

-- If the child of the button is a GtkMisc or GtkAlignment, this property can be used to control it's vertical alignment. 0.0 is top aligned, 1.0 is bottom aligned.

-- Allowed values: [0,1]

-- Default value: 0.5

-- Since 2.4

feature {ANY} -- Style Properties

--   "child-displacement-x" gint                  : Read
--   "child-displacement-y" gint                  : Read
--   "default-border"       GtkBorder             : Read
--   "default-outside-border" GtkBorder             : Read
--   "displace-focus"       gboolean              : Read

-- Style Property Details
-- The "child-displacement-x" style property

--   "child-displacement-x" gint                  : Read

-- How far in the x direction to move the child when the button is depressed.

-- Default value: 0
-- The "child-displacement-y" style property

--   "child-displacement-y" gint                  : Read

-- How far in the y direction to move the child when the button is depressed.

-- Default value: 0
-- The "default-border" style property

--   "default-border"       GtkBorder             : Read

-- Extra space to add for CAN_DEFAULT buttons.
-- The "default-outside-border" style property

--   "default-outside-border" GtkBorder             : Read

-- Extra space to add for CAN_DEFAULT buttons that is always drawn outside the border.
-- The "displace-focus" style property

--   "displace-focus"       gboolean              : Read

-- Whether the child_displacement_x/child_displacement_y properties should also affect the focus rectangle.

-- Default value: FALSE

-- Since 2.6

feature {ANY} -- The "activate" signal
	activate_signal_name: STRING is "activate"
	enable_on_activate
			-- Connects "activate" signal to `on_activate' feature.
		do
			connect (Current, activate_signal_name, $on_activate)
		end

	on_activate
			-- Built-in activate signal handler; empty by design; redefine it.

			-- The "activate" signal on GtkButton is an action signal and
			-- emitting it causes the button to animate press then
			-- release. Applications should never connect to this signal,
			-- but use the "activate" signal.
		
		do
		end

	connect_agent_to_activate_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_BUTTON]])
		require
			valid_procedure: a_procedure /= Void
		local
			activate_callback: ACTIVATE_CALLBACK[like Current]
		do
			create activate_callback.make
			activate_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "clicked" signal
	clicked_signal_name: STRING is "clicked"

	on_clicked
			-- Built-in clicked signal handler; empty by design; redefine it.
		local a_foo: INTEGER
		do
			a_foo := 12 -- Dummy instructions
		end

	enable_on_clicked
			-- Connects "clicked" signal to `on_clicked' feature.
			
			-- Emitted when the button has been activated (pressed and released).
			
			-- Emitted when a button clicked on by the mouse and the
			-- cursor stays on the button. If the cursor is not on the
			-- button when the mouse button is released, the signal is
			-- not emitted.
		do
			connect (Current, clicked_signal_name, $on_clicked)
		end

	connect_agent_to_clicked_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_BUTTON]])
			-- button : 	the object that received the signal
		require valid_procedure: a_procedure /= Void
		local clicked_callback: CLICKED_CALLBACK [like Current]
		do
			create clicked_callback.make
			clicked_callback.connect (Current, a_procedure)
		end
feature {ANY} -- struct size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkButton)"
		end

feature {} -- Property names
	focus_on_click_property_name: STRING is "focus-on-click"
	image_property_name: STRING is "image"
	label_property_name: STRING is "label"
	relief_property_name: STRING is "relief"
	use_stock_property_name: STRING is "use-stock"
	use_underline_property_name: STRING is "use-underline"
	xalign_property_name: STRING is "xalign"
	yalign_property_name: STRING is "yalign"
end
