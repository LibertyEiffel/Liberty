class NCURSES_TOOLS
	--
	-- To share the acces to the `ncurses' singleton.
	-- Just insert this class in order to use NCURSES.
	-- See example in the SmartEiffel/tutorial/ncurses directory.
	--

feature {}
	ncurses: NCURSES is
			-- Access to the `ncurses' singleton.
		once
			create Result.make
		end

feature{ANY}
	invisible_cursor_mode: INTEGER is 0
			-- In this mode the cursor is invisible.
	
	default_visible_cursor_mode: INTEGER is 1
			-- The default visible cursor mode.
	
	special_visible_cursor_mode: INTEGER is 2
			-- In this mode cursor may blink in a more special or in a more visible way.
	
	valid_cursor_visibility (code: INTEGER): BOOLEAN is
			-- Chack that code is one of `invisible_cursor_mode', `default_visible_cursor_mode' 
			-- or `special_visible_cursor_mode'.
		do
			inspect
				code
			when invisible_cursor_mode, default_visible_cursor_mode, special_visible_cursor_mode then
				Result := True
			else
				check
					not Result
				end
			end
		ensure
			Result = code.in_range(invisible_cursor_mode, special_visible_cursor_mode)
		end
	
end -- class NCURSES_TOOLS
	
