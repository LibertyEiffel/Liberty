class READ_LINE_HISTORY
--
-- The history of read lines.
--
-- Note: items may be Void.
--

inherit
   TRAVERSABLE[HISTORY_ENTRY]
      undefine
         is_equal
      end

insert
   SINGLETON
      undefine
         out_in_tagged_out_memory
      end
   WRAPPER_FACTORY[HISTORY_ENTRY]
   HISTORY_EXTERNALS
      undefine
         out_in_tagged_out_memory
      end
   HIST_ENTRY_STRUCT
      undefine
         out_in_tagged_out_memory
      end

create {ANY}
   using_history

feature {ANY} -- TODO: State managing
   --  -- Function: HISTORY_STATE * history_get_history_state (void)
   --      Return a structure describing the current state of the input
   --      history.
   --
   --  -- Function: void history_set_history_state (HISTORY_STATE *state)
   --      Set the state of the history list according to STATE.
   --
   --

feature {ANY} --       History List Management
   add (a_string: ABSTRACT_STRING)
         -- Place `a_string' at the end of the history list.  The associated data field (if any) is set to `NULL'.
      require
         a_string /= Void
      do
         add_history(a_string.to_external)
         generation := generation + 1
      end

   add_time (a_stamp: ABSTRACT_STRING)
         -- Change the time stamp associated with the most recent history entry to `a_stamp'.
      require
         a_stamp /= Void
      do
         add_history_time(a_stamp.to_external)
         generation := generation + 1
      end

   remove (an_offset: INTEGER): HISTORY_ENTRY
         -- The history entry at `an_offset' removed from the history.
         -- Note: the C library returns the removed element in order to free the
         -- line, data, and containing structure. This may be useful for an
         -- higher level interface to the library. Result will be different from
         -- item(an_offset) because the library will mostly copy it elsewhere
         -- before returning it.
      local
         p: POINTER
      do
         create Result.from_external_pointer(remove_history(an_offset))
         generation := generation + 1
      ensure
         removed: count = old count -1
         different_object: Result /= old item(an_offset)
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

   clear
         -- Clear the history list by deleting all the entries.
      do
         clear_history
         generation := generation + 1
      end

   stifle (a_max: INTEGER)
         -- Stifle the history list, remembering only the last `a_max' entries.
      do
         stifle_history(a_max)
         generation := generation + 1
      end

   --  -- Function: int unstifle_history (void)
   --      Stop stifling the history.  This returns the previously-set
   --      maximum number of history entries (as set by `stifle_history()').
   --
   is_stifled: BOOLEAN
         -- Is history stifled?
      do
         Result := history_is_stifled.to_boolean
      end

feature {ANY} -- 2.3.3 Information About the History List
   -- These functions return information about the entire history list or
   -- individual list entries.

   --  -- Function: HIST_ENTRY ** history_list (void)
   --      Return a `NULL' terminated array of `HIST_ENTRY *' which is the
   --      current input history.  Element 0 of this list is the beginning of
   --      time.  If there is no history, return `NULL'.

   current_position: INTEGER
         -- offset of the current history element
      do
         Result := where_history
      end

   current_entry: HISTORY_ENTRY
         -- The history entry at the `current_position'. May be Void if there is no entry there.
      do
         Result := wrapper_or_void(current_history)
      end

   item (an_offset: INTEGER): HISTORY_ENTRY
         -- The history entry at position `an_offset'. Voidif there is no entry
         -- Note that the C library allows `an_offset' to be greater than the history length, giving a Void Result.
      do
         Result := wrapper_or_void(history_get(an_offset))
      end

   first: HISTORY_ENTRY
      do
         Result := item(lower)
      end

   last: HISTORY_ENTRY
      do
         Result := item(upper)
      end

   total_bytes: INTEGER
         -- the number of bytes that the primary history entries are using
         -- computed as the sum of the lengths of all the lines in the history.
      do
         Result := history_total_bytes
      end

feature {ANY} -- Moving Around the History List
   new_iterator: ITERATOR[HISTORY_ENTRY]
      do
         create {HISTORY_ITERATOR} Result.make(Current)
      end

   set_position (a_position: INTEGER)
         -- Set the current history offset to `a_position', an absolute index
         -- into the list.
      require
         valid_index(a_position)
      local
         res: INTEGER
      do
         res := history_set_pos(a_position)
         check
            res = 1
            -- history_set_pos returns 1 on success, 0 if POS is less than zero
            -- or greater than the number of history entries. We should always
            -- receive 1 because of the precondition.
         end
      end

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

feature {ANY} -- Searching
   -- These functions allow searching of the history list for entries
   -- containing a specific string.  Searching may be performed both forward
   -- and backward from the current history position.  The search may be
   -- "anchored", meaning that the string must match at the beginning of the
   -- history entry.

   search (a_string: ABSTRACT_STRING; forward: BOOLEAN): INTEGER
         -- Search the history for `a_string', starting at the current history
         -- offset.  If `forward' is true then the search is through previous
         -- entries, otherwise through subsequent entries.  If `a_string'
         -- found, then the current history index is set to that history entry,
         -- and Result is the offset in the line of the entry where STRING was
         -- found.  Otherwise, nothing is changed, and a -1 is returned.
      do
         Result := history_search(a_string.to_external, forward.to_integer - 1)
      end

   search_prefix (a_string: ABSTRACT_STRING; forward: BOOLEAN)
         -- Search the history for `a_string', starting at the current history
         -- offset.  The search is anchored: matching lines must begin with
         -- `a_string'.  If `forward' ir False then the search is through
         -- previous entries, otherwise through subsequent entries.  If
         -- `a_string' is found, then the current history index is set to that
         -- entry, and `is_successful' set to True.  Otherwise, nothing
         -- changed, and `is_successful' set to False.
      require
         a_string /= Void
      do
         is_successful := not history_search_prefix(a_string.to_external, forward.to_integer - 1).to_boolean
      end

   search_from_position (a_string: ABSTRACT_STRING; forward: BOOLEAN; a_position: INTEGER): INTEGER
         -- The index of the first occurrence of `a_string' in the history list,
         -- starting at `a_position'.  If `forward' is False the search proceeds
         -- backward from `a_position', otherwise forward.  Result will be -1 if
         -- `a_string' is not found.
      require
         a_string /= Void
         valid_index(a_position)
      do
         Result := history_search_pos(a_string.to_external, forward.to_integer - 1, a_position)
      end

