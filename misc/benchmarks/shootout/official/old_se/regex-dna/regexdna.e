--
-- The Computer Language Shotout
-- http://shootout.alioth.debian.org/
--
-- Contributed by Leland McInnes
--
class REGEXDNA

insert
	REGULAR_EXPRESSION_BUILDER

create {ANY}
	make

feature {ANY}
	make is
			-- Perform regex-dna benchmark
		local
			initial_length, cleaned_length, final_length: INTEGER; cleaning_regex: REGULAR_EXPRESSION
		do
			create sequence.make_empty
			io.read_tail_in(sequence)
			initial_length := sequence.upper
			cleaning_regex := convert_posix_pattern(">.*%N|%N")
			check
				cleaning_regex /= Void
			end
			cleaning_regex.prepare_substitution("")
			cleaning_regex.substitute_all_in(sequence)
			cleaned_length := sequence.count
			count_variants
			expand_patterns
			final_length := sequence.count
			io.put_new_line
			io.put_integer(initial_length)
			io.put_new_line
			io.put_integer(cleaned_length)
			io.put_new_line
			io.put_integer(final_length)
			io.put_new_line
		end

	count_variants is
			-- Count the number of occurences of each variant pattern
		local
			i, count: INTEGER; match_pattern: REGULAR_EXPRESSION; variants: ARRAY[STRING]
		do
			variants :=
			<<"agggtaaa|tttaccct", "[cgt]gggtaaa|tttaccc[acg]", "a[act]ggtaaa|tttacc[agt]t", "ag[act]gtaaa|tttac[agt]ct", "agg[act]taaa|ttta[agt]cct",
				"aggg[acg]aaa|ttt[cgt]ccct", "agggt[cgt]aa|tt[acg]accct", "agggta[cgt]a|t[acg]taccct", "agggtaa[cgt]|[acg]ttaccct">>
			from
				i := variants.lower
			until
				i > variants.upper
			loop
				match_pattern := convert_posix_pattern(variants.item(i))
				check
					match_pattern /= Void
				end
				from
					count := 0
				until
					not match_pattern.match_next(sequence)
				loop
					count := count + 1
				end
				io.put_string(variants.item(i) + " ")
				io.put_integer(count)
				io.put_new_line
				i := i + 1
			end
		end

	expand_patterns is
			-- Expand IUB code alternatives
		local
			i: INTEGER; iub_code: REGULAR_EXPRESSION; iub_code_patterns, replacement_patterns: ARRAY[STRING]
		do
			iub_code_patterns :=
			<<"B", "D", "H", "K", "M", "N", "R", "S", "V", "W", "Y">>
			replacement_patterns :=
			<<"(c|g|t)", "(a|g|t)", "(a|c|t)", "(g|t)", "(a|c)", "(a|c|g|t)", "(a|g)", "(c|g)", "(a|c|g)", "(a|t)", "(c|t)">>
			from
				i := iub_code_patterns.lower
			until
				i > iub_code_patterns.upper
			loop
				iub_code := convert_posix_pattern(iub_code_patterns.item(i))
				check
					iub_code /= Void
				end
				iub_code.prepare_substitution(replacement_patterns.item(i))
				iub_code.substitute_all_in(sequence)
				i := i + 1
			end
		end

feature {} -- Implementation
	sequence: STRING

end -- class REGEXDNA
