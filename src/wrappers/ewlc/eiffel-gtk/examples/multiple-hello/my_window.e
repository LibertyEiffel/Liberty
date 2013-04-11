class MY_WINDOW

inherit GTK_WINDOW redefine make, on_destroy end

create {ANY} make

feature {ANY} 
	make is
		do
			Precursor
			enable_on_destroy
			-- create destroy_callback.make; destroy_callback.connect (Current, agent on_destroy)
		end

feature {ANY} -- callback
	--	destroy_callback: DESTROY_CALLBACK
	on_destroy is
		local
			windows: G_LIST[GTK_WINDOW]; wi: ITERATOR[GTK_WINDOW]
			w: GTK_WINDOW; t: STRING
		do
			windows:=gtk.toplevels
			check windows/=Void end
			if windows.count>1 then 
				print (windows.count.out+" windows: ")
				from wi:=windows.get_new_iterator; wi.start until wi.is_off
				loop
					w:=wi.item
					if w/=Void then 
						t:=w.title
						if t/=Void then print ("'"+t+"'")
						else print ("No title") end
					else
						raise("Void window")
					end
					wi.next
					if not wi.is_off then print (", ") end
				end
				print ("%N"+title+" is being closed.%N")
			else
				print ("%NLast window is being closed, we quit.%N")
				gtk.quit
			end
		end
end
	
