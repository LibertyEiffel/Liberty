-- The Computer Language Benchmarks Game
-- http://shootout.alioth.debian.org/
-- contributed by Pierre-Nicolas Clauss
class BINARYTREES

insert
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	min_depth: INTEGER is 4

	max_depth: INTEGER is
		once
			if argument_count >= 1 and then argument(1).is_integer then
				Result := argument(1).to_integer
			end
			Result := Result.max(min_depth + 2)
		end

	stretch_depth: INTEGER is
		do
			Result := max_depth + 1
		end

	make is
		local
			long_lived_tree: NODE; depth, iterations, i, c: INTEGER
		do
			print("stretch tree of depth " + stretch_depth.out + "%T check: " + maketree(stretch_depth, 0).test.out + "%N")
			long_lived_tree := maketree(max_depth, 0)
			from
				depth := min_depth
			until
				depth > max_depth
			loop
				iterations := {INTEGER_32 1} |<< (max_depth - depth + min_depth).to_integer_8
				from
					i := 0
					c := 0
				until
					i >= iterations
				loop
					c := c + maketree(depth, i).test + maketree(depth, -i).test
					i := i + 1
				end
				print((2 * iterations).out + "%T trees of depth " + depth.out + "%T check: " + c.out + "%N")
				depth := depth + 2
			end
			print("long lived tree of depth " + max_depth.out + "%T check: " + long_lived_tree.test.out + "%N")
		end

	maketree (depth, item: INTEGER): NODE is
		local
			d, i: INTEGER
		do
			if depth = 0 then
				create Result.make(item, Void, Void)
			else
				d := depth - 1
				i := 2 * item
				create Result.make(item, maketree(d, i - 1), maketree(d, i))
			end
		end

end -- class BINARYTREES
