deferred class OBSERVABLE
	--
	-- Part of the ''Observer'' Design Pattern. An object of this class should notify its observers whenever its
	-- state changes. Use the `notify' feature for that.
	--
	-- See also OBSERVER.
	--

feature {ANY}
	add (o: OBSERVER[like Current]) is
			-- Add an observer that should be notified
		do
			observers.add_last(o)
		end

	remove (o: OBSERVER[like Current]) is
			-- Remove an observer that should not be notified anymore
		require
			has(o)
		local
			i: INTEGER
		do
			i := observers.first_index_of(o)
			observers.remove(i)
		end

	has (o: OBSERVER[like Current]): BOOLEAN is
			-- True if the observer will be notified when the state of Current changes
		do
			Result := observers.has(o)
		end

feature {}
	notify is
			-- Notify all the observers that the state of Current changed
		local
			i: INTEGER
		do
			from
				i := observers.lower
			until
				i > observers.upper
			loop
				observers.item(i).update(Current)
				i := i + 1
			end
		end

feature {}
	observers: COLLECTION[OBSERVER[like Current]]
			-- The collection of observers

invariant
	notifiable: observers /= Void

end -- class OBSERVABLE
