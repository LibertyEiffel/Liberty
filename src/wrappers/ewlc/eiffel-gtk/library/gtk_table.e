note
	description: "GtkTable -- Pack widgets in regular patterns."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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


class GTK_TABLE
	-- The GTK_TABLE functions allow the programmer to arrange widgets in
	-- rows and columns, making it easy to align many widgets next to each
	-- other, horizontally and vertically.
	
	-- Tables are created with a call to `make,' the size of which
	-- can later be changed with `resize'.

	-- Widgets can be added to a table using `attach' or the more
	-- convenient (but slightly less flexible) `attach_defaults'.

	-- To alter the space next to a specific row, use `set_row_spacing'
	-- and for a column, `set_col_spacing'.

	-- The gaps between all rows or columns can be changed by calling
	-- `set_row_spacings' or `set_col_spacings' respectively.

	-- `set_homogeneous', can be used to set whether all cells in the
	-- table will resize themselves to the size of the largest widget
	-- in the table.
	
	-- TODO: provide access to underlying data, as described here: The
	-- GTK_TABLE structure holds the data for the actual table itself.
	-- children is a G_LIST of all the widgets the table contains. rows
	-- and columns are pointers to GTK_TABLE_ROW_COL structures, which
	-- contain the default spacing and expansion details for the
	-- GtkTable's rows and columns, respectively.

	-- nrows and ncols are 16bit integers storing the number of rows and
	-- columns the table has.

	-- See Also: GTK_HBOX and GTK_VBOX  and for packing widgets 
	-- horizontally and vertically only.
	
	-- TODO: wrap read-only access to the content of children, rows and
	-- columns fields of the GtkTable C structure.

inherit GTK_CONTAINER -- rename make as make_c_struct end

-- TODO: GtkTable implements AtkImplementorIface interface

insert GTK_ATTACH_OPTIONS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (rows, columns: INTEGER; homogeneous: BOOLEAN)
			-- Used to create a new table widget. An initial size must be given by
			-- specifying how many rows and columns the table should have, although
			-- this can be changed later with `resize'. rows and columns must both
			-- be in the range 0 .. 65535.
		
			-- rows : The number of rows the new table should have.
		
			-- columns :     The number of columns the new table should have.
		
			-- homogeneous : If set to TRUE, all table cells are resized to the
			-- size of the cell containing the largest widget.

			-- Note: rows and columns shall be a NATURAL_16
		require
			gtk_initialized: gtk.is_initialized
			rows_fits_natural_16: rows.in_range (0,65535)
			columns_fits_natural_16: columns.in_range (0,65535)
		do
			handle :=gtk_table_new (rows, columns, homogeneous.to_integer)
			store_eiffel_wrapper
		end
	
