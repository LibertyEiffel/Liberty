class
	GOO_CANVAS_GROUP
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM) is
		do
			from_external_pointer (goo_canvas_group_new (parent.handle))
		end
	
	
	goo_canvas_group_new (parent : POINTER) : POINTER is
		external "C use <goocanvas-1.0/goocanvasgroup.h>"
		end

feature -- struct size
	struct_size: INTEGER is
		external "C inline use <goocanvas-1.0/goocanvasgroup.h>"
		alias "sizeof(GooCanvasGroup)"
		end
end
