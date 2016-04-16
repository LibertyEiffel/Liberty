note
	description: "GtkFileFilter - used to restrict the files shown in a GtkFileChoose."
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

class GTK_FILE_FILTER
	-- A GtkFileFilter can be used to restrict the files being shown in
	-- a GtkFileChooser. Files can be filtered based on their name
	-- (with `add_pattern'), on their mime type (with `add_mime_type'),
	-- or by a custom filter function (with TODO: `add_custom').

	-- Filtering by mime types handles aliasing and subclassing of mime
	-- types; e.g. a filter for text/plain also matches a file with
	-- mime type application/rtf, since application/rtf is a subclass
	-- of text/plain. Note that GtkFileFilter allows wildcards for the
	-- subtype of a mime type, so you can e.g. filter for image/*.

	-- Normally, filters are used by adding them to a GtkFileChooser,
	-- see GTK_FILE_CHOOSER's `add_filter', but it is also possible to
	-- manually use a filter on a file with (TODO) `filter'.

inherit
	GTK_OBJECT

insert
	GTK_FILE_FILTER_EXTERNALS
	GTK_FILE_FILTER_INFO_EXTERNALS
	GTK_FILE_FILTER_FLAGS

create {ANY} make, with_pattern, with_mime_type, from_external_pointer

feature {} -- Creation
	make is
			-- Creates a new GtkFileFilter with no rules added to
			-- it. Such a filter doesn't accept any files, so is not
			-- particularly useful until you add rules with
			-- `add_mime_type', `add_pattern', or `add_custom'. To create
			-- a filter that accepts any file, use:
			-- create a_filter.make; a_filter.add_pattern ("*")
		
			-- See also `with_pattern', `with_mime_type'
		do
			from_external_pointer (gtk_file_filter_new)
		end

	with_pattern  (a_pattern: STRING) is
			-- Creates a new GtkFileFilter with `a_pattern' rule.
		require pattern_not_void: a_pattern /= Void
		do
			make; add_pattern (a_pattern)
		end

	with_mime_type(a_mime_type: STRING) is
			-- Creates a new GtkFileFilter with `a_mime_type' rule
		require valid_mime_type: a_mime_type /= Void
		do
			make; add_mime_type(a_mime_type)
		end
	
feature {ANY} -- Filter name
	set_name (a_name: STRING) is
			-- Sets the human-readable name of the filter; this is the
			-- string that will be displayed in the file selector user
			-- interface if there is a selectable list of filters.
		require a_name /= Void
		do
			gtk_file_filter_set_name (handle, a_name.to_external)
		end

	unset_name is
			-- Remove any human-readable name of the filter, the string
			-- that will be displayed in the file selector user interface
			-- if there is a selectable list of filters.
		do
			gtk_file_filter_set_name (handle, default_pointer)
		end

	name: STRING is
			-- The human-readable name for the filter. See `set_name'.
		local cstr: POINTER
		do
			cstr := gtk_file_filter_get_name (handle)
			-- Returns : The human-readable name of the filter, or
			-- NULL. This value is owned by GTK+ and must not be modified
			-- or freed.
			if cstr.is_not_null
			then create Result.from_external_copy (cstr)
			end
		end
			

feature {ANY} -- Mime type filter
	add_mime_type (a_mime_type: STRING) is
			-- Adds a rule allowing the given `a_mime_type' to filter.
		require valid_mime_type: a_mime_type /= Void
		do
			gtk_file_filter_add_mime_type   (handle, a_mime_type.to_external)
		end

feature {ANY} -- Pattern filter
	add_pattern (a_pattern: STRING) is
			-- Adds a rule allowing a shell style glob to a filter.
		require pattern_not_void: a_pattern /= Void
		do
			gtk_file_filter_add_pattern     (handle, a_pattern.to_external)
		end

feature {ANY} -- Image filter
	add_pixbuf_formats is
			-- Adds a rule allowing image files in the formats supported by GdkPixbuf.
		do
			gtk_file_filter_add_pixbuf_formats (handle)
		end
	

	-- TODO: gtk_file_filter_add_custom ()

-- void        gtk_file_filter_add_custom      (GtkFileFilter *filter,
-- 															GtkFileFilterFlags needed,
-- 															GtkFileFilterFunc func,
-- 															gpointer data,
-- 															GDestroyNotify notify);

-- Adds rule to a filter that allows files based on a custom callback function. The bitfield needed which is passed in provides information about what sorts of information that the filter function needs; this allows GTK+ to avoid retrieving expensive information when it isn't needed by the filter.

-- filter : 	a GtkFileFilter
-- needed : 	bitfield of flags indicating the information that the custom filter function needs.
-- func : 	callback function; if the function returns TRUE, then the file will be displayed.
-- data : 	data to pass to func
-- notify : 	function to call to free data when it is no longer needed.

-- Since 2.4

	-- TODO gtk_file_filter_get_needed ()

-- GtkFileFilterFlags gtk_file_filter_get_needed
-- 														  (GtkFileFilter *filter);

-- Gets the fields that need to be filled in for the structure passed to gtk_file_filter_filter()

-- This function will not typically be used by applications; it is intended principally for use in the implementation of GtkFileChooser.

-- filter : 	a GtkFileFilter
-- Returns : 	bitfield of flags indicating needed fields when calling gtk_file_filter_filter()

-- Since 2.4
-- gtk_file_filter_filter ()

-- gboolean    gtk_file_filter_filter          (GtkFileFilter *filter,
-- 															const GtkFileFilterInfo *filter_info);

-- Tests whether a file should be displayed according to filter. The GtkFileFilterInfo structure filter_info should include the fields returned from gtk_file_filter_get_needed().

-- This function will not typically be used by applications; it is intended principally for use in the implementation of GtkFileChooser.

-- filter : 	a GtkFileFilter
-- filter_info : 	a GtkFileFilterInfo structure containing information about a file.
-- Returns : 	TRUE if the file should be displayed
feature {ANY}
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFileFilter)"
		end
end
