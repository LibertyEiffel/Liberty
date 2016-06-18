note
	description: "The GdkColor structure is used to describe an allocated or unallocated color."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GDK_COLOR

inherit
	C_STRUCT
		redefine 
			copy
		end
create {ANY}
	from_external_pointer, make

feature {ANY} 

	struct_size: INTEGER
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkColor)"
		end

	make
		do
			allocate
		end

	dispose
		do
			gdk_color_free (handle)			
		end
	
	copy (another: like Current)
		do
			from_external_pointer(gdk_color_copy(handle))
		end

feature {ANY} -- Getters and setters

	is_allocated: BOOLEAN
		-- Not implemented, we still need GdkColormaps for this.
		-- Shall be set to True after a call to gdk_color_alloc()
		-- or gdk_colors_alloc()

	pixel: INTEGER
			-- For allocated colors, the value used to draw this color on the
			-- screen.
		require
			is_allocated
		do
			Result := get_pixel_external (handle)
		ensure
			Result > 0
		end

	red: INTEGER
			-- The red component of the color. This is a value between 0 and
			-- 65535, with 65535 indicating full intensitiy.
		do
			Result := get_red_external (handle)
		ensure
			Result.in_range (0, 65535)
		end

	green: INTEGER
			-- The green component of the color.
		do
			Result := get_green_external (handle)
		ensure
			Result.in_range (0, 65535)
		end

	blue: INTEGER
			-- The blue component of the color.
		do
			Result := get_blue_external (handle)
		ensure
			Result.in_range (0, 65535)
		end

	set_red (a_red: INTEGER)
		require
			a_red.in_range (0, 65535)
		do
			set_red_external (handle, a_red)
		ensure
			red = a_red
		end

	set_green (a_green: INTEGER)
		require
			a_green.in_range (0, 65535)
		do
			set_green_external (handle, a_green)
		ensure
			green = a_green
		end

	set_blue (a_blue: INTEGER)
		require
			a_blue.in_range (0, 65535)
		do
			set_blue_external (handle, a_blue)
		ensure
			blue = a_blue
		end

feature {} -- Low level access

	gdk_color_copy (a_color: POINTER): POINTER
			-- GdkColor* gdk_color_copy (const GdkColor *color);
		external "C use <gdk/gdk.h>"
		end

	gdk_color_free (a_color: POINTER)
			-- void gdk_color_free (GdkColor *color);
		external "C use <gdk/gdk.h>"
		end

	get_pixel_external (ptr: POINTER): INTEGER
			-- Note: Result shall be NATURAL_32 since itr's a guint32
		external "C struct GdkColor get pixel use <gdk/gdk.h>"
		end

	get_red_external (ptr: POINTER): INTEGER
			-- Note: Result shall be NATURAL_16 since itr's a guint16
		external "C struct GdkColor get red use <gdk/gdk.h>"
		end

	set_red_external (ptr: POINTER; a_red: INTEGER)
			-- NOTE: a_red shall be a NATURAL_16 since it's a guint16
		external "C struct GdkColor set red use <gdk/gdk.h>"
		end

	get_green_external (ptr: POINTER): INTEGER
			-- Note: Result shall be NATURAL_16 since itr's a guint16
		external "C struct GdkColor get green use <gdk/gdk.h>"
		end

	set_green_external (ptr: POINTER; a_green: INTEGER)
			-- NOTE: a_ shall be a NATURAL_16 since it's a guint16
		external "C struct GdkColor set green use <gdk/gdk.h>"
		end

	get_blue_external (ptr: POINTER): INTEGER
			-- Note: Result shall be NATURAL_16 since itr's a guint16
		external "C struct GdkColor get blue use <gdk/gdk.h>"
		end

	set_blue_external (ptr: POINTER; a_blue: INTEGER)
			-- NOTE: a_blue shall be a NATURAL_16 since it's a guint16
		external "C struct GdkColor set blue use <gdk/gdk.h>"
		end

end
