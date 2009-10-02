class LIBERTY_DEBUG

inherit
	LIBERTY_INSTRUCTION

feature {ANY}
	keys: TRAVERSABLE[STRING]
	instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

feature {}
	make (a_keys: like keys; a_instructions: like instructions) is
		require
			a_keys /= Void
			a_instructions /= Void
		do
			keys := a_keys
			instructions := a_instructions
		ensure
			keys = a_keys
			instructions = a_instructions
		end

invariant
	keys /= Void
	instructions /= Void

end
