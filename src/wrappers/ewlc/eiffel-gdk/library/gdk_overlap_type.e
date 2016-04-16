note
	description: "Enum  GdkOverlapType Specifies the possible values returned by gdk_region_rect_in()."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Specifies the possible values returned by gdk_region_rect_in().
deferred class  GDK_OVERLAP_TYPE

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_overlap_type (a_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gdk_overlap_rectangle_in) or else
						(a_type = gdk_overlap_rectangle_out) or else
						(a_type = gdk_overlap_rectangle_part))
		end
	
	gdk_overlap_rectangle_in: INTEGER is	
			-- if the rectangle is inside the GdkRegion.	
		external "C macro use <gdk/gdk.h>"	
		alias "GDK_OVERLAP_RECTANGLE_IN"	
		end	
	
	gdk_overlap_rectangle_out: INTEGER is	
			-- if the rectangle is outside the GdkRegion.	
		external "C macro use <gdk/gdk.h>"	
		alias "GDK_OVERLAP_RECTANGLE_OUT"	
		end	

	gdk_overlap_rectangle_part: INTEGER is	
			-- if the rectangle is partly inside the GdkRegion.	
		external "C macro use <gdk/gdk.h>"	
		alias "GDK_OVERLAP_RECTANGLE_PART"	
		end	

end
