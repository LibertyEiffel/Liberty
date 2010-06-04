class READ_LINE_HISTORY
	-- The history of read lines.

	-- Note: items may be Void.

inherit 
	TRAVERSABLE[HISTORY_ENTRY] undefine is_equal end 

insert
	SINGLETON 
	WRAPPER_FACTORY[HISTORY_ENTRY]
	HISTORY_EXTERNALS
	HIST_ENTRY_STRUCT

creation using_history

feature -- TODO: State managing
	--  -- Function: HISTORY_STATE * history_get_history_state (void)
--      Return a structure describing the current state of the input
--      history.
-- 
--  -- Function: void history_set_history_state (HISTORY_STATE *state)
--      Set the state of the history list according to STATE.
-- 
-- 	 
feature -- 	 History List Management
	add (a_string: ABSTRACT_STRING) is
		-- Place `a_string' at the end of the history list.  The associated data field (if any) is set to `NULL'.
	require a_string/=Void
	do
		add_history(a_string.to_external)
	end

	add_time (a_stamp: ABSTRACT_STRING) is
		-- Change the time stamp associated with the most recent history entry to `a_stamp'.
	require a_stamp/=Void
	do
		add_history_time (a_stamp.to_external)
	end

	remove (an_offset: INTEGER) is
		-- Remove history entry at `an_offset' WHICH from the history. TODO: model in Eiffel this "The removed element is returned so you can free the line, data, and containing structure."
	local p: POINTER
	do
		p:=remove_history (an_offset)
	end

	--  -- Function: histdata_t free_history_entry (HIST_ENTRY *histent)
--      Free the history entry HISTENT and any history library private
--      data associated with it.  Returns the application-specific data so
--      the caller can dispose of it.
-- 
--  -- Function: HIST_ENTRY * replace_history_entry (int which, const char
--           *line, histdata_t data)
--      Make the history entry at offset WHICH have LINE and DATA.  This
--      returns the old entry so the caller can dispose of any
--      application-specific data.  In the case of an invalid WHICH, a
--      `NULL' pointer is returned.
-- 

	clear is
		-- Clear the history list by deleting all the entries.		
		do
			clear_history
		end

	stifle (a_max: INTEGER) is
		-- Stifle the history list, remembering only the last `a_max' entries.
	do
		stifle_history (a_max)
	end

