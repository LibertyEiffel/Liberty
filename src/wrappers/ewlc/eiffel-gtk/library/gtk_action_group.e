note
	description: "A group of actions."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_ACTION_GROUP
	-- Actions are organised into groups. An action group is
	-- essentially a map from names to GtkAction objects.

	-- All actions that would make sense to use in a particular context
	-- should be in a single group. Multiple action groups may be used
	-- for a particular user interface. In fact, it is expected that
	-- most nontrivial applications will make use of multiple
	-- groups. For example, in an application that can edit multiple
	-- documents, one group holding global actions (e.g. quit, about,
	-- new), and one group per document holding actions that act on
	-- that document (eg. save, cut/copy/paste, etc). Each window's
	-- menus would be constructed from a combination of two action
	-- groups.

	-- Accelerators are handled by the GTK+ accelerator map. All
	-- actions are assigned an accelerator path (which normally has the
	-- form <Actions>/group-name/action-name) and a shortcut is
	-- associated with this accelerator path. All menuitems and tool
	-- items take on this accelerator path. The GTK+ accelerator map
	-- code makes sure that the correct shortcut is displayed next to
	-- the menu item.

inherit G_OBJECT

create {ANY} make, from_external_pointer

feature {} -- Creation

	make (a_name: STRING) is
			-- Creates a new GtkActionGroup object. `a_name' is used as
			-- the name of the action group and it is used when
			-- associating keybindings with the actions.
		do
			from_external_pointer (gtk_action_group_new (a_name.to_external))
		end

feature {ANY} 
	name: CONST_STRING is
			-- the name of the action group.
		do
			create Result.from_external(gtk_action_group_get_name(handle))
		ensure not_void: Result /= Void
		end


	--  gtk_action_group_get_sensitive ()

	-- gboolean    gtk_action_group_get_sensitive  (GtkActionGroup *action_group);

	--   Returns TRUE if the group is sensitive. The constituent actions can only
	--   be logically sensitive (see gtk_action_is_sensitive()) if they are
	--   sensitive (see gtk_action_get_sensitive()) and their group is sensitive.

	--   action_group : the action group
	--   Returns :      TRUE if the group is sensitive.

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_set_sensitive ()

	-- void        gtk_action_group_set_sensitive  (GtkActionGroup *action_group,
	--                                              gboolean sensitive);

	--   Changes the sensitivity of action_group

	--   action_group : the action group
	--   sensitive :    new sensitivity

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_get_visible ()

	-- gboolean    gtk_action_group_get_visible    (GtkActionGroup *action_group);

	--   Returns TRUE if the group is visible. The constituent actions can only be
	--   logically visible (see gtk_action_is_visible()) if they are visible (see
	--   gtk_action_get_visible()) and their group is visible.

	--   action_group : the action group
	--   Returns :      TRUE if the group is visible.

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_set_visible ()

	-- void        gtk_action_group_set_visible    (GtkActionGroup *action_group,
	--                                              gboolean visible);

	--   Changes the visible of action_group.

	--   action_group : the action group
	--   visible :      new visiblity

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_get_action ()

	-- GtkAction*  gtk_action_group_get_action     (GtkActionGroup *action_group,
	--                                              const gchar *action_name);

	--   Looks up an action in the action group by name.

	--   action_group : the action group
	--   action_name :  the name of the action
	--   Returns :      the action, or NULL if no action by that name exists

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_list_actions ()

	-- GList*      gtk_action_group_list_actions   (GtkActionGroup *action_group);

	--   Lists the actions in the action group.

	--   action_group : the action group
	--   Returns :      an allocated list of the action objects in the action group

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_action ()

	-- void        gtk_action_group_add_action     (GtkActionGroup *action_group,
	--                                              GtkAction *action);

	--   Adds an action object to the action group. Note that this function does
	--   not set up the accel path of the action, which can lead to problems if a
	--   user tries to modify the accelerator of a menuitem associated with the
	--   action. Therefore you must either set the accel path yourself with
	--   gtk_action_set_accel_path(), or use gtk_action_group_add_action_with_accel
	--   (..., NULL).

	--   action_group : the action group
	--   action :       an action

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_action_with_accel ()

	-- void        gtk_action_group_add_action_with_accel
	--                                             (GtkActionGroup *action_group,
	--                                              GtkAction *action,
	--                                              const gchar *accelerator);

	--   Adds an action object to the action group and sets up the accelerator.

	--   If accelerator is NULL, attempts to use the accelerator associated with
	--   the stock_id of the action.

	--   Accel paths are set to <Actions>/group-name/action-name.

	--   action_group : the action group
	--   action :       the action to add
	--   accelerator :  the accelerator for the action, in the format understood by
	--                  gtk_accelerator_parse(), or "" for no accelerator, or NULL
	--                  to use the stock accelerator

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_remove_action ()

	-- void        gtk_action_group_remove_action  (GtkActionGroup *action_group,
	--                                              GtkAction *action);

	--   Removes an action object from the action group.

	--   action_group : the action group
	--   action :       an action

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  GtkActionEntry

	-- typedef struct {
	--   const gchar     *name;
	--   const gchar     *stock_id;
	--   const gchar     *label;
	--   const gchar     *accelerator;
	--   const gchar     *tooltip;
	--   GCallback  callback;
	-- } GtkActionEntry;

	--   GtkActionEntry structs are used with gtk_action_group_add_actions() to
	--   construct actions.

	--   const gchar *name;        The name of the action.
	--   const gchar *stock_id;    The stock id for the action, or the name of an
	--                             icon from the icon theme.
	--   const gchar *label;       The label for the action. This field should
	--                             typically be marked for translation, see
	--                             gtk_action_group_set_translation_domain().
	--   const gchar *accelerator; The accelerator for the action, in the format
	--                             understood by gtk_accelerator_parse().
	--   const gchar *tooltip;     The tooltip for the action. This field should
	--                             typically be marked for translation, see
	--                             gtk_action_group_set_translation_domain().
	--   GCallback callback;       The function to call when the action is
	--                             activated.

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_actions ()

	-- void        gtk_action_group_add_actions    (GtkActionGroup *action_group,
	--                                              const GtkActionEntry *entries,
	--                                              guint n_entries,
	--                                              gpointer user_data);

	--   This is a convenience function to create a number of actions and add them
	--   to the action group.

	--   The "activate" signals of the actions are connected to the callbacks and
	--   their accel paths are set to <Actions>/group-name/action-name.

	--   action_group : the action group
	--   entries :      an array of action descriptions
	--   n_entries :    the number of entries
	--   user_data :    data to pass to the action callbacks

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_actions_full ()

	-- void        gtk_action_group_add_actions_full
	--                                             (GtkActionGroup *action_group,
	--                                              const GtkActionEntry *entries,
	--                                              guint n_entries,
	--                                              gpointer user_data,
	--                                              GDestroyNotify destroy);

	--   This variant of gtk_action_group_add_actions() adds a GDestroyNotify
	--   callback for user_data.

	--   action_group : the action group
	--   entries :      an array of action descriptions
	--   n_entries :    the number of entries
	--   user_data :    data to pass to the action callbacks
	--   destroy :      destroy notification callback for user_data

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  GtkToggleActionEntry

	-- typedef struct {
	--   const gchar     *name;
	--   const gchar     *stock_id;
	--   const gchar     *label;
	--   const gchar     *accelerator;
	--   const gchar     *tooltip;
	--   GCallback  callback;
	--   gboolean   is_active;
	-- } GtkToggleActionEntry;

	--   GtkToggleActionEntry structs are used with
	--   gtk_action_group_add_toggle_actions() to construct toggle actions.

	--   const gchar *name;        The name of the action.
	--   const gchar *stock_id;    The stock id for the action, or the name of an
	--                             icon from the icon theme.
	--   const gchar *label;       The label for the action. This field should
	--                             typically be marked for translation, see
	--                             gtk_action_group_set_translation_domain().
	--   const gchar *accelerator; The accelerator for the action, in the format
	--                             understood by gtk_accelerator_parse().
	--   const gchar *tooltip;     The tooltip for the action. This field should
	--                             typically be marked for translation, see
	--                             gtk_action_group_set_translation_domain().
	--   GCallback callback;       The function to call when the action is
	--                             activated.
	--   gboolean is_active;       The initial state of the toggle action.

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_toggle_actions ()

	-- void        gtk_action_group_add_toggle_actions
	--                                             (GtkActionGroup *action_group,
	--                                              const GtkToggleActionEntry *entries,
	--                                              guint n_entries,
	--                                              gpointer user_data);

	--   This is a convenience function to create a number of toggle actions and
	--   add them to the action group.

	--   The "activate" signals of the actions are connected to the callbacks and
	--   their accel paths are set to <Actions>/group-name/action-name.

	--   action_group : the action group
	--   entries :      an array of toggle action descriptions
	--   n_entries :    the number of entries
	--   user_data :    data to pass to the action callbacks

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_toggle_actions_full ()

	-- void        gtk_action_group_add_toggle_actions_full
	--                                             (GtkActionGroup *action_group,
	--                                              const GtkToggleActionEntry *entries,
	--                                              guint n_entries,
	--                                              gpointer user_data,
	--                                              GDestroyNotify destroy);

	--   This variant of gtk_action_group_add_toggle_actions() adds a
	--   GDestroyNotify callback for user_data.

	--   action_group : the action group
	--   entries :      an array of toggle action descriptions
	--   n_entries :    the number of entries
	--   user_data :    data to pass to the action callbacks
	--   destroy :      destroy notification callback for user_data

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  GtkRadioActionEntry

	-- typedef struct {
	--   const gchar *name;
	--   const gchar *stock_id;
	--   const gchar *label;
	--   const gchar *accelerator;
	--   const gchar *tooltip;
	--   gint   value;
	-- } GtkRadioActionEntry;

	--   GtkRadioActionEntry structs are used with
	--   gtk_action_group_add_radio_actions() to construct groups of radio actions.

	--   const gchar *name;        The name of the action.
	--   const gchar *stock_id;    The stock id for the action, or the name of an
	--                             icon from the icon theme.
	--   const gchar *label;       The label for the action. This field should
	--                             typically be marked for translation, see
	--                             gtk_action_group_set_translation_domain().
	--   const gchar *accelerator; The accelerator for the action, in the format
	--                             understood by gtk_accelerator_parse().
	--   const gchar *tooltip;     The tooltip for the action. This field should
	--                             typically be marked for translation, see
	--                             gtk_action_group_set_translation_domain().
	--   gint value;               The value to set on the radio action. See
	--                             gtk_radio_action_get_current_value().

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_radio_actions ()

	-- void        gtk_action_group_add_radio_actions
	--                                             (GtkActionGroup *action_group,
	--                                              const GtkRadioActionEntry *entries,
	--                                              guint n_entries,
	--                                              gint value,
	--                                              GCallback on_change,
	--                                              gpointer user_data);

	--   This is a convenience routine to create a group of radio actions and add
	--   them to the action group.

	--   The "changed" signal of the first radio action is connected to the
	--   on_change callback and the accel paths of the actions are set to
	--   <Actions>/group-name/action-name.

	--   action_group : the action group
	--   entries :      an array of radio action descriptions
	--   n_entries :    the number of entries
	--   value :        the value of the action to activate initially, or -1 if no
	--                  action should be activated
	--   on_change :    the callback to connect to the changed signal
	--   user_data :    data to pass to the action callbacks

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_add_radio_actions_full ()

	-- void        gtk_action_group_add_radio_actions_full
	--                                             (GtkActionGroup *action_group,
	--                                              const GtkRadioActionEntry *entries,
	--                                              guint n_entries,
	--                                              gint value,
	--                                              GCallback on_change,
	--                                              gpointer user_data,
	--                                              GDestroyNotify destroy);

	--   This variant of gtk_action_group_add_radio_actions() adds a GDestroyNotify
	--   callback for user_data.

	--   action_group : the action group
	--   entries :      an array of radio action descriptions
	--   n_entries :    the number of entries
	--   value :        the value of the action to activate initially, or -1 if no
	--                  action should be activated
	--   on_change :    the callback to connect to the changed signal
	--   user_data :    data to pass to the action callbacks
	--   destroy :      destroy notification callback for user_data

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_set_translate_func ()

	-- void        gtk_action_group_set_translate_func
	--                                             (GtkActionGroup *action_group,
	--                                              GtkTranslateFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify notify);

	--   Sets a function to be used for translating the label and tooltip of
	--   GtkActionGroupEntrys added by gtk_action_group_add_actions().

	--   If you're using gettext(), it is enough to set the translation domain with
	--   gtk_action_group_set_translation_domain().

	--   action_group : a GtkActionGroup
	--   func :         a GtkTranslateFunc
	--   data :         data to be passed to func and notify
	--   notify :       a GtkDestroyNotify function to be called when action_group
	--                  is destroyed and when the translation function is changed
	--                  again

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_set_translation_domain ()

	-- void        gtk_action_group_set_translation_domain
	--                                             (GtkActionGroup *action_group,
	--                                              const gchar *domain);

	--   Sets the translation domain and uses dgettext() for translating the label
	--   and tooltip of GtkActionEntrys added by gtk_action_group_add_actions().

	--   If you're not using gettext() for localization, see
	--   gtk_action_group_set_translate_func().

	--   action_group : a GtkActionGroup
	--   domain :       the translation domain to use for dgettext() calls

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  gtk_action_group_translate_string ()

	-- const gchar* gtk_action_group_translate_string
	--                                             (GtkActionGroup *action_group,
	--                                              const gchar *string);

	--   Translates a string using the specified translate_func(). This is mainly
	--   intended for language bindings.

	--   action_group : a GtkActionGroup
	--   string :       a string
	--   Returns :      the translation of string

	--   Since 2.6


feature {ANY} -- TODO: Properties


	--   "name"                 gchararray            : Read / Write / Construct Only
	--   "sensitive"            gboolean              : Read / Write
	--   "visible"              gboolean              : Read / Write

	--Property Details

	--  The "name" property

	--   "name"                 gchararray            : Read / Write / Construct Only

	--   A name for the action group.

	--   Default value: NULL

	--   --------------------------------------------------------------------------

	--  The "sensitive" property

	--   "sensitive"            gboolean              : Read / Write

	--   Whether the action group is enabled.

	--   Default value: TRUE

	--   --------------------------------------------------------------------------

	--  The "visible" property

	--   "visible"              gboolean              : Read / Write

	--   Whether the action group is visible.

	--   Default value: TRUE


feature {ANY} -- TODO: Signals


	-- "connect-proxy"
	--             void        user_function      (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             GtkWidget      *proxy,
	--                                             gpointer        user_data)         :
	-- "disconnect-proxy"
	--             void        user_function      (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             GtkWidget      *proxy,
	--                                             gpointer        user_data)         :
	-- "post-activate"
	--             void        user_function      (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             gpointer        user_data)         :
	-- "pre-activate"
	--             void        user_function      (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             gpointer        user_data)         :

	--Signal Details

	--  The "connect-proxy" signal

	-- void        user_function                  (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             GtkWidget      *proxy,
	--                                             gpointer        user_data)         :

	--   The connect_proxy signal is emitted after connecting a proxy to an action
	--   in the group. Note that the proxy may have been connected to a different
	--   action before.

	--   This is intended for simple customizations for which a custom action class
	--   would be too clumsy, e.g. showing tooltips for menuitems in the statusbar.

	--   GtkUIManager proxies the signal and provides global notification just
	--   before any action is connected to a proxy, which is probably more
	--   convenient to use.

	--   action_group : the group
	--   action :       the action
	--   proxy :        the proxy
	--   user_data :    user data set when the signal handler was connected.

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  The "disconnect-proxy" signal

	-- void        user_function                  (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             GtkWidget      *proxy,
	--                                             gpointer        user_data)         :

	--   The disconnect_proxy signal is emitted after disconnecting a proxy from an
	--   action in the group.

	--   GtkUIManager proxies the signal and provides global notification just
	--   before any action is connected to a proxy, which is probably more
	--   convenient to use.

	--   action_group : the group
	--   action :       the action
	--   proxy :        the proxy
	--   user_data :    user data set when the signal handler was connected.

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  The "post-activate" signal

	-- void        user_function                  (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             gpointer        user_data)         :

	--   The post_activate signal is emitted just after the action in the
	--   action_group is activated

	--   This is intended for GtkUIManager to proxy the signal and provide global
	--   notification just after any action is activated.

	--   action_group : the group
	--   action :       the action
	--   user_data :    user data set when the signal handler was connected.

	--   Since 2.4

	--   --------------------------------------------------------------------------

	--  The "pre-activate" signal

	-- void        user_function                  (GtkActionGroup *action_group,
	--                                             GtkAction      *action,
	--                                             gpointer        user_data)         :

	--   The pre_activate signal is emitted just before the action in the
	--   action_group is activated

	--   This is intended for GtkUIManager to proxy the signal and provide global
	--   notification just before any action is activated.

	--   action_group : the group
	--   action :       the action
	--   user_data :    user data set when the signal handler was connected.

	--   Since 2.4
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkActionGroup)"
		end

feature {} -- External calls
	gtk_action_group_new (a_name: POINTER): POINTER is
			-- GtkActionGroup* gtk_action_group_new (const gchar *name);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_get_name (an_action_group: POINTER): POINTER is
			-- const gchar* gtk_action_group_get_name (GtkActionGroup
			-- *action_group);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_get_sensitive (an_action_group: POINTER): INTEGER is
			-- gboolean gtk_action_group_get_sensitive (GtkActionGroup
			-- *action_group);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_set_sensitive (an_action_group: POINTER; a_sensitive: INTEGER) is
			-- void gtk_action_group_set_sensitive (GtkActionGroup
			-- *action_group, gboolean sensitive);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_get_visible (an_action_group: POINTER): INTEGER is
			-- gboolean gtk_action_group_get_visible (GtkActionGroup
			-- *action_group);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_set_visible (an_action_group: POINTER; a_setting: INTEGER) is
			-- void gtk_action_group_set_visible (GtkActionGroup
			-- *action_group, gboolean visible);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_get_action (an_action_group, a_action_name: POINTER): POINTER is
			-- GtkAction*  gtk_action_group_get_action (GtkActionGroup *action_group, const gchar *action_name);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_list_actions (an_action_group: POINTER): POINTER is
			-- GList* gtk_action_group_list_actions (GtkActionGroup
			-- *action_group);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_add_action (an_action_group, an_action: POINTER) is
			-- void gtk_action_group_add_action (GtkActionGroup
			-- *action_group, GtkAction *action);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_add_action_with_accel (an_action_group, an_action, an_accelerator: POINTER) is
			-- void gtk_action_group_add_action_with_accel
			-- (GtkActionGroup *action_group, GtkAction *action, const
			-- gchar *accelerator);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_remove_action (an_action_group, an_action: POINTER) is
			-- void gtk_action_group_remove_action (GtkActionGroup
			-- *action_group, GtkAction *action);
		external "C use <gtk/gtk.h>"
		end

	--             GtkActionEntry;
	
	gtk_action_group_add_actions (an_action_group, some_entries: POINTER; guint_n_entries: INTEGER; user_data: POINTER) is
			-- void gtk_action_group_add_actions (GtkActionGroup
			-- *action_group, const GtkActionEntry *entries, guint
			-- n_entries, gpointer user_data);

			-- TODO: guint_n_entries should be NATURAL since it is a guint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_action_group_add_actions_full (an_action_group, some_entries: POINTE; guint_n_entries: INTEGER; user_data, gdestroynotify: POINTER) is
			-- void gtk_action_group_add_actions_full (GtkActionGroup
			-- *action_group, const GtkActionEntry *entries, guint
			-- n_entries, gpointer user_data, GDestroyNotify destroy);

			-- TODO: guint_n_entries should be NATURAL since it is a guint
		external "C use <gtk/gtk.h>"
		end

	--             GtkToggleActionEntry;

	gtk_action_group_add_toggle_actions (an_action_group, some_entrires: POINTER; guint_n_entries: INTEGER; user_data: POINTER) is
			-- void gtk_action_group_add_toggle_actions (GtkActionGroup
			-- *action_group, const GtkToggleActionEntry *entries, guint
			-- n_entries, gpointer user_data);

			-- TODO: guint_n_entries should be NATURAL since it is a guint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_action_group_add_toggle_actions_full (an_action_group, some_entries: POINTER; guint_n_entries: INTEGER; user_data, gdestroynotify: POINTER) is
			-- void gtk_action_group_add_toggle_actions_full
			-- (GtkActionGroup *action_group, const GtkToggleActionEntry
			-- *entries, guint n_entries, gpointer user_data,
			-- GDestroyNotify destroy);

			-- TODO: guint_n_entries should be NATURAL since it is a guint
		external "C use <gtk/gtk.h>"
		end

	-- GtkRadioActionEntry;
	
	gtk_action_group_add_radio_actions (an_action_group, some_entries: POINTER; guint_n_entries, a_value: INTEGER; on_change_gcallback, user_data: POINTER) is
			-- void gtk_action_group_add_radio_actions (GtkActionGroup
			-- *action_group, const GtkRadioActionEntry *entries, guint
			-- n_entries, gint value, GCallback on_change, gpointer
			-- user_data);

			-- TODO: guint_n_entries should be NATURAL since it is a guint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_action_group_add_radio_actions_full (an_action_group, some_entries: POINTER; guint_n_entries, a_value: INTEGER; on_change_gcallback, user_data, gdestroynotify: POINTER) is
			-- void gtk_action_group_add_radio_actions_full
			-- (GtkActionGroup *action_group, const GtkRadioActionEntry
			-- *entries, guint n_entries, gint value, GCallback
			-- on_change, gpointer user_data, GDestroyNotify destroy);

			-- TODO: guint_n_entries should be NATURAL since it is a guint
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_set_translate_func (an_action_group, a_gtktranslatefunc, some_data, a_gtkdestroynotify: POINTER) is
			-- void gtk_action_group_set_translate_func (GtkActionGroup
			-- *action_group, GtkTranslateFunc func, gpointer data,
			-- GtkDestroyNotify notify);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_action_group_set_translation_domain (an_action_group, a_domain: POINTER) is
			-- void gtk_action_group_set_translation_domain
			-- (GtkActionGroup *action_group, const gchar *domain);
		external "C use <gtk/gtk.h>"
		end

	gtk_action_group_translate_string (an_action_group, a_string: POINTER): POINTER is
			-- const gchar* gtk_action_group_translate_string
			-- (GtkActionGroup *action_group, const gchar *string);
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_ACTION_GROUP
