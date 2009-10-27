-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_WRITTEN_ASSERTIONS

inherit
	LIBERTY_ASSERTIONS

feature {}
	assertions: TRAVERSABLE[LIBERTY_ASSERTION]

invariant
	assertions /= Void

end
