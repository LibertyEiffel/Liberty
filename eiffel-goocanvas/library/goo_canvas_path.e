class
	GOO_CANVAS_PATH
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; path_data : STRING) is
		do
			from_external_pointer (goo_canvas_path_new (parent.handle, path_data.to_external))
		end
	
	
	goo_canvas_path_new (parent, path_data : POINTER) : POINTER is
		external "C use <goocanvas-1.0/goocanvaspath.h>"
		end

feature -- struct size
	struct_size: INTEGER is
		external "C inline use <goocanvas-1.0/goocanvaspath.h>"
		alias "sizeof(GooCanvasPath)"
		end

feature {} -- properties
	
--  "data"                     gchararray            : Write
end
