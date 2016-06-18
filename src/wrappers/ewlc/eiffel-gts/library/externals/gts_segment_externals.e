note
	description: "External calls for GTS_SEGMENT"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_SEGMENT_EXTERNALS
	
inherit ANY undefine is_equal, copy end

insert GTS_EDGE_EXTERNALS

feature {} -- External calls
	-- #define     GTS_SEGMENT_CLASS               (klass)
	-- #define     GTS_SEGMENT                     (obj)
	gts_is_segment (an_obj: POINTER): INTEGER
			-- #define GTS_IS_SEGMENT (obj)
		external "C use <gts.h>"
		alias "GTS_IS_SEGMENT"
		end

	gts_segment_class: POINTER
			-- GtsSegmentClass* gts_segment_class (void)
		external "C use <gts.h>"
		end

	gts_segment_new (a_class, a_v1, a_v2: POINTER): POINTER
			-- GtsSegment* gts_segment_new (GtsSegmentClass *klass,
			-- GtsVertex *v1, GtsVertex *v2)
		external "C use <gts.h>"
		end

	gts_segments_are_identical (s1, s2: POINTER): INTEGER
			-- #define gts_segments_are_identical (s1, s2)
		external "C macro use <gts.h>"
		end
		
	
	gts_segments_are_intersecting (an_s1, an_s2: POINTER): INTEGER
			-- GtsIntersect gts_segments_are_intersecting (GtsSegment *s1,
			-- GtsSegment *s2)
		external "C use <gts.h>"
		end

	gts_segment_is_duplicate (a_segment: POINTER): POINTER
			-- GtsSegment* gts_segment_is_duplicate (GtsSegment *s)
		external "C use <gts.h>"
		end

	gts_segment_is_ok (a_segment: POINTER): INTEGER
			-- gboolean gts_segment_is_ok (GtsSegment *s)
		external "C use <gts.h>"
		end

	gts_segment_connect (s, e1, e2: POINTER): INTEGER
			-- #define gts_segment_connect (s, e1, e2)
		require 
			gts_is_segment(s).to_boolean
			gts_is_edge(e1).to_boolean
			gts_is_edge(e2).to_boolean
		external "C macro use <gts.h>"
		end
	
	gts_segments_touch (s1, s2: POINTER): INTEGER
			-- #define gts_segments_touch (s1, s2)
		external "C macro use <gts.h>"
		end
	
	gts_segments_from_vertices (some_vertices: POINTER): POINTER
			-- GSList* gts_segments_from_vertices (GSList *vertices)
		external "C use <gts.h>"
		end
	
	gts_segment_midvertex (a_segment, a_class: POINTER): POINTER
			-- GtsVertex* gts_segment_midvertex (GtsSegment *s, GtsVertexClass
			-- *klass)
		external "C use <gts.h>"
		end

	-- gts_segment_triangle_intersection(a_segment, a_triangle:
	-- POINTER; boundary_bool: INTEGER; a_point_class: POINTER):
	-- POINTER is external "C use <gts.h>" end
end
