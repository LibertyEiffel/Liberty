note
	description: "Access to GtkFileSelection C structure"
	copyright: "Copyright (C) 2007-2022: $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_SELECTION_STRUCT
feature {} -- Structure getter/setter calls
	--  GtkFileSelection
	--
	-- typedef struct {
	--   GtkWidget *dir_list;
	--   GtkWidget *file_list;
	--   GtkWidget *selection_entry;
	--   GtkWidget *selection_text;
	--   GtkWidget *main_vbox;
	--   GtkWidget *ok_button;
	--   GtkWidget *cancel_button;
	--   GtkWidget *help_button;
	--   GtkWidget *history_pulldown;
	--   GtkWidget *history_menu;
	--   GList     *history_list;
	--   GtkWidget *fileop_dialog;
	--   GtkWidget *fileop_entry;
	--   gchar     *fileop_file;
	--   gpointer   cmpl_state;
	--
	--   GtkWidget *fileop_c_dir;
	--   GtkWidget *fileop_del_file;
	--   GtkWidget *fileop_ren_file;
	--
	--   GtkWidget *button_area;
	--   GtkWidget *action_area;
	-- } GtkFileSelection;

	--   GtkWidget *dir_list;
	get_dir_list (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get dir_list use <gtk/gtk.h>"
		end

	set_c_dir_list (a_struct: POINTER; a_dir_list: POINTER)
		external "C struct GtkFileSelection set dir_list use <gtk/gtk.h>"
		end
	--   GtkWidget *file_list;
	get_file_list (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get file_list use <gtk/gtk.h>"
		end

	set_c_file_list (a_struct: POINTER; a_file_list: POINTER)
		external "C struct GtkFileSelection set file_list use <gtk/gtk.h>"
		end
	--   GtkWidget *selection_entry;
	get_selection_entry (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get selection_entry use <gtk/gtk.h>"
		end

	set_c_selection_entry (a_struct: POINTER; a_selection_entry: POINTER)
		external "C struct GtkFileSelection set selection_entry use <gtk/gtk.h>"
		end
	--   GtkWidget *selection_text;
	get_selection_text (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get selection_text use <gtk/gtk.h>"
		end

	set_c_selection_text (a_struct: POINTER; a_selection_text: POINTER)
		external "C struct GtkFileSelection set selection_text use <gtk/gtk.h>"
		end
	--   GtkWidget *main_vbox;
	get_main_vbox (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get main_vbox use <gtk/gtk.h>"
		end

	set_c_main_vbox (a_struct: POINTER; a_main_vbox: POINTER)
		external "C struct GtkFileSelection set main_vbox use <gtk/gtk.h>"
		end
	--   GtkWidget *ok_button;
	get_ok_button (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get ok_button use <gtk/gtk.h>"
		end

	set_c_ok_button (a_struct: POINTER; a_ok_button: POINTER)
		external "C struct GtkFileSelection set ok_button use <gtk/gtk.h>"
		end
	--   GtkWidget *cancel_button;
	get_cancel_button (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get cancel_button use <gtk/gtk.h>"
		end

	set_c_cancel_button (a_struct: POINTER; a_cancel_button: POINTER)
		external "C struct GtkFileSelection set cancel_button use <gtk/gtk.h>"
		end
	--   GtkWidget *help_button;
	get_help_button (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get help_button use <gtk/gtk.h>"
		end

	set_c_help_button (a_struct: POINTER; a_help_button: POINTER)
		external "C struct GtkFileSelection set help_button use <gtk/gtk.h>"
		end
	--   GtkWidget *history_pulldown;
	get_history_pulldown (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get history_pulldown use <gtk/gtk.h>"
		end

	set_c_history_pulldown (a_struct: POINTER; a_history_pulldown: POINTER)
		external "C struct GtkFileSelection set history_pulldown use <gtk/gtk.h>"
		end
	--   GtkWidget *history_menu;
	get_history_menu (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get history_menu use <gtk/gtk.h>"
		end

	set_c_history_menu (a_struct: POINTER; a_history_menu: POINTER)
		external "C struct GtkFileSelection set history_menu use <gtk/gtk.h>"
		end
	--   GList     *history_list;
	get_history_list (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get history_list use <gtk/gtk.h>"
		end

	set_c_history_list (a_struct: POINTER; a_history_list: POINTER)
		external "C struct GtkFileSelection set history_list use <gtk/gtk.h>"
		end
	
	--   GtkWidget *fileop_dialog;
	get_fileop_dialog (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get fileop_dialog use <gtk/gtk.h>"
		end

	set_c_fileop_dialog (a_struct: POINTER; a_fileop_dialog: POINTER)
		external "C struct GtkFileSelection set fileop_dialog use <gtk/gtk.h>"
		end
	
	--   GtkWidget *fileop_entry;
	get_fileop_entry (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get fileop_entry use <gtk/gtk.h>"
		end

	set_c_fileop_entry (a_struct: POINTER; a_fileop_entry: POINTER)
		external "C struct GtkFileSelection set fileop_entry use <gtk/gtk.h>"
		end
	
	--   gchar     *fileop_file;
	get_fileop_file (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get fileop_file use <gtk/gtk.h>"
		end

	set_c_fileop_file (a_struct: POINTER; a_fileop_file: POINTER)
		external "C struct GtkFileSelection set fileop_file use <gtk/gtk.h>"
		end
	
	--   gpointer   cmpl_state;
	get_cmpl_state (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get cmpl_state use <gtk/gtk.h>"
		end

	set_c_cmpl_state (a_struct: POINTER; a_cmpl_state: POINTER)
		external "C struct GtkFileSelection set cmpl_state use <gtk/gtk.h>"
		end

	--   GtkWidget *fileop_c_dir;
	get_fileop_c_dir (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get fileop_c_dir use <gtk/gtk.h>"
		end

	set_c_fileop_c_dir (a_struct: POINTER; a_fileop_c_dir: POINTER)
		external "C struct GtkFileSelection set fileop_c_dir use <gtk/gtk.h>"
		end
	
	--   GtkWidget *fileop_del_file;
	get_fileop_del_file (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get fileop_del_file use <gtk/gtk.h>"
		end

	set_c_fileop_del_file (a_struct: POINTER; a_fileop_del_file: POINTER)
		external "C struct GtkFileSelection set fileop_del_file use <gtk/gtk.h>"
		end
	
	--   GtkWidget *fileop_ren_file;
	get_fileop_ren_file (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get fileop_ren_file use <gtk/gtk.h>"
		end

	set_c_fileop_ren_file (a_struct: POINTER; a_fileop_ren_file: POINTER)
		external "C struct GtkFileSelection set fileop_ren_file use <gtk/gtk.h>"
		end

	--   GtkWidget *button_area;
	get_button_area (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get button_area use <gtk/gtk.h>"
		end

	set_c_button_area (a_struct: POINTER; a_button_area: POINTER)
		external "C struct GtkFileSelection set button_area use <gtk/gtk.h>"
		end
	
	--   GtkWidget *action_area;
	get_action_area (a_struct: POINTER): POINTER
		external "C struct GtkFileSelection get action_area use <gtk/gtk.h>"
		end

	set_c_action_area (a_struct: POINTER; a_action_area: POINTER)
		external "C struct GtkFileSelection set action_area use <gtk/gtk.h>"
		end
	
	--   The GtkFileSelection struct contains the following GtkWidget fields:

	--                      the dialog box used to display the GtkFileSelection. It
	--   *fileop_dialog;    can be customized by adding/removing widgets from it
	--                      using the standard GtkDialog functions.
	--   *ok_button,        the two main buttons that signals should be connected
	--   *cancel_button;    to in order to perform an action when the user hits
	--                      either OK or Cancel.
	--   *history_pulldown; the GtkOptionMenu used to create the drop-down
	--                      directory history.
	--                      the buttons that appear at the top of the file
	--   *fileop_c_dir,     selection dialog. These "operation buttons" can be
	--   *fileop_del_file,  hidden and redisplayed with
	--   *fileop_ren_file;  gtk_file_selection_hide_fileop_buttons() and
	--                      gtk_file_selection_show_fileop_buttons() 
	--                      respectively.
	
end
