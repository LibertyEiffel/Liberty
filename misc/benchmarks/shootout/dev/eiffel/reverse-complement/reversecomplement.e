-- The Great Computer Language Shootout
-- http://shootout.alioth.debian.org/
-- reversecomplement v1 for Smarteiffel contributed by jose
class REVERSECOMPLEMENT

insert
	ARGUMENTS
	PLATFORM

create {ANY}
	make

feature {ANY}
	buffer: STRING

	complement: FAST_ARRAY[CHARACTER]

	make
		local
			line: STRING
		do
			make_complement
			create buffer.make(16777216)
			line := io.last_string
			from
				io.read_line
			until
				io.end_of_input
			loop
				if line.is_empty then
				elseif line.first = '>' then
					process
					io.put_string(line)
					io.put_new_line
					buffer.clear_count
				else
					-- while (l > 0 && !isalpha (buffer[l-1])) l--;
					buffer.append(line)
				end
				io.read_line
			end
			if not buffer.is_empty then
				process
			end
		end

	process
		local
			i, j, k: INTEGER
		do
			from
				k := 1
				i := buffer.lower
				j := buffer.upper
			until
				i > j
			loop
				io.put_character(complement.item(buffer.item(j).code))
				buffer.put(complement.item(buffer.item(i).code), j)
				if k = 60 then
					io.put_new_line
					k := 1
				else
					k := k + 1
				end
				i := i + 1
				j := j - 1
			end
			from
				j := buffer.upper
			until
				i > j
			loop
				io.put_character(buffer.item(i))
				if k = 60 then
					io.put_new_line
					k := 1
				else
					k := k + 1
				end
				i := i + 1
			end
			if k > 1 then
				io.put_new_line
			end
		end

	make_complement
		local
			code: INTEGER_16
		do
			create complement.make(1 + Maximum_character_code)
			from
			until
				code > Maximum_character_code
			loop
				complement.put(code.to_character, code)
				code := code + 1
			end
			make_complementar('A', 'T')
			make_complementar('C', 'G')
			make_complementar('B', 'V')
			make_complementar('D', 'H')
			make_complementar('K', 'M')
			make_complementar('R', 'Y')
		end

	make_complementar (a, b: CHARACTER)
		do
			complement.put(a, b.code)
			complement.put(a, b.to_lower.code)
			complement.put(b, a.code)
			complement.put(b, a.to_lower.code)
		end

end -- class REVERSECOMPLEMENT
