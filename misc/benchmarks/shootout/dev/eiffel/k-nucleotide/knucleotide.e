--
-- http://shootout.alioth.debian.org/
-- k-nucleotide for SE2.1 by jose
--
class KNUCLEOTIDE

inherit
	ABSTRACT_SORTER[TUPLE[INTEGER, STRING]]

insert
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	make
		local
			mem: MEMORY
		do
			mem.collection_off
			create array.make(100000)
			create sequence.make(100000)
			create dictionary.with_capacity(10000)
			read
			write_frequencies(1)
			write_frequencies(2)
			write_count(once "GGT")
			write_count(once "GGTA")
			write_count(once "GGTATT")
			write_count(once "GGTATTTTAATT")
			write_count(once "GGTATTTTAATTTATAGT")
		end

	write_frequencies (length: INTEGER)
		local
			i: INTEGER; coef: REAL_64
		do
			count(length)
			array.clear_count
			dictionary.item_map_in(array)
			sort(array)
			coef := {INTEGER_32 100} / (1 + sequence.count - length)
			from
				i := array.lower
			until
				i > array.upper
			loop
				std_output.put_string(array.item(i).second)
				std_output.put_character(' ')
				std_output.put_real_format(coef * array.item(i).first, 3)
				std_output.put_new_line
				i := i + 1
			end
			std_output.put_new_line
		end

	write_count (match: STRING)
		local
			n: INTEGER
		do
			count(match.count)
			tuple := dictionary.reference_at(match)
			if tuple /= Void then
				n := tuple.first
			end
			std_output.put_integer(n)
			std_output.put_character('%T')
			std_output.put_string(match)
			std_output.put_new_line
		end

	sequence: STRING

	part: STRING

	tuple: TUPLE[INTEGER, STRING]

	dictionary: HASHED_DICTIONARY[like tuple, like part]

	array: FAST_ARRAY[like tuple]

	read
		do
			from
				std_input.read_line
			until
				std_input.end_of_input or else std_input.last_string.has_prefix(once ">THREE")
			loop
				std_input.read_line
			end
			if not std_input.end_of_input then
				from
					std_input.read_line
				until
					std_input.end_of_input or else std_input.last_string.first = '>'
				loop
					if std_input.last_string.first /= ';' then
						sequence.append(std_input.last_string)
					end
					std_input.read_line
				end
				sequence.to_upper
			end
		end

	count (length: INTEGER)
		local
			pos, i, j: INTEGER
		do
			dictionary.clear_count
			from
				part := sequence.substring(1, length)
				tuple := [{INTEGER_32 1}, part.twin]
				dictionary.add(tuple, tuple.second)
				pos := length
			until
				pos >= sequence.upper
			loop
				pos := pos + 1
				from
					i := 1
				until
					i = length
				loop
					j := i + 1
					part.put(part.item(j), i)
					i := j
				end
				part.put(sequence.item(pos), length)
				tuple := dictionary.reference_at(part)
				if tuple = Void then
					tuple := [{INTEGER_32 1}, part.twin]
					dictionary.add(tuple, tuple.second)
				else
					tuple.set_first(1 + tuple.first)
				end
			end
		end

	lt (a, b: like tuple): BOOLEAN
		do
			Result := b.first < a.first or else a.first = b.first and then a.second < b.second
		end

end -- class KNUCLEOTIDE