feature {ANY}
	resize (rows, columns: INTEGER)
			-- If you need to change a table's size after it has been created, this
			-- function allows you to do so.

			-- rows : The new number of rows.
			-- columns : The new number of columns.
		require
			rows_fits_natural_16: rows.in_range (0,65535)
			columns_fits_natural_16: columns.in_range (0,65535)
		do
			gtk_table_resize (handle, rows, columns)
		end

	attach (a_child: GTK_WIDGET; left_attach, right_attach, top_attach, bottom_attach: INTEGER;
			  xoptions, yoptions: INTEGER; xpadding, ypadding: INTEGER)
			-- Adds a widget to a table. The number of 'cells' that a widget will
			-- occupy is specified by left_attach, right_attach, top_attach and
			-- bottom_attach. These each represent the leftmost, rightmost,
			-- uppermost and lowest column and row numbers of the table. (Columns
			-- and rows are indexed from zero).

			-- `a_child': The widget to add.
		
			-- `left_attach': the column number to attach the left side of a child
			-- widget to.

			-- `right_attach': the column number to attach the right side of a
			-- child widget to.

			-- `top_attach': the row number to attach the top of a child widget to.
			-- `bottom_attach': the row number to attach the bottom of a child
			-- widget to.

			-- `xoptions' : Used to specify the properties of the child widget when
			-- the table is resized.

			-- `yoptions': The same as xoptions, except this field determines
			-- behaviour of vertical resizing.

			-- `xpadding': An integer value specifying the padding on the left and
			-- right of the widget being added to the table.

			-- `ypadding': The amount of padding above and below the child widget.
		require
			valid_child: a_child /= Void
			valid_x_options: are_valid_attach_options(xoptions)
			valid_y_options: are_valid_attach_options(yoptions)
			left_attach_fits_natural_16: left_attach.in_range (0,65535)
			right_attach_fits_natural_16: right_attach.in_range (0,65535)
			top_attach_fits_natural_16: top_attach.in_range (0,65535)
			bottom_attach_fits_natural_16: bottom_attach.in_range (0,65535)
		do
			gtk_table_attach (handle, a_child.handle,
									left_attach, right_attach, top_attach, bottom_attach,
									xoptions, yoptions,
									xpadding, ypadding)
		end

	attach_defaults (a_child: GTK_WIDGET; left_attach, right_attach, top_attach, bottom_attach: INTEGER)
			-- As there are many options associated with `attach'), this
			-- convenience function provides the programmer with a means to add
			-- children to a table with identical padding and expansion
			-- options. The values used for the GtkAttachOptions are gtk_expand and
			-- gtk_fill, and the padding is set to 0.
		
			-- `a_child': The child widget to add.

			-- `left_attach': The column number to attach the left side of the
			-- child widget to.

			-- `right_attach': The column number to attach the right side of the
			-- child widget to.

			-- `top_attach': The row number to attach the top of the child widget
			-- to.

			-- `bottom_attach' : The row number to attach the bottom of the child
			-- widget to.
		require
			valid_child: a_child /= Void
			left_attach_fits_natural_16: left_attach.in_range (0,65535)
			right_attach_fits_natural_16: right_attach.in_range (0,65535)
			top_attach_fits_natural_16: top_attach.in_range (0,65535)
			bottom_attach_fits_natural_16: bottom_attach.in_range (0,65535)
		do
			gtk_table_attach_defaults  (handle, a_child.handle,
			left_attach, right_attach, top_attach, bottom_attach)
		end

	set_row_spacing (a_row, a_spacing: INTEGER)
			-- Changes the space between a given table row and its surrounding
			-- rows. `a_row': row number whose spacing will be
			-- changed. `a_spacing': number of pixels that the spacing should take
			-- up.
		require
			row_fits_natural_16: a_row.in_range (0,65535)
			spacing_fits_natural_16: a_spacing.in_range (0,65535)
		do
			gtk_table_set_row_spacing (handle, a_row, a_spacing)
		end

	set_col_spacing (a_column, a_spacing: INTEGER)
			-- Alters the amount of space between a given table column and the
			-- adjacent columns.

			-- `a_column' : the column whose spacing should be changed.
			-- `a_spacing' : number of pixels that the spacing should take up.
		require
			column_fits_natural_16: a_column.in_range (0,65535)
			spacing_fits_natural_16: a_spacing.in_range (0,65535)
		do
			gtk_table_set_col_spacing (handle, a_column, a_spacing)
		end

	set_row_spacings (a_spacing: INTEGER)
			-- Sets the space between every row in table equal to spacing.
		
			-- `a_spacing': the number of pixels of space to place between every
			-- row in the table.
		do
			gtk_table_set_row_spacings(handle, a_spacing)
		end

	set_col_spacings (a_spacing: INTEGER)
			-- Sets the space between every column in table equal to spacing.
		
			-- `a_spacing': the number of pixels of space to place between every
			-- column in the table.
		do
			gtk_table_set_col_spacings(handle, a_spacing)
		end
	
	set_homogeneous
			-- Ensure all table cells are the same size.
		do
			gtk_table_set_homogeneous (handle,1)
		ensure homogeneus: is_homogeneous
		end

	unset_homogeneous
			-- Allow table cells to have different sizes.
		do
			gtk_table_set_homogeneous (handle,0)
		ensure unhomogeneus: not is_homogeneous
		end

	default_row_spacing: INTEGER
			-- the default row spacing for the table. This is the spacing that will
			-- be used for newly added rows. (See `set_row_spacings').

			-- Note: should be NATURAL, perhaps even NATURAL_16, since it's a 
			-- guint constrained to be in 0..65535 interval
		do
			Result:=gtk_table_get_default_row_spacing (handle)
		ensure fits_natural_16: Result.in_range(0,65535)
		end

	is_homogeneous: BOOLEAN
			-- Are the table cells all constrained to the same width and height?
			-- (See `set_homogenous')
		do
			Result:=gtk_table_get_homogeneous(handle).to_boolean
		end

	
	row_spacing (a_row: INTEGER): INTEGER
			-- The amount of space between `a_row', and its next row. See
			-- `set_row_spacing'. 0 indicates the first row

			-- Note: both a_row and Result shall be NATURAL since they're
			-- guint. Perhaps `a_row' shall be even NATURAL_16, since it
			-- should fit 0.65535
		require row_fits_natural_16: a_row.in_range (0,65535)
		do
			Result:=gtk_table_get_row_spacing (handle, a_row)
		ensure positive: Result>=0
		end

	col_spacing  (a_column: INTEGER): INTEGER
			-- The amount of space between `a_column', and its next row. See
			-- `set_row_spacing'. 0 indicates the first column

			-- Note: both a_column and Result shall be NATURAL since they're
			-- guint. Perhaps `a_column' shall be even NATURAL_16, since it
			-- should fit 0.65535
		require row_fits_natural_16: a_column.in_range (0,65535)
		do
			Result:=gtk_table_get_row_spacing (handle, a_column)
		ensure positive: Result>=0
		end

	default_col_spacing: INTEGER
			-- The default column spacing for the table. This is the
			-- spacing that will be used for newly added columns. (See
			-- `set_col_spacings')
		do
			Result := gtk_table_get_default_col_spacing (handle)
		ensure positive: Result>=0
		end


-- Properties


--    "column-spacing"       guint                 : Read / Write
--    "homogeneous"          gboolean              : Read / Write
--    "n-columns"            guint                 : Read / Write
--    "n-rows"               guint                 : Read / Write
--    "row-spacing"          guint                 : Read / Write

-- Child Properties


--    "bottom-attach"        guint                 : Read / Write
--    "left-attach"          guint                 : Read / Write
--    "right-attach"         guint                 : Read / Write
--    "top-attach"           guint                 : Read / Write
--    "x-options"            GtkAttachOptions      : Read / Write
--    "x-padding"            guint                 : Read / Write
--    "y-options"            GtkAttachOptions      : Read / Write
--    "y-padding"            guint                 : Read / Write

-- Property Details

--   The "column-spacing" property

--    "column-spacing"       guint                 : Read / Write

--    The amount of space between two consecutive columns.

--    Default value: 0

--    --------------------------------------------------------------------------

--   The "homogeneous" property

--    "homogeneous"          gboolean              : Read / Write

--    If TRUE this means the table cells are all the same width/height.

--    Default value: FALSE

--    --------------------------------------------------------------------------

--   The "n-columns" property

--    "n-columns"            guint                 : Read / Write

--    The number of columns in the table.

--    Default value: 0

--    --------------------------------------------------------------------------

--   The "n-rows" property

--    "n-rows"               guint                 : Read / Write

--    The number of rows in the table.

--    Default value: 0

--    --------------------------------------------------------------------------

--   The "row-spacing" property

--    "row-spacing"          guint                 : Read / Write

--    The amount of space between two consecutive rows.

--    Default value: 0

-- Child Property Details

--   The "bottom-attach" child property

--    "bottom-attach"        guint                 : Read / Write

--    The row number to attach the bottom of the child to.

--    Allowed values: [1,65535]

--    Default value: 1

--    --------------------------------------------------------------------------

--   The "left-attach" child property

--    "left-attach"          guint                 : Read / Write

--    The column number to attach the left side of the child to.

--    Allowed values: <= 65535

--    Default value: 0

--    --------------------------------------------------------------------------

--   The "right-attach" child property

--    "right-attach"         guint                 : Read / Write

--    The column number to attach the right side of a child widget to.

--    Allowed values: [1,65535]

--    Default value: 1

--    --------------------------------------------------------------------------

--   The "top-attach" child property

--    "top-attach"           guint                 : Read / Write

--    The row number to attach the top of a child widget to.

--    Allowed values: <= 65535

--    Default value: 0

--    --------------------------------------------------------------------------

--   The "x-options" child property

--    "x-options"            GtkAttachOptions      : Read / Write

--    Options specifying the horizontal behaviour of the child.

--    Default value: GTK_EXPAND|GTK_FILL

--    --------------------------------------------------------------------------

--   The "x-padding" child property

--    "x-padding"            guint                 : Read / Write

--    Extra space to put between the child and its left and right neighbors, in
--    pixels.

--    Allowed values: <= 65535

--    Default value: 0

--    --------------------------------------------------------------------------

--   The "y-options" child property

--    "y-options"            GtkAttachOptions      : Read / Write

--    Options specifying the vertical behaviour of the child.

--    Default value: GTK_EXPAND|GTK_FILL

--    --------------------------------------------------------------------------

--   The "y-padding" child property

--    "y-padding"            guint                 : Read / Write

--    Extra space to put between the child and its upper and lower neighbors, in
--    pixels.

--    Allowed values: <= 65535

--    Default value: 0

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTable)"
		end

