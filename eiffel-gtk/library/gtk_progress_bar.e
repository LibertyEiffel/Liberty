indexing
	description: "GtkProgressBar — A widget which indicates progress visually"
	copyright: "(C) 2006 Nicolas Fafchamps <nicolas.fafchamps@gmail.com> and Others"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GTK_PROGRESS_BAR

inherit GTK_BIN redefine make end
insert GTK_PROGRESS_BAR_EXTERNALS
	
creation
	make
	
feature {NONE} -- Initialization

	make is
			-- Create a new GtkProgressBar.
		do
			handle := gtk_progress_bar_new
			store_eiffel_wrapper
		end

feature -- Element change
	pulse is
			-- Move the bar with `pulse_step'.
		do
			gtk_progress_bar_pulse(handle)
		end

feature -- Status setting
	set_text (a_text : STRING) is
			-- Set the text to appear superimposed on the progress bar.
		require 
			valid_text: a_text/=Void
		do
			gtk_progress_bar_set_text(handle,a_text.to_external)
		end

	set_fraction (a_fraction : REAL) is
			-- Cause the progress bar to "fill in" the given fraction of the bar.
		require 
			valid_fraction: a_fraction >= 0 and a_fraction <= 1
		do
			gtk_progress_bar_set_fraction(handle,a_fraction)
		end	

	set_pulse_step (a_fraction : REAL) is
			-- Sets the fraction of total progress bar length to move the bouncing block for each call to `pulse'.
		require 
			valid_fraction: a_fraction >= 0 and a_fraction <= 1
		do
			gtk_progress_bar_set_pulse_step(handle,a_fraction)
		end

	-- Todo : gtk_progress_bar_set_orientation
	-- Todo : gtk_progress_bar_set_ellipsize

feature -- Status report
	text : STRING is
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

	fraction : REAL is
			-- Current fraction of the task that's been completed
		do
			Result := gtk_progress_bar_get_fraction (handle)
		end

	-- Todo : gtk_progress_bar_get_orientation ()
	-- Todo : gtk_progress_bar_get_ellipsize ()

	-- Todo : Properties

	-- Note : Other functions are deprecated

end

	
