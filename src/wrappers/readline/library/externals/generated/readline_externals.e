-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class READLINE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	funmap: POINTER
               -- funmap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "funmap"
               }"
               end

       address_of_funmap: POINTER
               -- Address of funmap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&funmap"
               }"
               end

       set_funmap (a_value: POINTER)
               -- Set variable funmap value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_funmap"
               }"
               end

	readline (argument_1: POINTER): POINTER 

		-- function readline (in `/usr/include/readline/readline.h')
               -- readline
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readline"
               }"
               end

	rl_abort (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_abort (in `/usr/include/readline/readline.h')
               -- rl_abort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_abort"
               }"
               end

	rl_add_defun (argument_1: POINTER; argument_2: POINTER; argument_3: INTEGER): INTEGER 

		-- function rl_add_defun (in `/usr/include/readline/readline.h')
               -- rl_add_defun
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_add_defun"
               }"
               end

	rl_add_funmap_entry (argument_1: POINTER; argument_2: POINTER): INTEGER 

		-- function rl_add_funmap_entry (in `/usr/include/readline/readline.h')
               -- rl_add_funmap_entry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_add_funmap_entry"
               }"
               end

	rl_add_undo (argument_1: INTEGER; argument_2: INTEGER; argument_3: INTEGER; argument_4: POINTER) 

		-- function rl_add_undo (in `/usr/include/readline/readline.h')
               -- rl_add_undo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_add_undo"
               }"
               end

	rl_alphabetic (argument_1: INTEGER): INTEGER 

		-- function rl_alphabetic (in `/usr/include/readline/readline.h')
               -- rl_alphabetic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_alphabetic"
               }"
               end

	rl_already_prompted: INTEGER
               -- rl_already_prompted
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_already_prompted"
               }"
               end

       address_of_rl_already_prompted: POINTER
               -- Address of rl_already_prompted
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_already_prompted"
               }"
               end

       set_rl_already_prompted (a_value: INTEGER)
               -- Set variable rl_already_prompted value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_already_prompted"
               }"
               end

	rl_arrow_keys (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_arrow_keys (in `/usr/include/readline/readline.h')
               -- rl_arrow_keys
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_arrow_keys"
               }"
               end

	rl_attempted_completion_function: POINTER
               -- rl_attempted_completion_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_attempted_completion_function"
               }"
               end

       address_of_rl_attempted_completion_function: POINTER
               -- Address of rl_attempted_completion_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_attempted_completion_function"
               }"
               end

       set_rl_attempted_completion_function (a_value: POINTER)
               -- Set variable rl_attempted_completion_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_attempted_completion_function"
               }"
               end

	rl_attempted_completion_over: INTEGER
               -- rl_attempted_completion_over
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_attempted_completion_over"
               }"
               end

       address_of_rl_attempted_completion_over: POINTER
               -- Address of rl_attempted_completion_over
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_attempted_completion_over"
               }"
               end

       set_rl_attempted_completion_over (a_value: INTEGER)
               -- Set variable rl_attempted_completion_over value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_attempted_completion_over"
               }"
               end

	rl_backward (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward (in `/usr/include/readline/readline.h')
               -- rl_backward
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward"
               }"
               end

	rl_backward_byte (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward_byte (in `/usr/include/readline/readline.h')
               -- rl_backward_byte
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward_byte"
               }"
               end

	rl_backward_char (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward_char (in `/usr/include/readline/readline.h')
               -- rl_backward_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward_char"
               }"
               end

	rl_backward_char_search (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward_char_search (in `/usr/include/readline/readline.h')
               -- rl_backward_char_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward_char_search"
               }"
               end

	rl_backward_kill_line (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward_kill_line (in `/usr/include/readline/readline.h')
               -- rl_backward_kill_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward_kill_line"
               }"
               end

	rl_backward_kill_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward_kill_word (in `/usr/include/readline/readline.h')
               -- rl_backward_kill_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward_kill_word"
               }"
               end

	rl_backward_menu_complete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward_menu_complete (in `/usr/include/readline/readline.h')
               -- rl_backward_menu_complete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward_menu_complete"
               }"
               end

	rl_backward_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_backward_word (in `/usr/include/readline/readline.h')
               -- rl_backward_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_backward_word"
               }"
               end

	rl_basic_quote_characters: POINTER
               -- rl_basic_quote_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_basic_quote_characters"
               }"
               end

       address_of_rl_basic_quote_characters: POINTER
               -- Address of rl_basic_quote_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_basic_quote_characters"
               }"
               end

       set_rl_basic_quote_characters (a_value: POINTER)
               -- Set variable rl_basic_quote_characters value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_basic_quote_characters"
               }"
               end

	rl_basic_word_break_characters: POINTER
               -- rl_basic_word_break_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_basic_word_break_characters"
               }"
               end

       address_of_rl_basic_word_break_characters: POINTER
               -- Address of rl_basic_word_break_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_basic_word_break_characters"
               }"
               end

       set_rl_basic_word_break_characters (a_value: POINTER)
               -- Set variable rl_basic_word_break_characters value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_basic_word_break_characters"
               }"
               end

	rl_beg_of_line (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_beg_of_line (in `/usr/include/readline/readline.h')
               -- rl_beg_of_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_beg_of_line"
               }"
               end

	rl_begin_undo_group: INTEGER 

		-- function rl_begin_undo_group (in `/usr/include/readline/readline.h')
               -- rl_begin_undo_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_begin_undo_group()"
               }"
               end

	rl_beginning_of_history (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_beginning_of_history (in `/usr/include/readline/readline.h')
               -- rl_beginning_of_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_beginning_of_history"
               }"
               end

	rl_bind_key (argument_1: INTEGER; argument_2: POINTER): INTEGER 

		-- function rl_bind_key (in `/usr/include/readline/readline.h')
               -- rl_bind_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_key"
               }"
               end

	rl_bind_key_if_unbound (argument_1: INTEGER; argument_2: POINTER): INTEGER 

		-- function rl_bind_key_if_unbound (in `/usr/include/readline/readline.h')
               -- rl_bind_key_if_unbound
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_key_if_unbound"
               }"
               end

	rl_bind_key_if_unbound_in_map (argument_1: INTEGER; argument_2: POINTER; argument_3: POINTER): INTEGER 

		-- function rl_bind_key_if_unbound_in_map (in `/usr/include/readline/readline.h')
               -- rl_bind_key_if_unbound_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_key_if_unbound_in_map"
               }"
               end

	rl_bind_key_in_map (argument_1: INTEGER; argument_2: POINTER; argument_3: POINTER): INTEGER 

		-- function rl_bind_key_in_map (in `/usr/include/readline/readline.h')
               -- rl_bind_key_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_key_in_map"
               }"
               end

	rl_bind_keyseq (argument_1: POINTER; argument_2: POINTER): INTEGER 

		-- function rl_bind_keyseq (in `/usr/include/readline/readline.h')
               -- rl_bind_keyseq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_keyseq"
               }"
               end

	rl_bind_keyseq_if_unbound (argument_1: POINTER; argument_2: POINTER): INTEGER 

		-- function rl_bind_keyseq_if_unbound (in `/usr/include/readline/readline.h')
               -- rl_bind_keyseq_if_unbound
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_keyseq_if_unbound"
               }"
               end

	rl_bind_keyseq_if_unbound_in_map (argument_1: POINTER; argument_2: POINTER; argument_3: POINTER): INTEGER 

		-- function rl_bind_keyseq_if_unbound_in_map (in `/usr/include/readline/readline.h')
               -- rl_bind_keyseq_if_unbound_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_keyseq_if_unbound_in_map"
               }"
               end

	rl_bind_keyseq_in_map (argument_1: POINTER; argument_2: POINTER; argument_3: POINTER): INTEGER 

		-- function rl_bind_keyseq_in_map (in `/usr/include/readline/readline.h')
               -- rl_bind_keyseq_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_bind_keyseq_in_map"
               }"
               end

	rl_binding_keymap: POINTER
               -- rl_binding_keymap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_binding_keymap"
               }"
               end

       address_of_rl_binding_keymap: POINTER
               -- Address of rl_binding_keymap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_binding_keymap"
               }"
               end

       set_rl_binding_keymap (a_value: POINTER)
               -- Set variable rl_binding_keymap value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_binding_keymap"
               }"
               end

	rl_call_last_kbd_macro (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_call_last_kbd_macro (in `/usr/include/readline/readline.h')
               -- rl_call_last_kbd_macro
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_call_last_kbd_macro"
               }"
               end

	rl_callback_handler_install (argument_1: POINTER; argument_2: POINTER) 

		-- function rl_callback_handler_install (in `/usr/include/readline/readline.h')
               -- rl_callback_handler_install
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_callback_handler_install"
               }"
               end

	rl_callback_handler_remove 

		-- function rl_callback_handler_remove (in `/usr/include/readline/readline.h')
               -- rl_callback_handler_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_callback_handler_remove()"
               }"
               end

	rl_callback_read_char 

		-- function rl_callback_read_char (in `/usr/include/readline/readline.h')
               -- rl_callback_read_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_callback_read_char()"
               }"
               end

	rl_capitalize_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_capitalize_word (in `/usr/include/readline/readline.h')
               -- rl_capitalize_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_capitalize_word"
               }"
               end

	rl_catch_signals: INTEGER
               -- rl_catch_signals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_catch_signals"
               }"
               end

       address_of_rl_catch_signals: POINTER
               -- Address of rl_catch_signals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_catch_signals"
               }"
               end

       set_rl_catch_signals (a_value: INTEGER)
               -- Set variable rl_catch_signals value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_catch_signals"
               }"
               end

	rl_catch_sigwinch: INTEGER
               -- rl_catch_sigwinch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_catch_sigwinch"
               }"
               end

       address_of_rl_catch_sigwinch: POINTER
               -- Address of rl_catch_sigwinch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_catch_sigwinch"
               }"
               end

       set_rl_catch_sigwinch (a_value: INTEGER)
               -- Set variable rl_catch_sigwinch value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_catch_sigwinch"
               }"
               end

	rl_change_environment: INTEGER
               -- rl_change_environment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_change_environment"
               }"
               end

       address_of_rl_change_environment: POINTER
               -- Address of rl_change_environment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_change_environment"
               }"
               end

       set_rl_change_environment (a_value: INTEGER)
               -- Set variable rl_change_environment value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_change_environment"
               }"
               end

	rl_char_is_quoted_p: POINTER
               -- rl_char_is_quoted_p
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_char_is_quoted_p"
               }"
               end

       address_of_rl_char_is_quoted_p: POINTER
               -- Address of rl_char_is_quoted_p
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_char_is_quoted_p"
               }"
               end

       set_rl_char_is_quoted_p (a_value: POINTER)
               -- Set variable rl_char_is_quoted_p value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_char_is_quoted_p"
               }"
               end

	rl_char_search (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_char_search (in `/usr/include/readline/readline.h')
               -- rl_char_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_char_search"
               }"
               end

	rl_character_len (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_character_len (in `/usr/include/readline/readline.h')
               -- rl_character_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_character_len"
               }"
               end

	rl_cleanup_after_signal 

		-- function rl_cleanup_after_signal (in `/usr/include/readline/readline.h')
               -- rl_cleanup_after_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_cleanup_after_signal()"
               }"
               end

	rl_clear_history 

		-- function rl_clear_history (in `/usr/include/readline/readline.h')
               -- rl_clear_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_clear_history()"
               }"
               end

	rl_clear_message: INTEGER 

		-- function rl_clear_message (in `/usr/include/readline/readline.h')
               -- rl_clear_message
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_clear_message()"
               }"
               end

	rl_clear_pending_input: INTEGER 

		-- function rl_clear_pending_input (in `/usr/include/readline/readline.h')
               -- rl_clear_pending_input
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_clear_pending_input()"
               }"
               end

	rl_clear_screen (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_clear_screen (in `/usr/include/readline/readline.h')
               -- rl_clear_screen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_clear_screen"
               }"
               end

	rl_clear_signals: INTEGER 

		-- function rl_clear_signals (in `/usr/include/readline/readline.h')
               -- rl_clear_signals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_clear_signals()"
               }"
               end

	rl_complete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_complete (in `/usr/include/readline/readline.h')
               -- rl_complete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_complete"
               }"
               end

	rl_complete_internal (argument_1: INTEGER): INTEGER 

		-- function rl_complete_internal (in `/usr/include/readline/readline.h')
               -- rl_complete_internal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_complete_internal"
               }"
               end

	rl_completer_quote_characters: POINTER
               -- rl_completer_quote_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completer_quote_characters"
               }"
               end

       address_of_rl_completer_quote_characters: POINTER
               -- Address of rl_completer_quote_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completer_quote_characters"
               }"
               end

       set_rl_completer_quote_characters (a_value: POINTER)
               -- Set variable rl_completer_quote_characters value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completer_quote_characters"
               }"
               end

	rl_completer_word_break_characters: POINTER
               -- rl_completer_word_break_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completer_word_break_characters"
               }"
               end

       address_of_rl_completer_word_break_characters: POINTER
               -- Address of rl_completer_word_break_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completer_word_break_characters"
               }"
               end

       set_rl_completer_word_break_characters (a_value: POINTER)
               -- Set variable rl_completer_word_break_characters value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completer_word_break_characters"
               }"
               end

	rl_completion_append_character: INTEGER
               -- rl_completion_append_character
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_append_character"
               }"
               end

       address_of_rl_completion_append_character: POINTER
               -- Address of rl_completion_append_character
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_append_character"
               }"
               end

       set_rl_completion_append_character (a_value: INTEGER)
               -- Set variable rl_completion_append_character value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_append_character"
               }"
               end

	rl_completion_display_matches_hook: POINTER
               -- rl_completion_display_matches_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_display_matches_hook"
               }"
               end

       address_of_rl_completion_display_matches_hook: POINTER
               -- Address of rl_completion_display_matches_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_display_matches_hook"
               }"
               end

       set_rl_completion_display_matches_hook (a_value: POINTER)
               -- Set variable rl_completion_display_matches_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_display_matches_hook"
               }"
               end

	rl_completion_entry_function: POINTER
               -- rl_completion_entry_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_entry_function"
               }"
               end

       address_of_rl_completion_entry_function: POINTER
               -- Address of rl_completion_entry_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_entry_function"
               }"
               end

       set_rl_completion_entry_function (a_value: POINTER)
               -- Set variable rl_completion_entry_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_entry_function"
               }"
               end

	rl_completion_found_quote: INTEGER
               -- rl_completion_found_quote
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_found_quote"
               }"
               end

       address_of_rl_completion_found_quote: POINTER
               -- Address of rl_completion_found_quote
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_found_quote"
               }"
               end

       set_rl_completion_found_quote (a_value: INTEGER)
               -- Set variable rl_completion_found_quote value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_found_quote"
               }"
               end

	rl_completion_invoking_key: INTEGER
               -- rl_completion_invoking_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_invoking_key"
               }"
               end

       address_of_rl_completion_invoking_key: POINTER
               -- Address of rl_completion_invoking_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_invoking_key"
               }"
               end

       set_rl_completion_invoking_key (a_value: INTEGER)
               -- Set variable rl_completion_invoking_key value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_invoking_key"
               }"
               end

	rl_completion_mark_symlink_dirs: INTEGER
               -- rl_completion_mark_symlink_dirs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_mark_symlink_dirs"
               }"
               end

       address_of_rl_completion_mark_symlink_dirs: POINTER
               -- Address of rl_completion_mark_symlink_dirs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_mark_symlink_dirs"
               }"
               end

       set_rl_completion_mark_symlink_dirs (a_value: INTEGER)
               -- Set variable rl_completion_mark_symlink_dirs value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_mark_symlink_dirs"
               }"
               end

	rl_completion_matches (argument_1: POINTER; argument_2: POINTER): POINTER 

		-- function rl_completion_matches (in `/usr/include/readline/readline.h')
               -- rl_completion_matches
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_matches"
               }"
               end

	rl_completion_mode (argument_1: POINTER): INTEGER 

		-- function rl_completion_mode (in `/usr/include/readline/readline.h')
               -- rl_completion_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_mode"
               }"
               end

	rl_completion_query_items: INTEGER
               -- rl_completion_query_items
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_query_items"
               }"
               end

       address_of_rl_completion_query_items: POINTER
               -- Address of rl_completion_query_items
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_query_items"
               }"
               end

       set_rl_completion_query_items (a_value: INTEGER)
               -- Set variable rl_completion_query_items value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_query_items"
               }"
               end

	rl_completion_quote_character: INTEGER
               -- rl_completion_quote_character
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_quote_character"
               }"
               end

       address_of_rl_completion_quote_character: POINTER
               -- Address of rl_completion_quote_character
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_quote_character"
               }"
               end

       set_rl_completion_quote_character (a_value: INTEGER)
               -- Set variable rl_completion_quote_character value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_quote_character"
               }"
               end

	rl_completion_suppress_append: INTEGER
               -- rl_completion_suppress_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_suppress_append"
               }"
               end

       address_of_rl_completion_suppress_append: POINTER
               -- Address of rl_completion_suppress_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_suppress_append"
               }"
               end

       set_rl_completion_suppress_append (a_value: INTEGER)
               -- Set variable rl_completion_suppress_append value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_suppress_append"
               }"
               end

	rl_completion_suppress_quote: INTEGER
               -- rl_completion_suppress_quote
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_suppress_quote"
               }"
               end

       address_of_rl_completion_suppress_quote: POINTER
               -- Address of rl_completion_suppress_quote
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_suppress_quote"
               }"
               end

       set_rl_completion_suppress_quote (a_value: INTEGER)
               -- Set variable rl_completion_suppress_quote value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_suppress_quote"
               }"
               end

	rl_completion_type: INTEGER
               -- rl_completion_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_type"
               }"
               end

       address_of_rl_completion_type: POINTER
               -- Address of rl_completion_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_type"
               }"
               end

       set_rl_completion_type (a_value: INTEGER)
               -- Set variable rl_completion_type value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_type"
               }"
               end

	rl_completion_word_break_hook: POINTER
               -- rl_completion_word_break_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_completion_word_break_hook"
               }"
               end

       address_of_rl_completion_word_break_hook: POINTER
               -- Address of rl_completion_word_break_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_completion_word_break_hook"
               }"
               end

       set_rl_completion_word_break_hook (a_value: POINTER)
               -- Set variable rl_completion_word_break_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_completion_word_break_hook"
               }"
               end

	rl_copy_backward_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_copy_backward_word (in `/usr/include/readline/readline.h')
               -- rl_copy_backward_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_copy_backward_word"
               }"
               end

	rl_copy_forward_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_copy_forward_word (in `/usr/include/readline/readline.h')
               -- rl_copy_forward_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_copy_forward_word"
               }"
               end

	rl_copy_region_to_kill (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_copy_region_to_kill (in `/usr/include/readline/readline.h')
               -- rl_copy_region_to_kill
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_copy_region_to_kill"
               }"
               end

	rl_copy_text (argument_1: INTEGER; argument_2: INTEGER): POINTER 

		-- function rl_copy_text (in `/usr/include/readline/readline.h')
               -- rl_copy_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_copy_text"
               }"
               end

	rl_crlf: INTEGER 

		-- function rl_crlf (in `/usr/include/readline/readline.h')
               -- rl_crlf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_crlf()"
               }"
               end

	rl_delete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_delete (in `/usr/include/readline/readline.h')
               -- rl_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_delete"
               }"
               end

	rl_delete_horizontal_space (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_delete_horizontal_space (in `/usr/include/readline/readline.h')
               -- rl_delete_horizontal_space
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_delete_horizontal_space"
               }"
               end

	rl_delete_or_show_completions (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_delete_or_show_completions (in `/usr/include/readline/readline.h')
               -- rl_delete_or_show_completions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_delete_or_show_completions"
               }"
               end

	rl_delete_text (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_delete_text (in `/usr/include/readline/readline.h')
               -- rl_delete_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_delete_text"
               }"
               end

	rl_deprep_term_function: POINTER
               -- rl_deprep_term_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_deprep_term_function"
               }"
               end

       address_of_rl_deprep_term_function: POINTER
               -- Address of rl_deprep_term_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_deprep_term_function"
               }"
               end

       set_rl_deprep_term_function (a_value: POINTER)
               -- Set variable rl_deprep_term_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_deprep_term_function"
               }"
               end

	rl_deprep_terminal 

		-- function rl_deprep_terminal (in `/usr/include/readline/readline.h')
               -- rl_deprep_terminal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_deprep_terminal()"
               }"
               end

	rl_digit_argument (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_digit_argument (in `/usr/include/readline/readline.h')
               -- rl_digit_argument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_digit_argument"
               }"
               end

	rl_ding: INTEGER 

		-- function rl_ding (in `/usr/include/readline/readline.h')
               -- rl_ding
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_ding()"
               }"
               end

	rl_directory_completion_hook: POINTER
               -- rl_directory_completion_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_directory_completion_hook"
               }"
               end

       address_of_rl_directory_completion_hook: POINTER
               -- Address of rl_directory_completion_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_directory_completion_hook"
               }"
               end

       set_rl_directory_completion_hook (a_value: POINTER)
               -- Set variable rl_directory_completion_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_directory_completion_hook"
               }"
               end

	rl_directory_rewrite_hook: POINTER
               -- rl_directory_rewrite_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_directory_rewrite_hook"
               }"
               end

       address_of_rl_directory_rewrite_hook: POINTER
               -- Address of rl_directory_rewrite_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_directory_rewrite_hook"
               }"
               end

       set_rl_directory_rewrite_hook (a_value: POINTER)
               -- Set variable rl_directory_rewrite_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_directory_rewrite_hook"
               }"
               end

	rl_discard_argument: INTEGER 

		-- function rl_discard_argument (in `/usr/include/readline/readline.h')
               -- rl_discard_argument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_discard_argument()"
               }"
               end

	rl_dispatching: INTEGER
               -- rl_dispatching
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_dispatching"
               }"
               end

       address_of_rl_dispatching: POINTER
               -- Address of rl_dispatching
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_dispatching"
               }"
               end

       set_rl_dispatching (a_value: INTEGER)
               -- Set variable rl_dispatching value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_dispatching"
               }"
               end

	rl_display_match_list (argument_1: POINTER; argument_2: INTEGER; argument_3: INTEGER) 

		-- function rl_display_match_list (in `/usr/include/readline/readline.h')
               -- rl_display_match_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_display_match_list"
               }"
               end

	rl_display_prompt: POINTER
               -- rl_display_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_display_prompt"
               }"
               end

       address_of_rl_display_prompt: POINTER
               -- Address of rl_display_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_display_prompt"
               }"
               end

       set_rl_display_prompt (a_value: POINTER)
               -- Set variable rl_display_prompt value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_display_prompt"
               }"
               end

	rl_do_lowercase_version (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_do_lowercase_version (in `/usr/include/readline/readline.h')
               -- rl_do_lowercase_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_do_lowercase_version"
               }"
               end

	rl_do_undo: INTEGER 

		-- function rl_do_undo (in `/usr/include/readline/readline.h')
               -- rl_do_undo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_do_undo()"
               }"
               end

	rl_done: INTEGER
               -- rl_done
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_done"
               }"
               end

       address_of_rl_done: POINTER
               -- Address of rl_done
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_done"
               }"
               end

       set_rl_done (a_value: INTEGER)
               -- Set variable rl_done value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_done"
               }"
               end

	rl_downcase_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_downcase_word (in `/usr/include/readline/readline.h')
               -- rl_downcase_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_downcase_word"
               }"
               end

	rl_dump_functions (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_dump_functions (in `/usr/include/readline/readline.h')
               -- rl_dump_functions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_dump_functions"
               }"
               end

	rl_dump_macros (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_dump_macros (in `/usr/include/readline/readline.h')
               -- rl_dump_macros
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_dump_macros"
               }"
               end

	rl_dump_variables (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_dump_variables (in `/usr/include/readline/readline.h')
               -- rl_dump_variables
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_dump_variables"
               }"
               end

	rl_echo_signal_char (argument_1: INTEGER) 

		-- function rl_echo_signal_char (in `/usr/include/readline/readline.h')
               -- rl_echo_signal_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_echo_signal_char"
               }"
               end

	rl_editing_mode: INTEGER
               -- rl_editing_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_editing_mode"
               }"
               end

       address_of_rl_editing_mode: POINTER
               -- Address of rl_editing_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_editing_mode"
               }"
               end

       set_rl_editing_mode (a_value: INTEGER)
               -- Set variable rl_editing_mode value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_editing_mode"
               }"
               end

	rl_emacs_editing_mode (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_emacs_editing_mode (in `/usr/include/readline/readline.h')
               -- rl_emacs_editing_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_emacs_editing_mode"
               }"
               end

	rl_end: INTEGER
               -- rl_end
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_end"
               }"
               end

       address_of_rl_end: POINTER
               -- Address of rl_end
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_end"
               }"
               end

       set_rl_end (a_value: INTEGER)
               -- Set variable rl_end value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_end"
               }"
               end

	rl_end_kbd_macro (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_end_kbd_macro (in `/usr/include/readline/readline.h')
               -- rl_end_kbd_macro
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_end_kbd_macro"
               }"
               end

	rl_end_of_history (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_end_of_history (in `/usr/include/readline/readline.h')
               -- rl_end_of_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_end_of_history"
               }"
               end

	rl_end_of_line (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_end_of_line (in `/usr/include/readline/readline.h')
               -- rl_end_of_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_end_of_line"
               }"
               end

	rl_end_undo_group: INTEGER 

		-- function rl_end_undo_group (in `/usr/include/readline/readline.h')
               -- rl_end_undo_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_end_undo_group()"
               }"
               end

	rl_erase_empty_line: INTEGER
               -- rl_erase_empty_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_erase_empty_line"
               }"
               end

       address_of_rl_erase_empty_line: POINTER
               -- Address of rl_erase_empty_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_erase_empty_line"
               }"
               end

       set_rl_erase_empty_line (a_value: INTEGER)
               -- Set variable rl_erase_empty_line value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_erase_empty_line"
               }"
               end

	rl_event_hook: POINTER
               -- rl_event_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_event_hook"
               }"
               end

       address_of_rl_event_hook: POINTER
               -- Address of rl_event_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_event_hook"
               }"
               end

       set_rl_event_hook (a_value: POINTER)
               -- Set variable rl_event_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_event_hook"
               }"
               end

	rl_exchange_point_and_mark (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_exchange_point_and_mark (in `/usr/include/readline/readline.h')
               -- rl_exchange_point_and_mark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_exchange_point_and_mark"
               }"
               end

	rl_execute_next (argument_1: INTEGER): INTEGER 

		-- function rl_execute_next (in `/usr/include/readline/readline.h')
               -- rl_execute_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_execute_next"
               }"
               end

	rl_executing_key: INTEGER
               -- rl_executing_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_executing_key"
               }"
               end

       address_of_rl_executing_key: POINTER
               -- Address of rl_executing_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_executing_key"
               }"
               end

       set_rl_executing_key (a_value: INTEGER)
               -- Set variable rl_executing_key value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_executing_key"
               }"
               end

	rl_executing_keymap: POINTER
               -- rl_executing_keymap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_executing_keymap"
               }"
               end

       address_of_rl_executing_keymap: POINTER
               -- Address of rl_executing_keymap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_executing_keymap"
               }"
               end

       set_rl_executing_keymap (a_value: POINTER)
               -- Set variable rl_executing_keymap value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_executing_keymap"
               }"
               end

	rl_executing_keyseq: POINTER
               -- rl_executing_keyseq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_executing_keyseq"
               }"
               end

       address_of_rl_executing_keyseq: POINTER
               -- Address of rl_executing_keyseq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_executing_keyseq"
               }"
               end

       set_rl_executing_keyseq (a_value: POINTER)
               -- Set variable rl_executing_keyseq value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_executing_keyseq"
               }"
               end

	rl_executing_macro: POINTER
               -- rl_executing_macro
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_executing_macro"
               }"
               end

       address_of_rl_executing_macro: POINTER
               -- Address of rl_executing_macro
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_executing_macro"
               }"
               end

       set_rl_executing_macro (a_value: POINTER)
               -- Set variable rl_executing_macro value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_executing_macro"
               }"
               end

	rl_expand_prompt (argument_1: POINTER): INTEGER 

		-- function rl_expand_prompt (in `/usr/include/readline/readline.h')
               -- rl_expand_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_expand_prompt"
               }"
               end

	rl_explicit_arg: INTEGER
               -- rl_explicit_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_explicit_arg"
               }"
               end

       address_of_rl_explicit_arg: POINTER
               -- Address of rl_explicit_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_explicit_arg"
               }"
               end

       set_rl_explicit_arg (a_value: INTEGER)
               -- Set variable rl_explicit_arg value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_explicit_arg"
               }"
               end

	rl_extend_line_buffer (argument_1: INTEGER) 

		-- function rl_extend_line_buffer (in `/usr/include/readline/readline.h')
               -- rl_extend_line_buffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_extend_line_buffer"
               }"
               end

	rl_filename_completion_desired: INTEGER
               -- rl_filename_completion_desired
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_completion_desired"
               }"
               end

       address_of_rl_filename_completion_desired: POINTER
               -- Address of rl_filename_completion_desired
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_filename_completion_desired"
               }"
               end

       set_rl_filename_completion_desired (a_value: INTEGER)
               -- Set variable rl_filename_completion_desired value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_filename_completion_desired"
               }"
               end

	rl_filename_completion_function (argument_1: POINTER; argument_2: INTEGER): POINTER 

		-- function rl_filename_completion_function (in `/usr/include/readline/readline.h')
               -- rl_filename_completion_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_completion_function"
               }"
               end

	rl_filename_dequoting_function: POINTER
               -- rl_filename_dequoting_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_dequoting_function"
               }"
               end

       address_of_rl_filename_dequoting_function: POINTER
               -- Address of rl_filename_dequoting_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_filename_dequoting_function"
               }"
               end

       set_rl_filename_dequoting_function (a_value: POINTER)
               -- Set variable rl_filename_dequoting_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_filename_dequoting_function"
               }"
               end

	rl_filename_quote_characters: POINTER
               -- rl_filename_quote_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_quote_characters"
               }"
               end

       address_of_rl_filename_quote_characters: POINTER
               -- Address of rl_filename_quote_characters
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_filename_quote_characters"
               }"
               end

       set_rl_filename_quote_characters (a_value: POINTER)
               -- Set variable rl_filename_quote_characters value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_filename_quote_characters"
               }"
               end

	rl_filename_quoting_desired: INTEGER
               -- rl_filename_quoting_desired
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_quoting_desired"
               }"
               end

       address_of_rl_filename_quoting_desired: POINTER
               -- Address of rl_filename_quoting_desired
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_filename_quoting_desired"
               }"
               end

       set_rl_filename_quoting_desired (a_value: INTEGER)
               -- Set variable rl_filename_quoting_desired value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_filename_quoting_desired"
               }"
               end

	rl_filename_quoting_function: POINTER
               -- rl_filename_quoting_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_quoting_function"
               }"
               end

       address_of_rl_filename_quoting_function: POINTER
               -- Address of rl_filename_quoting_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_filename_quoting_function"
               }"
               end

       set_rl_filename_quoting_function (a_value: POINTER)
               -- Set variable rl_filename_quoting_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_filename_quoting_function"
               }"
               end

	rl_filename_rewrite_hook: POINTER
               -- rl_filename_rewrite_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_rewrite_hook"
               }"
               end

       address_of_rl_filename_rewrite_hook: POINTER
               -- Address of rl_filename_rewrite_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_filename_rewrite_hook"
               }"
               end

       set_rl_filename_rewrite_hook (a_value: POINTER)
               -- Set variable rl_filename_rewrite_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_filename_rewrite_hook"
               }"
               end

	rl_filename_stat_hook: POINTER
               -- rl_filename_stat_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_filename_stat_hook"
               }"
               end

       address_of_rl_filename_stat_hook: POINTER
               -- Address of rl_filename_stat_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_filename_stat_hook"
               }"
               end

       set_rl_filename_stat_hook (a_value: POINTER)
               -- Set variable rl_filename_stat_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_filename_stat_hook"
               }"
               end

	rl_forced_update_display: INTEGER 

		-- function rl_forced_update_display (in `/usr/include/readline/readline.h')
               -- rl_forced_update_display
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_forced_update_display()"
               }"
               end

	rl_forward (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_forward (in `/usr/include/readline/readline.h')
               -- rl_forward
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_forward"
               }"
               end

	rl_forward_byte (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_forward_byte (in `/usr/include/readline/readline.h')
               -- rl_forward_byte
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_forward_byte"
               }"
               end

	rl_forward_char (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_forward_char (in `/usr/include/readline/readline.h')
               -- rl_forward_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_forward_char"
               }"
               end

	rl_forward_search_history (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_forward_search_history (in `/usr/include/readline/readline.h')
               -- rl_forward_search_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_forward_search_history"
               }"
               end

	rl_forward_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_forward_word (in `/usr/include/readline/readline.h')
               -- rl_forward_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_forward_word"
               }"
               end

	rl_free (argument_1: POINTER) 

		-- function rl_free (in `/usr/include/readline/readline.h')
               -- rl_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_free"
               }"
               end

	rl_free_keymap (argument_1: POINTER) 

		-- function rl_free_keymap (in `/usr/include/readline/readline.h')
               -- rl_free_keymap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_free_keymap"
               }"
               end

	rl_free_line_state 

		-- function rl_free_line_state (in `/usr/include/readline/readline.h')
               -- rl_free_line_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_free_line_state()"
               }"
               end

	rl_free_undo_list 

		-- function rl_free_undo_list (in `/usr/include/readline/readline.h')
               -- rl_free_undo_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_free_undo_list()"
               }"
               end

	rl_function_dumper (argument_1: INTEGER) 

		-- function rl_function_dumper (in `/usr/include/readline/readline.h')
               -- rl_function_dumper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_function_dumper"
               }"
               end

	rl_function_of_keyseq (argument_1: POINTER; argument_2: POINTER; argument_3: POINTER): POINTER 

		-- function rl_function_of_keyseq (in `/usr/include/readline/readline.h')
               -- rl_function_of_keyseq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_function_of_keyseq"
               }"
               end

	rl_funmap_names: POINTER 

		-- function rl_funmap_names (in `/usr/include/readline/readline.h')
               -- rl_funmap_names
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_funmap_names()"
               }"
               end

	rl_generic_bind (argument_1: INTEGER; argument_2: POINTER; argument_3: POINTER; argument_4: POINTER): INTEGER 

		-- function rl_generic_bind (in `/usr/include/readline/readline.h')
               -- rl_generic_bind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_generic_bind"
               }"
               end

	rl_get_keymap_name (argument_1: POINTER): POINTER 

		-- function rl_get_keymap_name (in `/usr/include/readline/readline.h')
               -- rl_get_keymap_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_get_keymap_name"
               }"
               end

	rl_get_keymap_name_from_edit_mode: POINTER 

		-- function rl_get_keymap_name_from_edit_mode (in `/usr/include/readline/readline.h')
               -- rl_get_keymap_name_from_edit_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_get_keymap_name_from_edit_mode()"
               }"
               end

	rl_get_next_history (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_get_next_history (in `/usr/include/readline/readline.h')
               -- rl_get_next_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_get_next_history"
               }"
               end

	rl_get_previous_history (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_get_previous_history (in `/usr/include/readline/readline.h')
               -- rl_get_previous_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_get_previous_history"
               }"
               end

	rl_get_screen_size (argument_1: POINTER; argument_2: POINTER) 

		-- function rl_get_screen_size (in `/usr/include/readline/readline.h')
               -- rl_get_screen_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_get_screen_size"
               }"
               end

	rl_get_termcap (argument_1: POINTER): POINTER 

		-- function rl_get_termcap (in `/usr/include/readline/readline.h')
               -- rl_get_termcap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_get_termcap"
               }"
               end

	rl_getc (argument_1: POINTER): INTEGER 

		-- function rl_getc (in `/usr/include/readline/readline.h')
               -- rl_getc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_getc"
               }"
               end

	rl_getc_function: POINTER
               -- rl_getc_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_getc_function"
               }"
               end

       address_of_rl_getc_function: POINTER
               -- Address of rl_getc_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_getc_function"
               }"
               end

       set_rl_getc_function (a_value: POINTER)
               -- Set variable rl_getc_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_getc_function"
               }"
               end

	rl_gnu_readline_p: INTEGER
               -- rl_gnu_readline_p
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_gnu_readline_p"
               }"
               end

       address_of_rl_gnu_readline_p: POINTER
               -- Address of rl_gnu_readline_p
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_gnu_readline_p"
               }"
               end

       set_rl_gnu_readline_p (a_value: INTEGER)
               -- Set variable rl_gnu_readline_p value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_gnu_readline_p"
               }"
               end

	rl_history_search_backward (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_history_search_backward (in `/usr/include/readline/readline.h')
               -- rl_history_search_backward
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_history_search_backward"
               }"
               end

	rl_history_search_forward (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_history_search_forward (in `/usr/include/readline/readline.h')
               -- rl_history_search_forward
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_history_search_forward"
               }"
               end

	rl_history_substr_search_backward (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_history_substr_search_backward (in `/usr/include/readline/readline.h')
               -- rl_history_substr_search_backward
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_history_substr_search_backward"
               }"
               end

	rl_history_substr_search_forward (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_history_substr_search_forward (in `/usr/include/readline/readline.h')
               -- rl_history_substr_search_forward
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_history_substr_search_forward"
               }"
               end

	rl_ignore_completion_duplicates: INTEGER
               -- rl_ignore_completion_duplicates
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_ignore_completion_duplicates"
               }"
               end

       address_of_rl_ignore_completion_duplicates: POINTER
               -- Address of rl_ignore_completion_duplicates
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_ignore_completion_duplicates"
               }"
               end

       set_rl_ignore_completion_duplicates (a_value: INTEGER)
               -- Set variable rl_ignore_completion_duplicates value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_ignore_completion_duplicates"
               }"
               end

	rl_ignore_some_completions_function: POINTER
               -- rl_ignore_some_completions_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_ignore_some_completions_function"
               }"
               end

       address_of_rl_ignore_some_completions_function: POINTER
               -- Address of rl_ignore_some_completions_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_ignore_some_completions_function"
               }"
               end

       set_rl_ignore_some_completions_function (a_value: POINTER)
               -- Set variable rl_ignore_some_completions_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_ignore_some_completions_function"
               }"
               end

	rl_inhibit_completion: INTEGER
               -- rl_inhibit_completion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_inhibit_completion"
               }"
               end

       address_of_rl_inhibit_completion: POINTER
               -- Address of rl_inhibit_completion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_inhibit_completion"
               }"
               end

       set_rl_inhibit_completion (a_value: INTEGER)
               -- Set variable rl_inhibit_completion value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_inhibit_completion"
               }"
               end

	rl_initialize: INTEGER 

		-- function rl_initialize (in `/usr/include/readline/readline.h')
               -- rl_initialize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_initialize()"
               }"
               end

	rl_initialize_funmap 

		-- function rl_initialize_funmap (in `/usr/include/readline/readline.h')
               -- rl_initialize_funmap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_initialize_funmap()"
               }"
               end

	rl_input_available_hook: POINTER
               -- rl_input_available_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_input_available_hook"
               }"
               end

       address_of_rl_input_available_hook: POINTER
               -- Address of rl_input_available_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_input_available_hook"
               }"
               end

       set_rl_input_available_hook (a_value: POINTER)
               -- Set variable rl_input_available_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_input_available_hook"
               }"
               end

	rl_insert (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_insert (in `/usr/include/readline/readline.h')
               -- rl_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_insert"
               }"
               end

	rl_insert_close (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_insert_close (in `/usr/include/readline/readline.h')
               -- rl_insert_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_insert_close"
               }"
               end

	rl_insert_comment (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_insert_comment (in `/usr/include/readline/readline.h')
               -- rl_insert_comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_insert_comment"
               }"
               end

	rl_insert_completions (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_insert_completions (in `/usr/include/readline/readline.h')
               -- rl_insert_completions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_insert_completions"
               }"
               end

	rl_insert_mode: INTEGER
               -- rl_insert_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_insert_mode"
               }"
               end

       address_of_rl_insert_mode: POINTER
               -- Address of rl_insert_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_insert_mode"
               }"
               end

       set_rl_insert_mode (a_value: INTEGER)
               -- Set variable rl_insert_mode value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_insert_mode"
               }"
               end

	rl_insert_text (argument_1: POINTER): INTEGER 

		-- function rl_insert_text (in `/usr/include/readline/readline.h')
               -- rl_insert_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_insert_text"
               }"
               end

	rl_instream: POINTER
               -- rl_instream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_instream"
               }"
               end

       address_of_rl_instream: POINTER
               -- Address of rl_instream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_instream"
               }"
               end

       set_rl_instream (a_value: POINTER)
               -- Set variable rl_instream value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_instream"
               }"
               end

	rl_invoking_keyseqs (argument_1: POINTER): POINTER 

		-- function rl_invoking_keyseqs (in `/usr/include/readline/readline.h')
               -- rl_invoking_keyseqs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_invoking_keyseqs"
               }"
               end

	rl_invoking_keyseqs_in_map (argument_1: POINTER; argument_2: POINTER): POINTER 

		-- function rl_invoking_keyseqs_in_map (in `/usr/include/readline/readline.h')
               -- rl_invoking_keyseqs_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_invoking_keyseqs_in_map"
               }"
               end

	rl_key_sequence_length: INTEGER
               -- rl_key_sequence_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_key_sequence_length"
               }"
               end

       address_of_rl_key_sequence_length: POINTER
               -- Address of rl_key_sequence_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_key_sequence_length"
               }"
               end

       set_rl_key_sequence_length (a_value: INTEGER)
               -- Set variable rl_key_sequence_length value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_key_sequence_length"
               }"
               end

	rl_kill_full_line (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_kill_full_line (in `/usr/include/readline/readline.h')
               -- rl_kill_full_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_kill_full_line"
               }"
               end

	rl_kill_line (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_kill_line (in `/usr/include/readline/readline.h')
               -- rl_kill_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_kill_line"
               }"
               end

	rl_kill_region (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_kill_region (in `/usr/include/readline/readline.h')
               -- rl_kill_region
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_kill_region"
               }"
               end

	rl_kill_text (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_kill_text (in `/usr/include/readline/readline.h')
               -- rl_kill_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_kill_text"
               }"
               end

	rl_kill_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_kill_word (in `/usr/include/readline/readline.h')
               -- rl_kill_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_kill_word"
               }"
               end

	rl_last_func: POINTER
               -- rl_last_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_last_func"
               }"
               end

       address_of_rl_last_func: POINTER
               -- Address of rl_last_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_last_func"
               }"
               end

       set_rl_last_func (a_value: POINTER)
               -- Set variable rl_last_func value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_last_func"
               }"
               end

	rl_library_version: POINTER
               -- rl_library_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_library_version"
               }"
               end

       address_of_rl_library_version: POINTER
               -- Address of rl_library_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_library_version"
               }"
               end

       set_rl_library_version (a_value: POINTER)
               -- Set variable rl_library_version value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_library_version"
               }"
               end

	rl_line_buffer: POINTER
               -- rl_line_buffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_line_buffer"
               }"
               end

       address_of_rl_line_buffer: POINTER
               -- Address of rl_line_buffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_line_buffer"
               }"
               end

       set_rl_line_buffer (a_value: POINTER)
               -- Set variable rl_line_buffer value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_line_buffer"
               }"
               end

	rl_list_funmap_names 

		-- function rl_list_funmap_names (in `/usr/include/readline/readline.h')
               -- rl_list_funmap_names
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_list_funmap_names()"
               }"
               end

	rl_macro_bind (argument_1: POINTER; argument_2: POINTER; argument_3: POINTER): INTEGER 

		-- function rl_macro_bind (in `/usr/include/readline/readline.h')
               -- rl_macro_bind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_macro_bind"
               }"
               end

	rl_macro_dumper (argument_1: INTEGER) 

		-- function rl_macro_dumper (in `/usr/include/readline/readline.h')
               -- rl_macro_dumper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_macro_dumper"
               }"
               end

	rl_mark: INTEGER
               -- rl_mark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_mark"
               }"
               end

       address_of_rl_mark: POINTER
               -- Address of rl_mark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_mark"
               }"
               end

       set_rl_mark (a_value: INTEGER)
               -- Set variable rl_mark value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_mark"
               }"
               end

	rl_maybe_replace_line: INTEGER 

		-- function rl_maybe_replace_line (in `/usr/include/readline/readline.h')
               -- rl_maybe_replace_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_maybe_replace_line()"
               }"
               end

	rl_maybe_save_line: INTEGER 

		-- function rl_maybe_save_line (in `/usr/include/readline/readline.h')
               -- rl_maybe_save_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_maybe_save_line()"
               }"
               end

	rl_maybe_unsave_line: INTEGER 

		-- function rl_maybe_unsave_line (in `/usr/include/readline/readline.h')
               -- rl_maybe_unsave_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_maybe_unsave_line()"
               }"
               end

	rl_menu_complete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_menu_complete (in `/usr/include/readline/readline.h')
               -- rl_menu_complete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_menu_complete"
               }"
               end

	rl_menu_completion_entry_function: POINTER
               -- rl_menu_completion_entry_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_menu_completion_entry_function"
               }"
               end

       address_of_rl_menu_completion_entry_function: POINTER
               -- Address of rl_menu_completion_entry_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_menu_completion_entry_function"
               }"
               end

       set_rl_menu_completion_entry_function (a_value: POINTER)
               -- Set variable rl_menu_completion_entry_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_menu_completion_entry_function"
               }"
               end

	rl_message: INTEGER 

		-- function rl_message (in `/usr/include/readline/readline.h')
               -- rl_message
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_message()"
               }"
               end

	rl_modifying (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_modifying (in `/usr/include/readline/readline.h')
               -- rl_modifying
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_modifying"
               }"
               end

	rl_named_function (argument_1: POINTER): POINTER 

		-- function rl_named_function (in `/usr/include/readline/readline.h')
               -- rl_named_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_named_function"
               }"
               end

	rl_newline (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_newline (in `/usr/include/readline/readline.h')
               -- rl_newline
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_newline"
               }"
               end

	rl_noninc_forward_search (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_noninc_forward_search (in `/usr/include/readline/readline.h')
               -- rl_noninc_forward_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_noninc_forward_search"
               }"
               end

	rl_noninc_forward_search_again (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_noninc_forward_search_again (in `/usr/include/readline/readline.h')
               -- rl_noninc_forward_search_again
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_noninc_forward_search_again"
               }"
               end

	rl_noninc_reverse_search (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_noninc_reverse_search (in `/usr/include/readline/readline.h')
               -- rl_noninc_reverse_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_noninc_reverse_search"
               }"
               end

	rl_noninc_reverse_search_again (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_noninc_reverse_search_again (in `/usr/include/readline/readline.h')
               -- rl_noninc_reverse_search_again
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_noninc_reverse_search_again"
               }"
               end

	rl_num_chars_to_read: INTEGER
               -- rl_num_chars_to_read
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_num_chars_to_read"
               }"
               end

       address_of_rl_num_chars_to_read: POINTER
               -- Address of rl_num_chars_to_read
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_num_chars_to_read"
               }"
               end

       set_rl_num_chars_to_read (a_value: INTEGER)
               -- Set variable rl_num_chars_to_read value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_num_chars_to_read"
               }"
               end

	rl_numeric_arg: INTEGER
               -- rl_numeric_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_numeric_arg"
               }"
               end

       address_of_rl_numeric_arg: POINTER
               -- Address of rl_numeric_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_numeric_arg"
               }"
               end

       set_rl_numeric_arg (a_value: INTEGER)
               -- Set variable rl_numeric_arg value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_numeric_arg"
               }"
               end

	rl_old_menu_complete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_old_menu_complete (in `/usr/include/readline/readline.h')
               -- rl_old_menu_complete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_old_menu_complete"
               }"
               end

	rl_on_new_line: INTEGER 

		-- function rl_on_new_line (in `/usr/include/readline/readline.h')
               -- rl_on_new_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_on_new_line()"
               }"
               end

	rl_on_new_line_with_prompt: INTEGER 

		-- function rl_on_new_line_with_prompt (in `/usr/include/readline/readline.h')
               -- rl_on_new_line_with_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_on_new_line_with_prompt()"
               }"
               end

	rl_outstream: POINTER
               -- rl_outstream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_outstream"
               }"
               end

       address_of_rl_outstream: POINTER
               -- Address of rl_outstream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_outstream"
               }"
               end

       set_rl_outstream (a_value: POINTER)
               -- Set variable rl_outstream value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_outstream"
               }"
               end

	rl_overwrite_mode (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_overwrite_mode (in `/usr/include/readline/readline.h')
               -- rl_overwrite_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_overwrite_mode"
               }"
               end

	rl_parse_and_bind (argument_1: POINTER): INTEGER 

		-- function rl_parse_and_bind (in `/usr/include/readline/readline.h')
               -- rl_parse_and_bind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_parse_and_bind"
               }"
               end

	rl_pending_input: INTEGER
               -- rl_pending_input
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_pending_input"
               }"
               end

       address_of_rl_pending_input: POINTER
               -- Address of rl_pending_input
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_pending_input"
               }"
               end

       set_rl_pending_input (a_value: INTEGER)
               -- Set variable rl_pending_input value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_pending_input"
               }"
               end

	rl_point: INTEGER
               -- rl_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_point"
               }"
               end

       address_of_rl_point: POINTER
               -- Address of rl_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_point"
               }"
               end

       set_rl_point (a_value: INTEGER)
               -- Set variable rl_point value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_point"
               }"
               end

	rl_possible_completions (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_possible_completions (in `/usr/include/readline/readline.h')
               -- rl_possible_completions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_possible_completions"
               }"
               end

	rl_pre_input_hook: POINTER
               -- rl_pre_input_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_pre_input_hook"
               }"
               end

       address_of_rl_pre_input_hook: POINTER
               -- Address of rl_pre_input_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_pre_input_hook"
               }"
               end

       set_rl_pre_input_hook (a_value: POINTER)
               -- Set variable rl_pre_input_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_pre_input_hook"
               }"
               end

	rl_prefer_env_winsize: INTEGER
               -- rl_prefer_env_winsize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_prefer_env_winsize"
               }"
               end

       address_of_rl_prefer_env_winsize: POINTER
               -- Address of rl_prefer_env_winsize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_prefer_env_winsize"
               }"
               end

       set_rl_prefer_env_winsize (a_value: INTEGER)
               -- Set variable rl_prefer_env_winsize value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_prefer_env_winsize"
               }"
               end

	rl_prep_term_function: POINTER
               -- rl_prep_term_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_prep_term_function"
               }"
               end

       address_of_rl_prep_term_function: POINTER
               -- Address of rl_prep_term_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_prep_term_function"
               }"
               end

       set_rl_prep_term_function (a_value: POINTER)
               -- Set variable rl_prep_term_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_prep_term_function"
               }"
               end

	rl_prep_terminal (argument_1: INTEGER) 

		-- function rl_prep_terminal (in `/usr/include/readline/readline.h')
               -- rl_prep_terminal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_prep_terminal"
               }"
               end

	rl_print_last_kbd_macro (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_print_last_kbd_macro (in `/usr/include/readline/readline.h')
               -- rl_print_last_kbd_macro
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_print_last_kbd_macro"
               }"
               end

	rl_prompt: POINTER
               -- rl_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_prompt"
               }"
               end

       address_of_rl_prompt: POINTER
               -- Address of rl_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_prompt"
               }"
               end

       set_rl_prompt (a_value: POINTER)
               -- Set variable rl_prompt value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_prompt"
               }"
               end

	rl_push_macro_input (argument_1: POINTER) 

		-- function rl_push_macro_input (in `/usr/include/readline/readline.h')
               -- rl_push_macro_input
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_push_macro_input"
               }"
               end

	rl_quoted_insert (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_quoted_insert (in `/usr/include/readline/readline.h')
               -- rl_quoted_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_quoted_insert"
               }"
               end

	rl_re_read_init_file (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_re_read_init_file (in `/usr/include/readline/readline.h')
               -- rl_re_read_init_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_re_read_init_file"
               }"
               end

	rl_read_init_file (argument_1: POINTER): INTEGER 

		-- function rl_read_init_file (in `/usr/include/readline/readline.h')
               -- rl_read_init_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_read_init_file"
               }"
               end

	rl_read_key: INTEGER 

		-- function rl_read_key (in `/usr/include/readline/readline.h')
               -- rl_read_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_read_key()"
               }"
               end

	rl_readline_name: POINTER
               -- rl_readline_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_readline_name"
               }"
               end

       address_of_rl_readline_name: POINTER
               -- Address of rl_readline_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_readline_name"
               }"
               end

       set_rl_readline_name (a_value: POINTER)
               -- Set variable rl_readline_name value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_readline_name"
               }"
               end

	rl_readline_state: INTEGER
               -- rl_readline_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_readline_state"
               }"
               end

       address_of_rl_readline_state: POINTER
               -- Address of rl_readline_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_readline_state"
               }"
               end

       set_rl_readline_state (a_value: INTEGER)
               -- Set variable rl_readline_state value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_readline_state"
               }"
               end

	rl_readline_version: INTEGER
               -- rl_readline_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_readline_version"
               }"
               end

       address_of_rl_readline_version: POINTER
               -- Address of rl_readline_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_readline_version"
               }"
               end

       set_rl_readline_version (a_value: INTEGER)
               -- Set variable rl_readline_version value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_readline_version"
               }"
               end

	rl_redisplay 

		-- function rl_redisplay (in `/usr/include/readline/readline.h')
               -- rl_redisplay
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_redisplay()"
               }"
               end

	rl_redisplay_function: POINTER
               -- rl_redisplay_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_redisplay_function"
               }"
               end

       address_of_rl_redisplay_function: POINTER
               -- Address of rl_redisplay_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_redisplay_function"
               }"
               end

       set_rl_redisplay_function (a_value: POINTER)
               -- Set variable rl_redisplay_function value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_redisplay_function"
               }"
               end

	rl_refresh_line (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_refresh_line (in `/usr/include/readline/readline.h')
               -- rl_refresh_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_refresh_line"
               }"
               end

	rl_replace_line (argument_1: POINTER; argument_2: INTEGER) 

		-- function rl_replace_line (in `/usr/include/readline/readline.h')
               -- rl_replace_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_replace_line"
               }"
               end

	rl_reset_after_signal 

		-- function rl_reset_after_signal (in `/usr/include/readline/readline.h')
               -- rl_reset_after_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_reset_after_signal()"
               }"
               end

	rl_reset_line_state: INTEGER 

		-- function rl_reset_line_state (in `/usr/include/readline/readline.h')
               -- rl_reset_line_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_reset_line_state()"
               }"
               end

	rl_reset_screen_size 

		-- function rl_reset_screen_size (in `/usr/include/readline/readline.h')
               -- rl_reset_screen_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_reset_screen_size()"
               }"
               end

	rl_reset_terminal (argument_1: POINTER): INTEGER 

		-- function rl_reset_terminal (in `/usr/include/readline/readline.h')
               -- rl_reset_terminal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_reset_terminal"
               }"
               end

	rl_resize_terminal 

		-- function rl_resize_terminal (in `/usr/include/readline/readline.h')
               -- rl_resize_terminal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_resize_terminal()"
               }"
               end

	rl_restart_output (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_restart_output (in `/usr/include/readline/readline.h')
               -- rl_restart_output
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_restart_output"
               }"
               end

	rl_restore_prompt 

		-- function rl_restore_prompt (in `/usr/include/readline/readline.h')
               -- rl_restore_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_restore_prompt()"
               }"
               end

	rl_restore_state (argument_1: POINTER): INTEGER 

		-- function rl_restore_state (in `/usr/include/readline/readline.h')
               -- rl_restore_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_restore_state"
               }"
               end

	rl_reverse_search_history (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_reverse_search_history (in `/usr/include/readline/readline.h')
               -- rl_reverse_search_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_reverse_search_history"
               }"
               end

	rl_revert_line (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_revert_line (in `/usr/include/readline/readline.h')
               -- rl_revert_line
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_revert_line"
               }"
               end

	rl_rubout (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_rubout (in `/usr/include/readline/readline.h')
               -- rl_rubout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_rubout"
               }"
               end

	rl_rubout_or_delete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_rubout_or_delete (in `/usr/include/readline/readline.h')
               -- rl_rubout_or_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_rubout_or_delete"
               }"
               end

	rl_save_prompt 

		-- function rl_save_prompt (in `/usr/include/readline/readline.h')
               -- rl_save_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_save_prompt()"
               }"
               end

	rl_save_state (argument_1: POINTER): INTEGER 

		-- function rl_save_state (in `/usr/include/readline/readline.h')
               -- rl_save_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_save_state"
               }"
               end

	rl_set_key (argument_1: POINTER; argument_2: POINTER; argument_3: POINTER): INTEGER 

		-- function rl_set_key (in `/usr/include/readline/readline.h')
               -- rl_set_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_key"
               }"
               end

	rl_set_keyboard_input_timeout (argument_1: INTEGER): INTEGER 

		-- function rl_set_keyboard_input_timeout (in `/usr/include/readline/readline.h')
               -- rl_set_keyboard_input_timeout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_keyboard_input_timeout"
               }"
               end

	rl_set_keymap_from_edit_mode 

		-- function rl_set_keymap_from_edit_mode (in `/usr/include/readline/readline.h')
               -- rl_set_keymap_from_edit_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_keymap_from_edit_mode()"
               }"
               end

	rl_set_mark (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_set_mark (in `/usr/include/readline/readline.h')
               -- rl_set_mark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_mark"
               }"
               end

	rl_set_paren_blink_timeout (argument_1: INTEGER): INTEGER 

		-- function rl_set_paren_blink_timeout (in `/usr/include/readline/readline.h')
               -- rl_set_paren_blink_timeout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_paren_blink_timeout"
               }"
               end

	rl_set_prompt (argument_1: POINTER): INTEGER 

		-- function rl_set_prompt (in `/usr/include/readline/readline.h')
               -- rl_set_prompt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_prompt"
               }"
               end

	rl_set_screen_size (argument_1: INTEGER; argument_2: INTEGER) 

		-- function rl_set_screen_size (in `/usr/include/readline/readline.h')
               -- rl_set_screen_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_screen_size"
               }"
               end

	rl_set_signals: INTEGER 

		-- function rl_set_signals (in `/usr/include/readline/readline.h')
               -- rl_set_signals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_set_signals()"
               }"
               end

	rl_show_char (argument_1: INTEGER): INTEGER 

		-- function rl_show_char (in `/usr/include/readline/readline.h')
               -- rl_show_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_show_char"
               }"
               end

	rl_signal_event_hook: POINTER
               -- rl_signal_event_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_signal_event_hook"
               }"
               end

       address_of_rl_signal_event_hook: POINTER
               -- Address of rl_signal_event_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_signal_event_hook"
               }"
               end

       set_rl_signal_event_hook (a_value: POINTER)
               -- Set variable rl_signal_event_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_signal_event_hook"
               }"
               end

	rl_skip_csi_sequence (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_skip_csi_sequence (in `/usr/include/readline/readline.h')
               -- rl_skip_csi_sequence
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_skip_csi_sequence"
               }"
               end

	rl_sort_completion_matches: INTEGER
               -- rl_sort_completion_matches
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_sort_completion_matches"
               }"
               end

       address_of_rl_sort_completion_matches: POINTER
               -- Address of rl_sort_completion_matches
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_sort_completion_matches"
               }"
               end

       set_rl_sort_completion_matches (a_value: INTEGER)
               -- Set variable rl_sort_completion_matches value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_sort_completion_matches"
               }"
               end

	rl_special_prefixes: POINTER
               -- rl_special_prefixes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_special_prefixes"
               }"
               end

       address_of_rl_special_prefixes: POINTER
               -- Address of rl_special_prefixes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_special_prefixes"
               }"
               end

       set_rl_special_prefixes (a_value: POINTER)
               -- Set variable rl_special_prefixes value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_special_prefixes"
               }"
               end

	rl_start_kbd_macro (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_start_kbd_macro (in `/usr/include/readline/readline.h')
               -- rl_start_kbd_macro
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_start_kbd_macro"
               }"
               end

	rl_startup_hook: POINTER
               -- rl_startup_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_startup_hook"
               }"
               end

       address_of_rl_startup_hook: POINTER
               -- Address of rl_startup_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_startup_hook"
               }"
               end

       set_rl_startup_hook (a_value: POINTER)
               -- Set variable rl_startup_hook value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_startup_hook"
               }"
               end

	rl_stop_output (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_stop_output (in `/usr/include/readline/readline.h')
               -- rl_stop_output
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_stop_output"
               }"
               end

	rl_stuff_char (argument_1: INTEGER): INTEGER 

		-- function rl_stuff_char (in `/usr/include/readline/readline.h')
               -- rl_stuff_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_stuff_char"
               }"
               end

	rl_tab_insert (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_tab_insert (in `/usr/include/readline/readline.h')
               -- rl_tab_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_tab_insert"
               }"
               end

	rl_terminal_name: POINTER
               -- rl_terminal_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_terminal_name"
               }"
               end

       address_of_rl_terminal_name: POINTER
               -- Address of rl_terminal_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_terminal_name"
               }"
               end

       set_rl_terminal_name (a_value: POINTER)
               -- Set variable rl_terminal_name value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_terminal_name"
               }"
               end

	rl_tilde_expand (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_tilde_expand (in `/usr/include/readline/readline.h')
               -- rl_tilde_expand
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_tilde_expand"
               }"
               end

	rl_translate_keyseq (argument_1: POINTER; argument_2: POINTER; argument_3: POINTER): INTEGER 

		-- function rl_translate_keyseq (in `/usr/include/readline/readline.h')
               -- rl_translate_keyseq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_translate_keyseq"
               }"
               end

	rl_transpose_chars (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_transpose_chars (in `/usr/include/readline/readline.h')
               -- rl_transpose_chars
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_transpose_chars"
               }"
               end

	rl_transpose_words (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_transpose_words (in `/usr/include/readline/readline.h')
               -- rl_transpose_words
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_transpose_words"
               }"
               end

	rl_tty_set_default_bindings (argument_1: POINTER) 

		-- function rl_tty_set_default_bindings (in `/usr/include/readline/readline.h')
               -- rl_tty_set_default_bindings
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_tty_set_default_bindings"
               }"
               end

	rl_tty_status (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_tty_status (in `/usr/include/readline/readline.h')
               -- rl_tty_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_tty_status"
               }"
               end

	rl_tty_unset_default_bindings (argument_1: POINTER) 

		-- function rl_tty_unset_default_bindings (in `/usr/include/readline/readline.h')
               -- rl_tty_unset_default_bindings
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_tty_unset_default_bindings"
               }"
               end

	rl_unbind_command_in_map (argument_1: POINTER; argument_2: POINTER): INTEGER 

		-- function rl_unbind_command_in_map (in `/usr/include/readline/readline.h')
               -- rl_unbind_command_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_unbind_command_in_map"
               }"
               end

	rl_unbind_function_in_map (argument_1: POINTER; argument_2: POINTER): INTEGER 

		-- function rl_unbind_function_in_map (in `/usr/include/readline/readline.h')
               -- rl_unbind_function_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_unbind_function_in_map"
               }"
               end

	rl_unbind_key (argument_1: INTEGER): INTEGER 

		-- function rl_unbind_key (in `/usr/include/readline/readline.h')
               -- rl_unbind_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_unbind_key"
               }"
               end

	rl_unbind_key_in_map (argument_1: INTEGER; argument_2: POINTER): INTEGER 

		-- function rl_unbind_key_in_map (in `/usr/include/readline/readline.h')
               -- rl_unbind_key_in_map
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_unbind_key_in_map"
               }"
               end

	rl_undo_command (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_undo_command (in `/usr/include/readline/readline.h')
               -- rl_undo_command
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_undo_command"
               }"
               end

	rl_undo_list: POINTER
               -- rl_undo_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_undo_list"
               }"
               end

       address_of_rl_undo_list: POINTER
               -- Address of rl_undo_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&rl_undo_list"
               }"
               end

       set_rl_undo_list (a_value: POINTER)
               -- Set variable rl_undo_list value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_rl_undo_list"
               }"
               end

	rl_universal_argument (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_universal_argument (in `/usr/include/readline/readline.h')
               -- rl_universal_argument
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_universal_argument"
               }"
               end

	rl_unix_filename_rubout (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_unix_filename_rubout (in `/usr/include/readline/readline.h')
               -- rl_unix_filename_rubout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_unix_filename_rubout"
               }"
               end

	rl_unix_line_discard (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_unix_line_discard (in `/usr/include/readline/readline.h')
               -- rl_unix_line_discard
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_unix_line_discard"
               }"
               end

	rl_unix_word_rubout (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_unix_word_rubout (in `/usr/include/readline/readline.h')
               -- rl_unix_word_rubout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_unix_word_rubout"
               }"
               end

	rl_untranslate_keyseq (argument_1: INTEGER): POINTER 

		-- function rl_untranslate_keyseq (in `/usr/include/readline/readline.h')
               -- rl_untranslate_keyseq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_untranslate_keyseq"
               }"
               end

	rl_upcase_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_upcase_word (in `/usr/include/readline/readline.h')
               -- rl_upcase_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_upcase_word"
               }"
               end

	rl_username_completion_function (argument_1: POINTER; argument_2: INTEGER): POINTER 

		-- function rl_username_completion_function (in `/usr/include/readline/readline.h')
               -- rl_username_completion_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_username_completion_function"
               }"
               end

	rl_variable_bind (argument_1: POINTER; argument_2: POINTER): INTEGER 

		-- function rl_variable_bind (in `/usr/include/readline/readline.h')
               -- rl_variable_bind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_variable_bind"
               }"
               end

	rl_variable_dumper (argument_1: INTEGER) 

		-- function rl_variable_dumper (in `/usr/include/readline/readline.h')
               -- rl_variable_dumper
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_variable_dumper"
               }"
               end

	rl_variable_value (argument_1: POINTER): POINTER 

		-- function rl_variable_value (in `/usr/include/readline/readline.h')
               -- rl_variable_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_variable_value"
               }"
               end

	rl_vi_append_eol (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_append_eol (in `/usr/include/readline/readline.h')
               -- rl_vi_append_eol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_append_eol"
               }"
               end

	rl_vi_append_mode (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_append_mode (in `/usr/include/readline/readline.h')
               -- rl_vi_append_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_append_mode"
               }"
               end

	rl_vi_arg_digit (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_arg_digit (in `/usr/include/readline/readline.h')
               -- rl_vi_arg_digit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_arg_digit"
               }"
               end

	rl_vi_b_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_bWord (in `/usr/include/readline/readline.h')
               -- rl_vi_bWord
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_bWord"
               }"
               end

	rl_vi_back_to_indent (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_back_to_indent (in `/usr/include/readline/readline.h')
               -- rl_vi_back_to_indent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_back_to_indent"
               }"
               end

	rl_vi_bracktype (argument_1: INTEGER): INTEGER 

		-- function rl_vi_bracktype (in `/usr/include/readline/readline.h')
               -- rl_vi_bracktype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_bracktype"
               }"
               end

	rl_vi_bword (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_bword (in `/usr/include/readline/readline.h')
               -- rl_vi_bword
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_bword"
               }"
               end

	rl_vi_change_case (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_change_case (in `/usr/include/readline/readline.h')
               -- rl_vi_change_case
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_change_case"
               }"
               end

	rl_vi_change_char (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_change_char (in `/usr/include/readline/readline.h')
               -- rl_vi_change_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_change_char"
               }"
               end

	rl_vi_change_to (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_change_to (in `/usr/include/readline/readline.h')
               -- rl_vi_change_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_change_to"
               }"
               end

	rl_vi_char_search (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_char_search (in `/usr/include/readline/readline.h')
               -- rl_vi_char_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_char_search"
               }"
               end

	rl_vi_check: INTEGER 

		-- function rl_vi_check (in `/usr/include/readline/readline.h')
               -- rl_vi_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_check()"
               }"
               end

	rl_vi_column (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_column (in `/usr/include/readline/readline.h')
               -- rl_vi_column
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_column"
               }"
               end

	rl_vi_complete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_complete (in `/usr/include/readline/readline.h')
               -- rl_vi_complete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_complete"
               }"
               end

	rl_vi_delete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_delete (in `/usr/include/readline/readline.h')
               -- rl_vi_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_delete"
               }"
               end

	rl_vi_delete_to (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_delete_to (in `/usr/include/readline/readline.h')
               -- rl_vi_delete_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_delete_to"
               }"
               end

	rl_vi_domove (argument_1: INTEGER; argument_2: POINTER): INTEGER 

		-- function rl_vi_domove (in `/usr/include/readline/readline.h')
               -- rl_vi_domove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_domove"
               }"
               end

	rl_vi_e_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_eWord (in `/usr/include/readline/readline.h')
               -- rl_vi_eWord
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_eWord"
               }"
               end

	rl_vi_editing_mode (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_editing_mode (in `/usr/include/readline/readline.h')
               -- rl_vi_editing_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_editing_mode"
               }"
               end

	rl_vi_end_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_end_word (in `/usr/include/readline/readline.h')
               -- rl_vi_end_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_end_word"
               }"
               end

	rl_vi_eof_maybe (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_eof_maybe (in `/usr/include/readline/readline.h')
               -- rl_vi_eof_maybe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_eof_maybe"
               }"
               end

	rl_vi_eword (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_eword (in `/usr/include/readline/readline.h')
               -- rl_vi_eword
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_eword"
               }"
               end

	rl_vi_f_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_fWord (in `/usr/include/readline/readline.h')
               -- rl_vi_fWord
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_fWord"
               }"
               end

	rl_vi_fetch_history (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_fetch_history (in `/usr/include/readline/readline.h')
               -- rl_vi_fetch_history
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_fetch_history"
               }"
               end

	rl_vi_first_print (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_first_print (in `/usr/include/readline/readline.h')
               -- rl_vi_first_print
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_first_print"
               }"
               end

	rl_vi_fword (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_fword (in `/usr/include/readline/readline.h')
               -- rl_vi_fword
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_fword"
               }"
               end

	rl_vi_goto_mark (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_goto_mark (in `/usr/include/readline/readline.h')
               -- rl_vi_goto_mark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_goto_mark"
               }"
               end

	rl_vi_insert_beg (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_insert_beg (in `/usr/include/readline/readline.h')
               -- rl_vi_insert_beg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_insert_beg"
               }"
               end

	rl_vi_insert_mode (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_insert_mode (in `/usr/include/readline/readline.h')
               -- rl_vi_insert_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_insert_mode"
               }"
               end

	rl_vi_insertion_mode (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_insertion_mode (in `/usr/include/readline/readline.h')
               -- rl_vi_insertion_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_insertion_mode"
               }"
               end

	rl_vi_match (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_match (in `/usr/include/readline/readline.h')
               -- rl_vi_match
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_match"
               }"
               end

	rl_vi_movement_mode (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_movement_mode (in `/usr/include/readline/readline.h')
               -- rl_vi_movement_mode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_movement_mode"
               }"
               end

	rl_vi_next_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_next_word (in `/usr/include/readline/readline.h')
               -- rl_vi_next_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_next_word"
               }"
               end

	rl_vi_overstrike (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_overstrike (in `/usr/include/readline/readline.h')
               -- rl_vi_overstrike
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_overstrike"
               }"
               end

	rl_vi_overstrike_delete (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_overstrike_delete (in `/usr/include/readline/readline.h')
               -- rl_vi_overstrike_delete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_overstrike_delete"
               }"
               end

	rl_vi_prev_word (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_prev_word (in `/usr/include/readline/readline.h')
               -- rl_vi_prev_word
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_prev_word"
               }"
               end

	rl_vi_put (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_put (in `/usr/include/readline/readline.h')
               -- rl_vi_put
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_put"
               }"
               end

	rl_vi_redo (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_redo (in `/usr/include/readline/readline.h')
               -- rl_vi_redo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_redo"
               }"
               end

	rl_vi_replace (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_replace (in `/usr/include/readline/readline.h')
               -- rl_vi_replace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_replace"
               }"
               end

	rl_vi_rubout (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_rubout (in `/usr/include/readline/readline.h')
               -- rl_vi_rubout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_rubout"
               }"
               end

	rl_vi_search (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_search (in `/usr/include/readline/readline.h')
               -- rl_vi_search
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_search"
               }"
               end

	rl_vi_search_again (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_search_again (in `/usr/include/readline/readline.h')
               -- rl_vi_search_again
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_search_again"
               }"
               end

	rl_vi_set_mark (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_set_mark (in `/usr/include/readline/readline.h')
               -- rl_vi_set_mark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_set_mark"
               }"
               end

	rl_vi_start_inserting (argument_1: INTEGER; argument_2: INTEGER; argument_3: INTEGER) 

		-- function rl_vi_start_inserting (in `/usr/include/readline/readline.h')
               -- rl_vi_start_inserting
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_start_inserting"
               }"
               end

	rl_vi_subst (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_subst (in `/usr/include/readline/readline.h')
               -- rl_vi_subst
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_subst"
               }"
               end

	rl_vi_tilde_expand (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_tilde_expand (in `/usr/include/readline/readline.h')
               -- rl_vi_tilde_expand
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_tilde_expand"
               }"
               end

	rl_vi_undo (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_undo (in `/usr/include/readline/readline.h')
               -- rl_vi_undo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_undo"
               }"
               end

	rl_vi_yank_arg (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_yank_arg (in `/usr/include/readline/readline.h')
               -- rl_vi_yank_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_yank_arg"
               }"
               end

	rl_vi_yank_to (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_vi_yank_to (in `/usr/include/readline/readline.h')
               -- rl_vi_yank_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_vi_yank_to"
               }"
               end

	rl_yank (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_yank (in `/usr/include/readline/readline.h')
               -- rl_yank
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_yank"
               }"
               end

	rl_yank_last_arg (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_yank_last_arg (in `/usr/include/readline/readline.h')
               -- rl_yank_last_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_yank_last_arg"
               }"
               end

	rl_yank_nth_arg (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_yank_nth_arg (in `/usr/include/readline/readline.h')
               -- rl_yank_nth_arg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_yank_nth_arg"
               }"
               end

	rl_yank_pop (argument_1: INTEGER; argument_2: INTEGER): INTEGER 

		-- function rl_yank_pop (in `/usr/include/readline/readline.h')
               -- rl_yank_pop
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rl_yank_pop"
               }"
               end


end -- class READLINE_EXTERNALS
