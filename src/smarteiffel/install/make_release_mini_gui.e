-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MAKE_RELEASE_MINI_GUI

inherit
   MAKE_RELEASE_GUI
      redefine
         info, warning, error, fatal
      end
   JOB

insert
   NCURSES_TOOLS
   NCURSES_COLORS

creation {MAKE_RELEASE}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      local
         t: TIME_EVENTS
      do
         sedb_breakpoint
         events.expect(t.timeout(0))
         if process /= Void and then not process.is_finished then
            events.expect(process.output.event_can_read)
            events.expect(process.error.event_can_read)
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         sedb_breakpoint
         if process = Void or else process.is_finished then
            has_output := False
            has_error := False
            Result := True
         else
            has_output := events.event_expected(process.output.event_can_read)
               and then events.event_occurred(process.output.event_can_read)
            has_error := events.event_expected(process.error.event_can_read)
               and then events.event_occurred(process.error.event_can_read)
            Result := has_output or else has_error
         end
      end

   continue is
      do
         sedb_breakpoint
         if has_output then
            process.output.read_line
            command_output.set_text(process.output.last_string)
         end
         if has_error then
            process.error.read_line
            command_output.set_text(process.error.last_string)
         end
         done := process = Void or else process.is_finished
         if done then
            ncurses.disable
         end
      end

   done: BOOLEAN

   restart is
      do
         check
            process /= Void
         end
         done := False
      end

feature {}
   process: PROCESS
   has_output: BOOLEAN
   has_error: BOOLEAN

feature {MAKE_RELEASE, MAKE_RELEASE_JOB}
   start (job: MAKE_RELEASE_JOB) is
      do
         ncurses.add_job(job)
         ncurses.start
         die(0)
      end

   set_title (a_message: STRING) is
      do
         root_window.put_string_at(a_message, 0, 0)
         progress_bar.hide
      end

   set_action (a_message: STRING) is
      do
         action_label.set_text(a_message)
         progress_bar.hide
      end

   set_progress (a_value, a_max: INTEGER; a_message: STRING) is
      do
         progress_bar.set_value(a_value * 30 // a_max)
         progress_label.set_text(a_message)
         progress_bar.show
      end

   die (death_code: INTEGER) is
      do
         from
            ncurses.disable
         until
            not ncurses.is_enabled
         loop
            ncurses.disable
         end
         die_with_code(death_code)
      end

   run_command (a_command: STRING): INTEGER is
      local
         pf: PROCESS_FACTORY
      do
         check
            process = Void
         end
         pf.set_direct_input(False)
         pf.set_direct_output(False)
         pf.set_direct_error(False)
         command_output.set_text(a_command)
         process := pf.execute_command_line(a_command)
         ncurses.enable
         ncurses.add_job(Current)
         ncurses.start
         process.wait
         Result := process.status
         process := Void
      end

   info (a_message: STRING) is
      do
         log_label.set_foreground_color(green_color)
         log_label.set_text(a_message)
      end

   warning (a_message: STRING) is
      do
         log_label.set_foreground_color(yellow_color)
         log_label.set_text(a_message)
      end

   error (a_message: STRING) is
      do
         log_label.set_foreground_color(red_color)
         log_label.set_text(a_message)
      end

   fatal (a_message: STRING; death_code: INTEGER) is
      do
         log_label.set_foreground_color(red_color)
         log_label.set_text(a_message)
         die(death_code)
      end

feature {}
   make is
      do
         ncurses.enable
         ncurses.set_cursor_visibility(default_visible_cursor_mode)
         ncurses.set_echoing_policy(False)
         root_window := ncurses.get_root_window
         create progress_bar.make(root_window, 0, 6, progress_bar_width, 0, progress_bar_width)
         progress_bar.hide
         progress_bar.set_colors(yellow_color, blue_color)
         progress_bar.display_value(True)
         create action_label.make(root_window, once "", 0, 3, root_window.width, 1)
         create progress_label.make(root_window, once "", progress_bar_width + 1, 6,
                                    root_window.width - progress_bar_width - 2, 1)
         create command_output.make(root_window, once "", 0, 10, root_window.width, 1)
         create log_label.make(root_window, once "", 0, 15, root_window.width, 1)
      end

   root_window: NCURSES_WINDOW
   action_label: NCURSES_LABEL
   progress_label: NCURSES_LABEL
   progress_bar: NCURSES_PROGRESSBAR
   command_output: NCURSES_LABEL
   log_label: NCURSES_LABEL

   progress_bar_width: INTEGER is 30

end -- class MAKE_RELEASE_MINI_GUI
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
