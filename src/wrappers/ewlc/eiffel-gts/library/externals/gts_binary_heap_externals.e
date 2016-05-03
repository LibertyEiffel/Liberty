note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_BINARY_HEAP_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	gts_heap_new (a_compare_func: POINTER): POINTER is
			-- GtsHeap* gts_heap_new (GCompareFunc compare_func);
		external "C use <gts.h>"
		end

	 gts_heap_insert (an_heap, a_pointer: POINTER) is
			-- void gts_heap_insert (GtsHeap *heap, gpointer p);
		external "C use <gts.h>"
		end
	
	gts_heap_remove_top (an_heap: POINTER): POINTER is
			-- gpointer gts_heap_remove_top (GtsHeap *heap);
		external "C use <gts.h>"
		end
	
	gts_heap_top (an_heap: POINTER): POINTER is
			-- gpointer gts_heap_top (GtsHeap *heap);
		external "C use <gts.h>"
		end
	
	gts_heap_freeze (an_heap: POINTER) is
			-- void gts_heap_freeze (GtsHeap *heap);
		external "C use <gts.h>"
		end
	
  gts_heap_thaw (an_heap: POINTER) is
			-- void gts_heap_thaw (GtsHeap *heap);
		external "C use <gts.h>"
		end
	
  gts_heap_foreach (an_heap, a_func, user_data: POINTER) is
			-- void gts_heap_foreach (GtsHeap *heap, GFunc func, gpointer user_data);
		external "C use <gts.h>"
		end
	
	gts_heap_size (an_heap: POINTER): INTEGER is
			-- guint gts_heap_size (GtsHeap *heap);
		external "C use <gts.h>"
		ensure natural: Result >= 0
		end

	gts_heap_destroy (an_heap: POINTER) is
			-- void gts_heap_destroy (GtsHeap *heap);
		external "C use <gts.h>"
		end
	
feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsHeap)"
		end
end
