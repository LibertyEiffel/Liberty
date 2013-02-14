-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class READLINE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	rl_completer_word_break_characters: POINTER is
 		-- rl_completer_word_break_characters (node at line 642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completer_word_break_characters"
		}"
		end

	address_of_rl_completer_word_break_characters: POINTER is
 		-- Address of rl_completer_word_break_characters (node at line 642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completer_word_break_characters"
		}"
		end

	set_rl_completer_word_break_characters (a_value: POINTER) is
		-- Set variable rl_completer_word_break_characters value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completer_word_break_characters"
		}"
		end

	rl_completion_mark_symlink_dirs: INTEGER_32 is
 		-- rl_completion_mark_symlink_dirs (node at line 783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_mark_symlink_dirs"
		}"
		end

<<<<<<< HEAD
	address_of_rl_completion_mark_symlink_dirs: POINTER is
 		-- Address of rl_completion_mark_symlink_dirs (node at line 783)
=======
	rl_completion_mark_symlink_dirs: INTEGER_32 is
 		-- rl_completion_mark_symlink_dirs (node at line 791)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_mark_symlink_dirs"
		}"
		end

<<<<<<< HEAD
	set_rl_completion_mark_symlink_dirs (a_value: INTEGER_32) is
		-- Set variable rl_completion_mark_symlink_dirs value
