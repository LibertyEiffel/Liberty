note
	description: "GtkCalendar -- Displays a calendar and allows the user to select a date."
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

class GTK_CALENDAR
	-- GtkCalendar is a widget that displays a calendar, one month at a
	-- time. It can be created with `make'.
	
	-- The month and year currently displayed can be altered with
	-- `select_month'. The exact day can be selected from the displayed
	-- month using `select_day'.

	-- To place a visual marker on a particular day, use `mark_day' and
	-- to remove the marker, `unmark_day'. Alternative, all marks can
	-- be cleared with `clear_marks'.
	
	-- The way in which the calendar itself is displayed can be altered
	-- using `set_display_options'.
	
	-- The selected date can be retrieved from a GtkCalendar using
	-- `date'.
	
inherit 
	GTK_WIDGET
	-- GtkCalendar implements AtkImplementorIface interface.

insert
	GTK_CALENDAR_EXTERNALS

create {ANY} make, from_external_pointer

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCalendar)"
		end

feature {} -- Creation
	make
			-- Creates a new calendar, with the current date being
			-- selected.
		do
			from_external_pointer (gtk_calendar_new)
		end

feature {ANY}
	marked_dates_count: INTEGER
			-- the number of days that have a mark over them.
		do
			Result:=get_num_marked_dates(handle)
		end

	marked_date (an_n: INTEGER): INTEGER
			-- the `an_n'-th marked date
		require valid_n: an_n.in_range(0,marked_dates_count-1)
		local array: NATIVE_ARRAY[INTEGER]
		do
			array:=array.from_pointer(get_marked_date(handle))
			Result:=array.item(an_n)
		end
			
	selected_day,day: INTEGER
			-- the currently visible selected day.

			-- Note: GTK allows to access this feature either as
			-- selected_day, a field of a structure and throught the
			-- "day" property. Choose the fittest name. Paolo 2007-05-31
		do
			Result:=get_selected_day(handle)
		ensure valid: Result.in_range(1,31)
		end
	
	month: INTEGER
			-- the currently visible month.
		do
			Result:=get_month(handle)
		ensure valid: Result.in_range(0,11)
		end

	year: INTEGER
			-- the currently visible year.
		do
			Result:=get_year(handle)
		end

	date: G_DATE
			-- Obtains the selected date from a GTK_CALENDAR
		local
			a_day, a_month, a_year: INTEGER
		do
			gtk_calendar_get_date (handle, $a_year, $a_month, $a_day)
			-- year : 	location to store the year number, or NULL
			-- month : 	location to store the month number (between 0 and 11), or NULL
			-- day : 	location to store the day number (between 1 and 31), or NULL
			create Result.make_dmy (a_day.to_integer_8, a_month + 1, a_year.to_integer_16)
		ensure
			Result /= Void
			Result.is_valid
		end
	
	select_month (a_month, an_year: INTEGER)
			-- Shifts the calendar to a different month.
			-- month : a month number between 0 and 11.
			-- year : the year the month is in.
		require
			month.in_range (0, 11)
			year >= 0
		do
			gtk_calendar_select_month (handle, a_month, an_year)
		end

	select_day (a_day: INTEGER)
			--    Selects a day from the current month.
		require valid_date: a_day.in_range(1,31)
		do
			gtk_calendar_select_day(handle, a_day)
		end

	unselect_day
			-- unselect the currently selected day.
		do
			gtk_calendar_select_day(handle, 0)
		end

	mark_day (a_day: INTEGER)
			-- Places a visual marker on a particular day.
		require valid_date: a_day.in_range(1,31)
		local always_true: INTEGER
		do
			always_true:=gtk_calendar_mark_day(handle,a_day)
		end

	unmark_day (a_day: INTEGER)
		require valid_date: a_day.in_range(1,31)
		local always_true: INTEGER
		do
			always_true:=gtk_calendar_unmark_day(handle,a_day)
		end

	clear_marks
			-- Remove all visual markers.
		do
			gtk_calendar_clear_marks(handle)
		end

	display_options: INTEGER
			-- the current display options of calendar.
		do
			Result:=gtk_calendar_get_display_options(handle)
		ensure valid: are_valid_gtk_calendar_display_options(Result)
		end

	set_display_options (some_flags: INTEGER)
			-- Sets display options (whether to display the heading and
			-- the month headings).
		require valid: are_valid_gtk_calendar_display_options(some_flags)
		do
			gtk_calendar_set_display_options(handle,some_flags)
		ensure set: display_options = some_flags
		end

feature {ANY} -- Properties: TODO
--    "day"                  gint                  : Read / Write
--    "month"                gint                  : Read / Write
--    "no-month-change"      gboolean              : Read / Write
--    "show-day-names"       gboolean              : Read / Write
--    "show-heading"         gboolean              : Read / Write
--    "show-week-numbers"    gboolean              : Read / Write
--    "year"                 gint                  : Read / Write

-- Property Details

--   The "day" property

--    "day"                  gint                  : Read / Write

--    The selected day (as a number between 1 and 31, or 0 to unselect the currently selected day).

--    Allowed values: [0,31]

--    Default value: 0

--    ----------------------------------------------------------------------------------------------

--   The "month" property

--    "month"                gint                  : Read / Write

--    The selected month (as a number between 0 and 11).

--    Allowed values: [0,11]

--    Default value: 0

--    ----------------------------------------------------------------------------------------------

--   The "no-month-change" property

--    "no-month-change"      gboolean              : Read / Write

--    Determines whether the selected month can be changed.

--    Default value: FALSE

--    Since 2.4

--    ----------------------------------------------------------------------------------------------

--   The "show-day-names" property

--    "show-day-names"       gboolean              : Read / Write

--    Determines whether day names are displayed.

--    Default value: TRUE

--    Since 2.4

--    ----------------------------------------------------------------------------------------------

--   The "show-heading" property

--    "show-heading"         gboolean              : Read / Write

--    Determines whether a heading is displayed.

--    Default value: TRUE

--    Since 2.4

--    ----------------------------------------------------------------------------------------------

--   The "show-week-numbers" property

--    "show-week-numbers"    gboolean              : Read / Write

--    Determines whether week numbers are displayed.

--    Default value: FALSE

--    Since 2.4

--    ----------------------------------------------------------------------------------------------

--   The "year" property

--    "year"                 gint                  : Read / Write

--    The selected year.

--    Allowed values: >= 0

--    Default value: 0

-- Signal Details

--   The "day-selected" signal

--  void        user_function                  (GtkCalendar *calendar,
--                                              gpointer     user_data)      : Run first

--    Emitted when the user selects a day.

--    calendar :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    ----------------------------------------------------------------------------------------------

--   The "day-selected-double-click" signal

--  void        user_function                  (GtkCalendar *calendar,
--                                              gpointer     user_data)      : Run first

--    calendar :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    ----------------------------------------------------------------------------------------------

--   The "month-changed" signal

--  void        user_function                  (GtkCalendar *calendar,
--                                              gpointer     user_data)      : Run first

--    Emitted when the user clicks a button to change the selected month on a calendar.

--    calendar :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    ----------------------------------------------------------------------------------------------

--   The "next-month" signal

--  void        user_function                  (GtkCalendar *calendar,
--                                              gpointer     user_data)      : Run first

--    calendar :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    ----------------------------------------------------------------------------------------------

--   The "next-year" signal

--  void        user_function                  (GtkCalendar *calendar,
--                                              gpointer     user_data)      : Run first

--    calendar :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    ----------------------------------------------------------------------------------------------

--   The "prev-month" signal

--  void        user_function                  (GtkCalendar *calendar,
--                                              gpointer     user_data)      : Run first

--    calendar :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

--    ----------------------------------------------------------------------------------------------

--   The "prev-year" signal

--  void        user_function                  (GtkCalendar *calendar,
--                                              gpointer     user_data)      : Run first

--    calendar :  the object which received the signal.
--    user_data : user data set when the signal handler was connected.

feature {} -- typedef struct _GtkCalendar GtkCalendar;	
	-- Note: All of these fields should be considered read only, and
	-- everything in this struct should only be modified using the
	-- functions provided below.

	get_num_marked_dates (a_struct: POINTER): INTEGER
		external "C struct GtkCalendar get num_marked_dates use <gtk/gtk.h>"
		end

	get_marked_date (a_struct: POINTER): POINTER
		external "C struct GtkCalendar get marked_date use <gtk/gtk.h>"
		end

	get_selected_day (a_struct: POINTER): INTEGER
		external "C struct GtkCalendar get selected_day use <gtk/gtk.h>"
		end

	get_month (a_struct: POINTER): INTEGER
		external "C struct GtkCalendar get month use <gtk/gtk.h>"
		end

	get_year (a_struct: POINTER): INTEGER
		external "C struct GtkCalendar get year use <gtk/gtk.h>"
		end

end
