deferred class SHARED_SETTINGS
	 -- Insert this class to access the `settings' singleton.

    -- It also provide commodity "proxy" setters and queries.
	
feature 
	settings: SETTINGS is
			-- The singleton to access all the shared settings
		once 
			create Result
			Result.set_directory(once ".") -- Set current directory as default
			-- TODO: Remove the above shameful assumption "." for current
			-- directory
		end

	-- Syntactic sugar
	verbose: BOOLEAN is do Result:=settings.verbose end
	global: BOOLEAN is do Result:=settings.global end
	directory: STRING is do Result:=settings.directory end
	
	use_naturals is do settings.use_naturals end
	use_integers is do settings.use_integers end
	are_naturals_used: BOOLEAN is do Result:=settings.are_naturals_used end

end