=======
	address_of_rl_completion_mark_symlink_dirs: POINTER is
 		-- Address of rl_completion_mark_symlink_dirs (node at line 791)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_mark_symlink_dirs"
		}"
		end

	rl_event_hook: POINTER is
 		-- rl_event_hook (node at line 562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_event_hook"
		}"
		end

	address_of_rl_event_hook: POINTER is
 		-- Address of rl_event_hook (node at line 562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_event_hook"
		}"
		end

	set_rl_event_hook (a_value: POINTER) is
		-- Set variable rl_event_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_event_hook"
		}"
		end

	rl_completion_invoking_key: INTEGER_32 is
 		-- rl_completion_invoking_key (node at line 751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_invoking_key"
		}"
		end

	address_of_rl_completion_invoking_key: POINTER is
 		-- Address of rl_completion_invoking_key (node at line 751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_invoking_key"
		}"
		end

	set_rl_completion_invoking_key (a_value: INTEGER_32) is
		-- Set variable rl_completion_invoking_key value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_invoking_key"
		}"
		end

	rl_filename_quoting_function: POINTER is
 		-- rl_filename_quoting_function (node at line 729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_quoting_function"
		}"
		end

	address_of_rl_filename_quoting_function: POINTER is
 		-- Address of rl_filename_quoting_function (node at line 729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_filename_quoting_function"
		}"
		end

	set_rl_filename_quoting_function (a_value: POINTER) is
		-- Set variable rl_filename_quoting_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_filename_quoting_function"
		}"
		end

	rl_completion_query_items: INTEGER_32 is
 		-- rl_completion_query_items (node at line 756)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_query_items"
		}"
		end

	address_of_rl_completion_query_items: POINTER is
 		-- Address of rl_completion_query_items (node at line 756)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_query_items"
		}"
		end

	set_rl_completion_query_items (a_value: INTEGER_32) is
		-- Set variable rl_completion_query_items value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_query_items"
		}"
		end

	rl_done: INTEGER_32 is
 		-- rl_done (node at line 519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_done"
		}"
		end

	address_of_rl_done: POINTER is
 		-- Address of rl_done (node at line 519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_done"
		}"
		end

	set_rl_done (a_value: INTEGER_32) is
		-- Set variable rl_done value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_done"
		}"
		end

	rl_completion_entry_function: POINTER is
 		-- rl_completion_entry_function (node at line 611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_entry_function"
		}"
		end

	address_of_rl_completion_entry_function: POINTER is
 		-- Address of rl_completion_entry_function (node at line 611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_entry_function"
		}"
		end

	set_rl_completion_entry_function (a_value: POINTER) is
		-- Set variable rl_completion_entry_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_entry_function"
		}"
		end

	rl_numeric_arg: INTEGER_32 is
 		-- rl_numeric_arg (node at line 534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_numeric_arg"
		}"
		end

	address_of_rl_numeric_arg: POINTER is
 		-- Address of rl_numeric_arg (node at line 534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_numeric_arg"
		}"
		end

	set_rl_numeric_arg (a_value: INTEGER_32) is
		-- Set variable rl_numeric_arg value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_numeric_arg"
		}"
		end

	rl_directory_rewrite_hook: POINTER is
 		-- rl_directory_rewrite_hook (node at line 688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_directory_rewrite_hook"
		}"
		end

	address_of_rl_directory_rewrite_hook: POINTER is
 		-- Address of rl_directory_rewrite_hook (node at line 688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_directory_rewrite_hook"
		}"
		end

	set_rl_directory_rewrite_hook (a_value: POINTER) is
		-- Set variable rl_directory_rewrite_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_directory_rewrite_hook"
		}"
		end

	rl_basic_quote_characters: POINTER is
 		-- rl_basic_quote_characters (node at line 656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_basic_quote_characters"
		}"
		end

	address_of_rl_basic_quote_characters: POINTER is
 		-- Address of rl_basic_quote_characters (node at line 656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_basic_quote_characters"
		}"
		end

	set_rl_basic_quote_characters (a_value: POINTER) is
		-- Set variable rl_basic_quote_characters value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_basic_quote_characters"
		}"
		end

	rl_dispatching: INTEGER_32 is
 		-- rl_dispatching (node at line 527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dispatching"
		}"
		end

	address_of_rl_dispatching: POINTER is
 		-- Address of rl_dispatching (node at line 527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_dispatching"
		}"
		end

	set_rl_dispatching (a_value: INTEGER_32) is
		-- Set variable rl_dispatching value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_dispatching"
		}"
		end

	rl_ignore_some_completions_function: POINTER is
 		-- rl_ignore_some_completions_function (node at line 623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_ignore_some_completions_function"
		}"
		end

	address_of_rl_ignore_some_completions_function: POINTER is
 		-- Address of rl_ignore_some_completions_function (node at line 623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_ignore_some_completions_function"
		}"
		end

	set_rl_ignore_some_completions_function (a_value: POINTER) is
		-- Set variable rl_ignore_some_completions_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_ignore_some_completions_function"
		}"
		end

	rl_erase_empty_line: INTEGER_32 is
 		-- rl_erase_empty_line (node at line 581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_erase_empty_line"
		}"
		end

	address_of_rl_erase_empty_line: POINTER is
 		-- Address of rl_erase_empty_line (node at line 581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_erase_empty_line"
		}"
		end

	set_rl_erase_empty_line (a_value: INTEGER_32) is
		-- Set variable rl_erase_empty_line value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_erase_empty_line"
		}"
		end

	rl_binding_keymap: POINTER is
 		-- rl_binding_keymap (node at line 575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_binding_keymap"
		}"
		end

	address_of_rl_binding_keymap: POINTER is
 		-- Address of rl_binding_keymap (node at line 575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_binding_keymap"
		}"
		end

	set_rl_binding_keymap (a_value: POINTER) is
		-- Set variable rl_binding_keymap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_binding_keymap"
		}"
		end

	rl_prep_term_function: POINTER is
 		-- rl_prep_term_function (node at line 570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_prep_term_function"
		}"
		end

	address_of_rl_prep_term_function: POINTER is
 		-- Address of rl_prep_term_function (node at line 570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_prep_term_function"
		}"
		end

	set_rl_prep_term_function (a_value: POINTER) is
		-- Set variable rl_prep_term_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_prep_term_function"
		}"
		end

	rl_prefer_env_winsize: INTEGER_32 is
 		-- rl_prefer_env_winsize (node at line 549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_prefer_env_winsize"
		}"
		end

	address_of_rl_prefer_env_winsize: POINTER is
 		-- Address of rl_prefer_env_winsize (node at line 549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_prefer_env_winsize"
		}"
		end

	set_rl_prefer_env_winsize (a_value: INTEGER_32) is
		-- Set variable rl_prefer_env_winsize value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_prefer_env_winsize"
		}"
		end

	rl_filename_dequoting_function: POINTER is
 		-- rl_filename_dequoting_function (node at line 734)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_dequoting_function"
		}"
		end

	address_of_rl_filename_dequoting_function: POINTER is
 		-- Address of rl_filename_dequoting_function (node at line 734)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_filename_dequoting_function"
		}"
		end

	set_rl_filename_dequoting_function (a_value: POINTER) is
		-- Set variable rl_filename_dequoting_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_filename_dequoting_function"
		}"
		end

	rl_completer_quote_characters: POINTER is
 		-- rl_completer_quote_characters (node at line 653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completer_quote_characters"
		}"
		end

	address_of_rl_completer_quote_characters: POINTER is
 		-- Address of rl_completer_quote_characters (node at line 653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completer_quote_characters"
		}"
		end

	set_rl_completer_quote_characters (a_value: POINTER) is
		-- Set variable rl_completer_quote_characters value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completer_quote_characters"
		}"
		end

	rl_mark: INTEGER_32 is
 		-- rl_mark (node at line 515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_mark"
		}"
		end

	address_of_rl_mark: POINTER is
 		-- Address of rl_mark (node at line 515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_mark"
		}"
		end

	set_rl_mark (a_value: INTEGER_32) is
		-- Set variable rl_mark value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_mark"
		}"
		end

	rl_readline_state: INTEGER_32 is
 		-- rl_readline_state (node at line 485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_readline_state"
		}"
		end

	address_of_rl_readline_state: POINTER is
 		-- Address of rl_readline_state (node at line 485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_readline_state"
		}"
		end

	set_rl_readline_state (a_value: INTEGER_32) is
		-- Set variable rl_readline_state value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_readline_state"
		}"
		end

	rl_terminal_name: POINTER is
 		-- rl_terminal_name (node at line 540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_terminal_name"
		}"
		end

	address_of_rl_terminal_name: POINTER is
 		-- Address of rl_terminal_name (node at line 540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_terminal_name"
		}"
		end

	set_rl_terminal_name (a_value: POINTER) is
		-- Set variable rl_terminal_name value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_terminal_name"
		}"
		end

	rl_completion_type: INTEGER_32 is
 		-- rl_completion_type (node at line 748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_type"
		}"
		end

	address_of_rl_completion_type: POINTER is
 		-- Address of rl_completion_type (node at line 748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_type"
		}"
		end

	set_rl_completion_type (a_value: INTEGER_32) is
		-- Set variable rl_completion_type value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_type"
		}"
		end

	rl_inhibit_completion: INTEGER_32 is
 		-- rl_inhibit_completion (node at line 798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_inhibit_completion"
		}"
		end

	address_of_rl_inhibit_completion: POINTER is
 		-- Address of rl_inhibit_completion (node at line 798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_inhibit_completion"
		}"
		end

	set_rl_inhibit_completion (a_value: INTEGER_32) is
		-- Set variable rl_inhibit_completion value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_inhibit_completion"
		}"
		end

	rl_filename_quote_characters: POINTER is
 		-- rl_filename_quote_characters (node at line 659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_quote_characters"
		}"
		end

	address_of_rl_filename_quote_characters: POINTER is
 		-- Address of rl_filename_quote_characters (node at line 659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_filename_quote_characters"
		}"
		end

	set_rl_filename_quote_characters (a_value: POINTER) is
		-- Set variable rl_filename_quote_characters value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_filename_quote_characters"
		}"
		end

	rl_catch_sigwinch: INTEGER_32 is
 		-- rl_catch_sigwinch (node at line 605)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_catch_sigwinch"
		}"
		end

	address_of_rl_catch_sigwinch: POINTER is
 		-- Address of rl_catch_sigwinch (node at line 605)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_catch_sigwinch"
		}"
		end

	set_rl_catch_sigwinch (a_value: INTEGER_32) is
		-- Set variable rl_catch_sigwinch value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_catch_sigwinch"
		}"
		end

	rl_completion_word_break_hook: POINTER is
 		-- rl_completion_word_break_hook (node at line 647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_word_break_hook"
		}"
		end

	address_of_rl_completion_word_break_hook: POINTER is
 		-- Address of rl_completion_word_break_hook (node at line 647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_word_break_hook"
		}"
		end

	set_rl_completion_word_break_hook (a_value: POINTER) is
		-- Set variable rl_completion_word_break_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_word_break_hook"
		}"
		end

	rl_completion_quote_character: INTEGER_32 is
 		-- rl_completion_quote_character (node at line 768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_quote_character"
		}"
		end

	address_of_rl_completion_quote_character: POINTER is
 		-- Address of rl_completion_quote_character (node at line 768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_quote_character"
		}"
		end

	set_rl_completion_quote_character (a_value: INTEGER_32) is
		-- Set variable rl_completion_quote_character value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_quote_character"
		}"
		end

	rl_special_prefixes: POINTER is
 		-- rl_special_prefixes (node at line 664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_special_prefixes"
		}"
		end

	address_of_rl_special_prefixes: POINTER is
 		-- Address of rl_special_prefixes (node at line 664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_special_prefixes"
		}"
		end

	set_rl_special_prefixes (a_value: POINTER) is
		-- Set variable rl_special_prefixes value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_special_prefixes"
		}"
		end

	funmap: POINTER is
 		-- funmap (node at line 74)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "funmap"
		}"
		end

	address_of_funmap: POINTER is
 		-- Address of funmap (node at line 74)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&funmap"
		}"
		end

	set_funmap (a_value: POINTER) is
		-- Set variable funmap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_funmap"
		}"
		end

	rl_completion_display_matches_hook: POINTER is
 		-- rl_completion_display_matches_hook (node at line 711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_display_matches_hook"
		}"
		end

	address_of_rl_completion_display_matches_hook: POINTER is
 		-- Address of rl_completion_display_matches_hook (node at line 711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_display_matches_hook"
		}"
		end

	set_rl_completion_display_matches_hook (a_value: POINTER) is
		-- Set variable rl_completion_display_matches_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_display_matches_hook"
		}"
		end

	rl_outstream: POINTER is
 		-- rl_outstream (node at line 544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_outstream"
		}"
		end

	address_of_rl_outstream: POINTER is
 		-- Address of rl_outstream (node at line 544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_outstream"
		}"
		end

	set_rl_outstream (a_value: POINTER) is
		-- Set variable rl_outstream value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_outstream"
		}"
		end

	rl_filename_quoting_desired: INTEGER_32 is
 		-- rl_filename_quoting_desired (node at line 723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_quoting_desired"
		}"
		end

	address_of_rl_filename_quoting_desired: POINTER is
 		-- Address of rl_filename_quoting_desired (node at line 723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_filename_quoting_desired"
		}"
		end

	set_rl_filename_quoting_desired (a_value: INTEGER_32) is
		-- Set variable rl_filename_quoting_desired value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_filename_quoting_desired"
		}"
		end

	rl_library_version: POINTER is
 		-- rl_library_version (node at line 478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_library_version"
		}"
		end

	address_of_rl_library_version: POINTER is
 		-- Address of rl_library_version (node at line 478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_library_version"
		}"
		end

	set_rl_library_version (a_value: POINTER) is
		-- Set variable rl_library_version value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_library_version"
		}"
		end

	rl_filename_completion_desired: INTEGER_32 is
 		-- rl_filename_completion_desired (node at line 716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_completion_desired"
		}"
		end

	address_of_rl_filename_completion_desired: POINTER is
 		-- Address of rl_filename_completion_desired (node at line 716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_filename_completion_desired"
		}"
		end

	set_rl_filename_completion_desired (a_value: INTEGER_32) is
		-- Set variable rl_filename_completion_desired value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_filename_completion_desired"
		}"
		end

	rl_executing_keymap: POINTER is
 		-- rl_executing_keymap (node at line 574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_executing_keymap"
		}"
		end

	address_of_rl_executing_keymap: POINTER is
 		-- Address of rl_executing_keymap (node at line 574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_executing_keymap"
		}"
		end

	set_rl_executing_keymap (a_value: POINTER) is
		-- Set variable rl_executing_keymap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_executing_keymap"
		}"
		end

	rl_menu_completion_entry_function: POINTER is
 		-- rl_menu_completion_entry_function (node at line 615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_menu_completion_entry_function"
		}"
		end

	address_of_rl_menu_completion_entry_function: POINTER is
 		-- Address of rl_menu_completion_entry_function (node at line 615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_menu_completion_entry_function"
		}"
		end

	set_rl_menu_completion_entry_function (a_value: POINTER) is
		-- Set variable rl_menu_completion_entry_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_menu_completion_entry_function"
		}"
		end

	rl_readline_version: INTEGER_32 is
 		-- rl_readline_version (node at line 479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_readline_version"
		}"
		end

	address_of_rl_readline_version: POINTER is
 		-- Address of rl_readline_version (node at line 479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_readline_version"
		}"
		end

	set_rl_readline_version (a_value: INTEGER_32) is
		-- Set variable rl_readline_version value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_readline_version"
		}"
		end

	rl_undo_list: POINTER is
 		-- rl_undo_list (node at line 66)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_undo_list"
		}"
		end

	address_of_rl_undo_list: POINTER is
 		-- Address of rl_undo_list (node at line 66)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_undo_list"
		}"
		end

	set_rl_undo_list (a_value: POINTER) is
		-- Set variable rl_undo_list value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_undo_list"
		}"
		end

	rl_filename_rewrite_hook: POINTER is
 		-- rl_filename_rewrite_hook (node at line 699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_rewrite_hook"
		}"
		end

	address_of_rl_filename_rewrite_hook: POINTER is
 		-- Address of rl_filename_rewrite_hook (node at line 699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_filename_rewrite_hook"
		}"
		end

	set_rl_filename_rewrite_hook (a_value: POINTER) is
		-- Set variable rl_filename_rewrite_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_filename_rewrite_hook"
		}"
		end

	rl_pending_input: INTEGER_32 is
 		-- rl_pending_input (node at line 522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_pending_input"
		}"
		end

	address_of_rl_pending_input: POINTER is
 		-- Address of rl_pending_input (node at line 522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_pending_input"
		}"
		end

	set_rl_pending_input (a_value: INTEGER_32) is
		-- Set variable rl_pending_input value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_pending_input"
		}"
		end

	rl_deprep_term_function: POINTER is
 		-- rl_deprep_term_function (node at line 571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_deprep_term_function"
		}"
		end

	address_of_rl_deprep_term_function: POINTER is
 		-- Address of rl_deprep_term_function (node at line 571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_deprep_term_function"
		}"
		end

	set_rl_deprep_term_function (a_value: POINTER) is
		-- Set variable rl_deprep_term_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_deprep_term_function"
		}"
		end

	rl_num_chars_to_read: INTEGER_32 is
 		-- rl_num_chars_to_read (node at line 590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_num_chars_to_read"
		}"
		end

	address_of_rl_num_chars_to_read: POINTER is
 		-- Address of rl_num_chars_to_read (node at line 590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_num_chars_to_read"
		}"
		end

	set_rl_num_chars_to_read (a_value: INTEGER_32) is
		-- Set variable rl_num_chars_to_read value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_num_chars_to_read"
		}"
		end

	rl_attempted_completion_over: INTEGER_32 is
 		-- rl_attempted_completion_over (node at line 743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_attempted_completion_over"
		}"
		end

	address_of_rl_attempted_completion_over: POINTER is
 		-- Address of rl_attempted_completion_over (node at line 743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_attempted_completion_over"
		}"
		end

	set_rl_attempted_completion_over (a_value: INTEGER_32) is
		-- Set variable rl_attempted_completion_over value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_attempted_completion_over"
		}"
		end

	rl_completion_suppress_quote: INTEGER_32 is
 		-- rl_completion_suppress_quote (node at line 777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_suppress_quote"
		}"
		end

	address_of_rl_completion_suppress_quote: POINTER is
 		-- Address of rl_completion_suppress_quote (node at line 777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_suppress_quote"
		}"
		end

	set_rl_completion_suppress_quote (a_value: INTEGER_32) is
		-- Set variable rl_completion_suppress_quote value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_suppress_quote"
		}"
		end

	rl_line_buffer: POINTER is
 		-- rl_line_buffer (node at line 508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_line_buffer"
		}"
		end

	address_of_rl_line_buffer: POINTER is
 		-- Address of rl_line_buffer (node at line 508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_line_buffer"
		}"
		end

	set_rl_line_buffer (a_value: POINTER) is
		-- Set variable rl_line_buffer value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_line_buffer"
		}"
		end

	rl_pre_input_hook: POINTER is
 		-- rl_pre_input_hook (node at line 558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_pre_input_hook"
		}"
		end

	address_of_rl_pre_input_hook: POINTER is
 		-- Address of rl_pre_input_hook (node at line 558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_pre_input_hook"
		}"
		end

	set_rl_pre_input_hook (a_value: POINTER) is
		-- Set variable rl_pre_input_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_pre_input_hook"
		}"
		end

	rl_insert_mode: INTEGER_32 is
 		-- rl_insert_mode (node at line 493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_mode"
		}"
		end

	address_of_rl_insert_mode: POINTER is
 		-- Address of rl_insert_mode (node at line 493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_insert_mode"
		}"
		end

	set_rl_insert_mode (a_value: INTEGER_32) is
		-- Set variable rl_insert_mode value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_insert_mode"
		}"
		end

	rl_completion_suppress_append: INTEGER_32 is
 		-- rl_completion_suppress_append (node at line 764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_suppress_append"
		}"
		end

	address_of_rl_completion_suppress_append: POINTER is
 		-- Address of rl_completion_suppress_append (node at line 764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_suppress_append"
		}"
		end

	set_rl_completion_suppress_append (a_value: INTEGER_32) is
		-- Set variable rl_completion_suppress_append value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_suppress_append"
		}"
		end

	rl_redisplay_function: POINTER is
 		-- rl_redisplay_function (node at line 568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_redisplay_function"
		}"
		end

	address_of_rl_redisplay_function: POINTER is
 		-- Address of rl_redisplay_function (node at line 568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_redisplay_function"
		}"
		end

	set_rl_redisplay_function (a_value: POINTER) is
		-- Set variable rl_redisplay_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_redisplay_function"
		}"
		end

	rl_readline_name: POINTER is
 		-- rl_readline_name (node at line 497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_readline_name"
		}"
		end

	address_of_rl_readline_name: POINTER is
 		-- Address of rl_readline_name (node at line 497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_readline_name"
		}"
		end

	set_rl_readline_name (a_value: POINTER) is
		-- Set variable rl_readline_name value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_readline_name"
		}"
		end

	rl_explicit_arg: INTEGER_32 is
 		-- rl_explicit_arg (node at line 531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_explicit_arg"
		}"
		end

	address_of_rl_explicit_arg: POINTER is
 		-- Address of rl_explicit_arg (node at line 531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_explicit_arg"
		}"
		end

	set_rl_explicit_arg (a_value: INTEGER_32) is
		-- Set variable rl_explicit_arg value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_explicit_arg"
		}"
		end

	rl_editing_mode: INTEGER_32 is
 		-- rl_editing_mode (node at line 489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_editing_mode"
		}"
		end

	address_of_rl_editing_mode: POINTER is
 		-- Address of rl_editing_mode (node at line 489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_editing_mode"
		}"
		end

	set_rl_editing_mode (a_value: INTEGER_32) is
		-- Set variable rl_editing_mode value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_editing_mode"
		}"
		end

	rl_end: INTEGER_32 is
 		-- rl_end (node at line 512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end"
		}"
		end

	address_of_rl_end: POINTER is
 		-- Address of rl_end (node at line 512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_end"
		}"
		end

	set_rl_end (a_value: INTEGER_32) is
		-- Set variable rl_end value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_end"
		}"
		end

	rl_directory_completion_hook: POINTER is
 		-- rl_directory_completion_hook (node at line 675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_directory_completion_hook"
		}"
		end

	address_of_rl_directory_completion_hook: POINTER is
 		-- Address of rl_directory_completion_hook (node at line 675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_directory_completion_hook"
		}"
		end

	set_rl_directory_completion_hook (a_value: POINTER) is
		-- Set variable rl_directory_completion_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_directory_completion_hook"
		}"
		end

	rl_point: INTEGER_32 is
 		-- rl_point (node at line 511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_point"
		}"
		end

	address_of_rl_point: POINTER is
 		-- Address of rl_point (node at line 511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_point"
		}"
		end

	set_rl_point (a_value: INTEGER_32) is
		-- Set variable rl_point value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_point"
		}"
		end

	rl_executing_macro: POINTER is
 		-- rl_executing_macro (node at line 593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_executing_macro"
		}"
		end

	address_of_rl_executing_macro: POINTER is
 		-- Address of rl_executing_macro (node at line 593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_executing_macro"
		}"
		end

	set_rl_executing_macro (a_value: POINTER) is
		-- Set variable rl_executing_macro value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_executing_macro"
		}"
		end

	rl_catch_signals: INTEGER_32 is
 		-- rl_catch_signals (node at line 598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_catch_signals"
		}"
		end

	address_of_rl_catch_signals: POINTER is
 		-- Address of rl_catch_signals (node at line 598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_catch_signals"
		}"
		end

	set_rl_catch_signals (a_value: INTEGER_32) is
		-- Set variable rl_catch_signals value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_catch_signals"
		}"
		end

	rl_char_is_quoted_p: POINTER is
 		-- rl_char_is_quoted_p (node at line 739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_char_is_quoted_p"
		}"
		end

	address_of_rl_char_is_quoted_p: POINTER is
 		-- Address of rl_char_is_quoted_p (node at line 739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_char_is_quoted_p"
		}"
		end

	set_rl_char_is_quoted_p (a_value: POINTER) is
		-- Set variable rl_char_is_quoted_p value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_char_is_quoted_p"
		}"
		end

	rl_getc_function: POINTER is
 		-- rl_getc_function (node at line 566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_getc_function"
		}"
		end

	address_of_rl_getc_function: POINTER is
 		-- Address of rl_getc_function (node at line 566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_getc_function"
		}"
		end

	set_rl_getc_function (a_value: POINTER) is
		-- Set variable rl_getc_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_getc_function"
		}"
		end

	rl_sort_completion_matches: INTEGER_32 is
 		-- rl_sort_completion_matches (node at line 780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_sort_completion_matches"
		}"
		end

	address_of_rl_sort_completion_matches: POINTER is
 		-- Address of rl_sort_completion_matches (node at line 780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_sort_completion_matches"
		}"
		end

	set_rl_sort_completion_matches (a_value: INTEGER_32) is
		-- Set variable rl_sort_completion_matches value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_sort_completion_matches"
		}"
		end

	rl_display_prompt: POINTER is
 		-- rl_display_prompt (node at line 505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_display_prompt"
		}"
		end

	address_of_rl_display_prompt: POINTER is
 		-- Address of rl_display_prompt (node at line 505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_display_prompt"
		}"
		end

	set_rl_display_prompt (a_value: POINTER) is
		-- Set variable rl_display_prompt value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_display_prompt"
		}"
		end

	rl_prompt: POINTER is
 		-- rl_prompt (node at line 501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_prompt"
		}"
		end

	address_of_rl_prompt: POINTER is
 		-- Address of rl_prompt (node at line 501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_prompt"
		}"
		end

	set_rl_prompt (a_value: POINTER) is
		-- Set variable rl_prompt value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_prompt"
		}"
		end

	rl_last_func: POINTER is
 		-- rl_last_func (node at line 537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_last_func"
		}"
		end

	address_of_rl_last_func: POINTER is
 		-- Address of rl_last_func (node at line 537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_last_func"
		}"
		end

	set_rl_last_func (a_value: POINTER) is
		-- Set variable rl_last_func value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_last_func"
		}"
		end

	rl_gnu_readline_p: INTEGER_32 is
 		-- rl_gnu_readline_p (node at line 482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_gnu_readline_p"
		}"
		end

	address_of_rl_gnu_readline_p: POINTER is
 		-- Address of rl_gnu_readline_p (node at line 482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_gnu_readline_p"
		}"
		end

	set_rl_gnu_readline_p (a_value: INTEGER_32) is
		-- Set variable rl_gnu_readline_p value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_gnu_readline_p"
		}"
		end

	rl_already_prompted: INTEGER_32 is
 		-- rl_already_prompted (node at line 586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_already_prompted"
		}"
		end

	address_of_rl_already_prompted: POINTER is
 		-- Address of rl_already_prompted (node at line 586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_already_prompted"
		}"
		end

	set_rl_already_prompted (a_value: INTEGER_32) is
		-- Set variable rl_already_prompted value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_already_prompted"
		}"
		end

	rl_completion_found_quote: INTEGER_32 is
 		-- rl_completion_found_quote (node at line 772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_found_quote"
		}"
		end

	address_of_rl_completion_found_quote: POINTER is
 		-- Address of rl_completion_found_quote (node at line 772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_found_quote"
		}"
		end

	set_rl_completion_found_quote (a_value: INTEGER_32) is
		-- Set variable rl_completion_found_quote value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_found_quote"
		}"
		end

	rl_attempted_completion_function: POINTER is
 		-- rl_attempted_completion_function (node at line 632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_attempted_completion_function"
		}"
		end

	address_of_rl_attempted_completion_function: POINTER is
 		-- Address of rl_attempted_completion_function (node at line 632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_attempted_completion_function"
		}"
		end

	set_rl_attempted_completion_function (a_value: POINTER) is
		-- Set variable rl_attempted_completion_function value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_attempted_completion_function"
		}"
		end

	rl_ignore_completion_duplicates: INTEGER_32 is
 		-- rl_ignore_completion_duplicates (node at line 794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_ignore_completion_duplicates"
		}"
		end

	address_of_rl_ignore_completion_duplicates: POINTER is
 		-- Address of rl_ignore_completion_duplicates (node at line 794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_ignore_completion_duplicates"
		}"
		end

	set_rl_ignore_completion_duplicates (a_value: INTEGER_32) is
		-- Set variable rl_ignore_completion_duplicates value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_ignore_completion_duplicates"
		}"
		end

	rl_basic_word_break_characters: POINTER is
 		-- rl_basic_word_break_characters (node at line 637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_basic_word_break_characters"
		}"
		end

	address_of_rl_basic_word_break_characters: POINTER is
 		-- Address of rl_basic_word_break_characters (node at line 637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_basic_word_break_characters"
		}"
		end

	set_rl_basic_word_break_characters (a_value: POINTER) is
		-- Set variable rl_basic_word_break_characters value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_basic_word_break_characters"
		}"
		end

	rl_startup_hook: POINTER is
 		-- rl_startup_hook (node at line 553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_startup_hook"
		}"
		end

	address_of_rl_startup_hook: POINTER is
 		-- Address of rl_startup_hook (node at line 553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_startup_hook"
		}"
		end

	set_rl_startup_hook (a_value: POINTER) is
		-- Set variable rl_startup_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_startup_hook"
		}"
		end

	rl_completion_append_character: INTEGER_32 is
 		-- rl_completion_append_character (node at line 760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_append_character"
		}"
		end

	address_of_rl_completion_append_character: POINTER is
 		-- Address of rl_completion_append_character (node at line 760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_completion_append_character"
		}"
		end

	set_rl_completion_append_character (a_value: INTEGER_32) is
		-- Set variable rl_completion_append_character value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_completion_append_character"
		}"
		end

	rl_instream: POINTER is
 		-- rl_instream (node at line 543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_instream"
		}"
		end

	address_of_rl_instream: POINTER is
 		-- Address of rl_instream (node at line 543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&rl_instream"
		}"
		end

	set_rl_instream (a_value: POINTER) is
		-- Set variable rl_instream value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_rl_instream"
		}"
		end

	rl_reset_terminal (an_argument_l25_c7: POINTER): INTEGER_32 is
 		-- rl_reset_terminal (node at line 24)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_terminal"
		}"
		end