feature {} -- External calls
-- #include <gtk/gtk.h>
-- GtkTable;
-- GtkTableChild;
	-- GtkTableRowCol;
	gtk_table_new (rows,  columns, homogeneous: INTEGER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_table_resize (a_table: POINTER; rows, columns: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_table_attach (a_table, a_child: POINTER;
							left_attach, right_attach, top_attach, bottom_attach: INTEGER; -- Note  those all all guint, therefore should be NATURAL
							xoptions, yoptions: INTEGER; -- GtkAttachOptions
							xpadding, ypadding: INTEGER -- Note: these are guint, therefore should be NATURAL
							)
		external "C use <gtk/gtk.h>"
		end

	gtk_table_attach_defaults (a_table: POINTER; a_widget: POINTER;
										left_attach, right_attach,
										top_attach, bottom_attach: INTEGER -- Note: these are guint, therefore should be NATURAL
										)
		external "C use <gtk/gtk.h>"
		end

	gtk_table_set_row_spacing (a_table: POINTER;
										a_row, a_spacing: INTEGER; -- shall be NATURAL, since they are guint
										)
		external "C use <gtk/gtk.h>"
		end

	gtk_table_set_col_spacing (a_table: POINTER;
										a_column, spacing: INTEGER; -- shall be NATURAL, since it's guint
										)
		external "C use <gtk/gtk.h>"
		end

	gtk_table_set_row_spacings (a_table: POINTER;
										 a_spacing: INTEGER; -- shall be NATURAL, since it's guint
										 )
		external "C use <gtk/gtk.h>"
		end
	
	gtk_table_set_col_spacings (a_table: POINTER;
										 a_spacing: INTEGER; -- shall be NATURAL, since it's guint
										 )
		external "C use <gtk/gtk.h>"
		end

	gtk_table_set_homogeneous (a_table: POINTER;
										homogeneous: INTEGER -- gboolean
										)
		external "C use <gtk/gtk.h>"
		end

	gtk_table_get_default_row_spacing (a_table: POINTER): INTEGER is -- guint 
		external "C use <gtk/gtk.h>"
		end

	gtk_table_get_homogeneous (a_table: POINTER): INTEGER is -- gboolean 
		external "C use <gtk/gtk.h>"
		end

	gtk_table_get_row_spacing (a_table: POINTER;
										a_row: INTEGER; -- shall be NATURAL, since it's guint
										): INTEGER is -- guint 
		external "C use <gtk/gtk.h>"
		end
	
	gtk_table_get_col_spacing (a_table: POINTER;
										a_column: INTEGER; -- shall be NATURAL, since it's guint
										): INTEGER is -- guint 
		external "C use <gtk/gtk.h>"
		end

	gtk_table_get_default_col_spacing (a_table: POINTER): INTEGER is -- guint 
		external "C use <gtk/gtk.h>"
		end
end
