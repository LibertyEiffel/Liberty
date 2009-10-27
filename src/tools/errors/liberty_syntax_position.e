-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_SYNTAX_POSITION

inherit
	LIBERTY_POSITION

create {LIBERTY_ERRORS}
	make

feature {ANY}
	source: STRING

feature {}
	make (a_index: like index; a_source: like source) is
		require
			a_source /= Void
			a_index.in_range(a_source.lower, a_source.upper)
		do
			index := a_index
			source := a_source
		ensure
			index = a_index
			source = a_source
		end

invariant
	source /= Void

end
