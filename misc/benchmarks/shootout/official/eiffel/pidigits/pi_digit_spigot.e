class PI_DIGIT_SPIGOT
	--
	-- Written by Cyril Adrian <cyril.adrian@laposte.net>
	--

creation {PIDIGITS}
	make

feature {PIDIGITS}
	next is
		do
			item := digit
			if is_safe(item) then
				produce(item)
			else
				consume
				next
			end
		end

	item: INTEGER

feature {}
	digit: INTEGER is
		do
			Result := z.extract(3)
		end

	is_safe (a_digit: like digit): BOOLEAN is
		do
			Result := a_digit = z.extract(4)
		end

	produce (i: INTEGER) is
		do
			inverse.qrst(10, -10 * i, 0, 1)
			inverse.compose(z)
			z.copy(inverse)
		end

	consume is
		do
			x.next
			z.compose(x)
		end

feature {}
	x, z, inverse: TRANSFORMATION

	make is
		do
			z.qrst(1, 0, 0, 1)
		end

end -- class PI_DIGIT_SPIGOT