<<<<<<< HEAD
	rl_completion_matches (an_argument_l37_c7: POINTER; an_argument_l38_c7: POINTER): POINTER is
 		-- rl_completion_matches (node at line 36)
=======
	rl_completion_matches (an_argument_l39_c7: POINTER; an_argument_l40_c7: POINTER): POINTER is
 		-- rl_completion_matches (node at line 38)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_matches"
		}"
		end

	rl_discard_argument: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_discard_argument (node at line 41)
=======
 		-- rl_discard_argument (node at line 43)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_discard_argument()"
		}"
		end

<<<<<<< HEAD
	rl_vi_goto_mark (an_argument_l43_c7: INTEGER_32; an_argument_l44_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_goto_mark (node at line 42)
=======
	rl_vi_goto_mark (an_argument_l45_c7: INTEGER_32; an_argument_l46_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_goto_mark (node at line 44)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_goto_mark"
		}"
		end

<<<<<<< HEAD
	rl_get_next_history (an_argument_l54_c7: INTEGER_32; an_argument_l55_c7: INTEGER_32): INTEGER_32 is
 		-- rl_get_next_history (node at line 53)
=======
	rl_get_next_history (an_argument_l56_c7: INTEGER_32; an_argument_l57_c7: INTEGER_32): INTEGER_32 is
 		-- rl_get_next_history (node at line 55)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_next_history"
		}"
		end

<<<<<<< HEAD
	rl_translate_keyseq (an_argument_l90_c7: POINTER; an_argument_l91_c7: POINTER; an_argument_l92_c7: POINTER): INTEGER_32 is
 		-- rl_translate_keyseq (node at line 89)
=======
	rl_vi_insert_mode (an_argument_l92_c7: INTEGER_32; an_argument_l93_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insert_mode (node at line 91)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_insert_mode"
		}"
		end

	rl_translate_keyseq (an_argument_l96_c7: POINTER; an_argument_l97_c7: POINTER; an_argument_l98_c7: POINTER): INTEGER_32 is
 		-- rl_translate_keyseq (node at line 95)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_translate_keyseq"
		}"
		end

	rl_clear_pending_input: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_clear_pending_input (node at line 121)
=======
 		-- rl_clear_pending_input (node at line 127)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_clear_pending_input()"
		}"
		end

<<<<<<< HEAD
	rl_extend_line_buffer (an_argument_l123_c7: INTEGER_32) is
 		-- rl_extend_line_buffer (node at line 122)
=======
	rl_extend_line_buffer (an_argument_l129_c7: INTEGER_32) is
 		-- rl_extend_line_buffer (node at line 128)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_extend_line_buffer"
		}"
		end

	rl_clear_signals: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_clear_signals (node at line 136)
