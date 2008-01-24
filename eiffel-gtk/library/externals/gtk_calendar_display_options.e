indexing
	description: "Enum GtkCalendarDisplayOptions"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gtk_calendar_display_options.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GTK_CALENDAR_DISPLAY_OPTIONS
       -- Enum GtkCalendarDisplayOptions

insert ENUM

creation set_gtk_calendar_show_heading

feature -- Setters

    set_gtk_calendar_show_heading is 
       do
          value := gtk_calendar_show_heading 
       ensure is_gtk_calendar_show_heading 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_0 is 
       do
          value := 0 
       ensure is_0 
       end

    set_gtk_calendar_show_day_names is 
       do
          value := gtk_calendar_show_day_names 
       ensure is_gtk_calendar_show_day_names 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_gtk_calendar_no_month_change is 
       do
          value := gtk_calendar_no_month_change 
       ensure is_gtk_calendar_no_month_change 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_2 is 
       do
          value := 2 
       ensure is_2 
       end

    set_gtk_calendar_show_week_numbers is 
       do
          value := gtk_calendar_show_week_numbers 
       ensure is_gtk_calendar_show_week_numbers 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_3 is 
       do
          value := 3 
       ensure is_3 
       end

    set_gtk_calendar_week_start_monday is 
       do
          value := gtk_calendar_week_start_monday 
       ensure is_gtk_calendar_week_start_monday 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_4 is 
       do
          value := 4 
       ensure is_4 
       end

feature -- Queries

    is_gtk_calendar_show_heading: BOOLEAN is do Result:=(value=gtk_calendar_show_heading) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_0: BOOLEAN is do Result:=(value=0) end

    is_gtk_calendar_show_day_names: BOOLEAN is do Result:=(value=gtk_calendar_show_day_names) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_gtk_calendar_no_month_change: BOOLEAN is do Result:=(value=gtk_calendar_no_month_change) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_2: BOOLEAN is do Result:=(value=2) end

    is_gtk_calendar_show_week_numbers: BOOLEAN is do Result:=(value=gtk_calendar_show_week_numbers) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_3: BOOLEAN is do Result:=(value=3) end

    is_gtk_calendar_week_start_monday: BOOLEAN is do Result:=(value=gtk_calendar_week_start_monday) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_4: BOOLEAN is do Result:=(value=4) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gtk_calendar_show_heading) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=0) or else
                    (a_value=gtk_calendar_show_day_names) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=1) or else
                    (a_value=gtk_calendar_no_month_change) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=2) or else
                    (a_value=gtk_calendar_show_week_numbers) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=3) or else
                    (a_value=gtk_calendar_week_start_monday) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=4) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gtk_calendar_show_heading: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CALENDAR_SHOW_HEADING"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "<<"
         end

    0: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "0"
         end

    gtk_calendar_show_day_names: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CALENDAR_SHOW_DAY_NAMES"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "<<"
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    gtk_calendar_no_month_change: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CALENDAR_NO_MONTH_CHANGE"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "<<"
         end

    2: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "2"
         end

    gtk_calendar_show_week_numbers: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CALENDAR_SHOW_WEEK_NUMBERS"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "<<"
         end

    3: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "3"
         end

    gtk_calendar_week_start_monday: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "GTK_CALENDAR_WEEK_START_MONDAY"
         end

    =: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "="
         end

    1: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "<<"
         end

    4: INTEGER is
         external "C macro use <gtk/gtk.h>"
         alias "4"
         end

end -- class GTK_CALENDAR_DISPLAY_OPTIONS
