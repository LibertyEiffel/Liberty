class NCURSES
	--
	-- The NCURSES library gives the user a terminal-independent method of updating character screens with  
	-- reasonable optimization.
	--
	-- NCURSES supports: overall screen, window and pad manipulation; output to windows and pads; reading terminal 
	-- input; control over terminal and curses input and output options; environment query routines; color 
	-- manipulation; use of soft label keys; terminfo capabilities; and access to low-level terminal-manipulation 
	-- routines.
	--
	-- The NCURSES class just provide access to the NCURSES_WRAPPER singleton.
	--

insert
	DISPOSABLE
	NCURSES_TOOLS
	NCURSES_KEYS
	SINGLETON

creation {ANY}
	make

feature {}
	make is
		do
			cursor_visibility := default_visible_cursor_mode
		end

	event_catcher: JOB is
		once
			create {SIMPLE_BACKGROUND_JOB}Result.set_work(agent proceed_events, Void, 1)
		end

	proceed_events: BOOLEAN is
		local
			keypressed: BOOLEAN
			key: INTEGER
		do
			keypressed := get_root_window.poll_keypress_for(2500)
			if not keypressed then
				if idle_signal /= Void then
					idle_signal.emit
				end
			else
				key := get_root_window.last_keypress
				if key = key_resize then
					disable
					check_for_error(refresh = ok)
					enable
					get_root_window.resize(terminal_width, terminal_height)
					if resized_signal /= Void then
						resized_signal.emit
					end
				elseif key_pressed_signal /= Void then
					key_pressed_signal.emit(key)
				end
			end
			Result := is_enabled
		end

	key_pressed_signal: SIGNAL_1[INTEGER]

	resized_signal, idle_signal: SIGNAL_0

	depth: INTEGER

	loop_stack: LOOP_STACK

feature {ANY} -- Events related routines
	when_key_pressed (p: PROCEDURE[TUPLE[INTEGER]]) is
		do
			if key_pressed_signal = Void then
				create key_pressed_signal.make
			end
			key_pressed_signal.connect(p)
		end

	when_resized (p: PROCEDURE[TUPLE]) is
		do
			if resized_signal = Void then
				create resized_signal.make
			end
			resized_signal.connect(p)
		end

	when_idle (p: PROCEDURE[TUPLE]) is
		do
			if idle_signal = Void then
				create idle_signal.make
			end
			idle_signal.connect(p)
		end

feature {ANY} -- To switch the `is_enabled' flag:
	is_enabled: BOOLEAN is
			-- Is `ncurses' ready to be used?
			-- This also means that we not in the normal terminal mode.
			--
			-- See also `enable', `disable'.
		do
			Result := depth > 0
		end

	enable is
			-- To switch from normal terminal mode to `ncurses' mode.
			--
			-- See also `disable', `is_enabled'.
		do
			depth := depth + 1
			if depth = 1 then
				if loop_stack = Void then
					create loop_stack.make
					loop_stack.add_job(event_catcher)
				end
				initscr
				start_color
				set_automatic_kill_policy(True)
				create color_pairs.make
				color_pair_counter := 1
			else
				loop_stack.new_loop
				loop_stack.add_job(event_catcher)
			end
		ensure
			is_enabled
			loop_stack /= Void
		end

	start is
		require
			is_enabled
		do
			get_root_window.redraw_now
			loop_stack.run
		end

	disable is
			-- This procedure must be called when returning to normal terminal mode.
			--
			-- See also `enable', `is_enabled'.
		require
			is_enabled
		do
			if depth = 1 then
				endwin
			end
			depth := depth - 1
		end

feature {ANY} -- Adding jobs to the loop stack:
	add_job (a_job: JOB) is
		require
			is_enabled
		do
			loop_stack.add_job(a_job)
		end

