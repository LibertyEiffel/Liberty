note
	description: "Enum GdkFillRule - The method for determining which pixels are included in a region, when creating a GdkRegion from a polygon. The fill rule is only relevant for polygons which overlap themselves."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			--	The method for determining which pixels are included in a
			--	region, when creating a GdkRegion from a polygon. The fill
			--	rule is only relevant for polygons which overlap
			--	themselves.

deferred class GDK_FILL_RULE

inherit ANY undefine is_equal, copy end

feature  {} -- enum

	is_valid_fill_rule (a_rule :INTEGER): BOOLEAN is
		do
			Result:=((a_rule = gdk_even_odd_rule) or else
			         (a_rule = gdk_winding_rule))
		end

	gdk_even_odd_rule: INTEGER is
			-- areas which are overlapped an odd number of times are
			-- included in the region, while areas overlapped an even
			-- number of times are not.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_EVEN_ODD_RULE"
		end

	gdk_winding_rule: INTEGER is
			-- overlapping areas are always included.	
		external "C macro use <gdk/gdk.h>"
		alias "GDK_WINDING_RULE"
		end

end
