-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASS_NAME
   --
   -- To store a CLASS_TEXT name with its associated `start_position'.
   --

inherit
   NAME
      redefine is_equal
      end
   HASHABLE

create {ANY}
   make, unknown_position

feature {ANY}
   start_position: POSITION
         -- Of the first character.

   hashed_name: HASHED_STRING
         -- The corresponding unique one.

   to_string: STRING
         -- The name itself.

   hash_code: INTEGER
         -- A memory cache for `hashed_name.hash_code'.

   allow_missing: BOOLEAN

   predefined: BOOLEAN
         -- All following classes are handled in a special way by the *_TYPE_MARK corresponding class.
      do
         inspect
            to_string
         when "ANY", "ARRAY", "BOOLEAN", "CHARACTER", "DOUBLE",
            "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER", "INTEGER_64", "POINTER",
            "NATURAL_8", "NATURAL_16", "NATURAL_32", "NATURAL", "NATURAL_64",
            "REAL_32", "REAL_64", "REAL_80", "REAL_128", "REAL_EXTENDED", "STRING"
          then
            Result := True
         else
            -- Not `predefined'.
         end
      end

   looks_like_a_formal_generic_name: BOOLEAN
      do
         Result := to_string.last = '_'
      end

   class_text: CLASS_TEXT
         -- The corresponding one unique instance.
      do
         Result := class_text_memory
         if Result = Void then
            Result := smart_eiffel.class_text(Current)
            class_text_memory := Result
         end
      ensure
         Result /= Void
      end

   try_class_text: CLASS_TEXT
      require
         not_done_to_report_errors: error_handler.is_empty
      do
         if class_text_memory = Void then
            if not has_tried_to_load then
               class_name_cache.make(hashed_name, start_position, True)
               class_text_memory := smart_eiffel.class_text(class_name_cache)
               error_handler.cancel
               has_tried_to_load := True
            end
         end
         Result := class_text_memory
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   pretty (indent_level: INTEGER)
      do
         pretty_printer.put_string(to_string)
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := to_string = other.to_string
      end

   is_tuple_related: BOOLEAN
         -- Is it some TUPLE-related name ("TUPLE", "TUPLE 1", "TUPLE 2", etc.)?
      do
         Result := hashed_name.is_tuple_related
      end

   accept (visitor: CLASS_NAME_VISITOR)
      do
         visitor.visit_class_name(Current)
      end

feature {}
   class_name_cache: CLASS_NAME
      once
         create Result.unknown_position(string_aliaser.hashed_string(as_any), True)
      end

feature {SMART_EIFFEL}
   tuple_count: INTEGER
      require
         is_tuple_related
      local
         i: INTEGER; string: STRING
      do
         i := to_string.first_index_of(' ')
         if i /= 0 then
            string := once ".... local buffer ...."
            string.clear_count
            string.append_substring(to_string, i + 1, to_string.count)
            Result := string.to_integer
         end
      end

feature {EIFFEL_PARSER, CLASS_TEXT, TYPE_MARK}
   set_accurate_position (sp: like start_position)
      do
         start_position := sp
      ensure
         start_position = sp
      end

feature {LIVE_TYPE, ANONYMOUS_FEATURE}
   get_export_permission_of (other: CLASS_NAME): BOOLEAN
      require
         to_string /= other.to_string
      local
         other_class_text: CLASS_TEXT
      do
         if as_any = other.to_string then
            Result := True
         else
            other_class_text := other.class_text_memory
            if other_class_text = Void then
               other_class_text := smart_eiffel.loaded_class_text(other)
               if other_class_text /= Void then
                  other.set_class_text_memory(other_class_text)
               end
            end
            if other_class_text /= Void then
               Result := class_text.get_export_permission_of(other_class_text)
            end
         end
      end

feature {CLASS_NAME, CLASS_NAME_VISITOR}
   class_text_memory: CLASS_TEXT
         -- To cache `class_text' function Result.

   has_tried_to_load: BOOLEAN

feature {CLASS_NAME}
   set_class_text_memory (bcm: like class_text_memory)
      require
         bcm /= Void
         class_text_memory = Void
      do
         class_text_memory := bcm
      ensure
         class_text_memory = bcm
      end

feature {CLASS_NAME_VISITOR, CLASS_TEXT}
   set_string (s: STRING)
      do
         set_hashed_name(string_aliaser.hashed_string(s))
      end

feature {INTEGER_TYPE_MARK, NATURAL_TYPE_MARK}
   set_hashed_name (hn: HASHED_STRING)
      require
         hn /= Void
      do
         hashed_name := hn
         hash_code := hn.hash_code
         to_string := hn.to_string
      ensure
         hashed_name = hn
         to_string = hashed_name.to_string
         hash_code = to_string.hash_code
      end

feature {ANY}
   make (hn: like hashed_name; sp: like start_position; am: like allow_missing)
      require
         hn /= Void
      do
         set_hashed_name(hn)
         start_position := sp
         allow_missing := am
      ensure
         hashed_name = hn
         start_position = sp
         allow_missing = am
         to_string = hashed_name.to_string
         hash_code = to_string.hash_code
      end

   unknown_position (hn: like hashed_name; am: like allow_missing)
      require
         hn /= Void
      local
         p: POSITION
      do
         make(hn, p, am)
      ensure
         hashed_name = hn
         allow_missing = am
         start_position.is_unknown
         to_string = hashed_name.to_string
         hash_code = to_string.hash_code
      end

end -- class CLASS_NAME
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
