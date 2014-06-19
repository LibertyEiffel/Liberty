class PI_DIGIT_SPIGOT
	--
	-- Written by Cyril Adrian <cyril.adrian@laposte.net>
	--

create {PIDIGITS}
	make

feature {PIDIGITS}
	next
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
	digit: INTEGER
		do
			Result := z.extract(3)
		end

	is_safe (a_digit: like digit): BOOLEAN
		do
			Result := a_digit = z.extract(4)
		end

	produce (i: INTEGER)
		do
			inverse.qrst(10, -10 * i, 0, 1)
			inverse.compose(z)
			z.copy(inverse)
		end

	consume
		do
			x.next
			z.compose(x)
		end

feature {}
	x, z, inverse: TRANSFORMATION

	make
		do
			z.qrst(1, 0, 0, 1)
		end

end -- class PI_DIGIT_SPIGOT
