-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SHORT_PRINTER
   --
   -- Driver for the `short' command. Actually, the `short_printer' singleton is the unique object
   -- to actually produce the output.
   --

insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   type: TYPE
         -- The `type' to short.

   sort_flag: BOOLEAN
         -- Is the "-sort" flag of command "short" used?

   has (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE): BOOLEAN
         -- Is this one already printed (or memorized)?
      require
         type.lookup(fn).anonymous_feature(type) = af
      do
         Result := memory.has(fn)
         check
            Result implies memory.reference_at(fn) = af
         end
      end

   hook_or (h, str: STRING)
      do
         if hook_exists(h) then
            from
               hook_file.read_character
            until
               hook_file.end_of_input
            loop
               out_stream.put_character(hook_file.last_character)
               hook_file.read_character
            end
            hook_file.disconnect
         else
            out_stream.put_string(str)
         end
      end

   hook_and_lower (h, name: STRING)
         -- When hook `h' exists, the corresponding `name' is printed
         -- one more time (using lower case letters) just before the
         -- contents of `h' hook file.
      local
         buffer: STRING
      do
         if hook_exists(h) then
            buffer := once "... unique once buffer ..."
            buffer.copy(name)
            buffer.to_lower
            out_stream.put_string(buffer)
            from
               hook_file.read_character
            until
               hook_file.end_of_input
            loop
               out_stream.put_character(hook_file.last_character)
               hook_file.read_character
            end
            hook_file.disconnect
         end
      end

   hook_and (h, name: STRING)
         -- When hook `h' exists, the corresponding `name' is printed
         -- just before the contents of `h' hook file.
      do
         if hook_exists(h) then
            out_stream.put_string(name)
            from
               hook_file.read_character
            until
               hook_file.end_of_input
            loop
               out_stream.put_character(hook_file.last_character)
               hook_file.read_character
            end
            hook_file.disconnect
         end
      end

   hook (h: STRING)
      do
         if hook_exists(h) then
            from
               hook_file.read_character
            until
               hook_file.end_of_input
            loop
               out_stream.put_character(hook_file.last_character)
               hook_file.read_character
            end
            hook_file.disconnect
         end
      end

   put_class_name (name: CLASS_NAME)
      local
         i: INTEGER; c: CHARACTER; actual_name: STRING
      do
         if name.is_tuple_related then
            actual_name := once "TUPLE"
         else
            actual_name := name.to_string
         end
         hook(once "Bcn")
         hook_and_lower(once "Mcn", actual_name)
         from
            i := 1
         until
            i > actual_name.count
         loop
            c := actual_name.item(i)
            if c = '_' then
               hook_or(once "Ucn", "_")
            else
               out_stream.put_character(c)
            end
            i := i + 1
         end
         hook(once "Acn")
      end

   put_integer (value: INTEGER_64)
      local
         s: STRING; c: CHARACTER; i: INTEGER
      do
         s := once ""
         s.clear_count
         value.append_in(s)
         from
            i := 1
         until
            i > s.count
         loop
            c := s.item(i)
            out_stream.put_character(c)
            i := i + 1
         end
      end

   put_character (c: CHARACTER)
      do
         out_stream.put_character(c)
      end

   put_dot
      do
         hook_or(once "dot", once ".")
      end

feature {CLASS_CHECKER}
   out_stream: OUTPUT_STREAM
         -- The `output_stream' itself .

   set_out_stream (os: like out_stream)
      require
         os /= Void
      do
         out_stream := os
      ensure
         out_stream = os
      end

   set_client (cl: like client)
      do
         client := cl
      end

