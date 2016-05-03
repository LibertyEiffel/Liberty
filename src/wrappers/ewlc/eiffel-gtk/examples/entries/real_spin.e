class REAL_SPIN
inherit GTK_SPIN_BUTTON rename make as make_spin redefine on_changed end
create {ANY} make
feature {ANY} make is
		local adj: GTK_ADJUSTMENT
		do
			create adj.make (0.0,0.0, 100.0, 2.5, 10.0, 20.0)
			make_spin (adj, 1.5, 3)
			connect (Current, "changed", $on_changed)
		end

	on_changed is
		do
			print(value.out) print ("%% of non-Eiffel code%N")
		end
end

