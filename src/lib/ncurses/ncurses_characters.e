deferred class NCURSES_CHARACTERS
	--
	-- Just insert this class to get keyboard key code names available with NCURSES.
	--

feature {}
	space: INTEGER is
		once
			Result := ' '.to_integer_8
		end

	return: INTEGER is
		once
			Result := '%N'.to_integer_8
		end

	upper_left_corner: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_ULCORNER"
		}"
		end

	lower_left_corner: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_LLCORNER"
		}"
		end

	upper_right_corner: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_URCORNER"
		}"
		end

	lower_right_corner: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_LRCORNER"
		}"
		end

	left_tee: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_LTEE"
		}"
		end

	right_tee: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_RTEE"
		}"
		end

	bottom_tee: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_BTEE"
		}"
		end

	top_tee: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_TTEE"
		}"
		end

	horizontal_line: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_HLINE"
		}"
		end

	vertical_line: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_VLINE"
		}"
		end

	plus: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_PLUS"
		}"
		end

	scanline1: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_S1"
		}"
		end

	scanline9: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_S9"
		}"
		end

	diamond: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_DIAMOND"
		}"
		end

	checker_board: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_CKBOARD"
		}"
		end

	degree: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_DEGREE"
		}"
		end

	plus_minus: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_PLMINUS"
		}"
		end

	bullet: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_BULLET"
		}"
		end

	left_arrow: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_LARROW"
			}"
		end

	right_arrow: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_RARROW"
		}"
		end

	down_arrow: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_DARROW"
		}"
		end

	up_arrow: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_UARROW"
		}"
		end

	board: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_BOARD"
		}"
		end

	lantern: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_LANTERN"
		}"
		end

	block: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_BLOCK"
		}"
		end

	scanline3: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_S3"
		}"
		end

	scanline7: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_S7"
		}"
		end

	less_or_equal: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_LEQUAL"
		}"
		end

	greater_or_equal: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_GEQUAL"
		}"
		end

	pi: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_PI"
		}"
		end

	not_equal: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_NEQUAL"
		}"
		end

	sterling: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ACS_STERLING"
		}"
		end

end -- class NCURSES_CHARACTERS
	
