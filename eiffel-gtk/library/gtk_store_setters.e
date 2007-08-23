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
			set_value (an_iterator, a_column, a_value)
		end

	set_natural (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_natural: INTEGER) is
		require
			a_column_contains_a_natural: -- TODO
			valid_natural: a_natural >= 0
			valid_iterator: an_iterator/=Void
		do
			hidden_gvalue.turn_to_natural
			hidden_gvalue.set_natural(a_natural)
			set_value (an_iterator, a_column, a_value)
		end

	set_integer (an_iterator: GTK_TREE_ITER; a_column: INTEGER; an_integer: INTEGER) is
		require
			a_column_contains_a_integer: -- TODO
			valid_iterator: an_iterator/=Void
		do
			hidden_gvalue.turn_to_integer
			hidden_gvalue.set_integer(a_integer)
			set_value (an_iterator, a_column, a_value)
		end
	
	set_real (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_real: REAL) is
		require
			a_column_contains_a_double: -- TODO
			valid_iterator: an_iterator/=Void				
		do
			hidden_gvalue.turn_to_real
			hidden_gvalue.set_real(a_real)
			create a_value.from_real (a_real)
			set_value (an_iterator, a_column, a_value)
		end
	
	set_boolean (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_boolean: BOOLEAN) is
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_a_boolean: -- TODO
		do
			hidden_gvalue.turn_to_boolean
			hidden_gvalue.set_boolean(a_boolean)
			set_value (an_iterator, a_column, a_value)
		end

	set_object (an_iterator: GTK_TREE_ITER; a_column: INTEGER; an_object: G_OBJECT) is
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_an_object: -- TODO
		do
			hidden_gvalue.turn_to_object
			hidden_gvalue.set_object(an_object)
			set_value (an_iterator, a_column, a_value)
		end

	set_pointer (an_iterator: GTK_TREE_ITER; a_column: INTEGER; a_pointer: POINTER) is
		require
			valid_iterator: an_iterator/=Void
			a_column_contains_an_object: -- TODO
		do
			hidden_gvalue.turn_to_pointer
			hidden_gvalue.set_pointer(a_pointer)
			set_value (an_iterator, a_column, a_value)
		end

end -- class GTK_STORE_SETTERS
