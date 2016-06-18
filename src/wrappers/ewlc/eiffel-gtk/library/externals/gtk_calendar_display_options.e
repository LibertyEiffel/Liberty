note
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

deferred class GTK_CALENDAR_DISPLAY_OPTIONS
	--    These options can be used to influence the display and
	--    behaviour of a GtkCalendar.
inherit ANY undefine is_equal, copy end

feature {} -- enum
	are_valid_gtk_calendar_display_options (some_options: INTEGER): BOOLEAN
		do	
			Result:=(some_options & (gtk_calendar_show_heading |
											 gtk_calendar_show_day_names |
											 gtk_calendar_no_month_change |
											 gtk_calendar_show_week_numbers)).to_boolean
		end

	gtk_calendar_show_heading: INTEGER
			-- Specifies that the month and year should be displayed.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CALENDAR_SHOW_HEADING"
		end

	gtk_calendar_show_day_names: INTEGER
			-- Specifies that three letter day descriptions should be
			-- present.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CALENDAR_SHOW_DAY_NAMES"
		end

	gtk_calendar_no_month_change: INTEGER
			-- Prevents the user from switching months with the calendar.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CALENDAR_NO_MONTH_CHANGE"
		end

	gtk_calendar_show_week_numbers: INTEGER
			-- Displays each week numbers of the current year, down the
			-- left side of the calendar.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CALENDAR_SHOW_WEEK_NUMBERS"
		end

end
