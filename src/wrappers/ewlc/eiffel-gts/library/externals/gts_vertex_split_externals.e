note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_VERTEX_SPLIT_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	gts_split_class_cast (a_klass: POINTER): POINTER is
			-- #define GTS_SPLIT_CLASS (klass)
		external "C macro use <gts.h>"
		alias "GTS_SPLIT_CLASS (klass)"
		end
	
	gts_split_cast (an_obj: POINTER): POINTER is
			-- #define GTS_SPLIT (obj)
		external "C macro use <gts.h>"
		alias "GTS_SPLIT (obj)"
		end
	
	gts_is_split (obj: POINTER): INTEGER is
			-- #define GTS_IS_SPLIT (obj)
		external "C macro use <gts.h>"
		alias "GTS_IS_SPLIT (obj)"
		end
	
	gts_split_v1 (vs: POINTER): POINTER is
			-- #define GTS_SPLIT_V1 (vs)
		external "C macro use <gts.h>"
		alias "GTS_SPLIT_V1"
		end
	
	gts_split_v2 (vs: POINTER): POINTER is
			-- #define GTS_SPLIT_V2 (vs)
		external "C macro use <gts.h>"
		alias "GTS_SPLIT_V2"
		end
	
	-- GtsSplitClass; GtsSplitCFace; GtsSplit;
	
	gts_split_class: POINTER is
			-- GtsSplitClass* gts_split_class (void);
		external "C use <gts.h>"
		end
	
	gts_split_new (klass, v, o1, o2: POINTER): POINTER is
			-- GtsSplit* gts_split_new (GtsSplitClass *klass, GtsVertex
			-- *v, GtsObject *o1, GtsObject *o2);
	external "C use <gts.h>"
	end
	
	gts_split_collapse (vs, klass, heap: POINTER) is
			-- void gts_split_collapse (GtsSplit *vs, GtsEdgeClass
			-- *klass, GtsEHeap *heap);
		external "C use <gts.h>"
		end
	
	gts_split_expand (vs, s, klass: POINTER) is
			-- void gts_split_expand (GtsSplit *vs, GtsSurface *s,
			-- GtsEdgeClass *klass);
		external "C use <gts.h>"
		end
	
	gts_split_height (root: POINTER): INTEGER is
			-- guint gts_split_height (GtsSplit *root);
		external "C use <gts.h>"
		ensure natural: Result >= 0
		end
	
	-- gboolean (*GtsSplitTraverseFunc) (GtsSplit *vs, gpointer data);

	gts_split_traverse (root: POINTER; a_traverse_type, a_depth: INTEGER; a_gts_split_traverse_func, some_data: POINTER) is
			-- void gts_split_traverse (GtsSplit *root, GTraverseType
			-- order, gint depth, GtsSplitTraverseFunc func, gpointer
			-- data);
		external "C use <gts.h>"
		end
	
feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsSplit)"
		end
end
