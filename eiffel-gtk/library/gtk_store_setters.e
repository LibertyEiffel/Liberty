indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, 
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class GTK_STORE_SETTERS
	-- Easy to use store setters

	-- Note: wrapping gtk_list/tree_store_set is problematic since it's
	-- a variadic function but also its not-variadic variant
	-- (gtk_list_store_set_valist) is not easy to use from within
	-- ewg-wrapped libraries since currently it's not easy/possible to
	-- wrap va_list-using functions. Using the plain
	-- gtk_list_store_set_value can be an answer but I haven't checked
	-- its performance (2005-05-16 Paolo)

inherit G_OBJECT
	
feature -- Store setters
	set_string (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_string: STRING) is
		require
			a_column_contains_a_string: -- TODO
			valid_iterator: an_iterator/=Void
		do
			hidden_gvalue.turn_to_string
			hidden_gvalue.set_string(a_string)
			set_value (an_iterator, a_column, hidden_gvalue)
		end

	set_natural (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_natural: INTEGER) is
		require
			a_column_contains_a_natural: -- TODO
			valid_natural: a_natural >= 0
			valid_iterator: an_iterator/=Void
		do
			hidden_gvalue.turn_to_natural
			hidden_gvalue.set_natural(a_natural)
			set_value (an_iterator, a_column, hidden_gvalue)
		end

	set_integer (an_iterator: GTK_TREE_ITER; a_column: INTEGER; an_integer: INTEGER) is
		require
			a_column_contains_a_integer: -- TODO
			valid_iterator: an_iterator/=Void
		do
			hidden_gvalue.turn_to_integer
			hidden_gvalue.set_integer(an_integer)
			set_value (an_iterator, a_column, hidden_gvalue)
		end

	set_real (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_real: REAL) is
		require
			a_column_contains_a_double: -- TODO
			valid_iterator: an_iterator/=Void
		do
			hidden_gvalue.turn_to_real
			hidden_gvalue.set_real(a_real)
			set_value (an_iterator, a_column, hidden_gvalue)
		end

	set_boolean (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_boolean: BOOLEAN) is
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_a_boolean: -- TODO
		do
			hidden_gvalue.turn_to_boolean
			hidden_gvalue.set_boolean(a_boolean)
			set_value (an_iterator, a_column, hidden_gvalue)
		end

	set_object (an_iterator: GTK_TREE_ITER; a_column: INTEGER; an_object: G_OBJECT) is
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_an_object: -- TODO
		do
			hidden_gvalue.turn_to_object
			hidden_gvalue.set_object(an_object)
			set_value (an_iterator, a_column, hidden_gvalue)
		end

	set_pointer (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_pointer: POINTER) is
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_an_object: -- TODO
		do
			hidden_gvalue.turn_to_pointer
			hidden_gvalue.set_pointer(a_pointer)
			set_value (an_iterator, a_column, hidden_gvalue)
		end

feature -- Generic queries and commands
	columns_count: INTEGER is
			-- the number of columns supported by tree_model.
		deferred
		end

	column_type (a_column_number: INTEGER): like g_type is
			-- the type of the column; it is a G_TYPE integer
		require valid_column_number: a_column_number.in_range (0,columns_count)
		deferred 
		end
	
	value (an_iterator: GTK_TREE_ITER; a_column: INTEGER): G_VALUE is
		deferred
		end

	set_value (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_value: G_VALUE) is
			-- Sets the data in the cell specified by `an_iterator' and
			-- `a_column'. The type of `a_value' must be convertible to
			-- the type of the column.
		
			-- `an_iterator': A valid GtkTreeIter for the row being modified
			-- `a_column' : column number to modify
			-- `a_value' : new value for the cell
		require
			valid_iterator: an_iterator/=Void
			valid_value: a_value /= Void -- and then Eiffelize "The type of
			-- `a_value' must be convertible to the type of the column."
		deferred
		ensure
			-- TODO: G_VALUE.is_equal is not good enough to use this:
			-- value_set: a_value.is_equal (value (an_iterator,a_column))
		end
	
end -- class GTK_STORE_SETTERS
