deferred class FACTORY[O_]
	--
	-- The ''Abstract Factory'' Design Pattern.
	--
	-- Usage: usually, write one FACTORY per concrete class. Several can be merged in a single class using
	-- Eiffel renaming facilities:
	--
	--  class FRUIT_FACTORY
	--  insert
	--     FACTORY[APPLE] rename new as new_apple end
	--     FACTORY[PEAR]  rename new as new_pear end
	--     ...
	--  end
	--

feature {ANY}
	new: O_ is
			-- Create a new object.
		deferred
		ensure
			Result /= Void
		end

end -- class FACTORY
