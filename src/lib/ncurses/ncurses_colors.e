deferred class NCURSES_COLORS
	--
	-- Just insert this class to get colors names available with NCURSES.
	--

feature {}
	black_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_BLACK"
			}"
		end
	
	red_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_RED"
			}"
		end
	
	green_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_GREEN"
			}"
		end
	
	yellow_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_YELLOW"
			}"
		end
	
	blue_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_BLUE"
			}"
		end
	
	magenta_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_MAGENTA"
			}"
		end
	
	cyan_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_CYAN"
			}"
		end
	
	white_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_WHITE"
			}"
		end
	
end -- class NCURSES_COLORS
	
