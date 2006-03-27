indexing
	description: "GtkButton -- A widget that creates a signal when clicked on"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

			-- The GtkButton widget is generally used to attach a
			-- function to that is called when the button is pressed. The
			-- various signals and how to use them are outlined below.

			-- The GtkButton widget can hold any valid child widget. That
			-- is it can hold most any other standard GtkWidget. The most
			-- commonly used child is the GtkLabel. 

class GTK_BUTTON

inherit
	WRAPPER
	GTK_BIN redefine make end
	GTK_BUTTON_EXTERNALS 

		-- Implemented Interfaces GtkButton implements
		-- AtkImplementorIface.
		
creation
	make,
	with_label,
	with_mnemonic,
	from_stock,
	from_pointer
	
feature {NONE} -- Creation

	make is
			-- Creates a new GtkButton widget. To add a child widget to
			-- the button, use `add' (of GTK_CONTAINER)
		do
			handle := gtk_button_new 
		end

	with_label (a_label: STRING) is
			-- Creates a GtkButton widget with a GtkLabel child
			-- containing the given text (`a_label')
		require valid_label: a_label/=Void
		do
			handle := gtk_button_new_with_label (a_label.to_external)
		end
	
	with_mnemonic (a_label: STRING) is
			-- Creates a new GtkButton containing a label. If characters
			-- in label are preceded by an underscore, they are
			-- underlined. If you need a literal underscore character in
			-- a label, use '__' (two underscores). The first underlined
			-- character represents a keyboard accelerator called a
			-- mnemonic. Pressing Alt and that key activates the button.
		require valid_label: a_label/=Void
		do
			handle := gtk_button_new_with_mnemonic (a_label.to_external)
		end

	from_stock (a_stock: STRING) is
			-- Creates a new GtkButton containing the image and text from
			-- a stock item. TODO: implement GTK_STOCK_ITEMS wrapping
			-- preprocessor macros like GTK_STOCK_OK and GTK_STOCK_APPLY
			-- (stock ids).

			-- If stock_id is unknown, then it will be treated as a
			-- mnemonic label (as for make_with_mnemonic()).
		require stock_not_void: a_stock/=Void
			valid_stock: True -- TODO
		do
			handle :=  gtk_button_new_from_stock (a_stock.to_external)
		end

feature 
	pressed is
		-- Emits a GtkButton::pressed signal to Current GtkButton.
		do
			gtk_button_pressed (handle)
		end

	released is
			-- Emits a GtkButton::released signal to the Current GtkButton.
		do
			gtk_button_released (handle)
		end

	clicked is
			-- Emits a GtkButton::clicked signal to the Current GtkButton.
		do
			gtk_button_clicked (handle)
		end

	enter is
			-- Emits a GtkButton::enter signal to the given GtkButton.
		do
			gtk_button_enter (handle)
		end

	leave is
			-- Emits a GtkButton::leave signal to the given GtkButton.
		do
			gtk_button_leave (handle)
		end

