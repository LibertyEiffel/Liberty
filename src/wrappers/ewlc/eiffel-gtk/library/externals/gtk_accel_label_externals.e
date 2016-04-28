note
	description: "External calls for GTK_ACCEL_LABEL"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ACCEL_LABEL_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_accel_label_new (a_string: POINTER): POINTER is
			-- GtkWidget* gtk_accel_label_new (const gchar *string);
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_label_set_accel_closure (an_accel_label, an_accel_closure: POINTER) is
			-- void gtk_accel_label_set_accel_closure (GtkAccelLabel *accel_label, GClosure *accel_closure);
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_label_get_accel_widget (an_accel_label: POINTER): POINTER is
			-- GtkWidget* gtk_accel_label_get_accel_widget (GtkAccelLabel *accel_label);
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_label_set_accel_widget (an_accel_label, an_accel_widget: POINTER) is
			-- void gtk_accel_label_set_accel_widget (GtkAccelLabel
			-- *accel_label, GtkWidget *accel_widget);
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_label_get_accel_width (an_accel_label: POINTER): INTEGER is
			-- guint gtk_accel_label_get_accel_width (GtkAccelLabel 
			-- *accel_label);

			-- TODO: Result should be NATURAL since it's a guint
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_label_refetch (an_accel_label: POINTER): INTEGER is
			-- gboolean gtk_accel_label_refetch (GtkAccelLabel *accel_label);
		external "C use <gtk/gtk.h>"
		end

end
