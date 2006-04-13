class MY_BUTTON
inherit GTK_BUTTON redefine with_label end
creation make,with_label
feature
	--foo is
	foo (my_handle: POINTER) is
		do
			print ("clicked signal with my-button%N")
			--if ((Current.to_pointer = my_address) and
			--		 (handle = my_handle))
			--then print ("I am the same object I've been connected to clicked%N")
			--else print ("I am different from the object connected to clicked%N")
			--end
		end

	say_hello is
		do
			print ("Hello from `my-button'%N")
			if (Current.to_pointer = my_address)
			then print ("I am the same object I've been connected to clicked%N")
			else print ("I am different from the object connected to clicked%N")
			end
		end
			
	my_address: POINTER

	clicked_callback: CLICKED_CALLBACK
	
	with_label (a_label:STRING) is
		do
			Precursor (a_label)
			connect (Current, "clicked", $foo)
			create clicked_callback.make (Current, agent say_hello)
			
			connect (Current, "destroy", $dispose)
			my_address:=Current.to_pointer
		end

end
