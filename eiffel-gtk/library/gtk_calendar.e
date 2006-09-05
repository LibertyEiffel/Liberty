indexing
	description: "GtkCalendar -- Displays a calendar and allows the user to select a date."
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

			-- Description: GtkCalendar is a widget that displays a
			-- calendar, one month at a time. It can be created with
			-- gtk_calendar_new().

			-- The month and year currently displayed can be altered with
			-- gtk_calendar_select_month(). The exact day can be selected
			-- from the displayed month using gtk_calendar_select_day().

			-- To place a visual marker on a particular day, use
			-- gtk_calendar_mark_day() and to remove the marker,
			-- gtk_calendar_unmark_day(). Alternative, all marks can be
			-- cleared with gtk_calendar_clear_marks().
	
			-- The way in which the calendar itself is displayed can be
			-- altered using gtk_calendar_set_display_options().
	
			-- The selected date can be retrieved from a GtkCalendar
			-- using gtk_calendar_get_date().

class GTK_CALENDAR
inherit 
	GTK_WIDGET
	-- GtkCalendar implements AtkImplementorIface interface.

insert
	GTK_CALENDAR_EXTERNALS

creation make, from_external_pointer

feature -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCalendar)"
		end

feature {} -- Creation
	make is 
			-- Creates a new calendar, with the current date being
			-- selected.
		do
			from_external_pointer (gtk_calendar_new)
		end

feature -- Properties

	date: TUPLE [INTEGER, INTEGER, INTEGER] is
			-- Obtains the selected date from a GTK_CALENDAR
		local
			year, month, day: INTEGER
		do
			gtk_calendar_get_date (handle, $year, $month, $day)
			Result := [year, month, day]
		ensure
			Result /= Void
			Result.first >= 0
			Result.second >= 0
			Result.third >= 0
		end

	select_month (month, year: INTEGER) is
			-- Shifts the calendar to a different month.
			-- month : a month number between 0 and 11.
			-- year : the year the month is in.
		require
			month.in_range (0, 11)
			year >= 0
		do
			gtk_calendar_select_month (handle, month, year)
		end


-- Details

--   GtkCalendar

--  typedef struct _GtkCalendar GtkCalendar;

--    num_marked_dates is an integer containing the number of days that have a mark over them.

--    marked_date is an array containing the day numbers that currently have a mark over them.

--    month, year, and selected_day contain the currently visible month, year, and selected day
--    respectively.

--    All of these fields should be considered read only, and everything in this struct should only
--    be modified using the functions provided below.

--   Note

--    Note that month is zero-based (i.e it allowed values are 0-11) while selected_day is one-based
--    (i.e. allowed values are 1-31).

--    ----------------------------------------------------------------------------------------------

--   enum GtkCalendarDisplayOptions

--  typedef enum
--  {
--    GTK_CALENDAR_SHOW_HEADING             = 1 < < 0,
--    GTK_CALENDAR_SHOW_DAY_NAMES           = 1 < < 1,
--    GTK_CALENDAR_NO_MONTH_CHANGE          = 1 < < 2,
--    GTK_CALENDAR_SHOW_WEEK_NUMBERS        = 1 < < 3,
--    GTK_CALENDAR_WEEK_START_MONDAY        = 1 < < 4
--  } GtkCalendarDisplayOptions;

--    These options can be used to influence the display and behaviour of a GtkCalendar.

--    GTK_CALENDAR_SHOW_HEADING      Specifies that the month and year should be displayed.
--    GTK_CALENDAR_SHOW_DAY_NAMES    Specifies that three letter day descriptions should be present.
--    GTK_CALENDAR_NO_MONTH_CHANGE   Prevents the user from switching months with the calendar.
--    GTK_CALENDAR_SHOW_WEEK_NUMBERS Displays each week numbers of the current year, down the left
--                                   side of the calendar.
--    GTK_CALENDAR_WEEK_START_MONDAY Since GTK+ 2.4, this option is deprecated and ignored by GTK+.
--                                   The information on which day the calendar week starts is
--                                   derived from the locale.

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_new ()

--  GtkWidget*  gtk_calendar_new                (void);



--    Returns : a newly GtkCalendar widget

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_select_month ()

--  gboolean    gtk_calendar_select_month       (GtkCalendar *calendar,
--                                               guint month,
--                                               guint year);

--    Shifts the calendar to a different month.

--    calendar : a GtkCalendar
--    month :    a month number between 0 and 11.
--    year :     the year the month is in.
--    Returns :  TRUE, always

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_select_day ()

--  void        gtk_calendar_select_day         (GtkCalendar *calendar,
--                                               guint day);

--    Selects a day from the current month.

--    calendar : a GtkCalendar.
--    day :      the day number between 1 and 31, or 0 to unselect the currently selected day.

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_mark_day ()

--  gboolean    gtk_calendar_mark_day           (GtkCalendar *calendar,
--                                               guint day);

--    Places a visual marker on a particular day.

