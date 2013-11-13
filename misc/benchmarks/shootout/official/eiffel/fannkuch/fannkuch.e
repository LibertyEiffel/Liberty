--   The Computer Language Shootout
--   http://shootout.alioth.debian.org
--
--   contributed by jos
--   modified by andy
class FANNKUCH

insert
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	n: INTEGER

	buffer: STRING

	make is
		do
			if argument_count > 0 and then argument(1).is_integer then
				n := argument(1).to_integer
				if n > 1 then
					create buffer.make(0)
					io.put_string("Pfannkuchen(" + n.to_string + ") = " + fannkuch(n).to_string + "%N")
				end
			end
		end

	fannkuch (x: like n): like n is
		require
			x > 1
		local
			perm, perm1, count, maxperm: FAST_ARRAY[like n]
			rot_rank, i, j, k, upper, cnt, flip_count, tmp, p0, dcptpr: like n
		do
			create perm.make(x)
			create perm1.make(x + 1)
			create count.make(x)
			create maxperm.make(x)
			-- initial (trivial) permutation
			from
				i := 0
			until
				i = x
			loop
				perm1.put(i, i)
				i := i + 1
			end
			upper := x - 1
			count.put(1, upper)
			dcptpr := 30
			from
				rot_rank := upper - 1
				cnt := x
			until
				rot_rank = upper
			loop
				-- if the thirties first permutations
				if dcptpr > 0 then
					dcptpr := dcptpr - 1
					from
						buffer.clear_count
						i := 0
					until
						i = x
					loop
						buffer.append((1 + perm1.item(i)).to_string)
						i := i + 1
					end
					buffer.add_last('%N')
					io.put_string(buffer)
				end
				-- update rotation counters
				count.put(cnt - 1, rot_rank)
				from
				until
					rot_rank = 0
				loop
					count.put(rot_rank, rot_rank - 1)
					rot_rank := rot_rank - 1
				end
				-- count the needed flips
				p0 := perm1.item(0)
				if p0 /= 0 and then perm1.item(upper) /= upper then
					from
						i := 0
					until
						i = x
					loop
						perm.put(perm1.item(i), i)
						i := i + 1
					end
					flip_count := 0
					from
						k := p0
					until
						k = 0
					loop
						tmp := perm.item(k)
						perm.put(k, k)
						j := k - 1
						k := tmp
						from
							i := 1
						until
							i >= j
						loop
							tmp := perm.item(i)
							perm.put(perm.item(j), i)
							perm.put(tmp, j)
							i := i + 1
							j := j - 1
						end
						flip_count := flip_count + 1
					end
					if flip_count > Result then
						Result := flip_count
						from
							i := 0
						until
							i = x
						loop
							maxperm.put(perm1.item(i), i)
							i := i + 1
						end
					end
				end
				-- next permutation
				perm1.put(perm1.item(1), 0)
				perm1.put(p0, 1)
				cnt := count.item(0)
				from
					i := 1
				until
					cnt /= 0
				loop
					rot_rank := i
					tmp := perm1.item(0)
					from
						i := 0
					until
						i > rot_rank
					loop
						j := i + 1
						perm1.put(perm1.item(j), i)
						i := j
					end
					perm1.put(tmp, i)
					cnt := count.item(rot_rank)
				end
			end
		ensure
			Result >= 0
		end

end -- class FANNKUCH
