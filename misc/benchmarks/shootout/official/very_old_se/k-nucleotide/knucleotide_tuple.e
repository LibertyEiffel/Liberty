class KNUCLEOTIDE_TUPLE

inherit
	COMPARABLE

creation make

feature {}
	make(f: like first; s: like second) is
		do
			first := f
			second := s
		end

feature
	first: INTEGER

	second: STRING

	infix "<" (other: like Current): BOOLEAN is
		do
			Result := other.first < first or else first = other.first and then second < other.second
		end

	set_first(f: like first) is
      do
         first := f
      end

end
