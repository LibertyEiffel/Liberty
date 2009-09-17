deferred class UNDOABLE_COMMAND
	--
	-- Another useful Command, that can be undone.
	--

inherit
	COMMAND

feature {ANY}
	undo: COMMAND is
			-- A command that makes the execution of Current undone.
		deferred
		end

end -- class UNDOABLE_COMMAND
