deferred class DISPOSABLE
	--
	-- All classes whoses instances need a special treatment before
	-- they are disposed of by the garbage collector should inherit
	-- from this class and effect `dispose'.
	--

insert
	ANY

feature {}
	dispose is
			-- Action to be executed just before garbage collection reclaims an
			-- object.
		deferred
		end

end -- class DISPOSABLE
