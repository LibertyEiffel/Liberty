indexing
	description: "The GdkColor structure is used to describe an allocated or unallocated color."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GDK_COLOR
inherit C_STRUCT
creation make, from_external_pointer
feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkColor)"
		end

feature {NONE} -- Creation

feature -- Getters and setters
   guint32 pixel; For allocated colors, the value used to draw this color on the screen.
   guint16 red;   The red component of the color. This is a value between 0 and 65535, with 65535
                  indicating full intensitiy.
   guint16 green; The blue component of the color.
   guint16 blue;  The green component of the color.

feature {NONE} -- Low level access
	get_pixel_external (ptr: POINTER): INTEGER is
			-- Note: Result shall be NATURAL_32 since itr's a guint32
		external "C struct GdkColor get pixel use <gdk/gdk.h>"
		end

	set_pixel_external (ptr: POINTER; a_pixel: INTEGER) is 
			-- NOTE: a_pixel shall be a NATURAL_32 since it's a guint32
		external "C struct GdkColor set pixel use <gdk/gdk.h>"
		end

	get_red_external (ptr: POINTER): INTEGER is
			-- Note: Result shall be NATURAL_16 since itr's a guint16
		external "C struct GdkColor get red use <gdk/gdk.h>"
		end

	set_red_external (ptr: POINTER; a_red: INTEGER) is 
			-- NOTE: a_red shall be a NATURAL_16 since it's a guint16
		external "C struct GdkColor set red use <gdk/gdk.h>"
		end

	get_green_external (ptr: POINTER): INTEGER is
			-- Note: Result shall be NATURAL_16 since itr's a guint16
		external "C struct GdkColor get green use <gdk/gdk.h>"
		end

	set_green_external (ptr: POINTER; a_green: INTEGER) is 
			-- NOTE: a_ shall be a NATURAL_16 since it's a guint16
		external "C struct GdkColor set green use <gdk/gdk.h>"
		end

	get_blue_external (ptr: POINTER): INTEGER is
			-- Note: Result shall be NATURAL_16 since itr's a guint16
		external "C struct GdkColor get blue use <gdk/gdk.h>"
		end

	set_blue_external (ptr: POINTER; a_blue: INTEGER) is 
			-- NOTE: a_blue shall be a NATURAL_16 since it's a guint16
		external "C struct GdkColor set blue use <gdk/gdk.h>"
		end
end
