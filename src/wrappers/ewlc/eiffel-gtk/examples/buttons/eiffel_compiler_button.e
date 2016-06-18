class EIFFEL_COMPILER_BUTTON
inherit
	GTK_RADIO_BUTTON redefine with_label,with_label_from_widget, on_toggled end
	G_SIGNALS
	
create {ANY} with_label, with_label_from_widget
	
feature {ANY} 
	with_label (a_group: G_SLIST[GTK_RADIO_BUTTON]; a_label: STRING)
		do
			Precursor (a_group, a_label)
			connect  (Current, "toggled", $on_toggled)
		end

	with_label_from_widget (a_widget: GTK_RADIO_BUTTON; a_label: STRING)
		do
			Precursor (a_widget, a_label)
			connect  (Current, "toggled", $on_toggled)
		end			
feature {ANY} -- Callback
	on_toggled
		do
			print ("Button `")
			print (label)
			if is_active then print ("' activated%N")
			else  print ("' deactivated%N") end
		end

end