feature {CREATION_CLAUSE}
   put_feature_1 (fn: FEATURE_NAME)
         -- Produce the output of `fn' assuming that `fn' is really the final name to be used in the current `type'.
         -- (See also `put_feature_2' to avoid recomputation.)
      require
         type.valid_feature_name(fn)
      local
         af: ANONYMOUS_FEATURE; fs: FEATURE_STAMP
      do
         fs := type.lookup(fn)
         af := fs.anonymous_feature(type)
         if client = Void then
            put_feature_2(fn, af, False)
         else
            put_feature_2(fn, af, True)
         end
      end

feature {}
   put_feature_2 (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE; hide_current_require: BOOLEAN)
         -- Produce the output for `fn' assuming that `fn' is really the final name in the current `type'.
      require
         type.lookup(fn).anonymous_feature(type) = af
      local
         args: FORMAL_ARG_LIST; rt: TYPE_MARK; hc: COMMENT; er: REQUIRE_ASSERTION; ea: ENSURE_ASSERTION
      do
         hook_or(once "hook300", once "   ")
         fn.short(type)
         args := af.arguments
         if args = Void then
            hook_or(once "hook301", once "")
         else
            args.short(type)
         end
         rt := af.result_type
         if rt = Void then
            hook_or(once "hook307", once "%N")
         else
            hook_or(once "hook308", once ": ")
            rt.short(type)
            hook_or(once "hook309", once "%N")
         end
         hc := af.header_comment
         if hc /= Void then
            hook(once "hook310")
            hc.short(once "hook311", once "      --", once "hook312", once "%N")
            hook(once "hook313")
         else
            hook(once "hook314")
         end
         er := af.require_assertion
         if er = Void then
            hook(once "hook400")
         else
            er.short(type, client, hide_current_require)
         end
         if af.is_deferred then
            hook_or(once "hook315", once "")
         end
         ea := af.ensure_assertion
         if ea = Void then
            hook_or(once "hook500", once "")
         else
            ea.ensure_assertion_short(type, client)
         end
         hook_or(once "hook599", once "")
      end

feature {FEATURE_NAME_LIST}
   delayed_output_of (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE)
      require
         sort_flag
         not has(fn, af)
      do
         memory.add(af, fn)
      ensure
         has(fn, af)
      end

   immediate_output_of (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE)
      require
         not sort_flag
         not has(fn, af)
      do
         put_feature_2(fn, af, False)
         memory.add(af, fn)
      ensure
         has(fn, af)
      end

feature {CLASS_CHECKER}
   is_empty: BOOLEAN
      do
         Result := memory.is_empty
      end

   do_sorted_print
      local
         i: INTEGER; key_map: FAST_ARRAY[FEATURE_NAME]; sorter: COLLECTION_SORTER[FEATURE_NAME]
         name: FEATURE_NAME; af: ANONYMOUS_FEATURE
      do
         create key_map.with_capacity(memory.count)
         memory.key_map_in(key_map)
         sorter.sort(key_map)
         from
            i := key_map.lower
         until
            i > key_map.upper
         loop
            name := key_map.item(i)
            af := memory.at(name)
            put_feature_2(name, af, False)
            i := i + 1
         end
      end

feature {FORMAL_GENERIC_ARG, TYPE_MARK, MANIFEST_GENERIC_SAMPLE_PRINTER}
   put_class_name_without_link (name: CLASS_NAME)
         -- Used when the class `name' has no corresponding source file.
      local
         i: INTEGER; c: CHARACTER; str: STRING
      do
         hook(once "Bfga")
         hook_and_lower(once "Mfga", name.to_string)
         from
            str := name.to_string
            i := 1
         until
            i > str.count
         loop
            c := str.item(i)
            inspect c
            when '_' then
               hook_or(once "Ufga", once "_")
            else
               out_stream.put_character(c)
            end
            i := i + 1
         end
         hook(once "Afga")
      end

feature {CLASS_CHECKER}
   start (format: STRING; ct: CLASS_TEXT; t: TYPE)
      require
         not format.is_empty
         --|*** t.class_text = ct (not always true: see PREDICATE)
      local
         hc2: COMMENT; fgl: FORMAL_GENERIC_LIST
      do
         class_text := ct
         type := t
         format_directory := system_tools.format_directory(format) -- Start output :
         hook(once "hook000")
         hook_and(once "hook002", ct.name.to_string)
         if ct.is_expanded then
            hook_or(once "hook010", once "expanded class interface ")
         elseif ct.is_deferred then
            hook_or(once "hook011", once "deferred class interface ")
         else
            hook_or(once "hook012", once "class interface ")
         end
         hook(once "hook013")
         put_class_name(ct.name)
         fgl := ct.formal_generic_list
         if fgl /= Void then
            fgl.short(type)
         end
         hook_or(once "hook014", once "%N")
         hc2 := ct.heading_comment2
         if hc2 /= Void then
            hook(once "hook015")
            hc2.short(once "hook016", once "   --", once "hook017", once "%N")
            hook(once "hook018")
         else
            hook(once "hook019")
         end
      ensure
         type = t
      end

   finish (obsolete_flag: BOOLEAN)
         -- The `obsolete_flag' indicates that the class to short itself is obsolete.
      local
         fgl: FORMAL_GENERIC_LIST; class_invariant: CLASS_INVARIANT
      do
         if not obsolete_flag then
            class_invariant := type.class_invariant
         end
         if class_invariant = Void then
            hook(once "hook800")
         else
            class_invariant.class_invariant_short(type, class_text, client)
         end
         hook(once "hook900")
         if class_text.is_expanded then
            hook_or(once "hook901", once "end of expanded ")
         elseif class_text.is_deferred then
            hook_or(once "hook902", once "end of deferred ")
         else
            hook_or(once "hook903", once "end of ")
         end
         hook(once "hook904")
         put_class_name(class_text.name)
         fgl := class_text.formal_generic_list
         if fgl /= Void then
            fgl.short(type)
         end
         hook_or(once "hook905", once "%N")
         hook(once "hook999")
      end

   short_for_tuple (format: STRING; tuple_list: FAST_ARRAY[TYPE])
         -- Where `tuple_list' goes from TUPLE to the maximum TUPLE[ANY, ANY, ...] ever defined.
      local
         tuple_type: TYPE; tuple_class_text, ct: CLASS_TEXT; ccl: CREATION_CLAUSE_LIST; cn: CLASS_NAME
         dummy: BOOLEAN; fcl: FEATURE_CLAUSE_LIST; i, i2: INTEGER
      do
         create cn.unknown_position(string_aliaser.hashed_string(as_any), False)
         create {CLASS_TYPE_MARK} client.make(cn)
         -- No sort for TUPLE:
         sort_flag := False
         from
            i := tuple_list.lower
         until
            i > tuple_list.upper
         loop
            tuple_type := tuple_list.item(i)
            tuple_class_text := tuple_type.class_text
            start(format, tuple_class_text, tuple_type)
            memory.clear_count
            ccl := tuple_class_text.creation_clause_list
            if ccl /= Void then
               dummy := ccl.short(client, tuple_type)
            end
            from
               i2 := tuple_list.lower
            until
               i2 > i
            loop
               ct := tuple_list.item(i2).class_text
               fcl := ct.feature_clause_list
               if fcl /= Void then
                  fcl.for_short(ct.name, tuple_list.item(i2), tuple_type, client)
               end
               i2 := i2 + 1
            end
            finish(False)
            if i < tuple_list.upper then
               hook_or(once "new_line", once "%N")
               hook_or(once "new_line", once "%N")
            end
            i := i + 1
         end
      end

feature {CALL_PREFIX}
   put_prefix_name (pn: FEATURE_NAME)
         -- Used in an expression.
      require
         pn.is_prefix_name
      local
         i: INTEGER; c: CHARACTER; str: STRING
      do
         from
            str := pn.to_string
            i := 1
         until
            i > str.count
         loop
            c := str.item(i)
            if c = '_' then
               hook_or(once "Usfn", once "_")
            else
               out_stream.put_character(c)
            end
            i := i + 1
         end
         put_character(' ')
      end

feature {CALL_INFIX, FEATURE_NAME}
   put_infix_name (h1, r1, h2, r2: STRING; in: FEATURE_NAME)
      require
         in.is_infix_name
      local
         i: INTEGER; str: STRING
      do
         hook_or(h1, r1)
         str := in.to_string
         if as_backslash_backslash = str then
            hook_or(once "rem", as_backslash_backslash)
         else
            from
               i := 1
            until
               i > str.count
            loop
               out_stream.put_character(str.item(i))
               i := i + 1
            end
         end
         hook_or(h2, r2)
      end

feature {BASE_TYPE_CONSTANT}
   put_base_type_constant (str: STRING)
      local
         i: INTEGER; c: CHARACTER
      do
         from
            i := 1
         until
            i > str.count
         loop
            c := str.item(i)
            if c = '.' then
               hook_or(once "dot", once ".")
            else
               out_stream.put_character(c)
            end
            i := i + 1
         end
      end

feature {SHORT}
   set_sort_flag (sf: BOOLEAN)
      do
         sort_flag := sf
      ensure
         sort_flag = sf
      end

feature {}
   format_directory: STRING
         -- The output style directory.

   class_text: CLASS_TEXT
         -- An alias for type.class_text.
         -- (*** Not a huge benefit. Dom. jan 27th 2004. ***)

   memory: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]
         -- Already printed features when the `sort_flag' is not used or the memorized features to be
         -- printed at the end when the `sort_flag' is used.

   client: TYPE_MARK

   make
      do
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]} memory.make
      end

   hook_exists (h: STRING): BOOLEAN
      local
         hook_path: STRING
      do
         hook_path := "... unique buffer ..."
         hook_path.copy(format_directory)
         hook_path.append(h)
         hook_file.connect_to(hook_path)
         Result := hook_file.is_connected
      end

   hook_file: TEXT_FILE_READ
      once
         create Result.make
      end

end -- class SHORT_PRINTER
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
