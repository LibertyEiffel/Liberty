class MY_WINDOW
inherit
	GTK_WINDOW redefine make end
	GTK_MAIN
creation make
feature {NONE}
	make is
		do
			Precursor
			connect (Current, "destroy", $on_destroy)
		end

feature -- callback
	on_destroy (a_ptr: POINTER) is
		do
			handle:=Null
			print ("Look! on_destroy at C level is (void (*)) (void*,void*), while at Eiffel level there's only the (hidden) pointer to Current!%NMy window is being destroyed, therefore we quit the application%N")
			gtk_quit
		end
end
	