feature -- Button's relief
	set_relief (a_relief: INTEGER) is
			-- Sets the relief style of the edges of the given GtkButton
			-- widget. Three styles exist, `gtk_relief_normal',
			-- `gtk_relief_half', `gtk_relief_none'. The default style is, as
			-- one can guess, `gtk_relief_normal'.
		require valid_relief_style: is_valid_gtk_relief_style (a_relief)
		do
			gtk_button_set_relief (handle, a_relief)
		end

	relief: INTEGER is
			-- the current relief style of the Current GtkButton.
		do
			Result := gtk_button_get_relief (handle)
		ensure valid_relief_style: is_valid_gtk_relief_style (Result)
		end

	is_relief_normal: BOOLEAN is
			-- Is the relief style normal?
		do
			Result := (relief = gtk_relief_normal)
		end
	
	set_relief_normal is
			-- Set relief style to normal
		do
			set_relief (gtk_relief_normal)
		ensure relief_set: is_relief_normal
		end
	
	is_relief_half: BOOLEAN is
			-- Is the relief style half?
		do
			Result := (relief = gtk_relief_half)
		end
	
	set_relief_half is
			-- Set relief style to half
		do
			set_relief (gtk_relief_half)
		ensure relief_set: is_relief_half
		end
	
	is_relief_none: BOOLEAN is
			-- Is the relief style none?
		do
			Result := (relief = gtk_relief_none)
		end
	
	set_relief_none is
			-- Set relief style to none
		do
			set_relief (gtk_relief_none)
		ensure relief_set: is_relief_none
		end

feature -- Label
	label: STRING is
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
			else Result := Void -- Possibily redundant. TODO: check it
			end
		end

	set_label (a_label: STRING) is
			-- Sets the text of the label of the button to
			-- `a_label'. This text is also used to select the stock item
			-- if `set_use_stock' is used. This will also clear any
			-- previously set labels.
		require valid_label: a_label/=Void
		do
			gtk_button_set_label (handle,a_label.to_external)
		end

	is_stock_item: BOOLEAN is
			-- Is the button label a stock item?
		do
			Result:=(gtk_button_get_use_stock(handle)).to_boolean
		end

	set_stock_item is
			-- Use the label as a stock id to select the stock item for
			-- the button.
		do
			gtk_button_set_use_stock (handle,1)
		end

	unset_stock_item is
			-- Use the label as a normal string. See `set_stock_item'
		do
			gtk_button_set_use_stock (handle,0)
		end

	is_using_underline: BOOLEAN is
			-- Is there an embedded underline in the button label
			-- indicating the mnemonic character? See
			-- `set_use_underline'.
		do
			Result:=(gtk_button_get_use_underline(handle)).to_boolean
		end

	set_use_underline is
			-- Put an underline in the text of the button label
			-- indicating the mnemonic accelerator key.
		do
			gtk_button_set_use_underline    (handle,1)
		end

	unset_use_underline is
			-- Put an underline in the text of the button label
			-- indicating the mnemonic accelerator key.
		do
			gtk_button_set_use_underline    (handle,1)
		end

	
	set_focus_on_click is
			-- the button grab focus when clicked with the mouse.
		do
			gtk_button_set_focus_on_click   (handle,1)
		ensure is_focused_on_click
		end

	unset_focus_on_click is
			-- the button doesn't grab focus when clicked with the
			-- mouse. Making mouse clicks not grab focus is useful in
			-- places like toolbars where you don't want the keyboard
			-- focus removed from the main area of the application.
		do
			gtk_button_set_focus_on_click   (handle,0)
		ensure not is_focused_on_click
		end


	is_focused_on_click: BOOLEAN is
			-- Does the button grabs focus when it is clicked with the mouse? See unset_focus_on_click.
		do
			Result:=(gtk_button_get_focus_on_click(handle)).to_boolean
		end

	set_alignment (an_x_alignment,an_y_alignment: REAL) is
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
	
	alignments: TUPLE[REAL,REAL] is
			-- The x and y alignments.
		local x_al,y_al: REAL
		do
			gtk_button_get_alignment (handle, x_al.to_pointer, y_al.to_pointer)
			create Result.make_2 (x_al,y_al)
		ensure
			valid_x: Result.item_1.in_range (0.0,1.0)
			valid_y: Result.item_2.in_range (0.0,1.0)
		end

	
	-- TODO: void gtk_button_set_image (GtkButton *button, -- GtkWidget
	-- *image);

	-- Set the image of button to the given widget. Note that it depends on the gtk-button-images setting whether the image will be displayed or not, you don't have to call gtk_widget_show() on image yourself.

	-- button : 	a GtkButton
	-- image : 	a widget to set as the image for the button

	--TODO: gtk_button_get_image ()

	-- GtkWidget* gtk_button_get_image (GtkButton *button);

	-- Gets the widget that is currenty set as the image of
	-- button. This may have been explicitly set by
	-- gtk_button_set_image() or constructed by
	-- gtk_button_new_from_stock().

	-- button : 	a GtkButton
	-- Returns : 	a GtkWidget or NULL in case there is no image

feature -- Properties
-- TODO: Properties

--   "focus-on-click"       gboolean              : Read / Write
--   "image"                GtkWidget             : Read / Write
--   "label"                gchararray            : Read / Write / Construct
--   "relief"               GtkReliefStyle        : Read / Write
--   "use-stock"            gboolean              : Read / Write / Construct
--   "use-underline"        gboolean              : Read / Write / Construct
--   "xalign"               gfloat                : Read / Write
--   "yalign"               gfloat                : Read / Write

-- Style Properties

--   "child-displacement-x" gint                  : Read
--   "child-displacement-y" gint                  : Read
--   "default-border"       GtkBorder             : Read
--   "default-outside-border" GtkBorder             : Read
--   "displace-focus"       gboolean              : Read

	-- Property Details
-- The "focus-on-click" property

--   "focus-on-click"       gboolean              : Read / Write

-- Whether the button grabs focus when it is clicked with the mouse.

-- Default value: TRUE
-- The "image" property

--   "image"                GtkWidget             : Read / Write

-- Child widget to appear next to the button text.
-- The "label" property

--   "label"                gchararray            : Read / Write / Construct

-- Text of the label widget inside the button, if the button contains a label widget.

-- Default value: NULL
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

-- Signals

-- "activate"  void        user_function      (GtkButton *widget,
--                                             gpointer   user_data)      : Run first / Action
-- "clicked"   void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first / Action
-- "enter"     void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first
-- "leave"     void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first
-- "pressed"   void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first
-- "released"  void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first

	-- Signal Details
-- The "activate" signal

-- void        user_function                  (GtkButton *widget,
--                                             gpointer   user_data)      : Run first / Action

-- The "activate" signal on GtkButton is an action signal and emitting it causes the button to animate press then release. Applications should never connect to this signal, but use the "clicked" signal.

-- widget : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "clicked" signal

-- void        user_function                  (GtkButton *button,
--                                             gpointer   user_data)      : Run first / Action

-- Emitted when the button has been activated (pressed and released).

-- Emitted when a button clicked on by the mouse and the cursor stays on the button. If the cursor is not on the button when the mouse button is released, the signal is not emitted.
-- button : 	the object that received the signal
-- user_data : 	user data set when the signal handler was connected.
-- The "enter" signal

-- void        user_function                  (GtkButton *button,
--                                             gpointer   user_data)      : Run first

-- Emitted when the pointer enters the button.

-- Deprecated: Use the GtkWidget::enter-notify-event signal.

-- Emitted when the mouse cursor enters the region of the button.
-- button : 	the object that received the signal
-- user_data : 	user data set when the signal handler was connected.
-- The "leave" signal

-- void        user_function                  (GtkButton *button,
--                                             gpointer   user_data)      : Run first

-- Emitted when the pointer leaves the button.

-- Deprecated: Use the GtkWidget::leave-notify-event signal.

-- Emitted when the mouse cursor leaves the region of the button.
-- button : 	the object that received the signal
-- user_data : 	user data set when the signal handler was connected.
-- The "pressed" signal

-- void        user_function                  (GtkButton *button,
--                                             gpointer   user_data)      : Run first

-- Emitted when the button is pressed.

-- Deprecated: Use the GtkWidget::button-press-event signal.

-- Emitted when the button is initially pressed.
-- button : 	the object that received the signal
-- user_data : 	user data set when the signal handler was connected.
-- The "released" signal

-- void        user_function                  (GtkButton *button,
--                                             gpointer   user_data)      : Run first

-- Emitted when the button is released.

-- Deprecated: Use the GtkWidget::button-release-event signal.

-- Emitted when a button which is pressed is released, no matter where the mouse cursor is.
-- button : 	the object that received the signal
-- user_data : 	user data set when the signal handler was connected.

end

	
