class
	GOO_CANVAS_TEXT
	
inherit
	GOO_CANVAS_ITEM_SIMPLE redefine struct_size end
	
create
	make, from_external_pointer
	
feature {} -- creation
	make (parent : GOO_CANVAS_ITEM; string : STRING; x, y, width : REAL_64; anchor : INTEGER) is
		do
			from_external_pointer (goo_canvas_text_new (parent.handle, string.to_external, x, y, width, anchor))
		end
	
	
	goo_canvas_text_new (parent, string : POINTER; x, y, width : REAL_64; anchor : INTEGER) : POINTER is
	 -- TODO: GtkAnchorType anchor ??
		external "C use <goocanvas-1.0/goocanvastext.h>"
		end
		
	-- TODO: 
--	goo_canvas_text_get_natural_extents (GooCanvasText *text,
--                                                         PangoRectangle *ink_rect,
--                                                         PangoRectangle *logical_rect)

feature -- struct size
	struct_size: INTEGER is
		external "C inline use <goocanvas-1.0/goocanvastext.h>"
		alias "sizeof(GooCanvasText)"
		end

feature {} -- properties
	
-- "alignment"                PangoAlignment        : Read / Write
--  "anchor"                   GtkAnchorType         : Read / Write
--  "ellipsize"                PangoEllipsizeMode    : Read / Write
--  "text"                     gchararray            : Read / Write
--  "use-markup"               gboolean              : Read / Write
--  "width"                    gdouble               : Read / Write
--  "wrap"                     PangoWrapMode         : Read / Write
--  "x"                        gdouble               : Read / Write
--  "y"                        gdouble               : Read / Write
end
