-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FEATURE_NAME
   --
   -- For all kinds of feature names (simple names, infix or prefix names, frozen names as well as
   -- Precursor names).
   -- The most common usage of FEATURE_NAME class is for declaration names of features (function,
   -- procedure and attributes), but the very same class is also used as an EXPRESSION for attributes which
   -- are syntactically recognizable (i.e. the left hand side of an assignment or for example, or the target
   -- of some creation instruction).
   --

inherit
   COMPARABLE
      redefine is_equal
      end
   HASHABLE

insert
   NAME
      redefine is_equal
      end

create {ANY}
   ordinary_name, simple_feature_name, infix_name, prefix_name, alias_name, unknown_position

feature {}
   name_type: INTEGER
         -- Dynamic binding is no longer used for feature name in order to avoid covariance problems
         -- in hashable DICTIONARY/SET.

   C_simple_feature_name:        INTEGER_8 1
   C_simple_feature_name_frozen: INTEGER_8 2
   C_infix_name:                 INTEGER_8 3
   C_infix_name_frozen:          INTEGER_8 4
   C_prefix_name:                INTEGER_8 5
   C_prefix_name_frozen:         INTEGER_8 6
   C_alias_name:                 INTEGER_8 7
   C_alias_name_frozen:          INTEGER_8 8

