class A

creation {ANY}
	make

feature {ANY}
	value_changed: SIGNAL_1[INTEGER] --declare variable of SIGNAL type, never inherit form SIGNAL.

	value: INTEGER

feature {}
	make is
		do
			create value_changed.make
		end

feature {ANY}
	set_val (v: INTEGER) is
		do
			-- Only emit if value really change (see signals.txt: when
			-- to use). Avoid infinite looping in case of cyclic connections.
			if v /= value then
				value := v
				value_changed.emit(v)
			end
		end

end -- class A
