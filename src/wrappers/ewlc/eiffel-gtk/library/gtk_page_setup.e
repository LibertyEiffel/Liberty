note
	description: "GtkPageSetup stores page setup information."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_PAGE_SETUP
	-- A GtkPageSetup object stores the page size, orientation and
	-- margins. The idea is that you can get one of these from the page
	-- setup dialog and then pass it to the GtkPrintOperation when
	-- printing. The benefit of splitting this out of the
	-- GtkPrintSettings is that these affect the actual layout of the
	-- page, and thus need to be set long before user prints.
	
	-- The margins specified in this object are the "print margins",
	-- i.e. the parts of the page that the printer cannot print
	-- on. These are different from the layout margins that a word
	-- processor uses; they are typically used to determine the minimal
	-- size for the layout margins.

	-- To obtain a GtkPageSetup use gtk_page_setup_new() to get the
	-- defaults, or use gtk_print_run_page_setup_dialog() to show the
	-- page setup dialog and receive the resulting page setup.

	--   Example 3. A page setup dialog

	-- static GtkPrintSettings *settings = NULL;
	-- static GtkPageSetup *page_setup = NULL;
	--
	-- static void
	-- do_page_setup (void)
	-- {
	--   GtkPageSetup *new_page_setup;
	--
	--   if (settings == NULL)
	--     settings = gtk_print_settings_new ();
	--
	--   new_page_setup = gtk_print_run_page_setup_dialog (GTK_WINDOW (main_window),
	--                                                     page_setup, settings);
	--
	--   if (page_setup)
	--     g_object_unref (page_setup);
	--
	--   page_setup = new_page_setup;
	-- }

	--   Printing support was added in GTK+ 2.10.

inherit
	G_OBJECT
		redefine copy end

insert 
	GTK_PAGE_SETUP_EXTERNALS
	GTK_PAGE_ORIENTATION

create {ANY} make, copy, from_external_pointer

feature {} -- Creation
	make
			--   Creates a new GtkPageSetup.
		do
			from_external_pointer(gtk_page_setup_new)
		end
	
feature {ANY} -- Copying
	copy (another: GTK_PAGE_SETUP)
			--   Copies a GtkPageSetup.
		do
			from_external_pointer(gtk_page_setup_copy(another.handle))
		end

feature {ANY} -- Queries
	orientation: INTEGER
			-- The page orientation of the GtkPageSetup.
		do
			Result:=gtk_page_setup_get_orientation(handle)
		ensure valid: is_valid_gtk_page_orientation(Result)
		end

	paper_size: GTK_PAPER_SIZE
			-- The paper size of the GtkPageSetup.
		do
			create Result.from_external_pointer
			(gtk_page_setup_get_paper_size(handle))
		end

	unit: INTEGER -- The unit used for margins

	top_margin: REAL
			-- the top margin.
		do
			Result:=gtk_page_setup_get_top_margin(handle,unit)
		end

	bottom_margin: REAL
			-- the bottom margin.
		do
			Result:=gtk_page_setup_get_bottom_margin(handle,unit)
		end

	left_margin: REAL
			-- The left margin.
		do
			Result:=gtk_page_setup_get_left_margin (handle, unit)
		end

	right_margin: REAL
			-- The right margin.
		do
			Result:=gtk_page_setup_get_right_margin (handle, unit)
		end

	paper_width: REAL
			-- The paper width (expressed in `unit').

			-- Note that this feature takes orientation, but not margins
			-- into consideration. See `page_width'.
		do
			Result:=gtk_page_setup_get_paper_width(handle, unit)
		end

	paper_height: REAL
			-- The paper height unit.

			-- Note that this function takes orientation, but not margins
			-- into consideration. See `page_height'.
		do
			Result:=gtk_page_setup_get_paper_height (handle,unit)
		end

	page_width: REAL
			-- The page width.

			-- Note that this function takes orientation and margins into
			-- consideration.  See `paper_width'.
		do
			Result:=gtk_page_setup_get_page_width(handle,unit)
		end	

	page_height: REAL
			-- The page height.
			
			-- Note that this function takes orientation and margins into
			-- consideration.  See `paper_height'.
		do
			Result:=gtk_page_setup_get_page_height(handle, unit)
		end	

feature {ANY} -- Setters
	set_orientation (an_orientation: INTEGER)
			--   Sets the page orientation of the GtkPageSetup.
		require valid: is_valid_gtk_page_orientation(an_orientation)
		do
			gtk_page_setup_set_orientation (handle, an_orientation)
		end
	
	set_paper_size (a_paper_size: GTK_PAPER_SIZE)
			-- Sets the paper size of the GtkPageSetup without changing
			-- the margins. See `set_paper_size_and_default_margins'.
		require size_not_void: a_paper_size /= Void
		do
			gtk_page_setup_set_paper_size (handle, a_paper_size.handle)
		end

	set_unit (a_unit: INTEGER)
			-- Use `a_unit' as the unit used to express margins
		require valid_unit: is_valid_gtk_unit(a_unit)
		do
			unit := a_unit
		end

	set_top_margin (a_margin: REAL)
			--   Sets the top margin of the GtkPageSetup to `a_margin'.
		do
			gtk_page_setup_set_top_margin(handle,a_margin, unit)
		ensure set: a_margin=top_margin
		end
	
	set_bottom_margin (a_margin: REAL)
			-- Sets the bottom margin of the GtkPageSetup to `a_margin',
			-- expressed in `unit'.
		do
			gtk_page_setup_set_bottom_margin(handle, a_margin, unit)
		end

	set_left_margin (a_margin: REAL)
			-- Sets the left margin of the GtkPageSetup to `a_margin',
			-- expressed in `unit'.
		do
			gtk_page_setup_set_left_margin  (handle, a_margin, unit)
		end

	set_right_margin (a_margin: REAL)
			--   Sets the right margin of the GtkPageSetup.
		do
			gtk_page_setup_set_right_margin (handle, a_margin, unit)
		end

	set_paper_size_and_default_margins (a_size: GTK_PAPER_SIZE)
			-- Sets the paper size of the GtkPageSetup and modifies the
			-- margins according to `a_size'.
		require size_not_void: a_size /= Void
		do
			gtk_page_setup_set_paper_size_and_default_margins(handle,a_size.handle)
		end
end -- class GTK_PAGE_SETUP
