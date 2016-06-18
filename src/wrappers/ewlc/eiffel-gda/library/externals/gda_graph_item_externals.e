-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_GRAPH_ITEM_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_graph_item_get_position (an_item: POINTER; a_x: POINTER; a_y: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_graph_item_set_position (an_item: POINTER; a_x: REAL_64; a_y: REAL_64)
		external "C use <libgda/libgda.h>"
		end

	gda_graph_item_get_ref_object (an_item: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_graph_item_new (a_dict: POINTER; a_ref_obj: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_graph_item_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_graph_item_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