=======
 		-- rl_clear_signals (node at line 142)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_clear_signals()"
		}"
		end

	rl_copy_region_to_kill (an_argument_l165_c7: INTEGER_32; an_argument_l166_c7: INTEGER_32): INTEGER_32 is
 		-- rl_copy_region_to_kill (node at line 164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_region_to_kill"
		}"
		end

	rl_vi_yank_arg (an_argument_l182_c7: INTEGER_32; an_argument_l183_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_yank_arg (node at line 181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_yank_arg"
		}"
		end

	rl_unix_filename_rubout (an_argument_l195_c7: INTEGER_32; an_argument_l196_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unix_filename_rubout (node at line 194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unix_filename_rubout"
		}"
		end

	rl_menu_complete (an_argument_l199_c7: INTEGER_32; an_argument_l200_c7: INTEGER_32): INTEGER_32 is
 		-- rl_menu_complete (node at line 198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_menu_complete"
		}"
		end

	rl_kill_region (an_argument_l203_c7: INTEGER_32; an_argument_l204_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_region (node at line 202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_region"
		}"
		end

<<<<<<< HEAD
	rl_vi_put (an_argument_l269_c7: INTEGER_32; an_argument_l270_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_put (node at line 268)
=======
	rl_vi_put (an_argument_l283_c7: INTEGER_32; an_argument_l284_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_put (node at line 282)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_put"
		}"
		end

<<<<<<< HEAD
	rl_vi_tilde_expand (an_argument_l280_c7: INTEGER_32; an_argument_l281_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_tilde_expand (node at line 279)
=======
	rl_vi_tilde_expand (an_argument_l294_c7: INTEGER_32; an_argument_l295_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_tilde_expand (node at line 293)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_tilde_expand"
		}"
		end

	rl_vi_fetch_history (an_argument_l308_c7: INTEGER_32; an_argument_l309_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fetch_history (node at line 307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_fetch_history"
		}"
		end

	rl_backward_char (an_argument_l320_c7: INTEGER_32; an_argument_l321_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_char (node at line 319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_char"
		}"
		end

<<<<<<< HEAD
	rl_vi_insert_mode (an_argument_l312_c7: INTEGER_32; an_argument_l313_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insert_mode (node at line 311)
=======
	rl_backward_word (an_argument_l330_c7: INTEGER_32; an_argument_l331_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_word (node at line 329)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_insert_mode"
		}"
		end

	rl_add_funmap_entry (an_argument_l321_c7: POINTER; an_argument_l322_c7: POINTER): INTEGER_32 is
 		-- rl_add_funmap_entry (node at line 320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_add_funmap_entry"
		}"
		end

	rl_maybe_save_line: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_maybe_save_line (node at line 343)
=======
 		-- rl_maybe_save_line (node at line 353)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_maybe_save_line()"
		}"
		end

<<<<<<< HEAD
	rl_revert_line (an_argument_l345_c7: INTEGER_32; an_argument_l346_c7: INTEGER_32): INTEGER_32 is
 		-- rl_revert_line (node at line 344)
=======
	rl_revert_line (an_argument_l355_c7: INTEGER_32; an_argument_l356_c7: INTEGER_32): INTEGER_32 is
 		-- rl_revert_line (node at line 354)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_revert_line"
		}"
		end

<<<<<<< HEAD
	rl_tty_unset_default_bindings (an_argument_l349_c7: POINTER) is
 		-- rl_tty_unset_default_bindings (node at line 348)
=======
	rl_tty_unset_default_bindings (an_argument_l359_c7: POINTER) is
 		-- rl_tty_unset_default_bindings (node at line 358)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tty_unset_default_bindings"
		}"
		end

<<<<<<< HEAD
	rl_insert_text (an_argument_l364_c7: POINTER): INTEGER_32 is
 		-- rl_insert_text (node at line 363)
=======
	rl_insert_text (an_argument_l374_c7: POINTER): INTEGER_32 is
 		-- rl_insert_text (node at line 373)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_text"
		}"
		end

	rl_callback_read_char is
<<<<<<< HEAD
 		-- rl_callback_read_char (node at line 392)
=======
 		-- rl_callback_read_char (node at line 405)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_callback_read_char()"
		}"
		end

<<<<<<< HEAD
	rl_insert (an_argument_l398_c7: INTEGER_32; an_argument_l399_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert (node at line 397)
=======
	rl_insert (an_argument_l411_c7: INTEGER_32; an_argument_l412_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert (node at line 410)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert"
		}"
		end

<<<<<<< HEAD
	rl_vi_delete (an_argument_l402_c7: INTEGER_32; an_argument_l403_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_delete (node at line 401)
=======
	rl_vi_delete (an_argument_l415_c7: INTEGER_32; an_argument_l416_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_delete (node at line 414)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_delete"
		}"
		end

<<<<<<< HEAD
	rl_possible_completions (an_argument_l412_c7: INTEGER_32; an_argument_l413_c7: INTEGER_32): INTEGER_32 is
 		-- rl_possible_completions (node at line 411)
=======
	rl_possible_completions (an_argument_l419_c7: INTEGER_32; an_argument_l420_c7: INTEGER_32): INTEGER_32 is
 		-- rl_possible_completions (node at line 418)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_possible_completions"
		}"
		end

<<<<<<< HEAD
	rl_vi_bword (an_argument_l416_c7: INTEGER_32; an_argument_l417_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bword (node at line 415)
=======
	rl_vi_bword (an_argument_l423_c7: INTEGER_32; an_argument_l424_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bword (node at line 422)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_bword"
		}"
		end

<<<<<<< HEAD
	rl_forward (an_argument_l427_c7: INTEGER_32; an_argument_l428_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward (node at line 426)
=======
	rl_forward (an_argument_l434_c7: INTEGER_32; an_argument_l435_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward (node at line 433)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward"
		}"
		end

<<<<<<< HEAD
	rl_vi_subst (an_argument_l464_c7: INTEGER_32; an_argument_l465_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_subst (node at line 463)
=======
	rl_free (an_argument_l447_c7: POINTER) is
 		-- rl_free (node at line 446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_free"
		}"
		end

	rl_vi_subst (an_argument_l474_c7: INTEGER_32; an_argument_l475_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_subst (node at line 473)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_subst"
		}"
		end

<<<<<<< HEAD
	rl_echo_signal_char (an_argument_l481_c7: INTEGER_32) is
 		-- rl_echo_signal_char (node at line 480)
=======
	rl_echo_signal_char (an_argument_l491_c7: INTEGER_32) is
 		-- rl_echo_signal_char (node at line 490)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_echo_signal_char"
		}"
		end

<<<<<<< HEAD
	rl_bind_keyseq_if_unbound_in_map (an_argument_l484_c7: POINTER; an_argument_l485_c7: POINTER; an_argument_l486_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_if_unbound_in_map (node at line 483)
=======
	rl_bind_keyseq_if_unbound_in_map (an_argument_l494_c7: POINTER; an_argument_l495_c7: POINTER; an_argument_l496_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_if_unbound_in_map (node at line 493)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_keyseq_if_unbound_in_map"
		}"
		end

<<<<<<< HEAD
	rl_vi_search (an_argument_l493_c7: INTEGER_32; an_argument_l494_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_search (node at line 492)
=======
	rl_vi_search (an_argument_l507_c7: INTEGER_32; an_argument_l508_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_search (node at line 506)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_search"
		}"
		end

	rl_funmap_names: POINTER is
<<<<<<< HEAD
 		-- rl_funmap_names (node at line 502)
=======
 		-- rl_funmap_names (node at line 516)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_funmap_names()"
		}"
		end

<<<<<<< HEAD
	rl_yank_pop (an_argument_l504_c7: INTEGER_32; an_argument_l505_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_pop (node at line 503)
=======
	rl_yank_pop (an_argument_l518_c7: INTEGER_32; an_argument_l519_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_pop (node at line 517)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank_pop"
		}"
		end

<<<<<<< HEAD
	rl_emacs_editing_mode (an_argument_l511_c7: INTEGER_32; an_argument_l512_c7: INTEGER_32): INTEGER_32 is
 		-- rl_emacs_editing_mode (node at line 510)
=======
	rl_emacs_editing_mode (an_argument_l525_c7: INTEGER_32; an_argument_l526_c7: INTEGER_32): INTEGER_32 is
 		-- rl_emacs_editing_mode (node at line 524)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_emacs_editing_mode"
		}"
		end

	rl_reset_after_signal is
<<<<<<< HEAD
 		-- rl_reset_after_signal (node at line 514)
=======
 		-- rl_reset_after_signal (node at line 528)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_after_signal()"
		}"
		end

<<<<<<< HEAD
	rl_bind_key_if_unbound (an_argument_l526_c7: INTEGER_32; an_argument_l527_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_if_unbound (node at line 525)
=======
	rl_bind_key_if_unbound (an_argument_l540_c7: INTEGER_32; an_argument_l541_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_if_unbound (node at line 539)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key_if_unbound"
		}"
		end

<<<<<<< HEAD
	rl_vi_delete_to (an_argument_l537_c7: INTEGER_32; an_argument_l538_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_delete_to (node at line 536)
=======
	rl_vi_delete_to (an_argument_l551_c7: INTEGER_32; an_argument_l552_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_delete_to (node at line 550)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_delete_to"
		}"
		end

<<<<<<< HEAD
	rl_backward_char_search (an_argument_l547_c7: INTEGER_32; an_argument_l548_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_char_search (node at line 546)
=======
	rl_backward_char_search (an_argument_l561_c7: INTEGER_32; an_argument_l562_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_char_search (node at line 560)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_char_search"
		}"
		end

	rl_reset_line_state: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_reset_line_state (node at line 551)
=======
 		-- rl_reset_line_state (node at line 565)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_line_state()"
		}"
		end

<<<<<<< HEAD
	rl_variable_dumper (an_argument_l575_c7: INTEGER_32) is
 		-- rl_variable_dumper (node at line 574)
=======
	rl_username_completion_function (an_argument_l567_c7: POINTER; an_argument_l568_c7: INTEGER_32): POINTER is
 		-- rl_username_completion_function (node at line 566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_username_completion_function"
		}"
		end

	rl_variable_dumper (an_argument_l591_c7: INTEGER_32) is
 		-- rl_variable_dumper (node at line 590)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_variable_dumper"
		}"
		end

<<<<<<< HEAD
	rl_noninc_forward_search_again (an_argument_l578_c7: INTEGER_32; an_argument_l579_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_forward_search_again (node at line 577)
=======
	rl_noninc_forward_search_again (an_argument_l594_c7: INTEGER_32; an_argument_l595_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_forward_search_again (node at line 593)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_forward_search_again"
		}"
		end

	rl_get_keymap: POINTER is
<<<<<<< HEAD
 		-- rl_get_keymap (node at line 586)
=======
 		-- rl_get_keymap (node at line 602)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap()"
		}"
		end

<<<<<<< HEAD
	rl_insert_completions (an_argument_l589_c7: INTEGER_32; an_argument_l590_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_completions (node at line 588)
=======
	rl_message: INTEGER_32 is
 		-- rl_message (node at line 603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_message()"
		}"
		end

	rl_insert_completions (an_argument_l606_c7: INTEGER_32; an_argument_l607_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_completions (node at line 605)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_completions"
		}"
		end

<<<<<<< HEAD
	rl_add_undo (an_argument_l606_c7: INTEGER; an_argument_l607_c7: INTEGER_32; an_argument_l608_c7: INTEGER_32; an_argument_l609_c7: POINTER) is
 		-- rl_add_undo (node at line 605)
=======
	rl_add_undo (an_argument_l623_c7: INTEGER; an_argument_l624_c7: INTEGER_32; an_argument_l625_c7: INTEGER_32; an_argument_l626_c7: POINTER) is
 		-- rl_add_undo (node at line 622)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_add_undo"
		}"
		end

<<<<<<< HEAD
	rl_clear_screen (an_argument_l631_c7: INTEGER_32; an_argument_l632_c7: INTEGER_32): INTEGER_32 is
 		-- rl_clear_screen (node at line 630)
=======
	rl_clear_screen (an_argument_l648_c7: INTEGER_32; an_argument_l649_c7: INTEGER_32): INTEGER_32 is
 		-- rl_clear_screen (node at line 647)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_clear_screen"
		}"
		end

	rl_get_keymap_name_from_edit_mode: POINTER is
<<<<<<< HEAD
 		-- rl_get_keymap_name_from_edit_mode (node at line 634)
=======
 		-- rl_get_keymap_name_from_edit_mode (node at line 651)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap_name_from_edit_mode()"
		}"
		end

<<<<<<< HEAD
	rl_bind_keyseq_if_unbound (an_argument_l653_c7: POINTER; an_argument_l654_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_if_unbound (node at line 652)
=======
	rl_bind_keyseq_if_unbound (an_argument_l670_c7: POINTER; an_argument_l671_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_if_unbound (node at line 669)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_keyseq_if_unbound"
		}"
		end

<<<<<<< HEAD
	rl_overwrite_mode (an_argument_l664_c7: INTEGER_32; an_argument_l665_c7: INTEGER_32): INTEGER_32 is
 		-- rl_overwrite_mode (node at line 663)
=======
	rl_overwrite_mode (an_argument_l681_c7: INTEGER_32; an_argument_l682_c7: INTEGER_32): INTEGER_32 is
 		-- rl_overwrite_mode (node at line 680)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_overwrite_mode"
		}"
		end

<<<<<<< HEAD
	rl_dump_macros (an_argument_l688_c7: INTEGER_32; an_argument_l689_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_macros (node at line 687)
=======
	rl_dump_macros (an_argument_l704_c7: INTEGER_32; an_argument_l705_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_macros (node at line 703)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dump_macros"
		}"
		end

<<<<<<< HEAD
	rl_function_dumper (an_argument_l696_c7: INTEGER_32) is
 		-- rl_function_dumper (node at line 695)
=======
	rl_function_dumper (an_argument_l712_c7: INTEGER_32) is
 		-- rl_function_dumper (node at line 711)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_function_dumper"
		}"
		end

<<<<<<< HEAD
	rl_noninc_reverse_search (an_argument_l704_c7: INTEGER_32; an_argument_l705_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_reverse_search (node at line 703)
=======
	rl_noninc_reverse_search (an_argument_l720_c7: INTEGER_32; an_argument_l721_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_reverse_search (node at line 719)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_reverse_search"
		}"
		end

<<<<<<< HEAD
	rl_set_keyboard_input_timeout (an_argument_l708_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_keyboard_input_timeout (node at line 707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_keyboard_input_timeout"
		}"
		end

	rl_vi_overstrike_delete (an_argument_l717_c7: INTEGER_32; an_argument_l718_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_overstrike_delete (node at line 716)
=======
	rl_vi_overstrike_delete (an_argument_l730_c7: INTEGER_32; an_argument_l731_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_overstrike_delete (node at line 729)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_overstrike_delete"
		}"
		end

<<<<<<< HEAD
	rl_history_search_backward (an_argument_l726_c7: INTEGER_32; an_argument_l727_c7: INTEGER_32): INTEGER_32 is
 		-- rl_history_search_backward (node at line 725)
=======
	rl_history_search_backward (an_argument_l739_c7: INTEGER_32; an_argument_l740_c7: INTEGER_32): INTEGER_32 is
 		-- rl_history_search_backward (node at line 738)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_history_search_backward"
		}"
		end

<<<<<<< HEAD
	rl_backward_word (an_argument_l742_c7: INTEGER_32; an_argument_l743_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_word (node at line 741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_word"
		}"
		end

	rl_generic_bind (an_argument_l751_c7: INTEGER_32; an_argument_l752_c7: POINTER; an_argument_l753_c7: POINTER; an_argument_l754_c7: POINTER): INTEGER_32 is
 		-- rl_generic_bind (node at line 750)
=======
	rl_generic_bind (an_argument_l760_c7: INTEGER_32; an_argument_l761_c7: POINTER; an_argument_l762_c7: POINTER; an_argument_l763_c7: POINTER): INTEGER_32 is
 		-- rl_generic_bind (node at line 759)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_generic_bind"
		}"
		end

<<<<<<< HEAD
	rl_vi_complete (an_argument_l770_c7: INTEGER_32; an_argument_l771_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_complete (node at line 769)
=======
	rl_vi_complete (an_argument_l779_c7: INTEGER_32; an_argument_l780_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_complete (node at line 778)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_complete"
		}"
		end

	rl_on_new_line: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_on_new_line (node at line 778)
=======
 		-- rl_on_new_line (node at line 787)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_on_new_line()"
		}"
		end

	rl_read_key: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_read_key (node at line 779)
=======
 		-- rl_read_key (node at line 788)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_read_key()"
		}"
		end

<<<<<<< HEAD
	rl_add_defun (an_argument_l782_c7: POINTER; an_argument_l783_c7: POINTER; an_argument_l784_c7: INTEGER_32): INTEGER_32 is
 		-- rl_add_defun (node at line 781)
=======
	rl_add_defun (an_argument_l791_c7: POINTER; an_argument_l792_c7: POINTER; an_argument_l793_c7: INTEGER_32): INTEGER_32 is
 		-- rl_add_defun (node at line 790)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_add_defun"
		}"
		end

<<<<<<< HEAD
	rl_vi_undo (an_argument_l787_c7: INTEGER_32; an_argument_l788_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_undo (node at line 786)
=======
	rl_vi_undo (an_argument_l796_c7: INTEGER_32; an_argument_l797_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_undo (node at line 795)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_undo"
		}"
		end

	rl_make_bare_keymap: POINTER is
<<<<<<< HEAD
 		-- rl_make_bare_keymap (node at line 802)
=======
 		-- rl_make_bare_keymap (node at line 809)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_make_bare_keymap()"
		}"
		end

<<<<<<< HEAD
	rl_backward_kill_line (an_argument_l810_c7: INTEGER_32; an_argument_l811_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_kill_line (node at line 809)
=======
	rl_backward_kill_line (an_argument_l817_c7: INTEGER_32; an_argument_l818_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_kill_line (node at line 816)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_kill_line"
		}"
		end

<<<<<<< HEAD
	rl_forward_search_history (an_argument_l818_c7: INTEGER_32; an_argument_l819_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_search_history (node at line 817)
=======
	rl_forward_search_history (an_argument_l825_c7: INTEGER_32; an_argument_l826_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_search_history (node at line 824)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_search_history"
		}"
		end

	rl_redisplay is
<<<<<<< HEAD
 		-- rl_redisplay (node at line 821)
=======
 		-- rl_redisplay (node at line 828)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_redisplay()"
		}"
		end

<<<<<<< HEAD
	rl_noninc_reverse_search_again (an_argument_l823_c7: INTEGER_32; an_argument_l824_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_reverse_search_again (node at line 822)
=======
	rl_noninc_reverse_search_again (an_argument_l830_c7: INTEGER_32; an_argument_l831_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_reverse_search_again (node at line 829)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_reverse_search_again"
		}"
		end

<<<<<<< HEAD
	rl_backward_kill_word (an_argument_l827_c7: INTEGER_32; an_argument_l828_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_kill_word (node at line 826)
=======
	rl_backward_kill_word (an_argument_l834_c7: INTEGER_32; an_argument_l835_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_kill_word (node at line 833)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_kill_word"
		}"
		end

<<<<<<< HEAD
	rl_vi_change_char (an_argument_l835_c7: INTEGER_32; an_argument_l836_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_char (node at line 834)
=======
	rl_vi_change_char (an_argument_l842_c7: INTEGER_32; an_argument_l843_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_char (node at line 841)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_change_char"
		}"
		end

<<<<<<< HEAD
	rl_dump_functions (an_argument_l840_c7: INTEGER_32; an_argument_l841_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_functions (node at line 839)
=======
	rl_dump_functions (an_argument_l848_c7: INTEGER_32; an_argument_l849_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_functions (node at line 847)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dump_functions"
		}"
		end

<<<<<<< HEAD
	rl_invoking_keyseqs (an_argument_l851_c7: POINTER): POINTER is
 		-- rl_invoking_keyseqs (node at line 850)
=======
	rl_invoking_keyseqs (an_argument_l859_c7: POINTER): POINTER is
 		-- rl_invoking_keyseqs (node at line 858)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_invoking_keyseqs"
		}"
		end

	rl_forced_update_display: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_forced_update_display (node at line 859)
=======
 		-- rl_forced_update_display (node at line 867)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forced_update_display()"
		}"
		end

<<<<<<< HEAD
	rl_digit_argument (an_argument_l864_c7: INTEGER_32; an_argument_l865_c7: INTEGER_32): INTEGER_32 is
 		-- rl_digit_argument (node at line 863)
=======
	rl_digit_argument (an_argument_l872_c7: INTEGER_32; an_argument_l873_c7: INTEGER_32): INTEGER_32 is
 		-- rl_digit_argument (node at line 871)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_digit_argument"
		}"
		end

<<<<<<< HEAD
	rl_vi_arg_digit (an_argument_l868_c7: INTEGER_32; an_argument_l869_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_arg_digit (node at line 867)
=======
	rl_vi_arg_digit (an_argument_l876_c7: INTEGER_32; an_argument_l877_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_arg_digit (node at line 875)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_arg_digit"
		}"
		end

<<<<<<< HEAD
	rl_vi_yank_to (an_argument_l872_c7: INTEGER_32; an_argument_l873_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_yank_to (node at line 871)
=======
	rl_vi_yank_to (an_argument_l880_c7: INTEGER_32; an_argument_l881_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_yank_to (node at line 879)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_yank_to"
		}"
		end

<<<<<<< HEAD
	rl_vi_prev_word (an_argument_l881_c7: INTEGER_32; an_argument_l882_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_prev_word (node at line 880)
=======
	rl_vi_prev_word (an_argument_l889_c7: INTEGER_32; an_argument_l890_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_prev_word (node at line 888)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_prev_word"
		}"
		end

<<<<<<< HEAD
	rl_vi_next_word (an_argument_l894_c7: INTEGER_32; an_argument_l895_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_next_word (node at line 893)
=======
	rl_vi_next_word (an_argument_l902_c7: INTEGER_32; an_argument_l903_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_next_word (node at line 901)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_next_word"
		}"
		end

<<<<<<< HEAD
	rl_vi_first_print (an_argument_l898_c7: INTEGER_32; an_argument_l899_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_first_print (node at line 897)
=======
	rl_vi_first_print (an_argument_l906_c7: INTEGER_32; an_argument_l907_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_first_print (node at line 905)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_first_print"
		}"
		end

	rl_on_new_line_with_prompt: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_on_new_line_with_prompt (node at line 912)
=======
 		-- rl_on_new_line_with_prompt (node at line 920)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_on_new_line_with_prompt()"
		}"
		end

	rl_resize_terminal is
<<<<<<< HEAD
 		-- rl_resize_terminal (node at line 931)
=======
 		-- rl_resize_terminal (node at line 939)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_resize_terminal()"
		}"
		end

<<<<<<< HEAD
	rl_character_len (an_argument_l933_c7: INTEGER_32; an_argument_l934_c7: INTEGER_32): INTEGER_32 is
 		-- rl_character_len (node at line 932)
=======
	rl_character_len (an_argument_l941_c7: INTEGER_32; an_argument_l942_c7: INTEGER_32): INTEGER_32 is
 		-- rl_character_len (node at line 940)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_character_len"
		}"
		end

<<<<<<< HEAD
	rl_vi_append_eol (an_argument_l947_c7: INTEGER_32; an_argument_l948_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_append_eol (node at line 946)
=======
	rl_vi_append_eol (an_argument_l955_c7: INTEGER_32; an_argument_l956_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_append_eol (node at line 954)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_append_eol"
		}"
		end

<<<<<<< HEAD
	rl_re_read_init_file (an_argument_l951_c7: INTEGER_32; an_argument_l952_c7: INTEGER_32): INTEGER_32 is
 		-- rl_re_read_init_file (node at line 950)
=======
	rl_re_read_init_file (an_argument_l959_c7: INTEGER_32; an_argument_l960_c7: INTEGER_32): INTEGER_32 is
 		-- rl_re_read_init_file (node at line 958)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_re_read_init_file"
		}"
		end

<<<<<<< HEAD
	rl_refresh_line (an_argument_l955_c7: INTEGER_32; an_argument_l956_c7: INTEGER_32): INTEGER_32 is
 		-- rl_refresh_line (node at line 954)
=======
	rl_refresh_line (an_argument_l963_c7: INTEGER_32; an_argument_l964_c7: INTEGER_32): INTEGER_32 is
 		-- rl_refresh_line (node at line 962)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_refresh_line"
		}"
		end

<<<<<<< HEAD
	rl_kill_text (an_argument_l959_c7: INTEGER_32; an_argument_l960_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_text (node at line 958)
=======
	rl_kill_text (an_argument_l967_c7: INTEGER_32; an_argument_l968_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_text (node at line 966)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_text"
		}"
		end

	rl_initialize_funmap is
<<<<<<< HEAD
 		-- rl_initialize_funmap (node at line 972)
=======
 		-- rl_initialize_funmap (node at line 980)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_initialize_funmap()"
		}"
		end

<<<<<<< HEAD
	rl_get_keymap_name (an_argument_l977_c7: POINTER): POINTER is
 		-- rl_get_keymap_name (node at line 976)
=======
	rl_get_keymap_name (an_argument_l985_c7: POINTER): POINTER is
 		-- rl_get_keymap_name (node at line 984)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap_name"
		}"
		end

<<<<<<< HEAD
	rl_yank_nth_arg (an_argument_l980_c7: INTEGER_32; an_argument_l981_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_nth_arg (node at line 979)
=======
	rl_yank_nth_arg (an_argument_l988_c7: INTEGER_32; an_argument_l989_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_nth_arg (node at line 987)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank_nth_arg"
		}"
		end

<<<<<<< HEAD
	rl_end_kbd_macro (an_argument_l984_c7: INTEGER_32; an_argument_l985_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_kbd_macro (node at line 983)
=======
	rl_end_kbd_macro (an_argument_l992_c7: INTEGER_32; an_argument_l993_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_kbd_macro (node at line 991)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_kbd_macro"
		}"
		end

<<<<<<< HEAD
	rl_execute_next (an_argument_l988_c7: INTEGER_32): INTEGER_32 is
 		-- rl_execute_next (node at line 987)
=======
	rl_execute_next (an_argument_l996_c7: INTEGER_32): INTEGER_32 is
 		-- rl_execute_next (node at line 995)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_execute_next"
		}"
		end

<<<<<<< HEAD
	rl_vi_editing_mode (an_argument_l995_c7: INTEGER_32; an_argument_l996_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_editing_mode (node at line 994)
=======
	rl_vi_editing_mode (an_argument_l1003_c7: INTEGER_32; an_argument_l1004_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_editing_mode (node at line 1002)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_editing_mode"
		}"
		end

<<<<<<< HEAD
	rl_tty_set_default_bindings (an_argument_l1007_c7: POINTER) is
 		-- rl_tty_set_default_bindings (node at line 1006)
=======
	readline (an_argument_l1016_c7: POINTER): POINTER is
 		-- readline (node at line 1015)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tty_set_default_bindings"
		}"
		end

<<<<<<< HEAD
	rl_unbind_command_in_map (an_argument_l1039_c7: POINTER; an_argument_l1040_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_command_in_map (node at line 1038)
=======
	rl_tty_set_default_bindings (an_argument_l1023_c7: POINTER) is
 		-- rl_tty_set_default_bindings (node at line 1022)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_command_in_map"
		}"
		end

<<<<<<< HEAD
	rl_vi_end_word (an_argument_l1056_c7: INTEGER_32; an_argument_l1057_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_end_word (node at line 1055)
=======
	rl_unbind_command_in_map (an_argument_l1055_c7: POINTER; an_argument_l1056_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_command_in_map (node at line 1054)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_end_word"
		}"
		end

<<<<<<< HEAD
	rl_completion_mode (an_argument_l1066_c7: POINTER): INTEGER_32 is
 		-- rl_completion_mode (node at line 1065)
=======
	rl_vi_start_inserting (an_argument_l1066_c7: INTEGER_32; an_argument_l1067_c7: INTEGER_32; an_argument_l1068_c7: INTEGER_32) is
 		-- rl_vi_start_inserting (node at line 1065)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_mode"
		}"
		end

<<<<<<< HEAD
	rl_restart_output (an_argument_l1069_c7: INTEGER_32; an_argument_l1070_c7: INTEGER_32): INTEGER_32 is
 		-- rl_restart_output (node at line 1068)
=======
	rl_vi_end_word (an_argument_l1076_c7: INTEGER_32; an_argument_l1077_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_end_word (node at line 1075)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_restart_output"
		}"
		end

<<<<<<< HEAD
	readline (an_argument_l1113_c7: POINTER): POINTER is
 		-- readline (node at line 1112)
=======
	rl_completion_mode (an_argument_l1086_c7: POINTER): INTEGER_32 is
 		-- rl_completion_mode (node at line 1085)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "readline"
		}"
		end

<<<<<<< HEAD
	rl_function_of_keyseq (an_argument_l1116_c7: POINTER; an_argument_l1117_c7: POINTER; an_argument_l1118_c7: POINTER): POINTER is
 		-- rl_function_of_keyseq (node at line 1115)
=======
	rl_restart_output (an_argument_l1089_c7: INTEGER_32; an_argument_l1090_c7: INTEGER_32): INTEGER_32 is
 		-- rl_restart_output (node at line 1088)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_function_of_keyseq"
		}"
		end

<<<<<<< HEAD
	rl_vi_start_inserting (an_argument_l1121_c7: INTEGER_32; an_argument_l1122_c7: INTEGER_32; an_argument_l1123_c7: INTEGER_32) is
 		-- rl_vi_start_inserting (node at line 1120)
=======
	rl_function_of_keyseq (an_argument_l1133_c7: POINTER; an_argument_l1134_c7: POINTER; an_argument_l1135_c7: POINTER): POINTER is
 		-- rl_function_of_keyseq (node at line 1132)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_start_inserting"
		}"
		end

<<<<<<< HEAD
	rl_expand_prompt (an_argument_l1126_c7: POINTER): INTEGER_32 is
 		-- rl_expand_prompt (node at line 1125)
=======
	rl_expand_prompt (an_argument_l1138_c7: POINTER): INTEGER_32 is
 		-- rl_expand_prompt (node at line 1137)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_expand_prompt"
		}"
		end

<<<<<<< HEAD
	rl_macro_bind (an_argument_l1134_c7: POINTER; an_argument_l1135_c7: POINTER; an_argument_l1136_c7: POINTER): INTEGER_32 is
 		-- rl_macro_bind (node at line 1133)
=======
	rl_macro_bind (an_argument_l1146_c7: POINTER; an_argument_l1147_c7: POINTER; an_argument_l1148_c7: POINTER): INTEGER_32 is
 		-- rl_macro_bind (node at line 1145)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_macro_bind"
		}"
		end

	rl_initialize: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_initialize (node at line 1144)
=======
 		-- rl_initialize (node at line 1156)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_initialize()"
		}"
		end

<<<<<<< HEAD
	rl_end_of_line (an_argument_l1162_c7: INTEGER_32; an_argument_l1163_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_of_line (node at line 1161)
=======
	rl_end_of_line (an_argument_l1173_c7: INTEGER_32; an_argument_l1174_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_of_line (node at line 1172)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_of_line"
		}"
		end

<<<<<<< HEAD
	rl_set_screen_size (an_argument_l1166_c7: INTEGER_32; an_argument_l1167_c7: INTEGER_32) is
 		-- rl_set_screen_size (node at line 1165)
=======
	rl_set_screen_size (an_argument_l1177_c7: INTEGER_32; an_argument_l1178_c7: INTEGER_32) is
 		-- rl_set_screen_size (node at line 1176)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_screen_size"
		}"
		end

<<<<<<< HEAD
	rl_capitalize_word (an_argument_l1180_c7: INTEGER_32; an_argument_l1181_c7: INTEGER_32): INTEGER_32 is
 		-- rl_capitalize_word (node at line 1179)
=======
	rl_capitalize_word (an_argument_l1191_c7: INTEGER_32; an_argument_l1192_c7: INTEGER_32): INTEGER_32 is
 		-- rl_capitalize_word (node at line 1190)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_capitalize_word"
		}"
		end

<<<<<<< HEAD
	rl_set_keymap (an_argument_l1184_c7: POINTER) is
 		-- rl_set_keymap (node at line 1183)
=======
	rl_set_keymap (an_argument_l1195_c7: POINTER) is
 		-- rl_set_keymap (node at line 1194)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_keymap"
		}"
		end