feature {ANY}
	get_root_window: NCURSES_WINDOW is
			-- Returns the root NCURSES_WINDOW.
		require
			is_enabled
		once
			create Result.make_root_window(stdscr)
		end
	
	register_recovery_agent (register: PROCEDURE[TUPLE]) is
		do
			recovery_agents.add_last(register)
		end
	
	unregister_recovery_agent (unregister: PROCEDURE[TUPLE]) is
		local
			i: INTEGER
		do
			i := recovery_agents.last_index_of(unregister)
			recovery_agents.remove(i)
		end
	
	get_color_pair (foreground, background: INTEGER): INTEGER is
			-- Defines new color-pair.
		require
			is_enabled
		local
			dict: HASHED_DICTIONARY[INTEGER, INTEGER]
			index: INTEGER
		do
			if not color_pairs.has(foreground) then
				create dict.make
				color_pairs.put(dict, foreground)
			else
				dict := color_pairs.at(foreground)
			end
			if not dict.has(background) then
				index := color_pair_counter
				color_pair_counter := color_pair_counter + 1
				check_for_error(init_pair(index, foreground, background) = ok)
				dict.put(index, background)
			end
			Result := color_pair(dict.at(background))
		end
	
	buffering_policy: BOOLEAN
			-- Is line buffering enabled?
			--
			-- See also `set_buffering_policy'.
		
	set_buffering_policy (enable_buffering: BOOLEAN) is
			-- Enables/disables line `buffering_policy'.
		require
			is_enabled
		do
			buffering_policy := enable_buffering
			if enable_buffering then
				check_for_error(nocbreak = ok)
			else
				check_for_error(cbreak = ok)
			end
		ensure
			buffering_policy = enable_buffering
		end

	echoing_policy: BOOLEAN
			-- Is there some echo on the screen when fetching keystrokes.
			--
			-- See also `set_echoing_policy'.
	
	set_echoing_policy (enable_echoing: BOOLEAN) is
			-- Enables/disables `echoing_policy'.
		require
			is_enabled
		do
			echoing_policy := enable_echoing
			if enable_echoing then
				check_for_error(echo = ok)
			else
				check_for_error(noecho = ok)
			end
		ensure
			echoing_policy = enable_echoing
		end
	
	automatic_kill_policy: BOOLEAN
			-- ?????
			--
			-- See also `set_automatic_kill_policy'.	
	
	set_automatic_kill_policy (enable_kill_policy: like automatic_kill_policy) is
			-- Enables/disables `automatic_kill_policy'.
		require
			is_enabled
		do
			if enable_kill_policy xor automatic_kill_policy then
				if enable_kill_policy then
					register_recovery_agent(agent disable_and_exit)
				else
					unregister_recovery_agent(agent disable_and_exit)
				end
			end
			automatic_kill_policy := enable_kill_policy
		ensure
			automatic_kill_policy = enable_kill_policy			
		end
	
	push_back_keypress (ch: INTEGER) is
			-- Pushes back the next (fake) keypress.
		require
			is_enabled
		do
			check_for_error(ungetch(ch) = ok)
		end
	
	refresh_pending is
			-- Refreshes all windows which have called `refresh_later'.
		require
			is_enabled
		do
			check_for_error(doupdate = ok)
		end
	
	ok: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "OK"
			}"
		end
	
	err: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ERR"
			}"
		end
	
	a_attributes: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_ATTRIBUTES"
			}"
		end
	
	a_chartext: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_CHARTEXT"
			}"
		end
	
	a_color: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_COLOR"
			}"
		end
	
	a_normal: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_NORMAL"
			}"
		end
	
	a_standout: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_STANDOUT"
			}"
		end
	
	a_underline: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_UNDERLINE"
			}"
		end
	
	a_reverse: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_REVERSE"
			}"
		end
	
	a_blink: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_BLINK"
			}"
		end

	a_dim: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_DIM"
			}"
		end
	
	a_bold: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_BOLD"
			}"
		end

	a_altcharset: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_ALTCHARSET"
			}"
		end
	
	a_invis: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_INVIS"
			}"
		end

	a_protect: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_PROTECT"
			}"
		end

	a_horizontal: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_HORIZONTAL"
			}"
		end

	a_left: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_LEFT"
			}"
		end

	a_low: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_LOW"
			}"
		end

	a_right: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_RIGHT"
			}"
		end

	a_top: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_TOP"
			}"
		end

	a_vertical: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "A_VERTICAL"
			}"
		end

feature {ANY}
	cursor_visibility: INTEGER
			-- See available cursor mode constants in NUMBER_TOOLS.

	set_cursor_visibility (visibility: like cursor_visibility) is
			-- See available cursor mode constants in NUMBER_TOOLS.
		require
			is_enabled
			valid_cursor_visibility(visibility)
		do
			cursor_visibility := visibility
			check_for_error(curs_set(visibility) /= err)
		ensure
			cursor_visibility = visibility
		end
	
feature {NCURSES_WIDGET}
	check_for_error (noerror: BOOLEAN) is
			-- Used to check correct ncurses return codes.
		local
			i: INTEGER
		do
			if not noerror then
				from
					i := recovery_agents.lower
				variant
					recovery_agents.upper - i
				until
					i > recovery_agents.upper
				loop
					recovery_agents.item(i).call([])
					i := i + 1
				end
			end
		end
	
feature{}
	color_pairs: HASHED_DICTIONARY[HASHED_DICTIONARY[INTEGER, INTEGER], INTEGER]
	
	color_pair_counter: INTEGER
	
	recovery_agents: FAST_ARRAY[PROCEDURE[TUPLE]] is
			-- We can safely use `once' here because `NCURSES_WRAPPER' is a singleton
		once
			create Result.with_capacity(1)
		end
	
	disable_and_exit is
		do
			disable
			crash
		end
	
	dispose is
		do
			if is_enabled then
				disable
			else
				-- Probably done manually by the user.
			end
		end
	
	-- Below are plug_in connections to the curses library
	initscr is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "init_screen()"
			}"
		end
	
	stdscr: POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "stdscr"
			}"
		end
	
	endwin is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "endwin()"
			}"
		end
	
	start_color is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "start_color()"
			}"
		end
	
	init_pair (pair, f, b: INTEGER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "init_pair"
			}"
		end
	
	color_pair (index: INTEGER): INTEGER is
			-- Returns defined color-pair.
		require
			is_enabled
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLOR_PAIR"
			}"
		end

	cbreak: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "cbreak()"
			}"
		end
	
	nocbreak: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "nocbreak()"
			}"
		end
	
	echo: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "echo()"
			}"
		end

	noecho: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "noecho()"
			}"
		end
	
	ungetch (ch: INTEGER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "ungetch"
			}"
		end

	doupdate: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "doupdate()"
			}"
		end

	refresh: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "refresh()"
			}"
		end

	curs_set (v: INTEGER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "curs_set"
			}"
		end

	terminal_width: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "COLS"
			}"
		end

	terminal_height: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "LINES"
			}"
		end

invariant
	depth >= 0

end -- class NCURSES
