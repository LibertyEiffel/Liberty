class MY_BUTTON
inherit
	GTK_BUTTON
		redefine with_label, on_clicked
		end
create {ANY} make,with_label
feature {ANY}
	on_clicked
		do
			print ("Hello from `my-button'. I was called with the built-in clicked signal handler%N")
		end
			
	with_label (a_label:STRING)
		do
			Precursor (a_label)
			enable_on_clicked
		end

end
