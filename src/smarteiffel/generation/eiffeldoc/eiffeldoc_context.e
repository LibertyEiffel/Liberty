-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_CONTEXT
   --
   -- Shared context for all Eiffeldoc classes.
   --

create {EIFFELDOC}
   make

feature {EIFFELDOC}
   set_options (a_options: like options)
      require
         a_options /= Void
      do
         options := a_options
      end

feature {EIFFELDOC, EIFFELDOC_SHORTER_CLASSDOC}
   set_class_text (a_class_text: like class_text)
      require
         a_class_text /= Void
      do
         class_text := a_class_text
         class_type := a_class_text.declaration_type_of_like_current
         type := class_type
      end

   set_html (a_html: like html)
      require
         a_html /= Void
      do
         html := a_html
      end

   set_type (a_type: like type)
      require
         a_type /= Void
      do
         type := a_type
      end

feature {EIFFELDOC, EIFFELDOC_SHORTER_CLASSDOC, EIFFELDOC_COMMENT_STATE, EIFFELDOC_CORE, EIFFELDOC_SHORTER, EIFFELDOC_COMMENT_WRITER}
   type: TYPE

   html: EIFFELDOC_OUTPUT_STREAM

   class_type: TYPE

   class_text: CLASS_TEXT

   options: EIFFELDOC_OPTIONS

   write_comment (comment: COMMENT; from_sentence, to_sentence: INTEGER)
      do
         comment_writer.write(comment, Void, from_sentence, to_sentence)
      end

   write_feature_comment (a_comment: COMMENT; for_feature: ANONYMOUS_FEATURE; from_sentence, to_sentence: INTEGER)
      do
         comment_writer.write(a_comment, for_feature, from_sentence, to_sentence)
      end

feature {EIFFELDOC_COMMENT_WRITER}
   frozen all_states: FAST_ARRAY[EIFFELDOC_COMMENT_STATE]
         -- All the known states.
         --
         -- The order is very important.
         -- * `hidden_comment', `in_bullet_list', `in_numbered_list', `in_preformatted' must be before
         -- `beginning_of_line' because they all use line beginnings
         -- * `in_url' must be before `in_wiki_word,' because they both use brackets
         -- * `in_bold', `in_italics' and `in_character' must be in this order because they all use quotes
         -- * `in_text' must be last because it handles anything not handled by another state
      once
         Result := {FAST_ARRAY[EIFFELDOC_COMMENT_STATE] <<
                                                          hidden_comment,
                                                          in_bullet_list,
                                                          in_numbered_list,
                                                          in_preformatted,
                                                          beginning_of_line,
                                                          in_class_name,
                                                          in_entity_name,
                                                          in_url,
                                                          in_wiki_word,
                                                          in_bold,
                                                          in_italics,
                                                          in_character,
                                                          in_string,
                                                          in_text
                                                          >> }
      end

   frozen hidden_comment: EIFFELDOC_COMMENT_STATE_HIDDEN
      once
         create Result.make(Current)
      end

   frozen in_bullet_list: EIFFELDOC_COMMENT_STATE_IN_BULLET_LIST
      once
         create Result.make(Current)
      end

   frozen in_numbered_list: EIFFELDOC_COMMENT_STATE_IN_NUMBERED_LIST
      once
         create Result.make(Current)
      end

   frozen in_preformatted: EIFFELDOC_COMMENT_STATE_IN_PREFORMATTED
      once
         create Result.make(Current)
      end

   frozen beginning_of_line: EIFFELDOC_COMMENT_STATE_BEGINNING_OF_LINE
      once
         create Result.make(Current)
      end

   frozen in_text: EIFFELDOC_COMMENT_STATE_IN_TEXT
      once
         create Result.make(Current)
      end

   frozen in_class_name: EIFFELDOC_COMMENT_STATE_IN_CLASS_NAME
      once
         create Result.make(Current)
      end

   frozen in_entity_name: EIFFELDOC_COMMENT_STATE_IN_ENTITY_NAME
      once
         create Result.make(Current)
      end

   frozen in_url: EIFFELDOC_COMMENT_STATE_IN_URL
      once
         create Result.make(Current)
      end

   frozen in_wiki_word: EIFFELDOC_COMMENT_STATE_IN_WIKI_WORD
      once
         create Result.make(Current)
      end

   frozen in_bold: EIFFELDOC_COMMENT_STATE_IN_BOLD
      once
         create Result.make(Current)
      end

   frozen in_italics: EIFFELDOC_COMMENT_STATE_IN_ITALICS
      once
         create Result.make(Current)
      end

   frozen in_character: EIFFELDOC_COMMENT_STATE_IN_CHARACTER
      once
         create Result.make(Current)
      end

   frozen in_string: EIFFELDOC_COMMENT_STATE_IN_STRING
      once
         create Result.make(Current)
      end

feature {}
   make
      do
         create comment_writer.make(Current)
      end

   comment_writer: EIFFELDOC_COMMENT_WRITER

end -- class EIFFELDOC_CONTEXT
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- https://www.liberty-eiffel.org
-- ------------------------------------------------------------------------------------------------------------------------------
