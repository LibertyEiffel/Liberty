note
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class GTS_SURFACE_QUALITY_STATS
	-- TODO: Quality and geometry statistics.
inherit C_STRUCT

insert GTS_SURFACE_QUALITY_STATS_STRUCT

create {ANY}  make, from_external_pointer

feature {} -- Creation
	make is
		do
			allocate
		end

	--   GtsSurfaceQualityStats
	
	--  typedef struct {
	--    GtsRange face_quality;
	--    GtsRange face_area;
	--    GtsRange edge_length;
	--    GtsRange edge_angle;
	--    GtsSurface * parent;
	--  } GtsSurfaceQualityStats;
	
	--     GtsRange face_quality;  Statistics for face quality (see gts_triangle_quality() for details).
	--     GtsRange face_area;     Statistics for the face area.
	--     GtsRange edge_length;   Statistics for the edge length.
	--     GtsRange edge_angle;    Statistics for the edge angles.
	--     GtsSurface *parent;     Surface from which these statistics have been obtained.
end -- class GTS_SURFACE_QUALITY_STATS
