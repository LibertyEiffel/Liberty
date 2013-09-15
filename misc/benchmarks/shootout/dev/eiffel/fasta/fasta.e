-- The Computer Language Shootout
-- http://shootout.alioth.debian.org/
-- by Frederic Merizen
class FASTA

insert
	ARGUMENTS

creation {ANY}
	make

feature {ANY}
	im: INTEGER is 139968

	ia: INTEGER is 3877

	ic: INTEGER is 29573

	last: INTEGER_32

	random (max: REAL_64): REAL_64 is
		do
			last := (last * ia + ic) \\ im
			Result := max * last / im
		end

	alu: STRING is "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG%
                  %GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA%
                  %CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT%
                  %ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA%
                  %GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG%
                  %AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC%
                  %AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"

	iub: FAST_ARRAY[TUPLE[CHARACTER, REAL_64]] is
		once
			Result := {FAST_ARRAY[TUPLE[CHARACTER, REAL_64]] << ['a', 0.27], ['c', 0.12], ['g', 0.12], ['t', 0.27], ['B', 0.02], ['D', 0.02], ['H', 0.02], ['K', 0.02], ['M', 0.02], ['N', 0.02], ['R', 0.02], ['S', 0.02], ['V', 0.02], ['W', 0.02], ['Y', 0.02] >> }
		end

	homo_sapiens: FAST_ARRAY[TUPLE[CHARACTER, REAL_64]] is
		once
			Result := {FAST_ARRAY[TUPLE[CHARACTER, REAL_64]] << ['a', 0.3029549426680], ['c', 0.1979883004921], ['g', 0.1975473066391], ['t', 0.3015094502008] >> }
		end

	make_cumulative (a: FAST_ARRAY[TUPLE[CHARACTER, REAL_64]]) is
		local
			cp: REAL_64; i: INTEGER; t: TUPLE[CHARACTER, REAL_64]
		do
			cp := 0.0
			from
				i := a.lower
			until
				i > a.upper
			loop
				t := a.item(i)
				cp := cp + t.second
				t.set_second(cp)
				i := i + 1
			end
		end

	make is
		local
			n: INTEGER
		do
			last := 42
			make_cumulative(homo_sapiens)
			make_cumulative(iub)
			if argument_count > 0 then
				n := argument(1).to_integer
			else
				n := 1000
			end
			make_repeat_fasta("ONE", "Homo sapiens alu", alu, n * 2, std_output)
			make_random_fasta("TWO", "IUB ambiguity codes", iub, n * 3, std_output)
			make_random_fasta("THREE", "Homo sapiens frequency", homo_sapiens, n * 5, std_output)
		end

	select_random (a: FAST_ARRAY[TUPLE[CHARACTER, REAL_64]]): CHARACTER is
		local
			r: REAL_64; i: INTEGER; stop: BOOLEAN; t: TUPLE[CHARACTER, REAL_64]
		do
			r := random(1.0)
			from
				i := a.lower
			until
				stop
			loop
				t := a.item(i)
				stop := r < t.second or else i = a.upper
				if stop then
					Result := t.first
				end
				i := i + 1
			end
		end

	line_length: INTEGER is 60

	make_random_fasta (id, desc: STRING; a: FAST_ARRAY[TUPLE[CHARACTER, REAL_64]]; n: INTEGER; s: OUTPUT_STREAM) is
		local
			i, j: INTEGER
		do
			s.put_character('>')
			s.put_string(id)
			s.put_character(' ')
			s.put_string(desc)
			s.put_new_line
			from
				i := n
			until
				i < 1
			loop
				from
					j := i.min(line_length)
				until
					j < 1
				loop
					s.put_character(select_random(a))
					j := j - 1
				end
				s.put_new_line
				i := i - line_length
			end
		end

	make_repeat_fasta (id, desc, a: STRING; n: INTEGER; s: OUTPUT_STREAM) is
		local
			i, j, k, kn: INTEGER
		do
			s.put_character('>')
			s.put_string(id)
			s.put_character(' ')
			s.put_string(desc)
			s.put_new_line
			kn := a.count
			k := 1
			from
				i := n
			until
				i < 1
			loop
				from
					j := i.min(line_length)
				until
					j < 1
				loop
					if k > kn then
						k := 1
					end
					io.put_character(a.item(k))
					k := k + 1
					j := j - 1
				end
				s.put_new_line
				i := i - line_length
			end
		end

end -- class FASTA
