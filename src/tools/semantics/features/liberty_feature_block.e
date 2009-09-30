deferred class LIBERTY_FEATURE_BLOCK

inherit
	LIBERTY_FEATURE_ROUTINE

feature {ANY}
	locals: DICTIONARY[LIBERTY_LOCAL, STRING]

	block_instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

	rescue_instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

feature {LIBERTY_TYPE_BUILDER}
	set_rescue (a_rescue: like rescue_instructions) is
		require
			rescue_instructions = Void
			a_rescue /= Void
		do
			rescue_instructions := a_rescue
		ensure
			rescue_instructions = a_rescue
		end

	add_local (a_local: LIBERTY_LOCAL) is
		require
			not locals.has(a_local.name)
		do
			locals.add(a_local, a_local.name)
		ensure
			locals.has(a_local.name)
		end

feature {}
	make (a_instructions: like block_instructions) is
		require
			a_instructions /= Void
		do
			block_instructions := a_instructions
			create {HASHED_DICTIONARY[LIBERTY_LOCAL, STRING]}locals.make
		ensure
			block_instructions = a_instructions
		end

invariant
	block_instructions /= Void
	locals /= Void

end
