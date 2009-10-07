deferred class LIBERTY_FEATURE_ROUTINE

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		end

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

	set_locals (a_locals: like locals) is
		do
			locals := a_locals
		end

feature {}
	make (a_instructions: like block_instructions) is
		require
			a_instructions /= Void
		do
			make_late_binding
			block_instructions := a_instructions
		ensure
			block_instructions = a_instructions
		end

invariant
	block_instructions /= Void

end
