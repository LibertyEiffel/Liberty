note
	description: "External calls for GtkCalendar"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CALENDAR_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GTK_CALENDAR_DISPLAY_OPTIONS
	
feature {} -- Externals

	gtk_calendar_new: POINTER is --  GtkWidget
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_select_month (a_calendar: POINTER; a_month,an_year: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_get_date (a_calendar, a_year, a_month, a_day: POINTER)
		external "C use <gtk/gtk.h>"
		end


	gtk_calendar_select_day (a_calendar: POINTER; a_day: INTEGER)
			-- void gtk_calendar_select_day (GtkCalendar *calendar, guint
			-- day);
		require natural_day: a_day>=0 -- TODO: some_day should be NATURAL
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_mark_day (a_calendar: POINTER; a_day: INTEGER): INTEGER
			-- gboolean gtk_calendar_mark_day (GtkCalendar *calendar,
			-- guint day);
		require natural_day: a_day>=0 -- TODO: some_day should be NATURAL
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_unmark_day (a_calendar: POINTER; a_day: INTEGER): INTEGER
			-- gboolean gtk_calendar_unmark_day (GtkCalendar *calendar, guint day);
		require natural_day: a_day>=0 -- TODO: some_day should be NATURAL
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_clear_marks (a_calendar: POINTER)
			-- void gtk_calendar_clear_marks (GtkCalendar *calendar);
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_get_display_options (a_calendar: POINTER): INTEGER
			-- GtkCalendarDisplayOptions gtk_calendar_get_display_options
			-- (GtkCalendar *calendar);
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_set_display_options (a_calendar: POINTER; some_flags: INTEGER)
			-- 	void gtk_calendar_set_display_options (GtkCalendar
			-- 	*calendar, GtkCalendarDisplayOptions flags);
		external "C use <gtk/gtk.h>"
		end

	gtk_calendar_thaw (a_calendar: POINTER)
			-- void gtk_calendar_thaw (GtkCalendar *calendar);
		external "C use <gtk/gtk.h>"
		end


end -- class GTK_CALENDAR_EXTERNALS
