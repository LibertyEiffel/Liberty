class INTEGER_SPIN
inherit GTK_SPIN_BUTTON rename make as make_spin redefine on_changed end
create {ANY} make
feature {ANY} make
		do
			with_range (0.0, 5.0, 1.0)
			enable_on_changed
		end

	on_changed
		do
			print(value.out) print (" Eiffel projects%N")
		end
	
end

