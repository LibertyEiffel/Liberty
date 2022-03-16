note
	description: "Points-related features."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli,  1999 St<E9>phane Popinet
					
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

deferred class GTS_POINTS_FUNCTIONS
	
inherit WRAPPER_HANDLER 

insert GTS_POINT_EXTERNALS

feature {ANY} 
	orientation (p1,p2,p3: GTS_POINT): REAL
			-- Checks for orientation of the projection of three points
			-- on the (x,y) plane. The result is an approximation of
			-- twice the signed area of the triangle defined by the three
			-- points. This function uses adaptive floating point
			-- arithmetic and is consequently geometrically robust.

			-- It is positive value if p1, p2 and p3 appear in
			-- counterclockwise order, a negative value if they appear in
			-- clockwise order and zero if they are colinear.
		require 
			p1_not_void: p1 /= Void
			p2_not_void: p2 /= Void
			p3_not_void: p3 /= Void
		do
			Result := gts_point_orientation (p1.handle, p2.handle, p3.handle)
		end

	orientation_sos (p1,p2,p3: GTS_POINT): INTEGER
			-- Checks for orientation of the projection of three points
			-- on the (x,y) plane.
		
			-- Simulation of Simplicity (SoS) is used to break ties when
			-- the orientation is degenerate (i.e. p3 lies on the line
			-- defined by p1 and p2).
		
			-- It is a positive value if p1, p2 and p3 appear in
			-- counterclockwise order or a negative value if they appear
			-- in clockwise order.
		require 
			p1_not_void: p1 /= Void
			p2_not_void: p2 /= Void
			p3_not_void: p3 /= Void
		do
			Result := gts_point_orientation_sos (p1.handle, p2.handle, p3.handle)
		end


--   gts_point_orientation_sos ()

--  gint        gts_point_orientation_sos       (GtsPoint *p1,
--                                               GtsPoint *p2,
--                                               GtsPoint *p3);
end -- class GTS_POINTS_FUNCTIONS
