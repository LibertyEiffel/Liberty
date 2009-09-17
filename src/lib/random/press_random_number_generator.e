class PRESS_RANDOM_NUMBER_GENERATOR
	--
	-- Press' standard generator, which uses the MINIMAL_RANDOM_NUMBER_GENERATOR 
	-- and then uses shuffling to break up short order corelations.
	--
	
inherit
	MINIMAL_RANDOM_NUMBER_GENERATOR
		redefine with_seed, last_integer, last_real, next
		end

insert
	MINIMAL_RANDOM_NUMBER_GENERATOR
		rename next as min_next
		export {} min_next
		redefine with_seed, last_integer, last_real
		end

creation {ANY}
	make, with_seed

feature {}
	iv: ARRAY[INTEGER]

	ntab: INTEGER is 32

	iy: INTEGER

feature {ANY}
	with_seed (seed_value: INTEGER) is
		local
			i: INTEGER
		do
			seed := seed_value
			min_next
			create iv.make(1, ntab)
			from
				i := 1
			until
				i > 7
			loop
				min_next
				i := i + 1
			end
			from
				i := ntab
			until
				i = 0
			loop
				iv.put(seed, i)
				min_next
				i := i - 1
			end
			iy := iv.item(1)
			next
		end

	next is
		local
			tmp: INTEGER
		do
			tmp := iy #\\ ntab + 1
			min_next
			iy := iv.item(tmp)
			iv.put(seed, tmp)
		end

	last_integer (n: INTEGER): INTEGER is
		do
			Result := iy #\\ n + 1
		end

	last_real: REAL is
		do
			Result := iy / im
		end

end -- class PRESS_RANDOM_NUMBER_GENERATOR
