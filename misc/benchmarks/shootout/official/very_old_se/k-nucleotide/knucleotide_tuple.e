class KNUCLEOTIDE_TUPLE

inherit
	COMPARABLE

create make

feature {}
	make(f: like first; s: like second)
		do
			first := f
			second := s
		end

feature
	first: INTEGER

	second: STRING

	infix "<" (other: like Current): BOOLEAN
		do
			Result := other.first < first or else first = other.first and then second < other.second
		end

	set_first(f: like first)
      do
         first := f
      end

end