feature {ANY} -- History File Management
   from_file (a_file_name: ABSTRACT_STRING)
         -- Add the contents of `a_file_name' to the history list, a line at a
         -- time.  If `a_file_name' is Void, then read from `~/.history'.
         -- Updates `is_successful' (and C errno)
      do
         is_successful := not read_history(null_or_string(a_file_name)).to_boolean
      end

   from_file_range (a_file_name: ABSTRACT_STRING; a_lower, an_upper: INTEGER)
         -- Read a range of lines from `a_file_name', adding them to the history
         -- list.  Start reading at line `a_lower' end at `an_upper'.  If
         -- `a_lower' is zero, start at the beginning.  If `an_upper' is less
         -- than `a_lower', then read until the end of the file.  If
         -- `a_file_name' is Void, then read from `~/.history'.  `is_successful'
         -- and `errno' are updated..
      do
         is_successful := not read_history_range(null_or_string(a_file_name),a_lower,an_upper).to_boolean
      end

   write (a_file_name: ABSTRACT_STRING)
         -- Write the current history to `a_file_name', overwriting it if
         -- necessary.  If `a_file_name' is Void, then write the history list to
         -- `~/.history'. `is_successful' and `errno' are updated.
      do
         is_successful := not write_history(null_or_string(a_file_name)).to_boolean
      end

   append_to_file (elements: INTEGER; a_file_name: ABSTRACT_STRING)
         -- Append the last `elements' of the history list to `a_file_name'.  If
         -- FILENAME is `NULL', then append to `~/.history'.  `is_successful' and `errno' are updater.
      do
         is_successful := not append_history(elements, null_or_string(a_file_name)).to_boolean
      end

   truncate_file (a_file_name: ABSTRACT_STRING; a_number_of_lines: INTEGER)
         -- Truncate the history file `a_file_name', leaving only the last `a_number_of_lines'
         -- lines.  If i`a_file_name' is Void, then `~/.history' is truncated.
         -- `is_successful' and `errno' are updated.
      require
         a_number_of_lines >= 0
      do
         is_successful := not history_truncate_file(null_or_string(a_file_name), a_number_of_lines).to_boolean
      end

feature {ANY} -- History expansion
   expand (a_string: ABSTRACT_STRING): STRING
         -- `a_string' expanded using the current content of the history. See
         -- `hasnt_been_expanded', `has_been_expanded', `error_in_expansion'.

         -- If an error ocurred in expansion, then Result contains a descriptive
         -- error message.

      local
         p: POINTER
      do
         last_expansion_result := history_expand(a_string.to_external, $p)
         check
            p.is_not_null -- we assume a string is always returned.
         end
         create Result.from_external(p)
      end

   hasnt_been_expanded: BOOLEAN
         -- If no expansions took place (or, if the only change in the
         -- text was the removal of escape characters preceding the history
         -- expansion character);
      do
         Result := last_expansion_result = 0
      end

   has_been_expanded: BOOLEAN
         -- Has last call to `expand' actually produced an expansion of the argument?
      do
         Result := last_expansion_result = 1
      end

   error_in_expansion: BOOLEAN
         -- Was there an error in the expansion?
      do
         Result := last_expansion_result = -1
      end

   -- TODO: see `2' result of expand: if the returned line should be displayed, but not executed,
   --           as with the `:p' modifier (*note Modifiers::).
   --
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
feature {ANY}
   lower: INTEGER
      do
         Result := history_base
      end

   count: INTEGER
      do
         Result := history_length
      end

   is_empty: BOOLEAN
      do
         Result := (count = 0)
      end

   upper: INTEGER
      do
         Result := lower + count
      end

   max_entries: INTEGER
         -- The maximum number of history entries. Change it with `stifle'
      do
         Result := history_max_entries
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
   --      immediately following HISTORY_EXPANSION_CHAR.  The default
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

feature {ANY}
   is_successful: BOOLEAN
         -- Was last command successful?

feature {} -- Implementation
   wrappers: HASHED_DICTIONARY[HISTORY_ENTRY, POINTER]
      once
         create Result.make
      end

   last_expansion_result: INTEGER

   wrapper (p: POINTER): HISTORY_ENTRY
      do
         if wrappers.has(p) then
            Result := wrappers.at(p)
         else
            create Result.from_external_pointer(p)
            wrappers.add(Result,p)
         end
      end

end -- class READ_LINE_HISTORY

-- Copyright (C) 2010-2018: , Paolo Redaelli, 2012 Cyril Adrian

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
