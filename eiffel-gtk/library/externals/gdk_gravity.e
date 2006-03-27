indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"
	description: "enum GdkGravity defines the reference point of a window and the meaning of coordinates passed to gtk_window_move(). See gtk_window_move() and the "implementation notes" section of the Extended Window Manager Hints specification for more details."

deferred class GDK_GRAVITY
feature -- Enum
	
	gdk_gravity_north_west: INTEGER is
			-- 	the reference point is at the top left corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_NORTH_WEST"
		end

	gdk_gravity_north: INTEGER is
			-- 	the reference point is in the middle of the top edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_NORTH"
		end

	gdk_gravity_north_east: INTEGER is
			-- 	the reference point is at the top right corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_NORTH_EAST"
		end

	gdk_gravity_west: INTEGER is
			-- 	the reference point is at the middle of the left edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_WEST"
		end

	gdk_gravity_center: INTEGER is
			-- 	the reference point is at the center of the window.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_CENTER"
		end

	gdk_gravity_east: INTEGER is
			-- 	the reference point is at the middle of the right edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_EAST"
		end

	gdk_gravity_south_west: INTEGER is
			-- 	the reference point is at the lower left corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_SOUTH_WEST"
		end

	gdk_gravity_south: INTEGER is
			-- 	the reference point is at the middle of the lower edge.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_SOUTH"
		end

	gdk_gravity_south_east: INTEGER is
			-- 	the reference point is at the lower right corner.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_SOUTH_EAST"
		end

	gdk_gravity_static: INTEGER is
			-- 	the reference point is at the top left corner of the window itself, ignoring window manager decorations.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_GRAVITY_STATIC"
		end

	is_valid_gravity (a_gravity: INTEGER): BOOLEAN is
		-- is `a_gravity' a valid GdkGravity enum?
		do
			Result := ((a_gravity = gdk_gravity_north_west) or else
						  (a_gravity = gdk_gravity_north) or else
						  (a_gravity = gdk_gravity_north_east) or else
						  (a_gravity = gdk_gravity_west) or else
						  (a_gravity = gdk_gravity_center) or else
						  (a_gravity = gdk_gravity_east) or else
						  (a_gravity = gdk_gravity_south_west) or else
						  (a_gravity = gdk_gravity_south) or else
						  (a_gravity = gdk_gravity_south_east) or else
						  (a_gravity = gdk_gravity_static))
		end
end
