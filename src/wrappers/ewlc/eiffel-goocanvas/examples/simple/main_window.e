class
	MAIN_WINDOW
	
inherit
	GTK_WINDOW
		redefine make, on_destroy end
	GTK
	
insert
	GDK
	
create {ANY}
	make
	
feature {ANY} make
--		local
--			temp : TUPLE[GDK_PIXMAP, GDK_BITMAP]
		local
			rect : GOO_CANVAS_RECT
			text : GOO_CANVAS_TEXT
		do
			Precursor
			set_title (once "SEditor")
			set_default_size (800, 600)
			midscreen
			enable_on_destroy
			
			create diagram_scroll.make_default
			add (diagram_scroll)
			
			create goo.make
			
			goo.set_size_request(800, 600)
			goo.set_bounds (0, 0, 1000, 1000)
			
			
			create rect.make (goo.root_item, 100, 100, 400, 400)
			rect.set_property ( "stroke-color-rgba", create {G_VALUE}.from_natural (0x7FAA7744))
--			rect.set_ ("line-width", 0xFFAA7744)
			
			create text.make (goo.root_item, "Hello World", 300, 300, -1, 0)
			
			diagram_scroll.add (goo)
		end

feature {ANY} -- Widgets
	vbox: GTK_VBOX
	
	diagram_scroll : GTK_SCROLLED_WINDOW
	goo : DIAGRAM_CANVAS

feature {ANY}  -- Callbacks

	on_destroy
		do
			gtk.quit
		end
	
end
	
	
	
