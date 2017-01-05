note
	description: "GtkProgressBar: A widget which indicates progress visually"
	copyright: "[
					Copyright (C) 2006-2017: Nicolas Fafchamps <nicolas.fafchamps@gmail-com
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
	copyright: "(C) 2006 Nicolas Fafchamps <nicolas.fafchamps@gmail.com> and Others"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GTK_PROGRESS_BAR
	-- the GtkProgressBar is typically used to display the progress of
	-- a long running operation. It provides a visual clue that
	-- processing is underway. The GtkProgressBar can be used in two
	-- different modes: percentage mode and activity mode.
	
	-- When an application can determine how much work needs to take
	-- place (e.g. read a fixed number of bytes from a file) and can
	-- monitor its progress, it can use the GtkProgressBar in
	-- percentage mode and the user sees a growing bar indicating the
	-- percentage of the work that has been completed. In this mode,
	-- the application is required to call `set_fraction' periodically
	-- to update the progress bar.

	-- When an application has no accurate way of knowing the amount of
	-- work to do, it can use the GtkProgressBar in activity mode,
	-- which shows activity by a block moving back and forth within the
	-- progress area. In this mode, the application is required to call
	-- `pulse' perodically to update the progress bar.

	-- There is quite a bit of flexibility provided to control the
	-- appearance of the GtkProgressBar. Functions are provided to
	-- control the orientation of the bar, optional text can be
	-- displayed along with the bar, and the step size used in activity
	-- mode can be set.

inherit GTK_BIN

insert
	GTK_PROGRESS_BAR_EXTERNALS
	GTK_PROGRESS_BAR_ORIENTATION
	PANGO_ELLIPSIZE_MODE
	
create {ANY}
	make, from_external_pointer

feature {} -- Initialization

	make
			-- Create a new GtkProgressBar.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_progress_bar_new) 
		end

feature {ANY} -- Element change
	pulse
			-- Move the bar with `pulse_step'.
		do
			gtk_progress_bar_pulse(handle)
		end

feature {ANY} -- Status setting
	set_text (a_text : STRING)
			-- Set the text to appear superimposed on the progress bar.
		require
			valid_text: a_text/=Void
		do
			gtk_progress_bar_set_text(handle,a_text.to_external)
		end

	set_fraction (a_fraction : REAL)
			-- Cause the progress bar to "fill in" the given fraction of the bar.
		require
			valid_fraction: a_fraction >= 0 and a_fraction <= 1
		do
			gtk_progress_bar_set_fraction(handle,a_fraction)
		end

	set_pulse_step (a_fraction : REAL)
			-- Sets the fraction of total progress bar length to move the bouncing block for each call to `pulse'.
		require
			valid_fraction: a_fraction >= 0 and a_fraction <= 1
		do
			gtk_progress_bar_set_pulse_step(handle,a_fraction)
		end

	set_orientation (an_orientation: INTEGER)
			-- Causes the progress bar to switch to a different
			-- orientation (left-to-right, right-to-left, top-to-bottom,
			-- or bottom-to-top).
		require valid_orientation: is_valid_gtk_progress_bar_orientation (an_orientation)
		do
			gtk_progress_bar_set_orientation (handle, an_orientation)
		end

	set_ellipsize (a_mode: INTEGER)
			-- Sets the mode used to ellipsize (add an ellipsis: "...")
			-- the text if there is not enough space to render the entire
			-- string.
		require is_valid_ellipsize_mode: is_valid_pango_ellipsize_mode(a_mode)
		do
			gtk_progress_bar_set_ellipsize (handle, a_mode)
		end

feature {ANY} -- Status report
	text : STRING
			-- Text displayed superimposed on the progress bar.
		local ptr: POINTER
		do
			ptr:=gtk_progress_bar_get_text(handle)
			if ptr.is_not_null then
				create Result.from_external_copy (ptr)
			else
				Result := Void
			end
		end

	fraction: REAL
			-- Current fraction of the task that's been completed
		do
			Result := gtk_progress_bar_get_fraction (handle)
		end

	orientation: INTEGER
			-- the current progress bar orientation
		do
			Result:=gtk_progress_bar_get_orientation(handle)
		ensure valid_progress_bar_orientation:
			is_valid_gtk_progress_bar_orientation (Result)
		end

	ellipsize_mode: INTEGER
			-- the ellipsizing position of the progressbar. See `set_ellipsize'
		do
			Result := gtk_progress_bar_get_ellipsize (handle)
		ensure valid_ellipsize_mode: is_valid_pango_ellipsize_mode(Result)
		end

	pulse_step: REAL
			-- The fraction of total progress to move the bouncing block
			-- when pulsed.
		do
			invoke_get_property (pulse_step_property.owner_class,	handle,
										pulse_step_property.param_id, pulse_step_gvalue.handle,
										pulse_step_property.handle)
			Result := pulse_step_gvalue.real
		ensure valid: Result.in_range(0.0, 1.0)
		end
	
	-- Note : Other functions are deprecated

feature {} -- Properties implementation
	pulse_step_label: STRING is "pulse-step"
							
	pulse_step_property: G_PARAM_SPEC
		once
			Result := find_property(pulse_step_label)
		end

	pulse_step_gvalue: G_VALUE
		once
			create Result.with_gtype (pulse_step_property.value_gtype)
		ensure not_void: Result /= Void
		end
	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkProgressBar)"
		end
end
