-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class READLINE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	rl_reset_terminal (an_argument_l25_c7: POINTER): INTEGER_32 is
 		-- rl_reset_terminal (node at line 24)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_terminal"
		}"
		end

	rl_completion_matches (an_argument_l37_c7: POINTER; an_argument_l38_c7: POINTER): POINTER is
 		-- rl_completion_matches (node at line 36)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_matches"
		}"
		end

	rl_discard_argument: INTEGER_32 is
 		-- rl_discard_argument (node at line 41)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_discard_argument()"
		}"
		end

	rl_vi_goto_mark (an_argument_l43_c7: INTEGER_32; an_argument_l44_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_goto_mark (node at line 42)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_goto_mark"
		}"
		end

	rl_get_next_history (an_argument_l54_c7: INTEGER_32; an_argument_l55_c7: INTEGER_32): INTEGER_32 is
 		-- rl_get_next_history (node at line 53)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_next_history"
		}"
		end

	rl_translate_keyseq (an_argument_l90_c7: POINTER; an_argument_l91_c7: POINTER; an_argument_l92_c7: POINTER): INTEGER_32 is
 		-- rl_translate_keyseq (node at line 89)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_translate_keyseq"
		}"
		end

	rl_clear_pending_input: INTEGER_32 is
 		-- rl_clear_pending_input (node at line 121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_clear_pending_input()"
		}"
		end

	rl_extend_line_buffer (an_argument_l123_c7: INTEGER_32) is
 		-- rl_extend_line_buffer (node at line 122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_extend_line_buffer"
		}"
		end

	rl_clear_signals: INTEGER_32 is
 		-- rl_clear_signals (node at line 136)
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

	rl_vi_put (an_argument_l269_c7: INTEGER_32; an_argument_l270_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_put (node at line 268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_put"
		}"
		end

	rl_vi_tilde_expand (an_argument_l280_c7: INTEGER_32; an_argument_l281_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_tilde_expand (node at line 279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_tilde_expand"
		}"
		end

	rl_vi_fetch_history (an_argument_l295_c7: INTEGER_32; an_argument_l296_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fetch_history (node at line 294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_fetch_history"
		}"
		end

	rl_backward_char (an_argument_l307_c7: INTEGER_32; an_argument_l308_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_char (node at line 306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_char"
		}"
		end

	rl_vi_insert_mode (an_argument_l312_c7: INTEGER_32; an_argument_l313_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insert_mode (node at line 311)
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
 		-- rl_maybe_save_line (node at line 337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_maybe_save_line()"
		}"
		end

	rl_revert_line (an_argument_l339_c7: INTEGER_32; an_argument_l340_c7: INTEGER_32): INTEGER_32 is
 		-- rl_revert_line (node at line 338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_revert_line"
		}"
		end

	rl_tty_unset_default_bindings (an_argument_l343_c7: POINTER) is
 		-- rl_tty_unset_default_bindings (node at line 342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tty_unset_default_bindings"
		}"
		end

	rl_insert_text (an_argument_l358_c7: POINTER): INTEGER_32 is
 		-- rl_insert_text (node at line 357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_text"
		}"
		end

	rl_callback_read_char is
 		-- rl_callback_read_char (node at line 386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_callback_read_char()"
		}"
		end

	rl_insert (an_argument_l392_c7: INTEGER_32; an_argument_l393_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert (node at line 391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert"
		}"
		end

	rl_vi_delete (an_argument_l396_c7: INTEGER_32; an_argument_l397_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_delete (node at line 395)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_delete"
		}"
		end

	rl_possible_completions (an_argument_l406_c7: INTEGER_32; an_argument_l407_c7: INTEGER_32): INTEGER_32 is
 		-- rl_possible_completions (node at line 405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_possible_completions"
		}"
		end

	rl_vi_bword (an_argument_l410_c7: INTEGER_32; an_argument_l411_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bword (node at line 409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_bword"
		}"
		end

	rl_forward (an_argument_l421_c7: INTEGER_32; an_argument_l422_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward (node at line 420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward"
		}"
		end

	rl_vi_subst (an_argument_l458_c7: INTEGER_32; an_argument_l459_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_subst (node at line 457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_subst"
		}"
		end

	rl_echo_signal_char (an_argument_l475_c7: INTEGER_32) is
 		-- rl_echo_signal_char (node at line 474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_echo_signal_char"
		}"
		end

	rl_bind_keyseq_if_unbound_in_map (an_argument_l478_c7: POINTER; an_argument_l479_c7: POINTER; an_argument_l480_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_if_unbound_in_map (node at line 477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_keyseq_if_unbound_in_map"
		}"
		end

	rl_vi_search (an_argument_l487_c7: INTEGER_32; an_argument_l488_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_search (node at line 486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_search"
		}"
		end

	rl_funmap_names: POINTER is
 		-- rl_funmap_names (node at line 496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_funmap_names()"
		}"
		end

	rl_yank_pop (an_argument_l498_c7: INTEGER_32; an_argument_l499_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_pop (node at line 497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank_pop"
		}"
		end

	rl_emacs_editing_mode (an_argument_l505_c7: INTEGER_32; an_argument_l506_c7: INTEGER_32): INTEGER_32 is
 		-- rl_emacs_editing_mode (node at line 504)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_emacs_editing_mode"
		}"
		end

	rl_reset_after_signal is
 		-- rl_reset_after_signal (node at line 508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_after_signal()"
		}"
		end

	rl_bind_key_if_unbound (an_argument_l520_c7: INTEGER_32; an_argument_l521_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_if_unbound (node at line 519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key_if_unbound"
		}"
		end

	rl_vi_delete_to (an_argument_l531_c7: INTEGER_32; an_argument_l532_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_delete_to (node at line 530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_delete_to"
		}"
		end

	rl_backward_char_search (an_argument_l541_c7: INTEGER_32; an_argument_l542_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_char_search (node at line 540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_char_search"
		}"
		end

	rl_reset_line_state: INTEGER_32 is
 		-- rl_reset_line_state (node at line 545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_line_state()"
		}"
		end

	rl_variable_dumper (an_argument_l569_c7: INTEGER_32) is
 		-- rl_variable_dumper (node at line 568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_variable_dumper"
		}"
		end

	rl_noninc_forward_search_again (an_argument_l572_c7: INTEGER_32; an_argument_l573_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_forward_search_again (node at line 571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_forward_search_again"
		}"
		end

	rl_get_keymap: POINTER is
 		-- rl_get_keymap (node at line 580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap()"
		}"
		end

	rl_insert_completions (an_argument_l583_c7: INTEGER_32; an_argument_l584_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_completions (node at line 582)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_completions"
		}"
		end

	rl_add_undo (an_argument_l600_c7: INTEGER; an_argument_l601_c7: INTEGER_32; an_argument_l602_c7: INTEGER_32; an_argument_l603_c7: POINTER) is
 		-- rl_add_undo (node at line 599)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_add_undo"
		}"
		end

	rl_clear_screen (an_argument_l625_c7: INTEGER_32; an_argument_l626_c7: INTEGER_32): INTEGER_32 is
 		-- rl_clear_screen (node at line 624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_clear_screen"
		}"
		end

	rl_get_keymap_name_from_edit_mode: POINTER is
 		-- rl_get_keymap_name_from_edit_mode (node at line 628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap_name_from_edit_mode()"
		}"
		end

	rl_bind_keyseq_if_unbound (an_argument_l647_c7: POINTER; an_argument_l648_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_if_unbound (node at line 646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_keyseq_if_unbound"
		}"
		end

	rl_overwrite_mode (an_argument_l658_c7: INTEGER_32; an_argument_l659_c7: INTEGER_32): INTEGER_32 is
 		-- rl_overwrite_mode (node at line 657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_overwrite_mode"
		}"
		end

	rl_dump_macros (an_argument_l682_c7: INTEGER_32; an_argument_l683_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_macros (node at line 681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dump_macros"
		}"
		end

	rl_function_dumper (an_argument_l690_c7: INTEGER_32) is
 		-- rl_function_dumper (node at line 689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_function_dumper"
		}"
		end

	rl_noninc_reverse_search (an_argument_l698_c7: INTEGER_32; an_argument_l699_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_reverse_search (node at line 697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_reverse_search"
		}"
		end

	rl_set_keyboard_input_timeout (an_argument_l702_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_keyboard_input_timeout (node at line 701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_keyboard_input_timeout"
		}"
		end

	rl_vi_overstrike_delete (an_argument_l711_c7: INTEGER_32; an_argument_l712_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_overstrike_delete (node at line 710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_overstrike_delete"
		}"
		end

	rl_history_search_backward (an_argument_l720_c7: INTEGER_32; an_argument_l721_c7: INTEGER_32): INTEGER_32 is
 		-- rl_history_search_backward (node at line 719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_history_search_backward"
		}"
		end

	rl_backward_word (an_argument_l736_c7: INTEGER_32; an_argument_l737_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_word (node at line 735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_word"
		}"
		end

	rl_generic_bind (an_argument_l745_c7: INTEGER_32; an_argument_l746_c7: POINTER; an_argument_l747_c7: POINTER; an_argument_l748_c7: POINTER): INTEGER_32 is
 		-- rl_generic_bind (node at line 744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_generic_bind"
		}"
		end

	rl_vi_complete (an_argument_l764_c7: INTEGER_32; an_argument_l765_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_complete (node at line 763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_complete"
		}"
		end

	rl_on_new_line: INTEGER_32 is
 		-- rl_on_new_line (node at line 772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_on_new_line()"
		}"
		end

	rl_read_key: INTEGER_32 is
 		-- rl_read_key (node at line 773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_read_key()"
		}"
		end

	rl_add_defun (an_argument_l776_c7: POINTER; an_argument_l777_c7: POINTER; an_argument_l778_c7: INTEGER_32): INTEGER_32 is
 		-- rl_add_defun (node at line 775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_add_defun"
		}"
		end

	rl_vi_undo (an_argument_l781_c7: INTEGER_32; an_argument_l782_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_undo (node at line 780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_undo"
		}"
		end

	rl_make_bare_keymap: POINTER is
 		-- rl_make_bare_keymap (node at line 796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_make_bare_keymap()"
		}"
		end

	rl_backward_kill_line (an_argument_l804_c7: INTEGER_32; an_argument_l805_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_kill_line (node at line 803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_kill_line"
		}"
		end

	rl_forward_search_history (an_argument_l812_c7: INTEGER_32; an_argument_l813_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_search_history (node at line 811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_search_history"
		}"
		end

	rl_redisplay is
 		-- rl_redisplay (node at line 815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_redisplay()"
		}"
		end

	rl_noninc_reverse_search_again (an_argument_l817_c7: INTEGER_32; an_argument_l818_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_reverse_search_again (node at line 816)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_reverse_search_again"
		}"
		end

	rl_backward_kill_word (an_argument_l821_c7: INTEGER_32; an_argument_l822_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_kill_word (node at line 820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_kill_word"
		}"
		end

	rl_vi_change_char (an_argument_l829_c7: INTEGER_32; an_argument_l830_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_char (node at line 828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_change_char"
		}"
		end

	rl_dump_functions (an_argument_l834_c7: INTEGER_32; an_argument_l835_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_functions (node at line 833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dump_functions"
		}"
		end

	rl_invoking_keyseqs (an_argument_l845_c7: POINTER): POINTER is
 		-- rl_invoking_keyseqs (node at line 844)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_invoking_keyseqs"
		}"
		end

	rl_forced_update_display: INTEGER_32 is
 		-- rl_forced_update_display (node at line 853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forced_update_display()"
		}"
		end

	rl_vi_back_to_indent (an_argument_l858_c7: INTEGER_32; an_argument_l859_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_back_to_indent (node at line 857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_back_to_indent"
		}"
		end

	rl_digit_argument (an_argument_l862_c7: INTEGER_32; an_argument_l863_c7: INTEGER_32): INTEGER_32 is
 		-- rl_digit_argument (node at line 861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_digit_argument"
		}"
		end

	rl_vi_arg_digit (an_argument_l866_c7: INTEGER_32; an_argument_l867_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_arg_digit (node at line 865)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_arg_digit"
		}"
		end

	rl_vi_yank_to (an_argument_l870_c7: INTEGER_32; an_argument_l871_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_yank_to (node at line 869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_yank_to"
		}"
		end

	rl_vi_prev_word (an_argument_l879_c7: INTEGER_32; an_argument_l880_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_prev_word (node at line 878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_prev_word"
		}"
		end

	rl_vi_next_word (an_argument_l892_c7: INTEGER_32; an_argument_l893_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_next_word (node at line 891)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_next_word"
		}"
		end

	rl_vi_first_print (an_argument_l896_c7: INTEGER_32; an_argument_l897_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_first_print (node at line 895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_first_print"
		}"
		end

	rl_on_new_line_with_prompt: INTEGER_32 is
 		-- rl_on_new_line_with_prompt (node at line 910)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_on_new_line_with_prompt()"
		}"
		end

	rl_resize_terminal is
 		-- rl_resize_terminal (node at line 929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_resize_terminal()"
		}"
		end

	rl_character_len (an_argument_l931_c7: INTEGER_32; an_argument_l932_c7: INTEGER_32): INTEGER_32 is
 		-- rl_character_len (node at line 930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_character_len"
		}"
		end

	rl_vi_append_eol (an_argument_l945_c7: INTEGER_32; an_argument_l946_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_append_eol (node at line 944)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_append_eol"
		}"
		end

	rl_re_read_init_file (an_argument_l949_c7: INTEGER_32; an_argument_l950_c7: INTEGER_32): INTEGER_32 is
 		-- rl_re_read_init_file (node at line 948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_re_read_init_file"
		}"
		end

	rl_refresh_line (an_argument_l953_c7: INTEGER_32; an_argument_l954_c7: INTEGER_32): INTEGER_32 is
 		-- rl_refresh_line (node at line 952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_refresh_line"
		}"
		end

	rl_kill_text (an_argument_l957_c7: INTEGER_32; an_argument_l958_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_text (node at line 956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_text"
		}"
		end

	rl_initialize_funmap is
 		-- rl_initialize_funmap (node at line 970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_initialize_funmap()"
		}"
		end

	rl_get_keymap_name (an_argument_l975_c7: POINTER): POINTER is
 		-- rl_get_keymap_name (node at line 974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap_name"
		}"
		end

	rl_yank_nth_arg (an_argument_l978_c7: INTEGER_32; an_argument_l979_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_nth_arg (node at line 977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank_nth_arg"
		}"
		end

	rl_end_kbd_macro (an_argument_l982_c7: INTEGER_32; an_argument_l983_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_kbd_macro (node at line 981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_kbd_macro"
		}"
		end

	rl_execute_next (an_argument_l986_c7: INTEGER_32): INTEGER_32 is
 		-- rl_execute_next (node at line 985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_execute_next"
		}"
		end

	rl_vi_editing_mode (an_argument_l993_c7: INTEGER_32; an_argument_l994_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_editing_mode (node at line 992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_editing_mode"
		}"
		end

	rl_tty_set_default_bindings (an_argument_l1005_c7: POINTER) is
 		-- rl_tty_set_default_bindings (node at line 1004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tty_set_default_bindings"
		}"
		end

	rl_unbind_command_in_map (an_argument_l1037_c7: POINTER; an_argument_l1038_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_command_in_map (node at line 1036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_command_in_map"
		}"
		end

	rl_vi_end_word (an_argument_l1054_c7: INTEGER_32; an_argument_l1055_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_end_word (node at line 1053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_end_word"
		}"
		end

	rl_completion_mode (an_argument_l1064_c7: POINTER): INTEGER_32 is
 		-- rl_completion_mode (node at line 1063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_mode"
		}"
		end

	rl_restart_output (an_argument_l1067_c7: INTEGER_32; an_argument_l1068_c7: INTEGER_32): INTEGER_32 is
 		-- rl_restart_output (node at line 1066)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_restart_output"
		}"
		end

	readline (an_argument_l1111_c7: POINTER): POINTER is
 		-- readline (node at line 1110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "readline"
		}"
		end

	rl_function_of_keyseq (an_argument_l1114_c7: POINTER; an_argument_l1115_c7: POINTER; an_argument_l1116_c7: POINTER): POINTER is
 		-- rl_function_of_keyseq (node at line 1113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_function_of_keyseq"
		}"
		end

	rl_vi_start_inserting (an_argument_l1119_c7: INTEGER_32; an_argument_l1120_c7: INTEGER_32; an_argument_l1121_c7: INTEGER_32) is
 		-- rl_vi_start_inserting (node at line 1118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_start_inserting"
		}"
		end

	rl_expand_prompt (an_argument_l1124_c7: POINTER): INTEGER_32 is
 		-- rl_expand_prompt (node at line 1123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_expand_prompt"
		}"
		end

	rl_macro_bind (an_argument_l1132_c7: POINTER; an_argument_l1133_c7: POINTER; an_argument_l1134_c7: POINTER): INTEGER_32 is
 		-- rl_macro_bind (node at line 1131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_macro_bind"
		}"
		end

	rl_initialize: INTEGER_32 is
 		-- rl_initialize (node at line 1142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_initialize()"
		}"
		end

	rl_end_of_line (an_argument_l1160_c7: INTEGER_32; an_argument_l1161_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_of_line (node at line 1159)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_of_line"
		}"
		end

	rl_set_screen_size (an_argument_l1164_c7: INTEGER_32; an_argument_l1165_c7: INTEGER_32) is
 		-- rl_set_screen_size (node at line 1163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_screen_size"
		}"
		end

	rl_capitalize_word (an_argument_l1178_c7: INTEGER_32; an_argument_l1179_c7: INTEGER_32): INTEGER_32 is
 		-- rl_capitalize_word (node at line 1177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_capitalize_word"
		}"
		end

	rl_set_keymap (an_argument_l1182_c7: POINTER) is
 		-- rl_set_keymap (node at line 1181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_keymap"
		}"
		end

	rl_bind_key_in_map (an_argument_l1185_c7: INTEGER_32; an_argument_l1186_c7: POINTER; an_argument_l1187_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_in_map (node at line 1184)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key_in_map"
		}"
		end

	rl_start_kbd_macro (an_argument_l1195_c7: INTEGER_32; an_argument_l1196_c7: INTEGER_32): INTEGER_32 is
 		-- rl_start_kbd_macro (node at line 1194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_start_kbd_macro"
		}"
		end

	rl_vi_append_mode (an_argument_l1201_c7: INTEGER_32; an_argument_l1202_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_append_mode (node at line 1200)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_append_mode"
		}"
		end

	rl_bind_key (an_argument_l1205_c7: INTEGER_32; an_argument_l1206_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key (node at line 1204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key"
		}"
		end

	rl_insert_comment (an_argument_l1214_c7: INTEGER_32; an_argument_l1215_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_comment (node at line 1213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_comment"
		}"
		end

	rl_get_keymap_by_name (an_argument_l1218_c7: POINTER): POINTER is
 		-- rl_get_keymap_by_name (node at line 1217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_keymap_by_name"
		}"
		end

	rl_vi_insertion_mode (an_argument_l1221_c7: INTEGER_32; an_argument_l1222_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insertion_mode (node at line 1220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_insertion_mode"
		}"
		end

	rl_set_key (an_argument_l1230_c7: POINTER; an_argument_l1231_c7: POINTER; an_argument_l1232_c7: POINTER): INTEGER_32 is
 		-- rl_set_key (node at line 1229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_key"
		}"
		end

	rl_arrow_keys (an_argument_l1237_c7: INTEGER_32; an_argument_l1238_c7: INTEGER_32): INTEGER_32 is
 		-- rl_arrow_keys (node at line 1236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_arrow_keys"
		}"
		end

	rl_delete (an_argument_l1241_c7: INTEGER_32; an_argument_l1242_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete (node at line 1240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete"
		}"
		end

	rl_get_screen_size (an_argument_l1247_c7: POINTER; an_argument_l1248_c7: POINTER) is
 		-- rl_get_screen_size (node at line 1246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_screen_size"
		}"
		end

	rl_dump_variables (an_argument_l1252_c7: INTEGER_32; an_argument_l1253_c7: INTEGER_32): INTEGER_32 is
 		-- rl_dump_variables (node at line 1251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dump_variables"
		}"
		end

	rl_vi_overstrike (an_argument_l1273_c7: INTEGER_32; an_argument_l1274_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_overstrike (node at line 1272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_overstrike"
		}"
		end

	rl_exchange_point_and_mark (an_argument_l1290_c7: INTEGER_32; an_argument_l1291_c7: INTEGER_32): INTEGER_32 is
 		-- rl_exchange_point_and_mark (node at line 1289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_exchange_point_and_mark"
		}"
		end

	rl_vi_f_w_ord (an_argument_l1295_c7: INTEGER_32; an_argument_l1296_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fWord (node at line 1294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_fWord"
		}"
		end

	rl_set_keymap_from_edit_mode is
 		-- rl_set_keymap_from_edit_mode (node at line 1299)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_keymap_from_edit_mode()"
		}"
		end

	rl_free_undo_list is
 		-- rl_free_undo_list (node at line 1300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_free_undo_list()"
		}"
		end

	rl_alphabetic (an_argument_l1302_c7: INTEGER_32): INTEGER_32 is
 		-- rl_alphabetic (node at line 1301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_alphabetic"
		}"
		end

	rl_free_line_state is
 		-- rl_free_line_state (node at line 1312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_free_line_state()"
		}"
		end

	rl_macro_dumper (an_argument_l1329_c7: INTEGER_32) is
 		-- rl_macro_dumper (node at line 1328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_macro_dumper"
		}"
		end

	rl_reverse_search_history (an_argument_l1344_c7: INTEGER_32; an_argument_l1345_c7: INTEGER_32): INTEGER_32 is
 		-- rl_reverse_search_history (node at line 1343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reverse_search_history"
		}"
		end

	rl_vi_redo (an_argument_l1352_c7: INTEGER_32; an_argument_l1353_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_redo (node at line 1351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_redo"
		}"
		end

	rl_vi_change_case (an_argument_l1364_c7: INTEGER_32; an_argument_l1365_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_case (node at line 1363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_change_case"
		}"
		end

	rl_filename_completion_function (an_argument_l1372_c7: POINTER; an_argument_l1373_c7: INTEGER_32): POINTER is
 		-- rl_filename_completion_function (node at line 1371)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_completion_function"
		}"
		end

	rl_transpose_words (an_argument_l1376_c7: INTEGER_32; an_argument_l1377_c7: INTEGER_32): INTEGER_32 is
 		-- rl_transpose_words (node at line 1375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_transpose_words"
		}"
		end

	rl_message: INTEGER_32 is
 		-- rl_message (node at line 1379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_message()"
		}"
		end

	rl_variable_value (an_argument_l1381_c7: POINTER): POINTER is
 		-- rl_variable_value (node at line 1380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_variable_value"
		}"
		end

	rl_callback_handler_remove is
 		-- rl_callback_handler_remove (node at line 1396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_callback_handler_remove()"
		}"
		end

	rl_old_menu_complete (an_argument_l1413_c7: INTEGER_32; an_argument_l1414_c7: INTEGER_32): INTEGER_32 is
 		-- rl_old_menu_complete (node at line 1412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_old_menu_complete"
		}"
		end

	rl_vi_search_again (an_argument_l1435_c7: INTEGER_32; an_argument_l1436_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_search_again (node at line 1434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_search_again"
		}"
		end

	rl_ding: INTEGER_32 is
 		-- rl_ding (node at line 1462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_ding()"
		}"
		end

	rl_backward_byte (an_argument_l1464_c7: INTEGER_32; an_argument_l1465_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_byte (node at line 1463)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_byte"
		}"
		end

	rl_save_prompt is
 		-- rl_save_prompt (node at line 1483)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_save_prompt()"
		}"
		end

	rl_list_funmap_names is
 		-- rl_list_funmap_names (node at line 1485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_list_funmap_names()"
		}"
		end

	rl_vi_e_w_ord (an_argument_l1488_c7: INTEGER_32; an_argument_l1489_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eWord (node at line 1487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_eWord"
		}"
		end

	rl_undo_command (an_argument_l1492_c7: INTEGER_32; an_argument_l1493_c7: INTEGER_32): INTEGER_32 is
 		-- rl_undo_command (node at line 1491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_undo_command"
		}"
		end

	rl_vi_rubout (an_argument_l1520_c7: INTEGER_32; an_argument_l1521_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_rubout (node at line 1519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_rubout"
		}"
		end

	rl_tilde_expand (an_argument_l1564_c7: INTEGER_32; an_argument_l1565_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tilde_expand (node at line 1563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tilde_expand"
		}"
		end

	rl_vi_domove (an_argument_l1569_c7: INTEGER_32; an_argument_l1570_c7: POINTER): INTEGER_32 is
 		-- rl_vi_domove (node at line 1568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_domove"
		}"
		end

	rl_delete_or_show_completions (an_argument_l1584_c7: INTEGER_32; an_argument_l1585_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_or_show_completions (node at line 1583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete_or_show_completions"
		}"
		end

	rl_get_previous_history (an_argument_l1626_c7: INTEGER_32; an_argument_l1627_c7: INTEGER_32): INTEGER_32 is
 		-- rl_get_previous_history (node at line 1625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_previous_history"
		}"
		end

	rl_char_search (an_argument_l1641_c7: INTEGER_32; an_argument_l1642_c7: INTEGER_32): INTEGER_32 is
 		-- rl_char_search (node at line 1640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_char_search"
		}"
		end

	rl_do_lowercase_version (an_argument_l1645_c7: INTEGER_32; an_argument_l1646_c7: INTEGER_32): INTEGER_32 is
 		-- rl_do_lowercase_version (node at line 1644)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_do_lowercase_version"
		}"
		end

	rl_vi_insert_beg (an_argument_l1650_c7: INTEGER_32; an_argument_l1651_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_insert_beg (node at line 1649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_insert_beg"
		}"
		end

	rl_set_prompt (an_argument_l1677_c7: POINTER): INTEGER_32 is
 		-- rl_set_prompt (node at line 1676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_prompt"
		}"
		end

	rl_backward_menu_complete (an_argument_l1688_c7: INTEGER_32; an_argument_l1689_c7: INTEGER_32): INTEGER_32 is
 		-- rl_backward_menu_complete (node at line 1687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_backward_menu_complete"
		}"
		end

	rl_vi_change_to (an_argument_l1707_c7: INTEGER_32; an_argument_l1708_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_change_to (node at line 1706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_change_to"
		}"
		end

	rl_getc (an_argument_l1724_c7: POINTER): INTEGER_32 is
 		-- rl_getc (node at line 1723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_getc"
		}"
		end

	rl_call_last_kbd_macro (an_argument_l1737_c7: INTEGER_32; an_argument_l1738_c7: INTEGER_32): INTEGER_32 is
 		-- rl_call_last_kbd_macro (node at line 1736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_call_last_kbd_macro"
		}"
		end

	rl_cleanup_after_signal is
 		-- rl_cleanup_after_signal (node at line 1755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_cleanup_after_signal()"
		}"
		end

	rl_unbind_function_in_map (an_argument_l1771_c7: POINTER; an_argument_l1772_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_function_in_map (node at line 1770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_function_in_map"
		}"
		end

	rl_copy_text (an_argument_l1775_c7: INTEGER_32; an_argument_l1776_c7: INTEGER_32): POINTER is
 		-- rl_copy_text (node at line 1774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_text"
		}"
		end

	rl_set_mark (an_argument_l1779_c7: INTEGER_32; an_argument_l1780_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_mark (node at line 1778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_mark"
		}"
		end

	rl_crlf: INTEGER_32 is
 		-- rl_crlf (node at line 1783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_crlf()"
		}"
		end

	rl_tab_insert (an_argument_l1799_c7: INTEGER_32; an_argument_l1800_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tab_insert (node at line 1798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tab_insert"
		}"
		end

	rl_vi_set_mark (an_argument_l1808_c7: INTEGER_32; an_argument_l1809_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_set_mark (node at line 1807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_set_mark"
		}"
		end

	rl_get_termcap (an_argument_l1821_c7: POINTER): POINTER is
 		-- rl_get_termcap (node at line 1820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_get_termcap"
		}"
		end

	rl_noninc_forward_search (an_argument_l1824_c7: INTEGER_32; an_argument_l1825_c7: INTEGER_32): INTEGER_32 is
 		-- rl_noninc_forward_search (node at line 1823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_noninc_forward_search"
		}"
		end

	rl_vi_char_search (an_argument_l1842_c7: INTEGER_32; an_argument_l1843_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_char_search (node at line 1841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_char_search"
		}"
		end

	rl_end_undo_group: INTEGER_32 is
 		-- rl_end_undo_group (node at line 1845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_undo_group()"
		}"
		end

	rl_kill_line (an_argument_l1859_c7: INTEGER_32; an_argument_l1860_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_line (node at line 1858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_line"
		}"
		end

	rl_forward_char (an_argument_l1871_c7: INTEGER_32; an_argument_l1872_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_char (node at line 1870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_char"
		}"
		end

	rl_bind_keyseq (an_argument_l1876_c7: POINTER; an_argument_l1877_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq (node at line 1875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_keyseq"
		}"
		end

	rl_quoted_insert (an_argument_l1883_c7: INTEGER_32; an_argument_l1884_c7: INTEGER_32): INTEGER_32 is
 		-- rl_quoted_insert (node at line 1882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_quoted_insert"
		}"
		end

	rl_insert_close (an_argument_l1889_c7: INTEGER_32; an_argument_l1890_c7: INTEGER_32): INTEGER_32 is
 		-- rl_insert_close (node at line 1888)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_insert_close"
		}"
		end

	rl_free (an_argument_l1893_c7: POINTER) is
 		-- rl_free (node at line 1892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_free"
		}"
		end

	rl_yank_last_arg (an_argument_l1896_c7: INTEGER_32; an_argument_l1897_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank_last_arg (node at line 1895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank_last_arg"
		}"
		end

	rl_begin_undo_group: INTEGER_32 is
 		-- rl_begin_undo_group (node at line 1900)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_begin_undo_group()"
		}"
		end

	rl_delete_horizontal_space (an_argument_l1929_c7: INTEGER_32; an_argument_l1930_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_horizontal_space (node at line 1928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete_horizontal_space"
		}"
		end

	rl_named_function (an_argument_l1937_c7: POINTER): POINTER is
 		-- rl_named_function (node at line 1936)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_named_function"
		}"
		end

	rl_complete (an_argument_l1943_c7: INTEGER_32; an_argument_l1944_c7: INTEGER_32): INTEGER_32 is
 		-- rl_complete (node at line 1942)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_complete"
		}"
		end

	rl_stuff_char (an_argument_l1995_c7: INTEGER_32): INTEGER_32 is
 		-- rl_stuff_char (node at line 1994)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_stuff_char"
		}"
		end

	rl_replace_line (an_argument_l2003_c7: POINTER; an_argument_l2004_c7: INTEGER_32) is
 		-- rl_replace_line (node at line 2002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_replace_line"
		}"
		end

	rl_vi_column (an_argument_l2008_c7: INTEGER_32; an_argument_l2009_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_column (node at line 2007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_column"
		}"
		end

	rl_unix_word_rubout (an_argument_l2019_c7: INTEGER_32; an_argument_l2020_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unix_word_rubout (node at line 2018)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unix_word_rubout"
		}"
		end

	rl_unbind_key (an_argument_l2049_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unbind_key (node at line 2048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_key"
		}"
		end

	rl_rubout_or_delete (an_argument_l2068_c7: INTEGER_32; an_argument_l2069_c7: INTEGER_32): INTEGER_32 is
 		-- rl_rubout_or_delete (node at line 2067)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_rubout_or_delete"
		}"
		end

	rl_read_init_file (an_argument_l2072_c7: POINTER): INTEGER_32 is
 		-- rl_read_init_file (node at line 2071)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_read_init_file"
		}"
		end

	rl_beg_of_line (an_argument_l2075_c7: INTEGER_32; an_argument_l2076_c7: INTEGER_32): INTEGER_32 is
 		-- rl_beg_of_line (node at line 2074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_beg_of_line"
		}"
		end

	rl_parse_and_bind (an_argument_l2083_c7: POINTER): INTEGER_32 is
 		-- rl_parse_and_bind (node at line 2082)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_parse_and_bind"
		}"
		end

	rl_display_match_list (an_argument_l2091_c7: POINTER; an_argument_l2092_c7: INTEGER_32; an_argument_l2093_c7: INTEGER_32) is
 		-- rl_display_match_list (node at line 2090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_display_match_list"
		}"
		end

	rl_end_of_history (an_argument_l2096_c7: INTEGER_32; an_argument_l2097_c7: INTEGER_32): INTEGER_32 is
 		-- rl_end_of_history (node at line 2095)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_end_of_history"
		}"
		end

	rl_reset_screen_size is
 		-- rl_reset_screen_size (node at line 2100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_reset_screen_size()"
		}"
		end

	rl_vi_eof_maybe (an_argument_l2108_c7: INTEGER_32; an_argument_l2109_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eof_maybe (node at line 2107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_eof_maybe"
		}"
		end

	rl_callback_handler_install (an_argument_l2121_c7: POINTER; an_argument_l2122_c7: POINTER) is
 		-- rl_callback_handler_install (node at line 2120)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_callback_handler_install"
		}"
		end

	rl_newline (an_argument_l2132_c7: INTEGER_32; an_argument_l2133_c7: INTEGER_32): INTEGER_32 is
 		-- rl_newline (node at line 2131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_newline"
		}"
		end

	rl_vi_b_w_ord (an_argument_l2148_c7: INTEGER_32; an_argument_l2149_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bWord (node at line 2147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_bWord"
		}"
		end

	rl_untranslate_keyseq (an_argument_l2153_c7: INTEGER_32): POINTER is
 		-- rl_untranslate_keyseq (node at line 2152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_untranslate_keyseq"
		}"
		end

	rl_forward_word (an_argument_l2199_c7: INTEGER_32; an_argument_l2200_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_word (node at line 2198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_word"
		}"
		end

	rl_show_char (an_argument_l2203_c7: INTEGER_32): INTEGER_32 is
 		-- rl_show_char (node at line 2202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_show_char"
		}"
		end

	rl_tty_status (an_argument_l2220_c7: INTEGER_32; an_argument_l2221_c7: INTEGER_32): INTEGER_32 is
 		-- rl_tty_status (node at line 2219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_tty_status"
		}"
		end

	rl_push_macro_input (an_argument_l2224_c7: POINTER) is
 		-- rl_push_macro_input (node at line 2223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_push_macro_input"
		}"
		end

	rl_do_undo: INTEGER_32 is
 		-- rl_do_undo (node at line 2240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_do_undo()"
		}"
		end

	rl_rubout (an_argument_l2270_c7: INTEGER_32; an_argument_l2271_c7: INTEGER_32): INTEGER_32 is
 		-- rl_rubout (node at line 2269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_rubout"
		}"
		end

	rl_beginning_of_history (an_argument_l2291_c7: INTEGER_32; an_argument_l2292_c7: INTEGER_32): INTEGER_32 is
 		-- rl_beginning_of_history (node at line 2290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_beginning_of_history"
		}"
		end

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
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_restore_state"
		}"
		end

	rl_yank (an_argument_l2335_c7: INTEGER_32; an_argument_l2336_c7: INTEGER_32): INTEGER_32 is
 		-- rl_yank (node at line 2334)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_yank"
		}"
		end

	rl_complete_internal (an_argument_l2339_c7: INTEGER_32): INTEGER_32 is
 		-- rl_complete_internal (node at line 2338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_complete_internal"
		}"
		end

	rl_vi_match (an_argument_l2342_c7: INTEGER_32; an_argument_l2343_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_match (node at line 2341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_match"
		}"
		end

	rl_set_signals: INTEGER_32 is
 		-- rl_set_signals (node at line 2380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_signals()"
		}"
		end

	rl_discard_keymap (an_argument_l2404_c7: POINTER) is
 		-- rl_discard_keymap (node at line 2403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_discard_keymap"
		}"
		end

	rl_prep_terminal (an_argument_l2407_c7: INTEGER_32) is
 		-- rl_prep_terminal (node at line 2406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_prep_terminal"
		}"
		end

	rl_bind_key_if_unbound_in_map (an_argument_l2421_c7: INTEGER_32; an_argument_l2422_c7: POINTER; an_argument_l2423_c7: POINTER): INTEGER_32 is
 		-- rl_bind_key_if_unbound_in_map (node at line 2420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_bind_key_if_unbound_in_map"
		}"
		end

	rl_variable_bind (an_argument_l2432_c7: POINTER; an_argument_l2433_c7: POINTER): INTEGER_32 is
 		-- rl_variable_bind (node at line 2431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_variable_bind"
		}"
		end

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
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_full_line"
		}"
		end

	rl_set_paren_blink_timeout (an_argument_l2482_c7: INTEGER_32): INTEGER_32 is
 		-- rl_set_paren_blink_timeout (node at line 2481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_set_paren_blink_timeout"
		}"
		end

	rl_downcase_word (an_argument_l2485_c7: INTEGER_32; an_argument_l2486_c7: INTEGER_32): INTEGER_32 is
 		-- rl_downcase_word (node at line 2484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_downcase_word"
		}"
		end

	rl_skip_csi_sequence (an_argument_l2489_c7: INTEGER_32; an_argument_l2490_c7: INTEGER_32): INTEGER_32 is
 		-- rl_skip_csi_sequence (node at line 2488)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_skip_csi_sequence"
		}"
		end

	rl_restore_prompt is
 		-- rl_restore_prompt (node at line 2496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_restore_prompt()"
		}"
		end

	rl_vi_bracktype (an_argument_l2515_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_bracktype (node at line 2514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_bracktype"
		}"
		end

	rl_clear_message: INTEGER_32 is
 		-- rl_clear_message (node at line 2517)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_clear_message()"
		}"
		end

	rl_vi_fword (an_argument_l2531_c7: INTEGER_32; an_argument_l2532_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_fword (node at line 2530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_fword"
		}"
		end

	rl_unbind_key_in_map (an_argument_l2535_c7: INTEGER_32; an_argument_l2536_c7: POINTER): INTEGER_32 is
 		-- rl_unbind_key_in_map (node at line 2534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unbind_key_in_map"
		}"
		end

	rl_copy_backward_word (an_argument_l2549_c7: INTEGER_32; an_argument_l2550_c7: INTEGER_32): INTEGER_32 is
 		-- rl_copy_backward_word (node at line 2548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_backward_word"
		}"
		end

	rl_copy_keymap (an_argument_l2562_c7: POINTER): POINTER is
 		-- rl_copy_keymap (node at line 2561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_keymap"
		}"
		end

	rl_maybe_unsave_line: INTEGER_32 is
 		-- rl_maybe_unsave_line (node at line 2589)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_maybe_unsave_line()"
		}"
		end

	rl_transpose_chars (an_argument_l2649_c7: INTEGER_32; an_argument_l2650_c7: INTEGER_32): INTEGER_32 is
 		-- rl_transpose_chars (node at line 2648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_transpose_chars"
		}"
		end

	rl_abort (an_argument_l2676_c7: INTEGER_32; an_argument_l2677_c7: INTEGER_32): INTEGER_32 is
 		-- rl_abort (node at line 2675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_abort"
		}"
		end

	rl_maybe_replace_line: INTEGER_32 is
 		-- rl_maybe_replace_line (node at line 2692)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_maybe_replace_line()"
		}"
		end

	rl_delete_text (an_argument_l2694_c7: INTEGER_32; an_argument_l2695_c7: INTEGER_32): INTEGER_32 is
 		-- rl_delete_text (node at line 2693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_delete_text"
		}"
		end

	rl_bind_keyseq_in_map (an_argument_l2706_c7: POINTER; an_argument_l2707_c7: POINTER; an_argument_l2708_c7: POINTER): INTEGER_32 is
 		-- rl_bind_keyseq_in_map (node at line 2705)
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
 		-- rl_vi_check (node at line 2720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_check()"
		}"
		end

	rl_modifying (an_argument_l2754_c7: INTEGER_32; an_argument_l2755_c7: INTEGER_32): INTEGER_32 is
 		-- rl_modifying (node at line 2753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_modifying"
		}"
		end

	rl_vi_eword (an_argument_l2777_c7: INTEGER_32; an_argument_l2778_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_eword (node at line 2776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_eword"
		}"
		end

	rl_vi_replace (an_argument_l2790_c7: INTEGER_32; an_argument_l2791_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_replace (node at line 2789)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_replace"
		}"
		end

	rl_deprep_terminal is
 		-- rl_deprep_terminal (node at line 2832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_deprep_terminal()"
		}"
		end

	rl_save_state (an_argument_l2834_c7: POINTER): INTEGER_32 is
 		-- rl_save_state (node at line 2833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_save_state"
		}"
		end

	rl_stop_output (an_argument_l2844_c7: INTEGER_32; an_argument_l2845_c7: INTEGER_32): INTEGER_32 is
 		-- rl_stop_output (node at line 2843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_stop_output"
		}"
		end

	rl_make_keymap: POINTER is
 		-- rl_make_keymap (node at line 2858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_make_keymap()"
		}"
		end

	rl_kill_word (an_argument_l2861_c7: INTEGER_32; an_argument_l2862_c7: INTEGER_32): INTEGER_32 is
 		-- rl_kill_word (node at line 2860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_kill_word"
		}"
		end

	rl_vi_movement_mode (an_argument_l2868_c7: INTEGER_32; an_argument_l2869_c7: INTEGER_32): INTEGER_32 is
 		-- rl_vi_movement_mode (node at line 2867)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_vi_movement_mode"
		}"
		end

	rl_history_search_forward (an_argument_l2873_c7: INTEGER_32; an_argument_l2874_c7: INTEGER_32): INTEGER_32 is
 		-- rl_history_search_forward (node at line 2872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_history_search_forward"
		}"
		end

	rl_copy_forward_word (an_argument_l2898_c7: INTEGER_32; an_argument_l2899_c7: INTEGER_32): INTEGER_32 is
 		-- rl_copy_forward_word (node at line 2897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_copy_forward_word"
		}"
		end

	rl_upcase_word (an_argument_l2903_c7: INTEGER_32; an_argument_l2904_c7: INTEGER_32): INTEGER_32 is
 		-- rl_upcase_word (node at line 2902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_upcase_word"
		}"
		end

	rl_forward_byte (an_argument_l2934_c7: INTEGER_32; an_argument_l2935_c7: INTEGER_32): INTEGER_32 is
 		-- rl_forward_byte (node at line 2933)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_forward_byte"
		}"
		end

	rl_universal_argument (an_argument_l2961_c7: INTEGER_32; an_argument_l2962_c7: INTEGER_32): INTEGER_32 is
 		-- rl_universal_argument (node at line 2960)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_universal_argument"
		}"
		end

	rl_unix_line_discard (an_argument_l2967_c7: INTEGER_32; an_argument_l2968_c7: INTEGER_32): INTEGER_32 is
 		-- rl_unix_line_discard (node at line 2966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_unix_line_discard"
		}"
		end

feature {} -- Variables
	rl_completer_word_break_characters: POINTER is
 		-- rl_completer_word_break_characters (node at line 642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completer_word_break_characters"
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

	rl_event_hook: POINTER is
 		-- rl_event_hook (node at line 562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_event_hook"
		}"
		end

	rl_completion_invoking_key: INTEGER_32 is
 		-- rl_completion_invoking_key (node at line 743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_invoking_key"
		}"
		end

	rl_filename_quoting_function: POINTER is
 		-- rl_filename_quoting_function (node at line 721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_quoting_function"
		}"
		end

	rl_completion_query_items: INTEGER_32 is
 		-- rl_completion_query_items (node at line 748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_query_items"
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

	rl_completion_entry_function: POINTER is
 		-- rl_completion_entry_function (node at line 611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_entry_function"
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

	rl_directory_rewrite_hook: POINTER is
 		-- rl_directory_rewrite_hook (node at line 680)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_directory_rewrite_hook"
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

	rl_dispatching: INTEGER_32 is
 		-- rl_dispatching (node at line 527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_dispatching"
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

	rl_erase_empty_line: INTEGER_32 is
 		-- rl_erase_empty_line (node at line 581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_erase_empty_line"
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

	rl_prep_term_function: POINTER is
 		-- rl_prep_term_function (node at line 570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_prep_term_function"
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

	rl_filename_dequoting_function: POINTER is
 		-- rl_filename_dequoting_function (node at line 726)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_dequoting_function"
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

	rl_mark: INTEGER_32 is
 		-- rl_mark (node at line 515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_mark"
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

	rl_terminal_name: POINTER is
 		-- rl_terminal_name (node at line 540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_terminal_name"
		}"
		end

	rl_completion_type: INTEGER_32 is
 		-- rl_completion_type (node at line 740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_type"
		}"
		end

	rl_inhibit_completion: INTEGER_32 is
 		-- rl_inhibit_completion (node at line 790)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_inhibit_completion"
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

	rl_catch_sigwinch: INTEGER_32 is
 		-- rl_catch_sigwinch (node at line 605)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_catch_sigwinch"
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

	rl_completion_quote_character: INTEGER_32 is
 		-- rl_completion_quote_character (node at line 760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_quote_character"
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

	funmap: POINTER is
 		-- funmap (node at line 74)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "funmap"
		}"
		end

	rl_completion_display_matches_hook: POINTER is
 		-- rl_completion_display_matches_hook (node at line 703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_display_matches_hook"
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

	rl_filename_quoting_desired: INTEGER_32 is
 		-- rl_filename_quoting_desired (node at line 715)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_quoting_desired"
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

	rl_filename_completion_desired: INTEGER_32 is
 		-- rl_filename_completion_desired (node at line 708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_completion_desired"
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

	rl_menu_completion_entry_function: POINTER is
 		-- rl_menu_completion_entry_function (node at line 615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_menu_completion_entry_function"
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

	rl_undo_list: POINTER is
 		-- rl_undo_list (node at line 66)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_undo_list"
		}"
		end

	rl_filename_rewrite_hook: POINTER is
 		-- rl_filename_rewrite_hook (node at line 691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_filename_rewrite_hook"
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

	rl_deprep_term_function: POINTER is
 		-- rl_deprep_term_function (node at line 571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_deprep_term_function"
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

	rl_attempted_completion_over: INTEGER_32 is
 		-- rl_attempted_completion_over (node at line 735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_attempted_completion_over"
		}"
		end

	rl_completion_suppress_quote: INTEGER_32 is
 		-- rl_completion_suppress_quote (node at line 769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_suppress_quote"
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

	rl_pre_input_hook: POINTER is
 		-- rl_pre_input_hook (node at line 558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_pre_input_hook"
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

	rl_completion_suppress_append: INTEGER_32 is
 		-- rl_completion_suppress_append (node at line 756)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_suppress_append"
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

	rl_readline_name: POINTER is
 		-- rl_readline_name (node at line 497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_readline_name"
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

	rl_editing_mode: INTEGER_32 is
 		-- rl_editing_mode (node at line 489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_editing_mode"
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

	rl_directory_completion_hook: POINTER is
 		-- rl_directory_completion_hook (node at line 671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_directory_completion_hook"
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

	rl_executing_macro: POINTER is
 		-- rl_executing_macro (node at line 593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_executing_macro"
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

	rl_char_is_quoted_p: POINTER is
 		-- rl_char_is_quoted_p (node at line 731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_char_is_quoted_p"
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

	rl_sort_completion_matches: INTEGER_32 is
 		-- rl_sort_completion_matches (node at line 772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_sort_completion_matches"
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

	rl_prompt: POINTER is
 		-- rl_prompt (node at line 501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_prompt"
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

	rl_gnu_readline_p: INTEGER_32 is
 		-- rl_gnu_readline_p (node at line 482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_gnu_readline_p"
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

	rl_completion_found_quote: INTEGER_32 is
 		-- rl_completion_found_quote (node at line 764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_found_quote"
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

	rl_ignore_completion_duplicates: INTEGER_32 is
 		-- rl_ignore_completion_duplicates (node at line 786)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_ignore_completion_duplicates"
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

	rl_startup_hook: POINTER is
 		-- rl_startup_hook (node at line 553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_startup_hook"
		}"
		end

	rl_completion_append_character: INTEGER_32 is
 		-- rl_completion_append_character (node at line 752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rl_completion_append_character"
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


end -- class READLINE_EXTERNALS
