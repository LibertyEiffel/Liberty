-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_POSITIONABLE

feature {ANY}
	position: LIBERTY_POSITION

invariant
	position /= Void

end
