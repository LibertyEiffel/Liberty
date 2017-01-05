note
	description: "Resource Files -- Routines for handling resource files"
	copyright: "[
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

expanded class GTK_RC

insert
	ANY
	GTK_RC_EXTERNALS

feature {ANY} -- Operations

	parse (a_filename: STRING)
		require
			a_filename /= Void
		do
			gtk_rc_parse (a_filename.to_external)
		end

	default_files: ARRAY [STRING]
		local
			native_array: NATIVE_ARRAY [POINTER]
			i: INTEGER
		do
			create native_array.default_create
			native_array := native_array.from_pointer (gtk_rc_get_default_files)
			create Result.make (1,0)
			from i := 0 until native_array.item (i).is_null loop
				Result.add_last (create {STRING}.from_external_copy (native_array.item (i)))
				i := i + 1
			end
		end

	set_default_files (some_default_files: ARRAY [STRING])
		require
			some_default_files /= Void
		local
			pointers: ARRAY [POINTER]
			iter: ITERATOR [STRING]
		do
			create pointers.make (1,0)
			from iter := some_default_files.get_new_iterator
			until iter.is_off
			loop
				pointers.add_last (iter.item.to_external)
			end
			pointers.add_last (default_pointer)
			gtk_rc_set_default_files (pointers.to_external)
		end

end -- class GTK_RC
