note
	description: "External calls for GTS_POINT"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_POINT_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GTS_INTERSECT_ENUM

feature {} -- External calls
	--  #include <gts.h>


	--  #define     GTS_POINT_CLASS                 (klass)
	--  #define     GTS_POINT                       (obj)
	--  #define     GTS_IS_POINT                    (obj)
	--              GtsPointClass;
	--              GtsPoint;

	gts_point_class: POINTER is -- GtsPointClass*
		external "C use <gts.h>"
		end

	gts_point_new (a_gtspointclass: POINTER; an_x, an_y, a_z: REAL): POINTER is -- GtsPoint*
		external "C use <gts.h>"
		end

	gts_point_set (a_point: POINTER; an_x, an_y, a_z: REAL) is -- void
		external "C use <gts.h>"
		end

	gts_point_is_in_rectangle (p, p1, p2: POINTER): INTEGER is
		external "C macro use <gts.h>"
		end

	gts_segment_triangle_intersection (a_segment, a_triangle: POINTER; boundary_boolean: INTEGER; a_gtspointclass: POINTER): POINTER is -- GtsPoint*
		external "C use <gts.h>"
		end

	gts_point_transform (a_point, a_gts_matrix: POINTER) is -- void
		external "C use <gts.h>"
		end

	gts_point_distance (a_point, another: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_distance2 (a_point, another: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_orientation_3d (p1, p2, p3, p4: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_orientation_3d_sos (p1, p2, p3, p4: POINTER): INTEGER is -- gint
		external "C use <gts.h>"
		end

	gts_point_in_circle (a_point, p1,p2,p3: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_in_triangle_circle (a_point, a_triangle: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_is_in_triangle (a_point, a_triangle: POINTER): INTEGER is -- GtsIntersect
		external "C use <gts.h>"
		ensure is_valid_intersection (Result)
		end

	gts_point_orientation (p1,p2,p3: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_orientation_sos (p1, p2, p3: POINTER): INTEGER is -- gint
		external "C use <gts.h>"
		end

	gts_point_segment_distance2 (a_point, a_segment: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_segment_distance (a_point, a_segment: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_segment_closest (a_point, a_segment, closest_point: POINTER) is 
		external "C use <gts.h>"
		end

	gts_point_triangle_distance (a_point, a_triangle: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_triangle_closest (a_point, a_triangle, closest_point: POINTER) is
		external "C use <gts.h>"
		end

	gts_point_triangle_distance2 (a_point, a_triangle: POINTER): REAL is -- gdouble
		external "C use <gts.h>"
		end

	gts_point_is_inside_surface (a_point, a_gnode_tree: POINTER; is_open_gboolean: INTEGER): INTEGER is -- gboolean
		external "C use <gts.h>"
		end

	gts_point_locate (a_point, a_surface, a_guess_face: POINTER): POINTER is
			-- GtsFace* gts_point_locate (GtsPoint *p, GtsSurface
			-- *surface, GtsFace *guess);
		external "C use <gts.h>"
		end

end -- class GTS_POINT_EXTERNALS
