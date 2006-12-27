indexing
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GTK_PROGRESS_BAR_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_progress_bar_new : POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_pulse (bar: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_text (bar: POINTER; text : POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_fraction (bar: POINTER; fraction: REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_pulse_step (bar : POINTER;fraction : REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_get_text (bar : POINTER) : POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_get_fraction (bar : POINTER) : REAL is
		external "C use <gtk/gtk.h>"
		end

	void        gtk_progress_bar_set_orientation
                                            (GtkProgressBar *pbar,
                                             GtkProgressBarOrientation orientation);
void        gtk_progress_bar_set_ellipsize  (GtkProgressBar *pbar,
                                             PangoEllipsizeMode mode);
enum        GtkProgressBarOrientation;
gdouble     gtk_progress_bar_get_pulse_step (GtkProgressBar *pbar);
GtkProgressBarOrientation gtk_progress_bar_get_orientation
                                            (GtkProgressBar *pbar);
PangoEllipsizeMode gtk_progress_bar_get_ellipsize
                                            (GtkProgressBar *pbar);
GtkWidget*  gtk_progress_bar_new_with_adjustment
                                            (GtkAdjustment *adjustment);
void        gtk_progress_bar_set_bar_style  (GtkProgressBar *pbar,
                                             GtkProgressBarStyle style);
enum        GtkProgressBarStyle;
void        gtk_progress_bar_set_discrete_blocks
                                            (GtkProgressBar *pbar,
                                             guint blocks);
void        gtk_progress_bar_set_activity_step
                                            (GtkProgressBar *pbar,
                                             guint step);
void        gtk_progress_bar_set_activity_blocks
                                            (GtkProgressBar *pbar,
                                             guint blocks);
void        gtk_progress_bar_update         (GtkProgressBar *pbar,
                                             gdouble percentage);

end
