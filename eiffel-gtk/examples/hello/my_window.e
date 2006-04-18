class MY_WINDOW
inherit GTK_WINDOW redefine make end
insert GTK_MAIN
creation make
feature {NONE}
	make is
		do
			Precursor
			--enable_on_destroy
			create destroy_callback.make
			destroy_callback.connect (Current, agent on_destroy)
		end

feature -- callback
	destroy_callback: DESTROY_CALLBACK
	on_destroy is
		do
			print ("Look! on_destroy at C level is (void (*)) (void*,void*), while at Eiffel level there's only the (hidden) pointer to Current!%NMy window is being destroyed, therefore we quit the application%N")
			gtk_quit
		end

end
	