<<<<<<< HEAD
	rl_bind_key_in_map (an_argument_l1187_c7: INTEGER_32; an_argument_l1188_c7: POINTER; an_argument_l1189_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_in_map (node at line 1186)
=======
	rl_bind_key_in_map (an_argument_l1198_c7: INTEGER_32; an_argument_l1199_c7: POINTER; an_argument_l1200_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_in_map (node at line 1197)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key_in_map"
		}"
		end

<<<<<<< HEAD
	rl_start_kbd_macro (an_argument_l1197_c7: INTEGER_32; an_argument_l1198_c7: INTEGER_32): INTEGER_32 is
 		-- rl_start_kbd_macro (node at line 1196)
=======
	rl_start_kbd_macro (an_argument_l1208_c7: INTEGER_32; an_argument_l1209_c7: INTEGER_32): INTEGER_32 is
 		-- rl_start_kbd_macro (node at line 1207)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_start_kbd_macro"
		}"
		end

<<<<<<< HEAD
	rl_vi_append_mode (an_argument_l1203_c7: INTEGER_32; an_argument_l1204_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_append_mode (node at line 1202)
=======
	rl_vi_append_mode (an_argument_l1214_c7: INTEGER_32; an_argument_l1215_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_append_mode (node at line 1213)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_append_mode"
		}"
		end

<<<<<<< HEAD
	rl_bind_key (an_argument_l1207_c7: INTEGER_32; an_argument_l1208_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key (node at line 1206)
=======
	rl_bind_key (an_argument_l1218_c7: INTEGER_32; an_argument_l1219_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key (node at line 1217)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key"
		}"
		end

<<<<<<< HEAD
	rl_insert_comment (an_argument_l1216_c7: INTEGER_32; an_argument_l1217_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_comment (node at line 1215)
=======
	rl_insert_comment (an_argument_l1227_c7: INTEGER_32; an_argument_l1228_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_comment (node at line 1226)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_comment"
		}"
		end

<<<<<<< HEAD
	rl_get_keymap_by_name (an_argument_l1220_c7: POINTER): POINTER is
 		-- rl_get_keymap_by_name (node at line 1219)
=======
	rl_get_keymap_by_name (an_argument_l1231_c7: POINTER): POINTER is
 		-- rl_get_keymap_by_name (node at line 1230)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap_by_name"
		}"
		end

<<<<<<< HEAD
	rl_vi_insertion_mode (an_argument_l1223_c7: INTEGER_32; an_argument_l1224_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insertion_mode (node at line 1222)
=======
	rl_vi_insertion_mode (an_argument_l1234_c7: INTEGER_32; an_argument_l1235_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insertion_mode (node at line 1233)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_insertion_mode"
		}"
		end

<<<<<<< HEAD
	rl_set_key (an_argument_l1232_c7: POINTER; an_argument_l1233_c7: POINTER; an_argument_l1234_c7: POINTER): INTEGER_32 is
 		-- rl_set_key (node at line 1231)
=======
	rl_set_key (an_argument_l1246_c7: POINTER; an_argument_l1247_c7: POINTER; an_argument_l1248_c7: POINTER): INTEGER_32 is
 		-- rl_set_key (node at line 1245)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_key"
		}"
		end

<<<<<<< HEAD
	rl_arrow_keys (an_argument_l1239_c7: INTEGER_32; an_argument_l1240_c7: INTEGER_32): INTEGER_32 is
 		-- rl_arrow_keys (node at line 1238)
=======
	rl_arrow_keys (an_argument_l1256_c7: INTEGER_32; an_argument_l1257_c7: INTEGER_32): INTEGER_32 is
 		-- rl_arrow_keys (node at line 1255)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_arrow_keys"
		}"
		end

<<<<<<< HEAD
	rl_delete (an_argument_l1243_c7: INTEGER_32; an_argument_l1244_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete (node at line 1242)
=======
	rl_delete (an_argument_l1260_c7: INTEGER_32; an_argument_l1261_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete (node at line 1259)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete"
		}"
		end

<<<<<<< HEAD
	rl_get_screen_size (an_argument_l1249_c7: POINTER; an_argument_l1250_c7: POINTER) is
 		-- rl_get_screen_size (node at line 1248)
=======
	rl_get_screen_size (an_argument_l1267_c7: POINTER; an_argument_l1268_c7: POINTER) is
 		-- rl_get_screen_size (node at line 1266)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_screen_size"
		}"
		end

<<<<<<< HEAD
	rl_dump_variables (an_argument_l1254_c7: INTEGER_32; an_argument_l1255_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_variables (node at line 1253)
=======
	rl_dump_variables (an_argument_l1272_c7: INTEGER_32; an_argument_l1273_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_variables (node at line 1271)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dump_variables"
		}"
		end

<<<<<<< HEAD
	rl_vi_overstrike (an_argument_l1275_c7: INTEGER_32; an_argument_l1276_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_overstrike (node at line 1274)
=======
	rl_vi_overstrike (an_argument_l1293_c7: INTEGER_32; an_argument_l1294_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_overstrike (node at line 1292)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_overstrike"
		}"
		end

<<<<<<< HEAD
	rl_exchange_point_and_mark (an_argument_l1292_c7: INTEGER_32; an_argument_l1293_c7: INTEGER_32): INTEGER_32 is
 		-- rl_exchange_point_and_mark (node at line 1291)
=======
	rl_exchange_point_and_mark (an_argument_l1310_c7: INTEGER_32; an_argument_l1311_c7: INTEGER_32): INTEGER_32 is
 		-- rl_exchange_point_and_mark (node at line 1309)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_exchange_point_and_mark"
		}"
		end

<<<<<<< HEAD
	rl_vi_f_word (an_argument_l1297_c7: INTEGER_32; an_argument_l1298_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fWord (node at line 1296)
=======
	rl_vi_f_word (an_argument_l1315_c7: INTEGER_32; an_argument_l1316_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fWord (node at line 1314)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_fWord"
		}"
		end

	rl_set_keymap_from_edit_mode is
<<<<<<< HEAD
 		-- rl_set_keymap_from_edit_mode (node at line 1301)
=======
 		-- rl_set_keymap_from_edit_mode (node at line 1319)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_keymap_from_edit_mode()"
		}"
		end

	rl_free_undo_list is
<<<<<<< HEAD
 		-- rl_free_undo_list (node at line 1302)
=======
 		-- rl_free_undo_list (node at line 1320)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_free_undo_list()"
		}"
		end

<<<<<<< HEAD
	rl_alphabetic (an_argument_l1304_c7: INTEGER_32): INTEGER_32 is
 		-- rl_alphabetic (node at line 1303)
=======
	rl_alphabetic (an_argument_l1322_c7: INTEGER_32): INTEGER_32 is
 		-- rl_alphabetic (node at line 1321)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_alphabetic"
		}"
		end

	rl_free_line_state is
