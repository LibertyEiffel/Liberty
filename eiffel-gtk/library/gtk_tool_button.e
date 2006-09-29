class GTK_TOOL_BUTTON
	-- A GtkToolItem subclass that displays buttons

inherit
	GTK_TOOL_ITEM

create
	from_external_pointer

--	
--Synopsis
--
--#include <gtk/gtk.h>
--
--
--            GtkToolButton;
--GtkToolItem* gtk_tool_button_new            (GtkWidget *icon_widget,
--                                             const gchar *label);
--GtkToolItem* gtk_tool_button_new_from_stock (const gchar *stock_id);
--void        gtk_tool_button_set_label       (GtkToolButton *button,
--                                             const gchar *label);
--const gchar* gtk_tool_button_get_label      (GtkToolButton *button);
--void        gtk_tool_button_set_use_underline
--                                            (GtkToolButton *button,
--                                             gboolean use_underline);
--gboolean    gtk_tool_button_get_use_underline
--                                            (GtkToolButton *button);
--void        gtk_tool_button_set_stock_id    (GtkToolButton *button,
--                                             const gchar *stock_id);
--const gchar* gtk_tool_button_get_stock_id   (GtkToolButton *button);
--void        gtk_tool_button_set_icon_name   (GtkToolButton *button,
--                                             const gchar *icon_name);
--const gchar* gtk_tool_button_get_icon_name  (GtkToolButton *button);
--void        gtk_tool_button_set_icon_widget (GtkToolButton *button,
--                                             GtkWidget *icon_widget);
--GtkWidget*  gtk_tool_button_get_icon_widget (GtkToolButton *button);
--void        gtk_tool_button_set_label_widget
--                                            (GtkToolButton *button,
--                                             GtkWidget *label_widget);
--GtkWidget*  gtk_tool_button_get_label_widget
--                                            (GtkToolButton *button);
--
--
--
--
--Properties
--
--  "icon-name"            gchararray            : Read / Write
--  "icon-widget"          GtkWidget             : Read / Write
--  "label"                gchararray            : Read / Write
--  "label-widget"         GtkWidget             : Read / Write
--  "stock-id"             gchararray            : Read / Write
--  "use-underline"        gboolean              : Read / Write
--
--Signals
--
--"clicked"   void        user_function      (GtkToolButton *toolbutton,
--                                            gpointer user_data);
--
--Description
--
--GtkToolButtons are GtkToolItems containing buttons.
--
--Use gtk_tool_button_new() to create a new GtkToolButton. Use gtk_tool_button_new_with_stock() to create a GtkToolButton containing a stock item.
--
--The label of a GtkToolButton is determined by the properties "label_widget", "label", and "stock_id". If "label_widget" is non-NULL, then that widget is used as the label. Otherwise, if "label" is non-NULL, that string is used as the label. Otherwise, if "stock_id" is non-NULL, the label is determined by the stock item. Otherwise, the button does not have a label.
--
--The icon of a GtkToolButton is determined by the properties "icon_widget" and "stock_id". If "icon_widget" is non-NULL, then that widget is used as the icon. Otherwise, if "stock_id" is non-NULL, the icon is determined by the stock item. Otherwise, the button does not have a label.
--Details
--GtkToolButton
--
--typedef struct _GtkToolButton GtkToolButton;
--
--The GtkToolButton struct contains only private. It should only be accessed with the function described below.
--gtk_tool_button_new ()
--
--GtkToolItem* gtk_tool_button_new            (GtkWidget *icon_widget,
--                                             const gchar *label);
--
--Creates a new GtkToolButton using icon_widget as icon and label as label.
--
--icon_widget : 	a widget that will be used as icon widget, or NULL
--label : 	a string that will be used as label, or NULL
--Returns : 	A new GtkToolButton
--
--Since 2.4
--gtk_tool_button_new_from_stock ()
--
--GtkToolItem* gtk_tool_button_new_from_stock (const gchar *stock_id);
--
--Creates a new GtkToolButton containing the image and text from a stock item. Some stock ids have preprocessor macros like GTK_STOCK_OK and GTK_STOCK_APPLY.
--
--It is an error if stock_id is not a name of a stock item.
--
--stock_id : 	the name of the stock item
--Returns : 	A new GtkToolButton
--
--Since 2.4
--gtk_tool_button_set_label ()
--
--void        gtk_tool_button_set_label       (GtkToolButton *button,
--                                             const gchar *label);
--
--Sets label as the label used for the tool button. The "label" property only has an effect if not overridden by a non-NULL "label_widget" property. If both the "label_widget" and "label" properties are NULL, the label is determined by the "stock_id" property. If the "stock_id" property is also NULL, button will not have a label.
--
--button : 	a GtkToolButton
--label : 	a string that will be used as label, or NULL.
--
--Since 2.4
--gtk_tool_button_get_label ()
--
--const gchar* gtk_tool_button_get_label      (GtkToolButton *button);
--
--Returns the label used by the tool button, or NULL if the tool button doesn't have a label. or uses a the label from a stock item. The returned string is owned by GTK+, and must not be modified or freed.
--
--button : 	a GtkToolButton
--Returns : 	The label, or NULL
--
--Since 2.4
--gtk_tool_button_set_use_underline ()
--
--void        gtk_tool_button_set_use_underline
--                                            (GtkToolButton *button,
--                                             gboolean use_underline);
--
--If set, an underline in the label property indicates that the next character should be used for the mnemonic accelerator key in the overflow menu. For example, if the label property is "_Open" and use_underline is TRUE, the label on the tool button will be "Open" and the item on the overflow menu will have an underlined 'O'.
--
--Labels shown on tool buttons never have mnemonics on them; this property only affects the menu item on the overflow menu.
--
--button : 	a GtkToolButton
--use_underline : 	whether the button label has the form "_Open"
--
--Since 2.4
--gtk_tool_button_get_use_underline ()
--
--gboolean    gtk_tool_button_get_use_underline
--                                            (GtkToolButton *button);
--
--Returns whether underscores in the label property are used as mnemonics on menu items on the overflow menu. See gtk_tool_button_set_use_underline().
--
--button : 	a GtkToolButton
--Returns : 	TRUE if underscores in the label property are used as mnemonics on menu items on the overflow menu.
--
--Since 2.4
--gtk_tool_button_set_stock_id ()
--
--void        gtk_tool_button_set_stock_id    (GtkToolButton *button,
--                                             const gchar *stock_id);
--
--Sets the name of the stock item. See gtk_tool_button_new_from_stock(). The stock_id property only has an effect if not overridden by non-NULL "label" and "icon_widget" properties.
--
--button : 	a GtkToolButton
--stock_id : 	a name of a stock item, or NULL
--
--Since 2.4
--gtk_tool_button_get_stock_id ()
--
--const gchar* gtk_tool_button_get_stock_id   (GtkToolButton *button);
--
--Returns the name of the stock item. See gtk_tool_button_set_stock_id(). The returned string is owned by GTK+ and must not be freed or modifed.
--
--button : 	a GtkToolButton
--Returns : 	the name of the stock item for button.
--
--Since 2.4
--gtk_tool_button_set_icon_name ()
--
--void        gtk_tool_button_set_icon_name   (GtkToolButton *button,
--                                             const gchar *icon_name);
--
--Sets the icon for the tool button from a named themed icon. See the docs for GtkIconTheme for more details. The "icon_name" property only has an effect if not overridden by non-NULL "label", "icon_widget" and "stock_id" properties.
--
--button : 	a GtkToolButton
--icon_name : 	the name of the themed icon
--
--Since 2.8
--gtk_tool_button_get_icon_name ()
--
--const gchar* gtk_tool_button_get_icon_name  (GtkToolButton *button);
--
--Returns the name of the themed icon for the tool button, see gtk_tool_button_set_icon_name().
--
--button : 	a GtkToolButton
--Returns : 	the icon name or NULL if the tool button has no themed icon
--
--Since 2.8
--gtk_tool_button_set_icon_widget ()
--
--void        gtk_tool_button_set_icon_widget (GtkToolButton *button,
--                                             GtkWidget *icon_widget);
--
--Sets icon as the widget used as icon on button. If icon_widget is NULL the icon is determined by the "stock_id" property. If the "stock_id" property is also NULL, button will not have an icon.
--
--button : 	a GtkToolButton
--icon_widget : 	the widget used as icon, or NULL
--
--Since 2.4
--gtk_tool_button_get_icon_widget ()
--
--GtkWidget*  gtk_tool_button_get_icon_widget (GtkToolButton *button);
--
--Return the widget used as icon widget on button. See gtk_tool_button_set_icon_widget().
--
--button : 	a GtkToolButton
--Returns : 	The widget used as icon on button, or NULL.
--
--Since 2.4
--gtk_tool_button_set_label_widget ()
--
--void        gtk_tool_button_set_label_widget
--                                            (GtkToolButton *button,
--                                             GtkWidget *label_widget);
--
--Sets label_widget as the widget that will be used as the label for button. If label_widget is NULL the "label" property is used as label. If "label" is also NULL, the label in the stock item determined by the "stock_id" property is used as label. If "stock_id" is also NULL, button does not have a label.
--
--button : 	a GtkToolButton
--label_widget : 	the widget used as label, or NULL
--
--Since 2.4
--gtk_tool_button_get_label_widget ()
--
--GtkWidget*  gtk_tool_button_get_label_widget
--                                            (GtkToolButton *button);
--
--Returns the widget used as label on button. See gtk_tool_button_set_label_widget().
--
--button : 	a GtkToolButton
--Returns : 	The widget used as label on button, or NULL.
--
--Since 2.4
--Property Details
--The "icon-name" property
--
--  "icon-name"            gchararray            : Read / Write
--
--The name of the themed icon displayed on the item. This property only has an effect if not overridden by "label", "icon_widget" or "stock_id" properties.
--
--Default value: NULL
--
--Since 2.8
--The "icon-widget" property
--
--  "icon-widget"          GtkWidget             : Read / Write
--
--Icon widget to display in the item.
--The "label" property
--
--  "label"                gchararray            : Read / Write
--
--Text to show in the item.
--
--Default value: NULL
--The "label-widget" property
--
--  "label-widget"         GtkWidget             : Read / Write
--
--Widget to use as the item label.
--The "stock-id" property
--
--  "stock-id"             gchararray            : Read / Write
--
--The stock icon displayed on the item.
--
--Default value: NULL
--The "use-underline" property
--
--  "use-underline"        gboolean              : Read / Write
--
--If set, an underline in the label property indicates that the next character should be used for the mnemonic accelerator key in the overflow menu.
--
--Default value: FALSE
--Signal Details
--The "clicked" signal
--
--void        user_function                  (GtkToolButton *toolbutton,
--                                            gpointer user_data);
--
--
--toolbutton : 	the object that emitted the signal
--user_data : 	user data set when the signal handler was connected.
feature -- The "clicked" signal
	clicked_signal_name: STRING is "clicked"

	on_clicked is
			-- Built-in clicked signal handler; empty by design; redefine it.
		local a_foo: INTEGER
		do
			a_foo := 12 -- Dummy instructions
		end

	enable_on_clicked is
			-- Connects "clicked" signal to `on_clicked' feature.
			-- This signal is emitted when the tool button is clicked with the
			-- mouse or activated with the keyboard.
		do
			connect (Current, clicked_signal_name, $on_clicked)
		end

	connect_agent_to_clicked_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TOOL_BUTTON]]) is
			-- button : 	the object that received the signal
		require valid_procedure: a_procedure /= Void
		local clicked_callback: CLICKED_CALLBACK [like Current]
		do
			create clicked_callback.make
			clicked_callback.connect (Current, a_procedure)
		end

end