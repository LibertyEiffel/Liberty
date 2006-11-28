indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_SEGMENT_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	-- #define     GTS_SEGMENT_CLASS               (klass)
	-- #define     GTS_SEGMENT                     (obj)
	-- #define     GTS_IS_SEGMENT                  (obj)

	gts_segment_class: POINTER is
			-- GtsSegmentClass* gts_segment_class (void)
		external "C use <gts.h>"
		end

	gts_segment_new (a_class, a_v1, a_v2: POINTER): POINTER is
			-- GtsSegment* gts_segment_new (GtsSegmentClass *klass, GtsVertex *v1,
			-- GtsVertex *v2)
		external "C use <gts.h>"
		end

	gts_segments_are_identical (s1, s2: POINTER): INTEGER is
			-- #define gts_segments_are_identical (s1, s2)
		external "C macro use <gts.h>"
		end
		
	
	gts_segments_are_intersecting (an_s1, an_s2: POINTER): INTEGER is
			-- GtsIntersect gts_segments_are_intersecting (GtsSegment *s1,
			-- GtsSegment *s2)
		external "C use <gts.h>"
		end

	gts_segment_is_duplicate (a_segment: POINTER): POINTER is
			-- GtsSegment* gts_segment_is_duplicate (GtsSegment *s)
		external "C use <gts.h>"
		end

	gts_segment_is_ok (a_segment: POINTER): INTEGER is
			-- gboolean gts_segment_is_ok (GtsSegment *s)
		external "C use <gts.h>"
		end

	gts_segment_connect (s, e1, e2: POINTER) is
			-- #define gts_segment_connect (s, e1, e2)
		external "C macro use <gts.h>"
		end
	
	gts_segments_touch (s1, s2: POINTER): INTEGER is
			-- #define gts_segments_touch (s1, s2)
		external "C macro use <gts.h>"
		end
	
	gts_segments_from_vertices (some_vertices: POINTER): POINTER is
			-- GSList* gts_segments_from_vertices (GSList *vertices)
		external "C use <gts.h>"
		end
	
	gts_segment_midvertex (a_segment, a_class: POINTER): POINTER is
			-- GtsVertex* gts_segment_midvertex (GtsSegment *s, GtsVertexClass
			-- *klass)
		external "C use <gts.h>"
		end

end
