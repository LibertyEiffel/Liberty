class DL_EXAMPLE

insert DYNAMIC_LINKING_LOADER; DL_FLAGS

creation {ANY} make

feature {} 
	make is
		local dl: DL_LOADER
		do
			l := new_dynamic_shared_object("libglib-2.0.so", rtld_now)
			l2 := dl.new_dynamic_shared_object("libglib-2.0.so", rtld_now)

			check
				l ~ l2
			end

			print (l.symbol("g_date_new").out)

			check 
				l.symbol("g_date_new") = l2.symbol("g_date_new")
			end
		end
	l,l2: DYNAMIC_SHARED_OBJECT
end -- DL_EXAMPLE
