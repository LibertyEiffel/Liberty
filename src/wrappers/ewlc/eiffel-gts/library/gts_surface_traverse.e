note
	description: "Iterator over surface."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class GTS_SURFACE_TRAVERSE

inherit
	ITERATOR[GTS_FACE] undefine copy, is_equal end
	C_STRUCT redefine dispose end
	
insert GTS_SURFACE_TRAVERSE_EXTERNALS

create {ANY}  make, from_face, from_external_pointer

feature {} -- Creation
	make (a_surface: GTS_SURFACE)
			-- Creates a new GTS_SURFACE_TRAVERSE, initialized to start traversing
			-- `a_surface'.
		require surface_not_void: a_surface /= Void
		do
			-- Note: from actual usage (found with google code search) it seems
			-- that it is valid to pass NULL as face.
			from_external_pointer(gts_surface_traverse_new
										 (a_surface.handle,
										  default_pointer -- a GtsFace belonging to s.
										  ))
		end

	from_face (a_surface: GTS_SURFACE; a_face: GTS_FACE)
			-- Creates a new GTS_SURFACE_TRAVERSE, initialized to start traversing
			-- from `a_face' of `a_surface'.
		require
			surface_not_void: a_surface /= Void
			face_not_void: a_face /= Void
			-- TODO: face_belongs_to_surface: a_surface.has(a_face)
		do
			from_external_pointer(gts_surface_traverse_new(a_surface.handle,a_face.handle))
		end

feature {ANY}
	start
		do
			next
		end
	
	is_off: BOOLEAN
		do
			Result:=(item=Void)
		end

	item: GTS_FACE 
	
	next
		local item_ptr: POINTER
		do
			item_ptr:=gts_surface_traverse_next(handle,$level)
			-- gts_surface_traverse_next returns the next face of the traversal in
			-- breadth-first order or NULL if no faces are left. If level if not
			-- NULL, it is filled with the level of the returned face (0 for the
			-- initial face, 1 for its neighbors and so on).
			if item_ptr.is_not_null
			 then	create item.from_external_pointer(item_ptr)
			else item:=Void
			end
		end

	level: INTEGER
			-- the level of `item' face; 0 for the initial face, 1 for its
			-- neighbors and so on
	
	dispose
		do
			gts_surface_traverse_destroy(handle)
		end
end -- class GTS_SURFACE_TRAVERSE