--    calendar : a GtkCalendar
--    day :      the day number to mark between 1 and 31.
--    Returns :  TRUE, always

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_unmark_day ()

--  gboolean    gtk_calendar_unmark_day         (GtkCalendar *calendar,
--                                               guint day);

--    Removes the visual marker from a particular day.

--    calendar : a GtkCalendar.
--    day :      the day number to unmark between 1 and 31.
--    Returns :  TRUE, always

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_clear_marks ()

--  void        gtk_calendar_clear_marks        (GtkCalendar *calendar);

--    Remove all visual markers.

--    calendar : a GtkCalendar

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_get_display_options ()

--  GtkCalendarDisplayOptions gtk_calendar_get_display_options
--                                              (GtkCalendar *calendar);

--    Returns the current display options of calendar.

--    calendar : a GtkCalendar
--    Returns :  the display options.

--    Since 2.4

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_set_display_options ()

--  void        gtk_calendar_set_display_options
--                                              (GtkCalendar *calendar,
--                                               GtkCalendarDisplayOptions flags);

--    Sets display options (whether to display the heading and the month headings).

--    calendar : a GtkCalendar
--    flags :    the display options to set

--    Since 2.4

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_display_options ()

--  void        gtk_calendar_display_options    (GtkCalendar *calendar,
--                                               GtkCalendarDisplayOptions flags);

--   Warning

--    gtk_calendar_display_options is deprecated and should not be used in newly-written code.

--    Sets display options (whether to display the heading and the month headings).

--    calendar : a GtkCalendar.
--    flags :    the display options to set.

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_get_date ()

--  void        gtk_calendar_get_date           (GtkCalendar *calendar,
--                                               guint *year,
--                                               guint *month,
--                                               guint *day);

--    Obtains the selected date from a GtkCalendar.

--    calendar : a GtkCalendar
--    year :     location to store the year number, or NULL
--    month :    location to store the month number (between 0 and 11), or NULL
--    day :      location to store the day number (between 1 and 31), or NULL

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_freeze ()

--  void        gtk_calendar_freeze             (GtkCalendar *calendar);

--   Warning

--    gtk_calendar_freeze is deprecated and should not be used in newly-written code.

--    Does nothing. Previously locked the display of the calendar until it was thawed with
--    gtk_calendar_thaw().

--    calendar : a GtkCalendar

--    ----------------------------------------------------------------------------------------------

--   gtk_calendar_thaw ()

--  void        gtk_calendar_thaw               (GtkCalendar *calendar);

--   Warning

--    gtk_calendar_thaw is deprecated and should not be used in newly-written code.

--    Does nothing. Previously defrosted a calendar; all the changes made since the last
--    gtk_calendar_freeze() were displayed.

--    calendar : a GtkCalendar


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


--  #include <gtk/gtk.h>
--              GtkCalendar;
--  enum        GtkCalendarDisplayOptions;

--  void        gtk_calendar_select_day         (a_calendar: POINTER, guint day);
--  gboolean    gtk_calendar_mark_day           (a_calendar: POINTER, guint day);
--  gboolean    gtk_calendar_unmark_day         (a_calendar: POINTER, guint day);
--  void        gtk_calendar_clear_marks        (a_calendar: POINTER);
--  GtkCalendarDisplayOptions gtk_calendar_get_display_options
--                                              (a_calendar: POINTER);
--  void        gtk_calendar_set_display_options
--                                              (a_calendar: POINTER, GtkCalendarDisplayOptions flags);
--  void        gtk_calendar_display_options    (a_calendar: POINTER, GtkCalendarDisplayOptions flags);

--  void        gtk_calendar_freeze             (a_calendar: POINTER);
--  void        gtk_calendar_thaw               (a_calendar: POINTER);

-- Original C documentation:
--  #include <gtk/gtk.h>
--              GtkCalendar;
--  enum        GtkCalendarDisplayOptions;
--  GtkWidget*  gtk_calendar_new                (void);

--  void        gtk_calendar_select_day         (GtkCalendar *calendar, guint day);
--  gboolean    gtk_calendar_mark_day           (GtkCalendar *calendar, guint day);
--  gboolean    gtk_calendar_unmark_day         (GtkCalendar *calendar, guint day);
--  void        gtk_calendar_clear_marks        (GtkCalendar *calendar);
--  GtkCalendarDisplayOptions gtk_calendar_get_display_options
--                                              (GtkCalendar *calendar);
--  void        gtk_calendar_set_display_options
--                                              (GtkCalendar *calendar, GtkCalendarDisplayOptions flags);
--  void        gtk_calendar_display_options    (GtkCalendar *calendar, GtkCalendarDisplayOptions flags);
--  void        gtk_calendar_get_date           (GtkCalendar *calendar, guint *year, guint *month, guint *day);
--  void        gtk_calendar_freeze             (GtkCalendar *calendar);
--  void        gtk_calendar_thaw               (GtkCalendar *calendar);

end