feature {ANY}
   start_position: POSITION
         -- Of the first character.

   name: HASHED_STRING
         -- The unique corresponding one.

   hash_code: INTEGER
      do
         Result := name.hash_code
      end

   to_string: STRING
      do
         Result := name.to_string
      end

   is_equal (other: like Current): BOOLEAN
      do
         if name = other.name then
            --|*** Why is there a special case for simple feature names? <FM-19/04/2006>
            inspect
               name_type
            when C_simple_feature_name, C_simple_feature_name_frozen then
               Result := True
            when C_infix_name, C_infix_name_frozen then
               Result := other.is_infix_name or else other.is_simple_feature_name
            when C_prefix_name, C_prefix_name_frozen then
               Result := other.is_prefix_name or else other.is_simple_feature_name
            when C_alias_name, C_alias_name_frozen then
               Result := other.is_alias_name or else other.is_simple_feature_name
            end
            check
               Result = is_simple_feature_name
                  or other.is_simple_feature_name
                  or (is_infix_name and other.is_infix_name)
                  or (is_prefix_name and other.is_prefix_name)
                  or (is_alias_name and other.is_alias_name)
            end
         end
      end

   infix "<" (other: like Current): BOOLEAN
      do
         if name = other.name then
            --|*** There is a special case for simple feature names because of is_equal. <FM-19/04/2006>
            inspect
               name_type
            when C_simple_feature_name, C_simple_feature_name_frozen then
               -- Result := False
            when C_infix_name, C_infix_name_frozen then
               -- Result := False
            when C_prefix_name, C_prefix_name_frozen then
               Result := other.is_infix_name
               check
                  Result = other.is_simple_feature_name or not other.is_prefix_name
               end
            when C_alias_name, C_alias_name_frozen then
               Result := other.is_alias_name
               check
                  Result = other.is_simple_feature_name or not other.is_alias_name
               end
            end
         else
            Result := to_string < other.to_string
         end
      end

   is_frozen: BOOLEAN
      do
         inspect
            name_type
         when C_simple_feature_name_frozen, C_infix_name_frozen, C_prefix_name_frozen, C_alias_name_frozen then
            Result := True
         else
            Result := False
         end
      end

   is_simple_feature_name: BOOLEAN
      do
         inspect
            name_type
         when C_simple_feature_name, C_simple_feature_name_frozen then
            Result := True
         else
            Result := False
         end
      end

   is_infix_name: BOOLEAN
      do
         inspect
            name_type
         when C_infix_name, C_infix_name_frozen then
            Result := True
         else
            Result := False
         end
      end

   is_prefix_name: BOOLEAN
      do
         inspect
            name_type
         when C_prefix_name, C_prefix_name_frozen then
            Result := True
         else
            Result := False
         end
      end

   is_alias_name: BOOLEAN
      do
         inspect
            name_type
         when C_alias_name, C_alias_name_frozen then
            Result := True
         else
            Result := False
         end
      end

   infix_or_prefix: STRING
         -- Return "infix" or "prefix" or Void.
      do
         if is_infix_name then
            Result := fz_infix
         elseif is_prefix_name then
            Result := fz_prefix
         end
      end

   complete_name_in (buffer: STRING)
      require
         buffer /= Void
      do
         if not complete_name_flag then
            complete_name_flag := True
            if is_simple_feature_name then
               buffer.append(to_string)
            elseif is_alias_name then
               buffer.append(once "alias %"")
               buffer.append(to_string)
               buffer.extend('%"')
            elseif is_infix_name then
               buffer.append(once "infix %"")
               buffer.append(to_string)
               buffer.extend('%"')
            else
               check
                  is_prefix_name
               end
               buffer.append(once "prefix %"")
               buffer.append(to_string)
               buffer.extend('%"')
            end
            if name_alias /= Void then
               buffer.extend(' ')
               name_alias.complete_name_in(buffer)
            end
            complete_name_flag := False
         end
      end

   mapping_c_in (buffer: STRING)
      local
         i: INTEGER; c: CHARACTER; string: STRING
      do
         string := to_string
         if is_simple_feature_name then
            buffer.append(string)
         else
            if is_prefix_name then
               buffer.append(once "_px_")
            else
               check
                  is_infix_name
               end
               buffer.append(once "_ix_")
            end
            from
               i := 1
            until
               i > string.count
            loop
               c := string.item(i)
               if c.is_letter then
                  buffer.extend(c)
               else
                  c.code.append_in(buffer)
               end
               i := i + 1
            end
         end
      end

   is_free_operator: BOOLEAN
         -- Note: this feature which checks the correctness of free
         -- operator notation is not used by the parser but is defined just
         -- to make the assertion code clear and nice.
      local
         set: STRING; i: INTEGER
      do
         set := once "+-*/\=<>@#|&~"
         Result := set.has(to_string.first)
         from
            i := 2
         until
            not Result or else i > to_string.count - 1
         loop
            if set.has(to_string.item(i)) then
            else
               inspect
                  to_string.item(i)
               when '.', '?', '{', '}' then
               else
                  Result := False
               end
            end
            i := i + 1
         end
         if Result then
            Result := set.has(to_string.last)
         end
      end

   declaration_in (buffer: STRING)
      require
         buffer /= Void
      do
         if is_simple_feature_name then
            buffer.append(to_string)
         elseif is_infix_name then
            buffer.append(fz_infix)
            buffer.extend(' ')
            buffer.extend('%"')
            buffer.append(to_string)
            buffer.extend('%"')
         else
            check
               is_prefix_name
            end
            buffer.append(fz_prefix)
            buffer.extend(' ')
            buffer.extend('%"')
            buffer.append(to_string)
            buffer.extend('%"')
         end
      end

   pretty (indent_level: INTEGER)
      do
         pretty_printer.put_string(to_string)
      end

   pretty_target (indent_level: INTEGER)
      do
         check
            False
         end
      end

   short (type: TYPE)
      local
         i: INTEGER; c: CHARACTER
      do
         if is_simple_feature_name then
            short_printer.hook(once "Bsfn")
            from
               i := 1
            until
               i > to_string.count
            loop
               c := to_string.item(i)
               if c = '_' then
                  short_printer.hook_or(once "Usfn", once "_")
               else
                  short_printer.put_character(c)
               end
               i := i + 1
            end
            short_printer.hook(once "Asfn")
         elseif is_infix_name then
            short_printer.put_infix_name(once "Bifn", once "infix %"", once "Aifn", once "%"", Current)
         else
            check
               is_prefix_name
            end
            short_printer.hook_or(once "Bpfn", once "prefix %"")
            from
               i := 1
            until
               i > to_string.count
            loop
               c := to_string.item(i)
               short_printer.put_character(c)
               i := i + 1
            end
            short_printer.hook_or(once "Apfn", once "%"")
         end
      end

   accept (visitor: FEATURE_NAME_VISITOR)
      do
         visitor.visit_feature_name(Current)
      end

feature {EIFFEL_PARSER, CLASS_TEXT, LIVE_TYPE, FEATURE_NAME_VISITOR}
   unknown_position (n: STRING)
      require
         n /= Void
      local
         unknown: POSITION
      do
         basic_create_1(C_simple_feature_name, n, unknown)
      ensure
         to_string.is_equal(n)
      end

feature {ANONYMOUS_FEATURE, RENAME_PAIR, FEATURE_NAME_LIST}
   declaration_pretty_print
      do
         special_pretty_print (True)
      end

feature {E_ROUTINE, WRITABLE_ATTRIBUTE}
   inside_end_comment_pretty_print
      do
         special_pretty_print (False)
      end

feature {}
   special_pretty_print (frozen_flag: BOOLEAN)
      do
         if frozen_flag and then is_frozen then
            pretty_printer.keyword(once "frozen")
         end
         if is_simple_feature_name then
            pretty_printer.put_string(name.to_string)
         elseif is_infix_name then
            pretty_printer.keyword(fz_infix)
            pretty_printer.put_character('%"')
            pretty_printer.put_string(to_string)
            pretty_printer.put_character('%"')
         else
            check
               is_prefix_name
            end
            pretty_printer.keyword(fz_prefix)
            pretty_printer.put_character('%"')
            pretty_printer.put_string(to_string)
            pretty_printer.put_character('%"')
         end
      end

feature {TYPE}
   ordinary_name (hn: like name; sp: like start_position)
         -- To create a simple ordinary feature name.
      require
         hn /= Void
         not sp.is_unknown
      do
         basic_create_0(C_simple_feature_name, hn, sp)
      ensure
         name = hn
         start_position = sp
      end

feature {ANY}
   name_alias: FEATURE_NAME

   set_name_alias (a: like name_alias) assign name_alias
      require
         a.is_simple_feature_name /= is_simple_feature_name
         name_alias = Void
         a.name_alias /= Void implies a.name_alias = Current
      do
         name_alias := a
      ensure
         name_alias = a
      end

feature {EIFFEL_PARSER, FEATURE_ACCUMULATOR}
   set_is_frozen
      require
         not is_frozen
      do
         inspect
            name_type
         when C_simple_feature_name then
            name_type := C_simple_feature_name_frozen
         when C_infix_name then
            name_type := C_infix_name_frozen
         when C_prefix_name then
            name_type := C_prefix_name_frozen
         when C_alias_name then
            name_type := C_alias_name_frozen
         end
      ensure
         is_frozen
      end

   set_plus_minus_prefix
      require
         is_infix_name
         name.to_string = as_plus or else name.to_string = as_minus
      do
         inspect
            name_type
         when C_infix_name then
            name_type := C_prefix_name
         when
            C_infix_name_frozen then
            name_type := C_prefix_name_frozen
         end
      ensure
         (old is_frozen) = is_frozen
         is_prefix_name
      end

feature {FEATURE_STAMP}
   set_start_position (sp: like start_position)
      require
         not sp.is_unknown
      do
         start_position := sp
      ensure
         start_position = sp
      end

feature {}
   simple_feature_name (n: STRING; sp: like start_position)
      require
         n /= Void
         not sp.is_unknown
      do
         basic_create_1(C_simple_feature_name, n, sp)
      ensure
         to_string.is_equal(n)
         start_position = sp
         is_simple_feature_name
      end

   prefix_name (hn: like name; sp: like start_position)
      require
         hn /= Void
         not sp.is_unknown
      do
         basic_create_0(C_prefix_name, hn, sp)
      ensure
         name = hn
         start_position = sp
         is_prefix_name
      end

   infix_name (hn: like name; sp: like start_position)
      require
         hn /= Void
         not sp.is_unknown
      do
         basic_create_0(C_infix_name, hn, sp)
      ensure
         name = hn
         start_position = sp
         is_infix_name
      end

   alias_name (hn: like name; sp: like start_position)
      require
         hn /= Void
         not sp.is_unknown
      do
         basic_create_0(C_alias_name, hn, sp)
      ensure
         name = hn
         start_position = sp
         is_alias_name
      end

   basic_create_1 (nt: like name_type; n: STRING; sp: like start_position)
      require
         n /= Void
      local
         hs: HASHED_STRING
      do
         hs := string_aliaser.hashed_string(n)
         basic_create_0(nt, hs, sp)
      end

   basic_create_0 (nt: INTEGER; hn: like name; sp: like start_position)
         -- The really basic final one.
      require
         (nt = C_simple_feature_name) xor (nt = C_infix_name) xor (nt = C_prefix_name) xor (nt = C_alias_name)
         hn /= Void
      do
         name_type := nt
         start_position := sp
         name := hn
      end

   complete_name_flag: BOOLEAN

invariant
   name /= Void

   name_type > 0

   string_aliaser.registered_one(to_string)

   name_alias /= Void implies (name_alias.is_simple_feature_name /= is_simple_feature_name)
   name_alias /= Void implies (name_alias.name_alias = Void or else name_alias.name_alias = Current)

end -- class FEATURE_NAME
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
