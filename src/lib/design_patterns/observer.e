deferred class OBSERVER[O_ -> OBSERVABLE]
	--
	-- The "Observer" Design Pattern. An Observer must be updated by an Observable (see the class OBSERVABLE in
	-- the lib/abilities cluster).
	--

feature {OBSERVABLE}
	update (o: O_) is
			-- The observable object `o' wants Current to be updated
		require
			o /= Void
		deferred
		end

end -- class OBSERVER
