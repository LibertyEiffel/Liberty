indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"
	description: "enum GdkWindowEdge determines a window edge or corner."

deferred class GDK_WINDOW_EDGE
feature -- Enum
	gdk_window_edge_north_west: INTEGER is
			-- 	the top left corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_NORTH_WEST"
		end

	gdk_window_edge_north: INTEGER is
			-- 	the top edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_NORTH"
		end

	gdk_window_edge_north_east: INTEGER is
			-- 	the top right corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_NORTH_EAST"
		end

	gdk_window_edge_west: INTEGER is
			-- 	the left edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_WEST"
		end

	gdk_window_edge_east: INTEGER is
			-- 	the right edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_EAST"
		end

	gdk_window_edge_south_west: INTEGER is
			-- 	the lower left corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_SOUTH_WEST"
		end

	gdk_window_edge_south: INTEGER is
			-- 	the lower edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_SOUTH"
		end

	gdk_window_edge_south_east: INTEGER is
			-- 	the lower right corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDOW_EDGE_SOUTH_EAST"
		end

	is_valid_window_edge (an_edge: INTEGER): BOOLEAN is
			-- is `an_edge' valid as a GdkWindowEdge?
		do
			Result := ((an_edge = gdk_window_edge_north_west) or else
						  (an_edge = gdk_window_edge_north) or else
						  (an_edge = gdk_window_edge_north_east) or else
						  (an_edge = gdk_window_edge_west) or else
						  (an_edge = gdk_window_edge_east) or else
						  (an_edge = gdk_window_edge_south_west) or else
						  (an_edge = gdk_window_edge_south) or else
						  (an_edge = gdk_window_edge_south_east))
		end
end
	
