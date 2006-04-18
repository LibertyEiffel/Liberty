class MY_BUTTON
inherit
	GTK_BUTTON
		rename on_clicked as say_hello
		redefine with_label, say_hello
		end
creation make,with_label
feature
	say_hello is
		do
			print ("Hello from `my-button'. I was called with the built-in clicked signal handler%N")
		end
			
	with_label (a_label:STRING) is
		do
			Precursor (a_label)
			enable_on_clicked
		end

end
