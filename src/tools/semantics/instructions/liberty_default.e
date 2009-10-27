-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_DEFAULT

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

feature {}
	make (a_instructions: like instructions) is
		require
			a_instructions /= Void
		do
			instructions := a_instructions
		ensure
			instructions = a_instructions
		end

invariant
	instructions /= Void

end