--  -- Function: int unstifle_history (void)
--      Stop stifling the history.  This returns the previously-set
--      maximum number of history entries (as set by `stifle_history()').
-- 
	is_stifled: BOOLEAN is
		-- Is history stifled?
		do
			Result:=history_is_stifled.to_boolean
		end

feature -- 2.3.3 Information About the History List
-- ----------------------------------------
-- 
-- These functions return information about the entire history list or
-- individual list entries.
-- 
--  -- Function: HIST_ENTRY ** history_list (void)
--      Return a `NULL' terminated array of `HIST_ENTRY *' which is the
--      current input history.  Element 0 of this list is the beginning of
--      time.  If there is no history, return `NULL'.

	current_position: INTEGER is
		-- offset of the current history element
	do
		Result := where_history
	end

	current_entry: HISTORY_ENTRY is
		-- The history entry at the `current_position'. May be Void if there is no entry there.
	do
		Result:=wrapper_or_void(current_history)
	end

	item (an_offset: INTEGER): HISTORY_ENTRY is
		-- The history entry at position `an_offset'. Voidif there is no entry
		-- Note that the C library allows `an_offset' to be greater than the history length, giving a Void Result. 
	do
		Result:= wrapper_or_void(history_get(an_offset))
	end

	first: HISTORY_ENTRY is
		do
			Result:=item(lower)
		end

	last: HISTORY_ENTRY is
		do
			Result:=item(upper)
		end
	--  -- Function: time_t history_get_time (HIST_ENTRY *entry)
--      Return the time stamp associated with the history entry ENTRY.
-- 
--  -- Function: int history_total_bytes (void)
--      Return the number of bytes that the primary history entries are
--      using.  This function returns the sum of the lengths of all the
--      lines in the history.
-- 
feature -- Moving Around the History List
	new_iterator: ITERATOR[HISTORY_ENTRY] is
	do
		create {HISTORY_ITERATOR} Result.make(Current)
	end
	-- These functions allow the current index into the history list to be set
-- or changed.
-- 
--  -- Function: int history_set_pos (int pos)
--      Set the current history offset to POS, an absolute index into the
--      list.  Returns 1 on success, 0 if POS is less than zero or greater
--      than the number of history entries.
-- 
--  -- Function: HIST_ENTRY * previous_history (void)
--      Back up the current history offset to the previous history entry,
--      and return a pointer to that entry.  If there is no previous
--      entry, return a `NULL' pointer.
-- 
--  -- Function: HIST_ENTRY * next_history (void)
--      Move the current history offset forward to the next history entry,
--      and return the a pointer to that entry.  If there is no next
--      entry, return a `NULL' pointer.
-- 
-- 
-- 
feature -- Searching
-- These functions allow searching of the history list for entries
-- containing a specific string.  Searching may be performed both forward
-- and backward from the current history position.  The search may be
-- "anchored", meaning that the string must match at the beginning of the
-- history entry.  
-- 
--  -- Function: int history_search (const char *string, int direction)
--      Search the history for STRING, starting at the current history
--      offset.  If DIRECTION is less than 0, then the search is through
--      previous entries, otherwise through subsequent entries.  If STRING
--      is found, then the current history index is set to that history
--      entry, and the value returned is the offset in the line of the
--      entry where STRING was found.  Otherwise, nothing is changed, and
--      a -1 is returned.
-- 
--  -- Function: int history_search_prefix (const char *string, int
--           direction)
--      Search the history for STRING, starting at the current history
--      offset.  The search is anchored: matching lines must begin with
--      STRING.  If DIRECTION is less than 0, then the search is through
--      previous entries, otherwise through subsequent entries.  If STRING
--      is found, then the current history index is set to that entry, and
--      the return value is 0.  Otherwise, nothing is changed, and a -1 is
--      returned.
-- 
--  -- Function: int history_search_pos (const char *string, int
--           direction, int pos)
--      Search for STRING in the history list, starting at POS, an
--      absolute index into the list.  If DIRECTION is negative, the search
--      proceeds backward from POS, otherwise forward.  Returns the
--      absolute index of the history element where STRING was found, or
--      -1 otherwise.
-- 
feature -- History File Management
-- -------------------------------
-- 
-- The History library can read the history from and write it to a file.
-- This section documents the functions for managing a history file.
-- 
--  -- Function: int read_history (const char *filename)
--      Add the contents of FILENAME to the history list, a line at a time.
--      If FILENAME is `NULL', then read from `~/.history'.  Returns 0 if
--      successful, or `errno' if not.
-- 
--  -- Function: int read_history_range (const char *filename, int from,
--           int to)
--      Read a range of lines from FILENAME, adding them to the history
--      list.  Start reading at line FROM and end at TO.  If FROM is zero,
--      start at the beginning.  If TO is less than FROM, then read until
--      the end of the file.  If FILENAME is `NULL', then read from
--      `~/.history'.  Returns 0 if successful, or `errno' if not.
-- 
--  -- Function: int write_history (const char *filename)
--      Write the current history to FILENAME, overwriting FILENAME if
--      necessary.  If FILENAME is `NULL', then write the history list to
--      `~/.history'.  Returns 0 on success, or `errno' on a read or write
--      error.
-- 
--  -- Function: int append_history (int nelements, const char *filename)
--      Append the last NELEMENTS of the history list to FILENAME.  If
--      FILENAME is `NULL', then append to `~/.history'.  Returns 0 on
--      success, or `errno' on a read or write error.
-- 
--  -- Function: int history_truncate_file (const char *filename, int
--           nlines)
--      Truncate the history file FILENAME, leaving only the last NLINES
--      lines.  If FILENAME is `NULL', then `~/.history' is truncated.
--      Returns 0 on success, or `errno' on failure.
-- 
feature -- Expansion
-- These functions implement history expansion.
-- 
--  -- Function: int history_expand (char *string, char **output)
--      Expand STRING, placing the result into OUTPUT, a pointer to a
--      string (*note History Interaction::).  Returns:
--     `0'
--           If no expansions took place (or, if the only change in the
--           text was the removal of escape characters preceding the
--           history expansion character);
-- 
--     `1'
--           if expansions did take place;
-- 
--     `-1'
--           if there was an error in expansion;
-- 
--     `2'
--           if the returned line should be displayed, but not executed,
--           as with the `:p' modifier (*note Modifiers::).
-- 
--      If an error ocurred in expansion, then OUTPUT contains a
--      descriptive error message.
-- 
--  -- Function: char * get_history_event (const char *string, int
--           *cindex, int qchar)
--      Returns the text of the history event beginning at STRING +
--      *CINDEX.  *CINDEX is modified to point to after the event
--      specifier.  At function entry, CINDEX points to the index into
--      STRING where the history event specification begins.  QCHAR is a
--      character that is allowed to end the event specification in
--      addition to the "normal" terminating characters.
-- 
--  -- Function: char ** history_tokenize (const char *string)
--      Return an array of tokens parsed out of STRING, much as the shell
--      might.  The tokens are split on the characters in the
--      HISTORY_WORD_DELIMITERS variable, and shell quoting conventions
--      are obeyed.
-- 
--  -- Function: char * history_arg_extract (int first, int last, const
--           char *string)
--      Extract a string segment consisting of the FIRST through LAST
--      arguments present in STRING.  Arguments are split using
--      `history_tokenize'.
-- 
-- 
feature
	lower: INTEGER is
		do
			Result:=history_base
		end

	count: INTEGER is
		do
			Result:=history_length
		end

	is_empty: BOOLEAN is
		do
			Result:=(count=0)
		end
	upper: INTEGER is
		do
			Result:=lower+count
		end

	max_entries: INTEGER is
			-- The maximum number of history entries. Change it with `stifle'
		do
			Result:=history_max_entries
		end

--  -- Variable: int history_write_timestamps
--      If non-zero, timestamps are written to the history file, so they
--      can be preserved between sessions.  The default value is 0,
--      meaning that timestamps are not saved.
-- 
--  -- Variable: char history_expansion_char
--      The character that introduces a history event.  The default is `!'.
--      Setting this to 0 inhibits history expansion.
-- 
--  -- Variable: char history_subst_char
--      The character that invokes word substitution if found at the start
--      of a line.  The default is `^'.
-- 
--  -- Variable: char history_comment_char
--      During tokenization, if this character is seen as the first
--      character of a word, then it and all subsequent characters up to a
--      newline are ignored, suppressing history expansion for the
--      remainder of the line.  This is disabled by default.
-- 
--  -- Variable: char * history_word_delimiters
--      The characters that separate tokens for `history_tokenize()'.  The
--      default value is `" \t\n()<>;&|"'.
-- 
-- -- Variable: char * history_search_delimiter_chars
--      The list of additional characters which can delimit a history
--      search string, in addition to space, TAB, `:' and `?' in the case
--      of a substring search.  The default is empty.
-- 
--  -- Variable: char * history_no_expand_chars
--      The list of characters which inhibit history expansion if found
--      immediately following HISTORY_EXPANSION_CHAR.  The default is
--      space, tab, newline, carriage return, and `='.
-- 
--  -- Variable: int history_quotes_inhibit_expansion
--      If non-zero, single-quoted words are not scanned for the history
--      expansion character.  The default value is 0.
-- 
--  -- Variable: rl_linebuf_func_t * history_inhibit_expansion_function
--      This should be set to the address of a function that takes two
--      arguments: a `char *' (STRING) and an `int' index into that string
--      (I).  It should return a non-zero value if the history expansion
--      starting at STRING[I] should not be performed; zero if the
--      expansion should be done.  It is intended for use by applications
--      like Bash that use the history expansion character for additional
--      purposes.  By default, this variable is set to `NULL'.

feature {} -- Implementation
	wrappers: HASHED_DICTIONARY[HISTORY_ENTRY, POINTER] is once create Result.make end

	wrapper (p: POINTER): HISTORY_ENTRY is
		do
			if wrappers.has(p) then
				Result:=wrappers.at(p)
			else
				create Result.from_external_pointer(p)
				wrappers.add(Result,p)
			end
		end
end -- class READ_LINE_HISTORY

-- Copyright (C) 2010, Paolo Redaelli

-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This package is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Readline.  If not, see <http://www.gnu.org/licenses/>.


