-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class NCURSES_KEYS
   --
   -- Just insert this class to get keyboard key code names available with NCURSES.
   --

feature {}
   key_escape: INTEGER 27

   key_return: INTEGER 10

   -- Below are integer equivalent for special "function" keys.
   -- Is it necessary to keep all of them ?
   key_min: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_MIN"
      }"
      end

   key_break: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_BREAK"
      }"
      end

   key_sreset: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SRESET"
      }"
      end

   key_reset: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_RESET"
      }"
      end

   key_down: INTEGER
         -- The Down arrow of the keyboard.
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_DOWN"
      }"
      end

   key_up: INTEGER
         -- The Up arrow of the keyboard.
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_UP"
      }"
      end

   key_left: INTEGER
         -- The Left arrow of the keyboard.
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_LEFT"
      }"
      end

   key_right: INTEGER
         -- The Right arrow of the keyboard.
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_RIGHT"
      }"
      end

   key_home: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_HOME"
      }"
      end

   key_backspace: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_BACKSPACE"
      }"
      end

   key_dl: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_DL"
      }"
      end

   key_il: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_IL"
      }"
      end

   key_dc: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_DC"
      }"
      end

   key_ic: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_IC"
      }"
      end

   key_eic: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_EIC"
      }"
      end

   key_clear: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_CLEAR"
      }"
      end

   key_eos: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_EOS"
      }"
      end

   key_eol: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_EOL"
      }"
      end

   key_sf: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SF"
      }"
      end

   key_sr: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SR"
      }"
      end

   key_next_page: INTEGER
         -- Also labeled "Page Down" on some keyboards.
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_NPAGE"
      }"
      end

   key_previous_page: INTEGER
         -- Also labeled "Page Up" on some keyboards.
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_PPAGE"
      }"
      end

   key_stab: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_STAB"
      }"
      end

   key_ctab: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_CTAB"
      }"
      end

   key_catab: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_CATAB"
      }"
      end

   key_enter: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_ENTER"
      }"
      end

   key_print: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_PRINT"
      }"
      end

   key_ll: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_LL"
      }"
      end

   key_a1: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_A1"
      }"
      end

   key_a3: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_A3"
      }"
      end

   key_b2: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_B2"
      }"
      end

   key_c1: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_C1"
      }"
      end

   key_c3: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_C3"
      }"
      end

   key_btab: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_BTAB"
      }"
      end

   key_beg: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_BEG"
      }"
      end

   key_cancel: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_CANCEL"
      }"
      end

   key_close: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_CLOSE"
      }"
      end

   key_command: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_COMMAND"
      }"
      end

   key_copy: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_COPY"
      }"
      end

   key_create: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_CREATE"
      }"
      end

   key_end: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_END"
      }"
      end

   key_exit: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_EXIT"
      }"
      end

   key_find: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_FIND"
      }"
      end

   key_help: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_HELP"
      }"
      end

   key_mark: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_MARK"
      }"
      end

   key_message: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_MESSAGE"
      }"
      end

   key_move: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_MOVE"
      }"
      end

   key_next: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_NEXT"
      }"
      end

   key_open: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_OPEN"
      }"
      end

   key_options: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_OPTIONS"
      }"
      end

   key_previous: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_PREVIOUS"
      }"
      end

   key_redo: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_REDO"
      }"
      end

   key_reference: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_REFERENCE"
      }"
      end

   key_refresh: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_REFRESH"
      }"
      end

   key_replace: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_REPLACE"
      }"
      end

   key_restart: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_RESTART"
      }"
      end

   key_resume: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_RESUME"
      }"
      end

   key_save: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SAVE"
      }"
      end

   key_sbeg: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SBEG"
      }"
      end

   key_scancel: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SCANCEL"
      }"
      end

   key_scommand: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SCOMMAND"
      }"
      end

   key_scopy: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SCOPY"
      }"
      end

   key_screate: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SCREATE"
      }"
      end

   key_sdc: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SDC"
      }"
      end

   key_sdl: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SDL"
      }"
      end

   key_select: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SELECT"
      }"
      end

   key_send: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SEND"
      }"
      end

   key_seol: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SEOL"
      }"
      end

   key_sexit: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SEXIT"
      }"
      end

   key_sfind: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SFIND"
      }"
      end

   key_shelp: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SHELP"
      }"
      end

   key_shome: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SHOME"
      }"
      end

   key_sic: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SIC"
      }"
      end

   key_sleft: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SLEFT"
      }"
      end

   key_smessage: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SMESSAGE"
      }"
      end

   key_smove: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SMOVE"
      }"
      end

   key_snext: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SNEXT"
      }"
      end

   key_soptions: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SOPTIONS"
      }"
      end

   key_sprevious: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SPREVIOUS"
      }"
      end

   key_sprint: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SPRINT"
      }"
      end

   key_sredo: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SREDO"
      }"
      end

   key_sreplace: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SREPLACE"
      }"
      end

   key_sright: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SRIGHT"
      }"
      end

   key_srsume: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SRSUME"
      }"
      end

   key_ssave: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SSAVE"
      }"
      end

   key_ssuspend: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SSUSPEND"
      }"
      end

   key_sundo: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SUNDO"
      }"
      end

   key_suspend: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_SUSPEND"
      }"
      end

   key_undo: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_UNDO"
      }"
      end

   key_mouse: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_MOUSE"
      }"
      end

   key_resize: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_RESIZE"
      }"
      end

   key_event: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_EVENT"
      }"
      end

   key_max: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_MAX"
      }"
      end

   key_f0: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F0"
      }"
      end

   key_f1: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(1)"
      }"
      end

   key_f2: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(2)"
      }"
      end

   key_f3: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(3)"
      }"
      end

   key_f4: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(4)"
      }"
      end

   key_f5: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(5)"
      }"
      end

   key_f6: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(6)"
      }"
      end

   key_f7: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(7)"
      }"
      end

   key_f8: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(8)"
      }"
      end

   key_f9: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(9)"
      }"
      end

   key_f10: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(10)"
      }"
      end

   key_f11: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(11)"
      }"
      end

   key_f12: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F(12)"
      }"
      end

   key_function (num: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "KEY_F"
      }"
      end

end -- class NCURSES_KEYS

--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
