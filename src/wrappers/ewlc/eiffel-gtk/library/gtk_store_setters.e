note
	description: "."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, 
					
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

deferred class GTK_STORE_SETTERS

insert
	ANY
		undefine
			copy,
			is_equal
		end

feature {ANY} -- Easy to use setters
	
	-- Note: wrapping gtk_list/tree_store_set is problematic since it's
	-- a variadic function but also its not-variadic variant
	-- (gtk_list_store_set_valist) is not easy to use from within
	-- ewg-wrapped libraries since currently it's not easy/possible to
	-- wrap va_list-using functions. Using the plain
	-- gtk_list_store_set_value can be an answer but I haven't checked
	-- its performance (2005-05-16 Paolo)

	set_string (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_string: STRING)
		require
			a_column_contains_a_string: -- TODO
			valid_iterator: an_iterator/=Void
		local a_value: G_VALUE
		do
			create a_value.from_string (a_string)
			set_value (an_iterator, a_column, a_value)
		end

	set_natural (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_natural: INTEGER)
		require
			a_column_contains_a_natural: -- TODO
			valid_natural: a_natural >= 0
			valid_iterator: an_iterator/=Void
		local a_value: G_VALUE
		do
			create a_value.from_natural (a_natural)
			set_value (an_iterator, a_column, a_value)
		end

	set_integer (an_iterator: GTK_TREE_ITER; a_column: INTEGER; an_integer: INTEGER)
		require
			a_column_contains_a_integer: -- TODO
			valid_iterator: an_iterator/=Void
		local a_value: G_VALUE
		do
			create a_value.from_integer (an_integer)
			set_value (an_iterator, a_column, a_value)
		end

	set_real (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_real: REAL)
		require
			a_column_contains_a_double: -- TODO
			valid_iterator: an_iterator/=Void
		local
			a_value: G_VALUE
		do
			create a_value.from_real (a_real)
			set_value (an_iterator, a_column, a_value)
		end

	set_boolean (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_boolean: BOOLEAN)
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_a_boolean: -- TODO
		local
			a_value: G_VALUE
		do
			create a_value.from_boolean (a_boolean)
			set_value (an_iterator, a_column, a_value)
		end

	set_object (an_iterator: GTK_TREE_ITER; a_column: INTEGER; an_object: G_OBJECT)
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_an_object: -- TODO
		local
			a_value: G_VALUE
		do
			create a_value.from_object (an_object)
			set_value (an_iterator, a_column, a_value)
		end

	set_pointer (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_pointer: POINTER)
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_an_object: -- TODO
		local
			a_value: G_VALUE
		do
			create a_value.from_pointer (a_pointer)
			set_value (an_iterator, a_column, a_value)
		end

feature {ANY} -- Generic setter
	set_value (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_value: G_VALUE)
		deferred
		end
end -- class GTK_STORE_SETTERS
