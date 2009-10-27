-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_ENTITY
--
-- Anything with a name and a result type.
-- Most entities have a non-Void result type, except procedures.
--
-- See also LIBERTY_WRITABLE
--

inherit
	LIBERTY_POSITIONABLE

feature {ANY}
	name: FIXED_STRING is
		deferred
		end

	result_type: LIBERTY_TYPE is
		require
			is_result_type_set
		deferred
		ensure
			-- Result may be Void in the particular case of procedures
		end

	is_result_type_set: BOOLEAN is
			-- True if the `result_type' may be queried. False if the object is not yet fully reconciled.
		deferred
		end

invariant
	name /= Void

end
