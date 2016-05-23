class
	DIAGRAM_CANVAS
	
inherit
	GOO_CANVAS redefine make, on_button_press_event end
	
create {ANY}
	make
	
feature {} -- creation
	make is
		do
			Precursor
			enable_on_button_press_event
		end
	
feature {ANY}
	on_button_press_event (event: GDK_EVENT_BUTTON; a_widget: GTK_WIDGET): BOOLEAN is
		do
			print ("pressed %N")
		end
	
end