<<<<<<< HEAD
 		-- rl_free_line_state (node at line 1314)
=======
 		-- rl_free_line_state (node at line 1332)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_free_line_state()"
		}"
		end

<<<<<<< HEAD
	rl_macro_dumper (an_argument_l1331_c7: INTEGER_32) is
 		-- rl_macro_dumper (node at line 1330)
=======
	rl_macro_dumper (an_argument_l1349_c7: INTEGER_32) is
 		-- rl_macro_dumper (node at line 1348)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_macro_dumper"
		}"
		end

<<<<<<< HEAD
	rl_reverse_search_history (an_argument_l1346_c7: INTEGER_32; an_argument_l1347_c7: INTEGER_32): INTEGER_32 is
 		-- rl_reverse_search_history (node at line 1345)
=======
	rl_reverse_search_history (an_argument_l1364_c7: INTEGER_32; an_argument_l1365_c7: INTEGER_32): INTEGER_32 is
 		-- rl_reverse_search_history (node at line 1363)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reverse_search_history"
		}"
		end

<<<<<<< HEAD
	rl_vi_redo (an_argument_l1354_c7: INTEGER_32; an_argument_l1355_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_redo (node at line 1353)
=======
	rl_vi_redo (an_argument_l1375_c7: INTEGER_32; an_argument_l1376_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_redo (node at line 1374)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_redo"
		}"
		end

<<<<<<< HEAD
	rl_vi_change_case (an_argument_l1366_c7: INTEGER_32; an_argument_l1367_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_case (node at line 1365)
=======
	rl_vi_change_case (an_argument_l1387_c7: INTEGER_32; an_argument_l1388_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_case (node at line 1386)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_change_case"
		}"
		end

<<<<<<< HEAD
	rl_filename_completion_function (an_argument_l1374_c7: POINTER; an_argument_l1375_c7: INTEGER_32): POINTER is
 		-- rl_filename_completion_function (node at line 1373)
=======
	rl_filename_completion_function (an_argument_l1395_c7: POINTER; an_argument_l1396_c7: INTEGER_32): POINTER is
 		-- rl_filename_completion_function (node at line 1394)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_completion_function"
		}"
		end

<<<<<<< HEAD
	rl_transpose_words (an_argument_l1378_c7: INTEGER_32; an_argument_l1379_c7: INTEGER_32): INTEGER_32 is
 		-- rl_transpose_words (node at line 1377)
=======
	rl_transpose_words (an_argument_l1399_c7: INTEGER_32; an_argument_l1400_c7: INTEGER_32): INTEGER_32 is
 		-- rl_transpose_words (node at line 1398)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_transpose_words"
		}"
		end

<<<<<<< HEAD
	rl_message: INTEGER_32 is
 		-- rl_message (node at line 1381)
=======
	rl_variable_value (an_argument_l1403_c7: POINTER): POINTER is
 		-- rl_variable_value (node at line 1402)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_message()"
		}"
		end

<<<<<<< HEAD
	rl_variable_value (an_argument_l1383_c7: POINTER): POINTER is
 		-- rl_variable_value (node at line 1382)
=======
	rl_callback_handler_remove is
 		-- rl_callback_handler_remove (node at line 1418)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_variable_value"
		}"
		end

<<<<<<< HEAD
	rl_callback_handler_remove is
 		-- rl_callback_handler_remove (node at line 1398)
=======
	rl_reset_screen_size is
 		-- rl_reset_screen_size (node at line 1434)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_callback_handler_remove()"
		}"
		end

<<<<<<< HEAD
	rl_old_menu_complete (an_argument_l1415_c7: INTEGER_32; an_argument_l1416_c7: INTEGER_32): INTEGER_32 is
 		-- rl_old_menu_complete (node at line 1414)
=======
	rl_old_menu_complete (an_argument_l1436_c7: INTEGER_32; an_argument_l1437_c7: INTEGER_32): INTEGER_32 is
 		-- rl_old_menu_complete (node at line 1435)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_old_menu_complete"
		}"
		end

<<<<<<< HEAD
	rl_vi_search_again (an_argument_l1437_c7: INTEGER_32; an_argument_l1438_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_search_again (node at line 1436)
=======
	rl_vi_search_again (an_argument_l1455_c7: INTEGER_32; an_argument_l1456_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_search_again (node at line 1454)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_search_again"
		}"
		end

	rl_ding: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_ding (node at line 1464)
=======
 		-- rl_ding (node at line 1485)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_ding()"
		}"
		end

<<<<<<< HEAD
	rl_backward_byte (an_argument_l1466_c7: INTEGER_32; an_argument_l1467_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_byte (node at line 1465)
=======
	rl_backward_byte (an_argument_l1487_c7: INTEGER_32; an_argument_l1488_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_byte (node at line 1486)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_byte"
		}"
		end

	rl_save_prompt is
<<<<<<< HEAD
 		-- rl_save_prompt (node at line 1485)
=======
 		-- rl_save_prompt (node at line 1506)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_save_prompt()"
		}"
		end

	rl_list_funmap_names is
<<<<<<< HEAD
 		-- rl_list_funmap_names (node at line 1487)
=======
 		-- rl_list_funmap_names (node at line 1507)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_list_funmap_names()"
		}"
		end

<<<<<<< HEAD
	rl_vi_e_word (an_argument_l1490_c7: INTEGER_32; an_argument_l1491_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eWord (node at line 1489)
=======
	rl_vi_e_word (an_argument_l1510_c7: INTEGER_32; an_argument_l1511_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eWord (node at line 1509)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_eWord"
		}"
		end

<<<<<<< HEAD
	rl_undo_command (an_argument_l1494_c7: INTEGER_32; an_argument_l1495_c7: INTEGER_32): INTEGER_32 is
 		-- rl_undo_command (node at line 1493)
=======
	rl_undo_command (an_argument_l1514_c7: INTEGER_32; an_argument_l1515_c7: INTEGER_32): INTEGER_32 is
 		-- rl_undo_command (node at line 1513)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_undo_command"
		}"
		end

<<<<<<< HEAD
	rl_vi_rubout (an_argument_l1522_c7: INTEGER_32; an_argument_l1523_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_rubout (node at line 1521)
=======
	rl_vi_rubout (an_argument_l1542_c7: INTEGER_32; an_argument_l1543_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_rubout (node at line 1541)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_rubout"
		}"
		end

<<<<<<< HEAD
	rl_tilde_expand (an_argument_l1566_c7: INTEGER_32; an_argument_l1567_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tilde_expand (node at line 1565)
=======
	rl_tilde_expand (an_argument_l1586_c7: INTEGER_32; an_argument_l1587_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tilde_expand (node at line 1585)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tilde_expand"
		}"
		end

<<<<<<< HEAD
	rl_vi_domove (an_argument_l1571_c7: INTEGER_32; an_argument_l1572_c7: POINTER): INTEGER_32 is
 		-- rl_vi_domove (node at line 1570)
=======
	rl_vi_domove (an_argument_l1591_c7: INTEGER_32; an_argument_l1592_c7: POINTER): INTEGER_32 is
 		-- rl_vi_domove (node at line 1590)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_domove"
		}"
		end

<<<<<<< HEAD
	rl_delete_or_show_completions (an_argument_l1586_c7: INTEGER_32; an_argument_l1587_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_or_show_completions (node at line 1585)
=======
	rl_delete_or_show_completions (an_argument_l1606_c7: INTEGER_32; an_argument_l1607_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_or_show_completions (node at line 1605)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete_or_show_completions"
		}"
		end

<<<<<<< HEAD
	rl_get_previous_history (an_argument_l1628_c7: INTEGER_32; an_argument_l1629_c7: INTEGER_32): INTEGER_32 is
 		-- rl_get_previous_history (node at line 1627)
=======
	rl_get_previous_history (an_argument_l1648_c7: INTEGER_32; an_argument_l1649_c7: INTEGER_32): INTEGER_32 is
 		-- rl_get_previous_history (node at line 1647)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_previous_history"
		}"
		end

<<<<<<< HEAD
	rl_char_search (an_argument_l1643_c7: INTEGER_32; an_argument_l1644_c7: INTEGER_32): INTEGER_32 is
 		-- rl_char_search (node at line 1642)
=======
	rl_char_search (an_argument_l1663_c7: INTEGER_32; an_argument_l1664_c7: INTEGER_32): INTEGER_32 is
 		-- rl_char_search (node at line 1662)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_char_search"
		}"
		end

<<<<<<< HEAD
	rl_do_lowercase_version (an_argument_l1647_c7: INTEGER_32; an_argument_l1648_c7: INTEGER_32): INTEGER_32 is
 		-- rl_do_lowercase_version (node at line 1646)
=======
	rl_do_lowercase_version (an_argument_l1667_c7: INTEGER_32; an_argument_l1668_c7: INTEGER_32): INTEGER_32 is
 		-- rl_do_lowercase_version (node at line 1666)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_do_lowercase_version"
		}"
		end

<<<<<<< HEAD
	rl_vi_insert_beg (an_argument_l1652_c7: INTEGER_32; an_argument_l1653_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insert_beg (node at line 1651)
=======
	rl_vi_insert_beg (an_argument_l1672_c7: INTEGER_32; an_argument_l1673_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insert_beg (node at line 1671)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_insert_beg"
		}"
		end

<<<<<<< HEAD
	rl_set_prompt (an_argument_l1679_c7: POINTER): INTEGER_32 is
 		-- rl_set_prompt (node at line 1678)
=======
	rl_set_prompt (an_argument_l1699_c7: POINTER): INTEGER_32 is
 		-- rl_set_prompt (node at line 1698)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_prompt"
		}"
		end

<<<<<<< HEAD
	rl_backward_menu_complete (an_argument_l1690_c7: INTEGER_32; an_argument_l1691_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_menu_complete (node at line 1689)
=======
	rl_backward_menu_complete (an_argument_l1710_c7: INTEGER_32; an_argument_l1711_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_menu_complete (node at line 1709)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_menu_complete"
		}"
		end

<<<<<<< HEAD
	rl_vi_change_to (an_argument_l1709_c7: INTEGER_32; an_argument_l1710_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_to (node at line 1708)
=======
	rl_vi_change_to (an_argument_l1729_c7: INTEGER_32; an_argument_l1730_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_to (node at line 1728)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_change_to"
		}"
		end

<<<<<<< HEAD
	rl_getc (an_argument_l1726_c7: POINTER): INTEGER_32 is
 		-- rl_getc (node at line 1725)
=======
	rl_getc (an_argument_l1747_c7: POINTER): INTEGER_32 is
 		-- rl_getc (node at line 1746)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_getc"
		}"
		end

<<<<<<< HEAD
	rl_call_last_kbd_macro (an_argument_l1739_c7: INTEGER_32; an_argument_l1740_c7: INTEGER_32): INTEGER_32 is
 		-- rl_call_last_kbd_macro (node at line 1738)
=======
	rl_call_last_kbd_macro (an_argument_l1760_c7: INTEGER_32; an_argument_l1761_c7: INTEGER_32): INTEGER_32 is
 		-- rl_call_last_kbd_macro (node at line 1759)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_call_last_kbd_macro"
		}"
		end

	rl_cleanup_after_signal is
<<<<<<< HEAD
 		-- rl_cleanup_after_signal (node at line 1757)
=======
 		-- rl_cleanup_after_signal (node at line 1778)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_cleanup_after_signal()"
		}"
		end

<<<<<<< HEAD
	rl_unbind_function_in_map (an_argument_l1773_c7: POINTER; an_argument_l1774_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_function_in_map (node at line 1772)
=======
	rl_unbind_function_in_map (an_argument_l1794_c7: POINTER; an_argument_l1795_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_function_in_map (node at line 1793)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_function_in_map"
		}"
		end

<<<<<<< HEAD
	rl_copy_text (an_argument_l1777_c7: INTEGER_32; an_argument_l1778_c7: INTEGER_32): POINTER is
 		-- rl_copy_text (node at line 1776)
=======
	rl_copy_text (an_argument_l1798_c7: INTEGER_32; an_argument_l1799_c7: INTEGER_32): POINTER is
 		-- rl_copy_text (node at line 1797)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_text"
		}"
		end

<<<<<<< HEAD
	rl_set_mark (an_argument_l1781_c7: INTEGER_32; an_argument_l1782_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_mark (node at line 1780)
=======
	rl_set_mark (an_argument_l1802_c7: INTEGER_32; an_argument_l1803_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_mark (node at line 1801)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_mark"
		}"
		end

	rl_crlf: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_crlf (node at line 1785)
=======
 		-- rl_crlf (node at line 1806)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_crlf()"
		}"
		end

