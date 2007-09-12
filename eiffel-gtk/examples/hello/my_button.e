class MY_BUTTON
inherit
	GTK_BUTTON
		redefine with_label, on_clicked
		end
creation dummy, make,with_label
feature
	on_clicked is
		do
			print ("Hello from `my-button'. I was called with the built-in clicked signal handler%N")
		end
			
	with_label (a_label:STRING) is
		do
			Precursor (a_label)
			enable_on_clicked
		end

end
