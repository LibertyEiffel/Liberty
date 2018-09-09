-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class POSITION
   --
   -- A position in some source file. In the most common case, the source file is an Eiffel source
   -- file, but, POSITION objects are also used in -cecil file or in the ACE file as well.
   --
   -- Because POSITION objects are very numerous (there are a _lot_ of POSITION objects used and
   -- POSITION objects are small objects). For this reason, POSITION is an expanded class.
   --
   -- Note: do not add new attributes in this class which must fit on 32bits. Also keep in mind that
   -- it is an expanded class !
   --

insert
   COMPARABLE
      redefine default_create, is_equal, out_in_tagged_out_memory
      end
   GLOBALS
      redefine default_create, is_equal, out_in_tagged_out_memory
      end
   PLATFORM
      redefine default_create, is_equal, out_in_tagged_out_memory
      end
   HASHABLE
      redefine default_create, out_in_tagged_out_memory
      end

feature {ANY}
   hash_code: INTEGER
      do
         Result := mangling
      end

   class_text: CLASS_TEXT
         -- The corresponding one which may be Void for example when `is_unknown' or when parsing
         -- a -cecil file or the ACE file.
      do
         Result := class_text_storage.item(id)
      end

   line: INTEGER
         -- The corresponding `line' number in the source file or 0
         -- when `is_unknown'.
      do
         if mangling.bit_test(0) then
            Result := mangling |>> 1
            Result := Result & 0x0000FFFF
            check
               Result.fit_integer_16
            end
         else
            Result := mangling |>> 8
            Result := Result & 0x00001FFF
         end
      ensure
         not is_unknown implies Result >= 0
      end

   column: INTEGER
         -- The `column' number in the source file or 0 when `is_unknown' or
         -- when there is not enough space in `mangling' for the `column'.
      do
         if mangling.bit_test(0) then
            -- Result is 0 because `column' is not memorized.
         else
            Result := mangling |>> 1
            Result := Result & 0x0000007F
         end
      ensure
         Result >= 0
      end

   class_text_name: CLASS_NAME
         -- The corresponding one when already loaded by the `eiffel_parser'.
      local
         ct: CLASS_TEXT
      do
         ct := class_text
         if ct /= Void then
            Result := ct.name
         end
      end

   path: STRING
         -- The corresponding file `path' or Void when `is_unknown'.
      local
         ct: CLASS_TEXT; id_value: INTEGER_16
      do
         ct := class_text
         if ct /= Void then
            Result := ct.path
         else
            -- Looking for the path of the -cecil file or for the
            -- path of some ACE or INI file.
            id_value := id
            inspect
               id_value
            when id_ace_file then
               Result := ace.file_path
            when id_ini_file then
               Result := ini_parser.file_path
            when id_plugin_file then
               Result := plugin_config.file_path
            else
               check
                  id_value > 0
               end
               Result := id_provider.alias_of(id_value).to_string
            end
         end
      ensure
         Result /= Void implies string_aliaser.registered_one(Result)
      end

   is_unknown: BOOLEAN
         -- True when the `Current' as the default value (not `set').
      do
         Result := mangling = 0
      end

   before (other: POSITION): BOOLEAN
         -- Is `Current' position strictly before `other' (which is in the
         -- same source text file).
      require
         path = other.path
      local
         li, other_li: INTEGER
      do
         li := line
         other_li := other.line
         if li < other_li then
            Result := True
         elseif li = other_li then
            Result := column < other.column
         end
      end

   sedb_trace: BOOLEAN
         -- Is the run-time trace mechanism activated for this position?
      local
         ct: CLASS_TEXT
      do
         ct := class_text
         if ct /= Void then
            Result := ct.sedb_trace
         end
      end

   append_in (buffer: STRING)
      require
         buffer /= Void
      local
         li, co: INTEGER; ct: CLASS_TEXT; ctn: CLASS_NAME; place: STRING
      do
         li := line
         co := column
         buffer.append(once "Line ")
         li.append_in(buffer)
         if co > 0 then
            buffer.append(once " column ")
            co.append_in(buffer)
         end
         ct := class_text
         if ct /= Void then
            place := ct.path
            if place = Void then
               ctn := ct.name
               if ctn /= Void then
                  place := ctn.to_string
               end
            end
            if place /= Void then
               buffer.append(once " in %"")
               buffer.append(place)
               buffer.append(once "%".")
            end
         end
      end

   set_class_text (ct: like class_text)
         -- Note: this routine may be used to create implicit Eiffel code (code which does not exists).
      require
         ct /= Void
      local
         l, c: INTEGER
      do
         l := line
         c := column
         if l = 0 or else c = 0 then
            -- This code is probably implicit.
            l := 1
            c := 1
         end
         set(l, c, ct.id, ct)
      ensure
         not is_unknown
      end

   infix "<" (other: POSITION): BOOLEAN
      local
         m_type, o_m_type: INTEGER_32
      do
         m_type := mangling & 1
         o_m_type := other.mangling & 1
         Result := m_type < o_m_type or else m_type = o_m_type and then mangling |>>> 1 < other.mangling |>>> 1
         --|*** If mangling was unsigned, the body could simply be
         --| replaced by the line
         --| Result := mangling #>> 1 < other.mangling #>> 1
         --| <FM-10/04/2004>
         --|    ensure then      -- this would be nice if possible without exporting id
         --|    Result = id < other.id
         --|       or else (id = other.id
         --|           and then (line < other.line
         --|                or else (line = other.line
         --|               and then column < other.column)))
      end

   is_equal (other: POSITION): BOOLEAN
      do
         Result := mangling = other.mangling
      ensure then
         Result = standard_is_equal(other)
      end

   same_line_as (other: POSITION): BOOLEAN
      do
         if mangling.bit_test(0) then
            Result := other.mangling.bit_test(0) and then mangling |>>> 17 = other.mangling |>>> 17
         else
            Result := not other.mangling.bit_test(0) and then mangling |>>> 8 = other.mangling |>>> 8
         end
      ensure
         Result = (path = other.path and line = other.line)
      end

   out_in_tagged_out_memory
      do
         append_in(tagged_out_memory)
      end

feature {EIFFEL_PARSER, CLASS_TEXT}
   set (li, co: INTEGER; class_id: INTEGER_16; ct: like class_text)
         -- The position is in some Eiffel file.
         -- (Note: this is function because POSITION is expanded.)
      require
         li >= 1
         co >= 1
         class_id.in_range(0, 32767)
         ct /= Void and then not ct.name.is_tuple_related implies class_id = ct.id
      do
         if ct /= Void then
            class_text_storage.put(ct, class_id)
         end
         check
            Integer_bits >= 32
         end
         if class_id <= 2047 and then li <= 8191 and then co <= 127 then
            mangling := class_id.to_integer_32 |<< 21 -- 11 bits for `id'
            mangling := mangling | (li |<< 8) -- 13 bits for `line'
            mangling := mangling | (co |<< 1) -- 7  bits for `column'
         else
            -- The `column' is not memorized.
            mangling := class_id.to_integer_32 |<< 17 -- 15 bits for `id'
            mangling := mangling | (li |<< 1) -- 16 bits for `line'
            mangling := mangling | 1 -- forget `column'.
         end
         debug
            if ct /= Void then
               debug_string := ct.path.twin
            else
               inspect class_id
               when id_ace_file then
                  debug_string := "ACE file"
               when id_ini_file then
                  debug_string := "INI file"
               when id_plugin_file then
                  debug_string := "Plugin file"
               else
                  debug_string := "Unknown position id=" + (class_id.out)
               end
            end
            debug_string.append(once ", line ")
            li.append_in(debug_string)
            debug_string.append(once ", column ")
            co.append_in(debug_string)
         end
      ensure
         line = li
         id = class_id
         column = 0 or else column = co
      end

feature {ACE}
   set_in_ace_file (li, co: INTEGER)
         -- The position is in the ACE file.
      require
         li >= 1
         co >= 1
      do
         set(li, co, id_ace_file, Void)
      ensure
         line = li
         id = id_ace_file
         column = 0 or else column = co
      end

feature {INI_PARSER}
   set_in_ini_file (li, co: INTEGER; id_: INTEGER_16)
         -- The position is in the configuration file.
      require
         li >= 1
         co >= 1
         id_ = id_ini_file or id_ = id_plugin_file
      do
         set(li, co, id_, Void)
      ensure
         line = li
         id = id_
         column = 0 or else column = co
      end

feature {C_PRETTY_PRINTER, SEDB, AGENT_CREATION, POSITION, C_CODE_COMPILER}
   mangling: INTEGER_32
         -- In order to save memory (there are a lot of objects like `Current'), the `id' of the class, the
         -- `line' and the `column' are saved in this 32 BIT sequence. Two mangling are used, and the
         -- `column' may be dropped (not memorized, see `set'). The two manglings are:
         --  ---------------------------------------------------------------
         -- |      id (11)        |    line (13)            | col (7)     |0|
         --  ---------------------------------------------------------------
         -- |         id (15)             |       line (16)               |1|
         --  ---------------------------------------------------------------

feature {PRINT_POSITION}
   id: INTEGER_16
      do
         if mangling.bit_test(0) then
            Result := (mangling |>>> 17).low_16
         else
            Result := (mangling |>>> 21).low_16
         end
      ensure
         Result.in_range(0, 32767)
      end

feature {}
   class_text_storage: NATIVE_ARRAY[CLASS_TEXT]
         -- Store which use the `id' of the corresponding CLASS_TEXT.
      once
         Result := Result.calloc(32768) -- Because the id is on 15 bits.
      end

feature {PRINT_POSITION}
   set_from_integer_32 (integer_32: INTEGER_32)
      do
         mangling := integer_32
      end

feature {}
   debug_string: STRING

feature {}
   id_ace_file: INTEGER_16 32767

feature {INI_PARSER}
   id_ini_file: INTEGER_16 32766

   id_plugin_file: INTEGER_16 32765

feature {ID_PROVIDER}
   maximum_free_id: INTEGER_16 32764

feature {}
   default_create
      do
         mangling := 0
      end

end -- class POSITION
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