<<<<<<< HEAD
	rl_tab_insert (an_argument_l1801_c7: INTEGER_32; an_argument_l1802_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tab_insert (node at line 1800)
=======
	rl_tab_insert (an_argument_l1822_c7: INTEGER_32; an_argument_l1823_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tab_insert (node at line 1821)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tab_insert"
		}"
		end

<<<<<<< HEAD
	rl_vi_set_mark (an_argument_l1810_c7: INTEGER_32; an_argument_l1811_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_set_mark (node at line 1809)
=======
	rl_vi_set_mark (an_argument_l1831_c7: INTEGER_32; an_argument_l1832_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_set_mark (node at line 1830)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_set_mark"
		}"
		end

<<<<<<< HEAD
	rl_get_termcap (an_argument_l1823_c7: POINTER): POINTER is
 		-- rl_get_termcap (node at line 1822)
=======
	rl_get_termcap (an_argument_l1844_c7: POINTER): POINTER is
 		-- rl_get_termcap (node at line 1843)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_termcap"
		}"
		end

<<<<<<< HEAD
	rl_noninc_forward_search (an_argument_l1826_c7: INTEGER_32; an_argument_l1827_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_forward_search (node at line 1825)
=======
	rl_noninc_forward_search (an_argument_l1847_c7: INTEGER_32; an_argument_l1848_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_forward_search (node at line 1846)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_forward_search"
		}"
		end

<<<<<<< HEAD
	rl_vi_char_search (an_argument_l1844_c7: INTEGER_32; an_argument_l1845_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_char_search (node at line 1843)
=======
	rl_vi_char_search (an_argument_l1865_c7: INTEGER_32; an_argument_l1866_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_char_search (node at line 1864)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_char_search"
		}"
		end

	rl_end_undo_group: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_end_undo_group (node at line 1847)
=======
 		-- rl_end_undo_group (node at line 1868)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_undo_group()"
		}"
		end

<<<<<<< HEAD
	rl_kill_line (an_argument_l1861_c7: INTEGER_32; an_argument_l1862_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_line (node at line 1860)
=======
	rl_kill_line (an_argument_l1882_c7: INTEGER_32; an_argument_l1883_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_line (node at line 1881)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_line"
		}"
		end

<<<<<<< HEAD
	rl_forward_char (an_argument_l1867_c7: INTEGER_32; an_argument_l1868_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_char (node at line 1866)
=======
	rl_forward_char (an_argument_l1888_c7: INTEGER_32; an_argument_l1889_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_char (node at line 1887)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_char"
		}"
		end

<<<<<<< HEAD
	rl_bind_keyseq (an_argument_l1872_c7: POINTER; an_argument_l1873_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq (node at line 1871)
=======
	rl_bind_keyseq (an_argument_l1893_c7: POINTER; an_argument_l1894_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq (node at line 1892)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_keyseq"
		}"
		end

<<<<<<< HEAD
	rl_quoted_insert (an_argument_l1879_c7: INTEGER_32; an_argument_l1880_c7: INTEGER_32): INTEGER_32 is
 		-- rl_quoted_insert (node at line 1878)
=======
	rl_quoted_insert (an_argument_l1901_c7: INTEGER_32; an_argument_l1902_c7: INTEGER_32): INTEGER_32 is
 		-- rl_quoted_insert (node at line 1900)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_quoted_insert"
		}"
		end

<<<<<<< HEAD
	rl_insert_close (an_argument_l1885_c7: INTEGER_32; an_argument_l1886_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_close (node at line 1884)
=======
	rl_insert_close (an_argument_l1907_c7: INTEGER_32; an_argument_l1908_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_close (node at line 1906)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_close"
		}"
		end

<<<<<<< HEAD
	rl_free (an_argument_l1889_c7: POINTER) is
 		-- rl_free (node at line 1888)
=======
	rl_invoking_keyseqs_in_map (an_argument_l1911_c7: POINTER; an_argument_l1912_c7: POINTER): POINTER is
 		-- rl_invoking_keyseqs_in_map (node at line 1910)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_free"
		}"
		end

<<<<<<< HEAD
	rl_yank_last_arg (an_argument_l1892_c7: INTEGER_32; an_argument_l1893_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_last_arg (node at line 1891)
=======
	rl_yank_last_arg (an_argument_l1915_c7: INTEGER_32; an_argument_l1916_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_last_arg (node at line 1914)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank_last_arg"
		}"
		end

	rl_begin_undo_group: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_begin_undo_group (node at line 1896)
=======
 		-- rl_begin_undo_group (node at line 1919)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_begin_undo_group()"
		}"
		end

<<<<<<< HEAD
	rl_delete_horizontal_space (an_argument_l1925_c7: INTEGER_32; an_argument_l1926_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_horizontal_space (node at line 1924)
=======
	rl_delete_horizontal_space (an_argument_l1948_c7: INTEGER_32; an_argument_l1949_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_horizontal_space (node at line 1947)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete_horizontal_space"
		}"
		end

<<<<<<< HEAD
	rl_named_function (an_argument_l1933_c7: POINTER): POINTER is
 		-- rl_named_function (node at line 1932)
=======
	rl_named_function (an_argument_l1956_c7: POINTER): POINTER is
 		-- rl_named_function (node at line 1955)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_named_function"
		}"
		end

<<<<<<< HEAD
	rl_complete (an_argument_l1939_c7: INTEGER_32; an_argument_l1940_c7: INTEGER_32): INTEGER_32 is
 		-- rl_complete (node at line 1938)
=======
	rl_complete (an_argument_l1962_c7: INTEGER_32; an_argument_l1963_c7: INTEGER_32): INTEGER_32 is
 		-- rl_complete (node at line 1961)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_complete"
		}"
		end

<<<<<<< HEAD
	rl_stuff_char (an_argument_l1991_c7: INTEGER_32): INTEGER_32 is
 		-- rl_stuff_char (node at line 1990)
=======
	rl_set_keyboard_input_timeout (an_argument_l1966_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_keyboard_input_timeout (node at line 1965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_keyboard_input_timeout"
		}"
		end

	rl_stuff_char (an_argument_l2017_c7: INTEGER_32): INTEGER_32 is
 		-- rl_stuff_char (node at line 2016)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_stuff_char"
		}"
		end

<<<<<<< HEAD
	rl_replace_line (an_argument_l1999_c7: POINTER; an_argument_l2000_c7: INTEGER_32) is
 		-- rl_replace_line (node at line 1998)
=======
	rl_replace_line (an_argument_l2025_c7: POINTER; an_argument_l2026_c7: INTEGER_32) is
 		-- rl_replace_line (node at line 2024)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_replace_line"
		}"
		end

<<<<<<< HEAD
	rl_vi_column (an_argument_l2004_c7: INTEGER_32; an_argument_l2005_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_column (node at line 2003)
=======
	rl_vi_column (an_argument_l2030_c7: INTEGER_32; an_argument_l2031_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_column (node at line 2029)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_column"
		}"
		end

<<<<<<< HEAD
	rl_unix_word_rubout (an_argument_l2015_c7: INTEGER_32; an_argument_l2016_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unix_word_rubout (node at line 2014)
=======
	rl_unix_word_rubout (an_argument_l2041_c7: INTEGER_32; an_argument_l2042_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unix_word_rubout (node at line 2040)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unix_word_rubout"
		}"
		end

<<<<<<< HEAD
	rl_unbind_key (an_argument_l2045_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unbind_key (node at line 2044)
=======
	rl_unbind_key (an_argument_l2071_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unbind_key (node at line 2070)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_key"
		}"
		end

<<<<<<< HEAD
	rl_rubout_or_delete (an_argument_l2064_c7: INTEGER_32; an_argument_l2065_c7: INTEGER_32): INTEGER_32 is
 		-- rl_rubout_or_delete (node at line 2063)
=======
	rl_rubout_or_delete (an_argument_l2090_c7: INTEGER_32; an_argument_l2091_c7: INTEGER_32): INTEGER_32 is
 		-- rl_rubout_or_delete (node at line 2089)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_rubout_or_delete"
		}"
		end

<<<<<<< HEAD
	rl_read_init_file (an_argument_l2068_c7: POINTER): INTEGER_32 is
 		-- rl_read_init_file (node at line 2067)
=======
	rl_read_init_file (an_argument_l2094_c7: POINTER): INTEGER_32 is
 		-- rl_read_init_file (node at line 2093)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_read_init_file"
		}"
		end

<<<<<<< HEAD
	rl_beg_of_line (an_argument_l2071_c7: INTEGER_32; an_argument_l2072_c7: INTEGER_32): INTEGER_32 is
 		-- rl_beg_of_line (node at line 2070)
=======
	rl_beg_of_line (an_argument_l2097_c7: INTEGER_32; an_argument_l2098_c7: INTEGER_32): INTEGER_32 is
 		-- rl_beg_of_line (node at line 2096)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_beg_of_line"
		}"
		end

<<<<<<< HEAD
	rl_parse_and_bind (an_argument_l2079_c7: POINTER): INTEGER_32 is
 		-- rl_parse_and_bind (node at line 2078)
=======
	rl_parse_and_bind (an_argument_l2105_c7: POINTER): INTEGER_32 is
 		-- rl_parse_and_bind (node at line 2104)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_parse_and_bind"
		}"
		end

<<<<<<< HEAD
	rl_display_match_list (an_argument_l2087_c7: POINTER; an_argument_l2088_c7: INTEGER_32; an_argument_l2089_c7: INTEGER_32) is
 		-- rl_display_match_list (node at line 2086)
=======
	rl_display_match_list (an_argument_l2113_c7: POINTER; an_argument_l2114_c7: INTEGER_32; an_argument_l2115_c7: INTEGER_32) is
 		-- rl_display_match_list (node at line 2112)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_display_match_list"
		}"
		end

<<<<<<< HEAD
	rl_end_of_history (an_argument_l2092_c7: INTEGER_32; an_argument_l2093_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_of_history (node at line 2091)
=======
	rl_end_of_history (an_argument_l2118_c7: INTEGER_32; an_argument_l2119_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_of_history (node at line 2117)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_of_history"
		}"
		end

<<<<<<< HEAD
	rl_reset_screen_size is
 		-- rl_reset_screen_size (node at line 2096)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_screen_size()"
		}"
		end

	rl_vi_eof_maybe (an_argument_l2104_c7: INTEGER_32; an_argument_l2105_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eof_maybe (node at line 2103)
=======
	rl_vi_eof_maybe (an_argument_l2129_c7: INTEGER_32; an_argument_l2130_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eof_maybe (node at line 2128)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_eof_maybe"
		}"
		end

<<<<<<< HEAD
	rl_callback_handler_install (an_argument_l2117_c7: POINTER; an_argument_l2118_c7: POINTER) is
 		-- rl_callback_handler_install (node at line 2116)
=======
	rl_callback_handler_install (an_argument_l2142_c7: POINTER; an_argument_l2143_c7: POINTER) is
 		-- rl_callback_handler_install (node at line 2141)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_callback_handler_install"
		}"
		end

<<<<<<< HEAD
	rl_newline (an_argument_l2128_c7: INTEGER_32; an_argument_l2129_c7: INTEGER_32): INTEGER_32 is
 		-- rl_newline (node at line 2127)
=======
	rl_newline (an_argument_l2153_c7: INTEGER_32; an_argument_l2154_c7: INTEGER_32): INTEGER_32 is
 		-- rl_newline (node at line 2152)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_newline"
		}"
		end

<<<<<<< HEAD
	rl_vi_b_word (an_argument_l2144_c7: INTEGER_32; an_argument_l2145_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bWord (node at line 2143)
=======
	rl_vi_b_word (an_argument_l2169_c7: INTEGER_32; an_argument_l2170_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bWord (node at line 2168)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_bWord"
		}"
		end

<<<<<<< HEAD
	rl_untranslate_keyseq (an_argument_l2149_c7: INTEGER_32): POINTER is
 		-- rl_untranslate_keyseq (node at line 2148)
=======
	rl_untranslate_keyseq (an_argument_l2174_c7: INTEGER_32): POINTER is
 		-- rl_untranslate_keyseq (node at line 2173)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_untranslate_keyseq"
		}"
		end

<<<<<<< HEAD
	rl_forward_word (an_argument_l2199_c7: INTEGER_32; an_argument_l2200_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_word (node at line 2198)
=======
	rl_forward_word (an_argument_l2224_c7: INTEGER_32; an_argument_l2225_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_word (node at line 2223)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_word"
		}"
		end

<<<<<<< HEAD
	rl_show_char (an_argument_l2203_c7: INTEGER_32): INTEGER_32 is
 		-- rl_show_char (node at line 2202)
=======
	rl_show_char (an_argument_l2228_c7: INTEGER_32): INTEGER_32 is
 		-- rl_show_char (node at line 2227)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_show_char"
		}"
		end

<<<<<<< HEAD
	rl_tty_status (an_argument_l2220_c7: INTEGER_32; an_argument_l2221_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tty_status (node at line 2219)
=======
	rl_tty_status (an_argument_l2245_c7: INTEGER_32; an_argument_l2246_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tty_status (node at line 2244)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tty_status"
		}"
		end

<<<<<<< HEAD
	rl_push_macro_input (an_argument_l2224_c7: POINTER) is
 		-- rl_push_macro_input (node at line 2223)
=======
	rl_push_macro_input (an_argument_l2249_c7: POINTER) is
 		-- rl_push_macro_input (node at line 2248)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_push_macro_input"
		}"
		end

	rl_do_undo: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_do_undo (node at line 2240)
=======
 		-- rl_do_undo (node at line 2260)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_do_undo()"
		}"
		end

<<<<<<< HEAD
	rl_rubout (an_argument_l2270_c7: INTEGER_32; an_argument_l2271_c7: INTEGER_32): INTEGER_32 is
 		-- rl_rubout (node at line 2269)
=======
	rl_rubout (an_argument_l2291_c7: INTEGER_32; an_argument_l2292_c7: INTEGER_32): INTEGER_32 is
 		-- rl_rubout (node at line 2290)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_rubout"
		}"
		end

<<<<<<< HEAD
	rl_beginning_of_history (an_argument_l2291_c7: INTEGER_32; an_argument_l2292_c7: INTEGER_32): INTEGER_32 is
 		-- rl_beginning_of_history (node at line 2290)
=======
	rl_beginning_of_history (an_argument_l2312_c7: INTEGER_32; an_argument_l2313_c7: INTEGER_32): INTEGER_32 is
 		-- rl_beginning_of_history (node at line 2311)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_beginning_of_history"
		}"
		end

<<<<<<< HEAD
	rl_backward (an_argument_l2295_c7: INTEGER_32; an_argument_l2296_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward (node at line 2294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward"
		}"
		end

	rl_restore_state (an_argument_l2307_c7: POINTER): INTEGER_32 is
 		-- rl_restore_state (node at line 2306)
=======
	rl_restore_state (an_argument_l2324_c7: POINTER): INTEGER_32 is
 		-- rl_restore_state (node at line 2323)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_restore_state"
		}"
		end

<<<<<<< HEAD
	rl_yank (an_argument_l2335_c7: INTEGER_32; an_argument_l2336_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank (node at line 2334)
=======
	rl_yank (an_argument_l2352_c7: INTEGER_32; an_argument_l2353_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank (node at line 2351)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank"
		}"
		end

<<<<<<< HEAD
	rl_complete_internal (an_argument_l2339_c7: INTEGER_32): INTEGER_32 is
 		-- rl_complete_internal (node at line 2338)
=======
	rl_complete_internal (an_argument_l2356_c7: INTEGER_32): INTEGER_32 is
 		-- rl_complete_internal (node at line 2355)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_complete_internal"
		}"
		end

<<<<<<< HEAD
	rl_vi_match (an_argument_l2342_c7: INTEGER_32; an_argument_l2343_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_match (node at line 2341)
=======
	rl_vi_match (an_argument_l2359_c7: INTEGER_32; an_argument_l2360_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_match (node at line 2358)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_match"
		}"
		end

	rl_set_signals: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_set_signals (node at line 2380)
=======
 		-- rl_set_signals (node at line 2397)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_signals()"
		}"
		end

