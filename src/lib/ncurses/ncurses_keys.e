-- See the Copyright notice at the end of this file.
--
deferred class NCURSES_KEYS
	--
	-- Just insert this class to get keyboard key code names available with NCURSES.
	--

feature {}
	key_escape: INTEGER is 27

	key_return: INTEGER is 10

	-- Below are integer equivalent for special "function" keys.
	-- Is it necessary to keep all of them ?
	key_min: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_MIN"
		}"
		end

	key_break: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_BREAK"
		}"
		end

	key_sreset: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SRESET"
		}"
		end

	key_reset: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_RESET"
		}"
		end

	key_down: INTEGER is
			-- The Down arrow of the keyboard.
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_DOWN"
		}"
		end

	key_up: INTEGER is
			-- The Up arrow of the keyboard.
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_UP"
		}"
		end

	key_left: INTEGER is
			-- The Left arrow of the keyboard.
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_LEFT"
		}"
		end

	key_right: INTEGER is
			-- The Right arrow of the keyboard.
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_RIGHT"
		}"
		end

	key_home: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_HOME"
		}"
		end

	key_backspace: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_BACKSPACE"
		}"
		end

	key_dl: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_DL"
		}"
		end

	key_il: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_IL"
		}"
		end

	key_dc: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_DC"
		}"
		end

	key_ic: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_IC"
		}"
		end

	key_eic: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_EIC"
		}"
		end

	key_clear: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_CLEAR"
		}"
		end

	key_eos: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_EOS"
		}"
		end

	key_eol: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_EOL"
		}"
		end

	key_sf: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SF"
		}"
		end

	key_sr: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SR"
		}"
		end

	key_next_page: INTEGER is
			-- Also labeled "Page Down" on some keyboards.
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_NPAGE"
		}"
		end

	key_previous_page: INTEGER is
			-- Also labeled "Page Up" on some keyboards.
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_PPAGE"
		}"
		end

	key_stab: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_STAB"
		}"
		end

	key_ctab: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_CTAB"
		}"
		end

	key_catab: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_CATAB"
		}"
		end

	key_enter: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_ENTER"
		}"
		end

	key_print: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_PRINT"
		}"
		end

	key_ll: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_LL"
		}"
		end

	key_a1: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_A1"
		}"
		end

	key_a3: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_A3"
		}"
		end

	key_b2: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_B2"
		}"
		end

	key_c1: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_C1"
		}"
		end

	key_c3: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_C3"
		}"
		end

	key_btab: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_BTAB"
		}"
		end

	key_beg: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_BEG"
		}"
		end

	key_cancel: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_CANCEL"
		}"
		end

	key_close: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_CLOSE"
		}"
		end

	key_command: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_COMMAND"
		}"
		end

	key_copy: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_COPY"
		}"
		end

	key_create: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_CREATE"
		}"
		end

	key_end: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_END"
		}"
		end

	key_exit: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_EXIT"
		}"
		end

	key_find: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_FIND"
		}"
		end

	key_help: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_HELP"
		}"
		end

	key_mark: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_MARK"
		}"
		end

	key_message: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_MESSAGE"
		}"
		end

	key_move: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_MOVE"
		}"
		end

	key_next: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_NEXT"
		}"
		end

	key_open: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_OPEN"
		}"
		end

	key_options: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_OPTIONS"
		}"
		end

	key_previous: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_PREVIOUS"
		}"
		end

	key_redo: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_REDO"
		}"
		end

	key_reference: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_REFERENCE"
		}"
		end

	key_refresh: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_REFRESH"
		}"
		end

	key_replace: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_REPLACE"
		}"
		end

	key_restart: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_RESTART"
		}"
		end

	key_resume: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_RESUME"
		}"
		end

	key_save: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SAVE"
		}"
		end

	key_sbeg: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SBEG"
		}"
		end

	key_scancel: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SCANCEL"
		}"
		end

	key_scommand: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SCOMMAND"
		}"
		end

	key_scopy: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SCOPY"
		}"
		end

	key_screate: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SCREATE"
		}"
		end

	key_sdc: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SDC"
		}"
		end

	key_sdl: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SDL"
		}"
		end

	key_select: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SELECT"
		}"
		end

	key_send: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SEND"
		}"
		end

	key_seol: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SEOL"
		}"
		end

	key_sexit: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SEXIT"
		}"
		end

	key_sfind: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SFIND"
		}"
		end

	key_shelp: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SHELP"
		}"
		end

	key_shome: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SHOME"
		}"
		end

	key_sic: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SIC"
		}"
		end

	key_sleft: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SLEFT"
		}"
		end

	key_smessage: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SMESSAGE"
		}"
		end

	key_smove: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SMOVE"
		}"
		end

	key_snext: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SNEXT"
		}"
		end

	key_soptions: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SOPTIONS"
		}"
		end

	key_sprevious: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SPREVIOUS"
		}"
		end

	key_sprint: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SPRINT"
		}"
		end

	key_sredo: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SREDO"
		}"
		end

	key_sreplace: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SREPLACE"
		}"
		end

	key_sright: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SRIGHT"
		}"
		end

	key_srsume: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SRSUME"
		}"
		end

	key_ssave: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SSAVE"
		}"
		end

	key_ssuspend: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SSUSPEND"
		}"
		end

	key_sundo: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SUNDO"
		}"
		end

	key_suspend: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_SUSPEND"
		}"
		end

	key_undo: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_UNDO"
		}"
		end

	key_mouse: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_MOUSE"
		}"
		end

	key_resize: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_RESIZE"
		}"
		end

	key_event: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_EVENT"
		}"
		end

	key_max: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_MAX"
		}"
		end

	key_f0: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F0"
		}"
		end

	key_f1: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(1)"
		}"
		end

	key_f2: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(2)"
		}"
		end

	key_f3: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(3)"
		}"
		end

	key_f4: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(4)"
		}"
		end

	key_f5: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(5)"
		}"
		end

	key_f6: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(6)"
		}"
		end

	key_f7: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(7)"
		}"
		end

	key_f8: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(8)"
		}"
		end

	key_f9: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(9)"
		}"
		end

	key_f10: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(10)"
		}"
		end

	key_f11: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(11)"
		}"
		end

	key_f12: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F(12)"
		}"
		end

	key_function (num: INTEGER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "KEY_F"
		}"
		end

end -- class NCURSES_KEYS
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN, Pierre-Nicolas CLAUSS
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
	