<<<<<<< HEAD
	rl_discard_keymap (an_argument_l2404_c7: POINTER) is
 		-- rl_discard_keymap (node at line 2403)
=======
	rl_discard_keymap (an_argument_l2421_c7: POINTER) is
 		-- rl_discard_keymap (node at line 2420)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_discard_keymap"
		}"
		end

<<<<<<< HEAD
	rl_prep_terminal (an_argument_l2407_c7: INTEGER_32) is
 		-- rl_prep_terminal (node at line 2406)
=======
	rl_prep_terminal (an_argument_l2424_c7: INTEGER_32) is
 		-- rl_prep_terminal (node at line 2423)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_prep_terminal"
		}"
		end

<<<<<<< HEAD
	rl_bind_key_if_unbound_in_map (an_argument_l2421_c7: INTEGER_32; an_argument_l2422_c7: POINTER; an_argument_l2423_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_if_unbound_in_map (node at line 2420)
=======
	rl_bind_key_if_unbound_in_map (an_argument_l2438_c7: INTEGER_32; an_argument_l2439_c7: POINTER; an_argument_l2440_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_if_unbound_in_map (node at line 2437)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key_if_unbound_in_map"
		}"
		end

<<<<<<< HEAD
	rl_variable_bind (an_argument_l2432_c7: POINTER; an_argument_l2433_c7: POINTER): INTEGER_32 is
 		-- rl_variable_bind (node at line 2431)
=======
	rl_variable_bind (an_argument_l2449_c7: POINTER; an_argument_l2450_c7: POINTER): INTEGER_32 is
 		-- rl_variable_bind (node at line 2448)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_variable_bind"
		}"
		end

<<<<<<< HEAD
	rl_invoking_keyseqs_in_map (an_argument_l2442_c7: POINTER; an_argument_l2443_c7: POINTER): POINTER is
 		-- rl_invoking_keyseqs_in_map (node at line 2441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_invoking_keyseqs_in_map"
		}"
		end

	rl_kill_full_line (an_argument_l2466_c7: INTEGER_32; an_argument_l2467_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_full_line (node at line 2465)
=======
	rl_kill_full_line (an_argument_l2479_c7: INTEGER_32; an_argument_l2480_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_full_line (node at line 2478)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_full_line"
		}"
		end

<<<<<<< HEAD
	rl_set_paren_blink_timeout (an_argument_l2482_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_paren_blink_timeout (node at line 2481)
=======
	rl_set_paren_blink_timeout (an_argument_l2495_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_paren_blink_timeout (node at line 2494)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_paren_blink_timeout"
		}"
		end

<<<<<<< HEAD
	rl_downcase_word (an_argument_l2485_c7: INTEGER_32; an_argument_l2486_c7: INTEGER_32): INTEGER_32 is
 		-- rl_downcase_word (node at line 2484)
=======
	rl_downcase_word (an_argument_l2498_c7: INTEGER_32; an_argument_l2499_c7: INTEGER_32): INTEGER_32 is
 		-- rl_downcase_word (node at line 2497)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_downcase_word"
		}"
		end

<<<<<<< HEAD
	rl_skip_csi_sequence (an_argument_l2489_c7: INTEGER_32; an_argument_l2490_c7: INTEGER_32): INTEGER_32 is
 		-- rl_skip_csi_sequence (node at line 2488)
=======
	rl_skip_csi_sequence (an_argument_l2502_c7: INTEGER_32; an_argument_l2503_c7: INTEGER_32): INTEGER_32 is
 		-- rl_skip_csi_sequence (node at line 2501)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_skip_csi_sequence"
		}"
		end

	rl_restore_prompt is
<<<<<<< HEAD
 		-- rl_restore_prompt (node at line 2496)
=======
 		-- rl_restore_prompt (node at line 2506)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_restore_prompt()"
		}"
		end

<<<<<<< HEAD
	rl_vi_bracktype (an_argument_l2515_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bracktype (node at line 2514)
=======
	rl_vi_bracktype (an_argument_l2525_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bracktype (node at line 2524)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_bracktype"
		}"
		end

	rl_clear_message: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_clear_message (node at line 2517)
=======
 		-- rl_clear_message (node at line 2527)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_clear_message()"
		}"
		end

<<<<<<< HEAD
	rl_vi_fword (an_argument_l2531_c7: INTEGER_32; an_argument_l2532_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fword (node at line 2530)
=======
	rl_vi_fword (an_argument_l2541_c7: INTEGER_32; an_argument_l2542_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fword (node at line 2540)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_fword"
		}"
		end

<<<<<<< HEAD
	rl_unbind_key_in_map (an_argument_l2535_c7: INTEGER_32; an_argument_l2536_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_key_in_map (node at line 2534)
=======
	rl_unbind_key_in_map (an_argument_l2545_c7: INTEGER_32; an_argument_l2546_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_key_in_map (node at line 2544)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_key_in_map"
		}"
		end

<<<<<<< HEAD
	rl_copy_backward_word (an_argument_l2549_c7: INTEGER_32; an_argument_l2550_c7: INTEGER_32): INTEGER_32 is
 		-- rl_copy_backward_word (node at line 2548)
=======
	rl_copy_backward_word (an_argument_l2559_c7: INTEGER_32; an_argument_l2560_c7: INTEGER_32): INTEGER_32 is
 		-- rl_copy_backward_word (node at line 2558)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_backward_word"
		}"
		end

<<<<<<< HEAD
	rl_copy_keymap (an_argument_l2562_c7: POINTER): POINTER is
 		-- rl_copy_keymap (node at line 2561)
=======
	rl_copy_keymap (an_argument_l2572_c7: POINTER): POINTER is
 		-- rl_copy_keymap (node at line 2571)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_keymap"
		}"
		end

	rl_maybe_unsave_line: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_maybe_unsave_line (node at line 2589)
=======
 		-- rl_maybe_unsave_line (node at line 2602)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_maybe_unsave_line()"
		}"
		end

<<<<<<< HEAD
	rl_vi_back_to_indent (an_argument_l2616_c7: INTEGER_32; an_argument_l2617_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_back_to_indent (node at line 2615)
=======
	rl_vi_back_to_indent (an_argument_l2629_c7: INTEGER_32; an_argument_l2630_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_back_to_indent (node at line 2628)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_back_to_indent"
		}"
		end

<<<<<<< HEAD
	rl_transpose_chars (an_argument_l2653_c7: INTEGER_32; an_argument_l2654_c7: INTEGER_32): INTEGER_32 is
 		-- rl_transpose_chars (node at line 2652)
=======
	rl_backward (an_argument_l2645_c7: INTEGER_32; an_argument_l2646_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward (node at line 2644)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward"
		}"
		end

<<<<<<< HEAD
	rl_abort (an_argument_l2676_c7: INTEGER_32; an_argument_l2677_c7: INTEGER_32): INTEGER_32 is
 		-- rl_abort (node at line 2675)
=======
	rl_transpose_chars (an_argument_l2670_c7: INTEGER_32; an_argument_l2671_c7: INTEGER_32): INTEGER_32 is
 		-- rl_transpose_chars (node at line 2669)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_transpose_chars"
		}"
		end

<<<<<<< HEAD
	rl_maybe_replace_line: INTEGER_32 is
 		-- rl_maybe_replace_line (node at line 2692)
=======
	rl_abort (an_argument_l2693_c7: INTEGER_32; an_argument_l2694_c7: INTEGER_32): INTEGER_32 is
 		-- rl_abort (node at line 2692)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_abort"
		}"
		end

<<<<<<< HEAD
	rl_delete_text (an_argument_l2694_c7: INTEGER_32; an_argument_l2695_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_text (node at line 2693)
=======
	rl_delete_text (an_argument_l2710_c7: INTEGER_32; an_argument_l2711_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_text (node at line 2709)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete_text"
		}"
		end

<<<<<<< HEAD
	rl_bind_keyseq_in_map (an_argument_l2706_c7: POINTER; an_argument_l2707_c7: POINTER; an_argument_l2708_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_in_map (node at line 2705)
=======
	rl_bind_keyseq_in_map (an_argument_l2723_c7: POINTER; an_argument_l2724_c7: POINTER; an_argument_l2725_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_in_map (node at line 2722)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_keyseq_in_map"
		}"
		end

	rl_username_completion_function (an_argument_l2717_c7: POINTER; an_argument_l2718_c7: INTEGER_32): POINTER is
 		-- rl_username_completion_function (node at line 2716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_username_completion_function"
		}"
		end

	rl_vi_check: INTEGER_32 is
<<<<<<< HEAD
 		-- rl_vi_check (node at line 2720)
=======
 		-- rl_vi_check (node at line 2733)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_check()"
		}"
		end

<<<<<<< HEAD
	rl_modifying (an_argument_l2754_c7: INTEGER_32; an_argument_l2755_c7: INTEGER_32): INTEGER_32 is
 		-- rl_modifying (node at line 2753)
=======
	rl_modifying (an_argument_l2764_c7: INTEGER_32; an_argument_l2765_c7: INTEGER_32): INTEGER_32 is
 		-- rl_modifying (node at line 2763)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_modifying"
		}"
		end

<<<<<<< HEAD
	rl_vi_eword (an_argument_l2777_c7: INTEGER_32; an_argument_l2778_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eword (node at line 2776)
=======
	rl_vi_eword (an_argument_l2787_c7: INTEGER_32; an_argument_l2788_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eword (node at line 2786)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_eword"
		}"
		end

<<<<<<< HEAD
	rl_vi_replace (an_argument_l2790_c7: INTEGER_32; an_argument_l2791_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_replace (node at line 2789)
=======
	rl_vi_replace (an_argument_l2801_c7: INTEGER_32; an_argument_l2802_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_replace (node at line 2800)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_replace"
		}"
		end

	rl_deprep_terminal is
<<<<<<< HEAD
 		-- rl_deprep_terminal (node at line 2832)
=======
 		-- rl_deprep_terminal (node at line 2843)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_deprep_terminal()"
		}"
		end

<<<<<<< HEAD
	rl_save_state (an_argument_l2834_c7: POINTER): INTEGER_32 is
 		-- rl_save_state (node at line 2833)
=======
	rl_save_state (an_argument_l2845_c7: POINTER): INTEGER_32 is
 		-- rl_save_state (node at line 2844)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_save_state"
		}"
		end

<<<<<<< HEAD
	rl_stop_output (an_argument_l2844_c7: INTEGER_32; an_argument_l2845_c7: INTEGER_32): INTEGER_32 is
 		-- rl_stop_output (node at line 2843)
=======
	rl_stop_output (an_argument_l2855_c7: INTEGER_32; an_argument_l2856_c7: INTEGER_32): INTEGER_32 is
 		-- rl_stop_output (node at line 2854)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_stop_output"
		}"
		end

	rl_make_keymap: POINTER is
<<<<<<< HEAD
 		-- rl_make_keymap (node at line 2858)
=======
 		-- rl_make_keymap (node at line 2869)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_make_keymap()"
		}"
		end

<<<<<<< HEAD
	rl_kill_word (an_argument_l2861_c7: INTEGER_32; an_argument_l2862_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_word (node at line 2860)
=======
	rl_kill_word (an_argument_l2872_c7: INTEGER_32; an_argument_l2873_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_word (node at line 2871)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_word"
		}"
		end

<<<<<<< HEAD
	rl_vi_movement_mode (an_argument_l2868_c7: INTEGER_32; an_argument_l2869_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_movement_mode (node at line 2867)
=======
	rl_vi_movement_mode (an_argument_l2879_c7: INTEGER_32; an_argument_l2880_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_movement_mode (node at line 2878)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_movement_mode"
		}"
		end

<<<<<<< HEAD
	rl_history_search_forward (an_argument_l2873_c7: INTEGER_32; an_argument_l2874_c7: INTEGER_32): INTEGER_32 is
 		-- rl_history_search_forward (node at line 2872)
=======
	rl_history_search_forward (an_argument_l2884_c7: INTEGER_32; an_argument_l2885_c7: INTEGER_32): INTEGER_32 is
 		-- rl_history_search_forward (node at line 2883)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_history_search_forward"
		}"
		end

<<<<<<< HEAD
	rl_copy_forward_word (an_argument_l2898_c7: INTEGER_32; an_argument_l2899_c7: INTEGER_32): INTEGER_32 is
 		-- rl_copy_forward_word (node at line 2897)
=======
	rl_maybe_replace_line: INTEGER_32 is
 		-- rl_maybe_replace_line (node at line 2896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_maybe_replace_line()"
		}"
		end

	rl_copy_forward_word (an_argument_l2910_c7: INTEGER_32; an_argument_l2911_c7: INTEGER_32): INTEGER_32 is
 		-- rl_copy_forward_word (node at line 2909)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_forward_word"
		}"
		end

<<<<<<< HEAD
	rl_upcase_word (an_argument_l2903_c7: INTEGER_32; an_argument_l2904_c7: INTEGER_32): INTEGER_32 is
 		-- rl_upcase_word (node at line 2902)
=======
	rl_upcase_word (an_argument_l2915_c7: INTEGER_32; an_argument_l2916_c7: INTEGER_32): INTEGER_32 is
 		-- rl_upcase_word (node at line 2914)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_upcase_word"
		}"
		end

<<<<<<< HEAD
	rl_forward_byte (an_argument_l2934_c7: INTEGER_32; an_argument_l2935_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_byte (node at line 2933)
=======
	rl_add_funmap_entry (an_argument_l2926_c7: POINTER; an_argument_l2927_c7: POINTER): INTEGER_32 is
 		-- rl_add_funmap_entry (node at line 2925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_add_funmap_entry"
		}"
		end

	rl_forward_byte (an_argument_l2950_c7: INTEGER_32; an_argument_l2951_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_byte (node at line 2949)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_byte"
		}"
		end

<<<<<<< HEAD
	rl_universal_argument (an_argument_l2961_c7: INTEGER_32; an_argument_l2962_c7: INTEGER_32): INTEGER_32 is
 		-- rl_universal_argument (node at line 2960)
=======
	rl_universal_argument (an_argument_l2977_c7: INTEGER_32; an_argument_l2978_c7: INTEGER_32): INTEGER_32 is
 		-- rl_universal_argument (node at line 2976)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_universal_argument"
		}"
		end

<<<<<<< HEAD
	rl_unix_line_discard (an_argument_l2967_c7: INTEGER_32; an_argument_l2968_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unix_line_discard (node at line 2966)
=======
	rl_unix_line_discard (an_argument_l2983_c7: INTEGER_32; an_argument_l2984_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unix_line_discard (node at line 2982)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unix_line_discard"
		}"
		end


end -- class READLINE_EXTERNALS
