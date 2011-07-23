-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CP_INFO
   --
   -- Print a human readable version of a JVM *.class generated
   -- by SmartEiffel.
   --

inherit
   CP_INFO_TAGS

creation {ANY}
   clear

feature {PRINT_JVM_CLASS}
   tag: CHARACTER -- Must be one defined in CP_INFO_TAGS.

   info: STRING -- Contains the corresponding information.

feature {CONSTANT_POOL}
   clear is
      do
         tag := Constant_empty
         if info = Void then
            create info.make(4)
         else
            info.clear_count
         end
      end

   is_tagged (tag_value: CHARACTER): BOOLEAN is
      do
         Result := tag = tag_value
      end

feature {ANY}
   set_class (i: STRING) is
      require
         i.count = 2
      do
         tag := Constant_class
         info.copy(i)
      end

   set_fieldref (i: STRING) is
      require
         i.count = 4
      do
         tag := Constant_fieldref
         info.copy(i)
      end

   set_methodref (i: STRING) is
      require
         i.count = 4
      do
         tag := Constant_methodref
         info.copy(i)
      end

   set_interface_methodref (i: STRING) is
      require
         i.count = 4
      do
         tag := Constant_interfacemethodref
         info.copy(i)
      end

   set_string (str: STRING) is
      require
         str.count >= 2
      local
         i: INTEGER; c: CHARACTER
      do
         tag := Constant_string
         info.clear_count
         info.extend(str.item(1))
         info.extend(str.item(2))
         from
            i := 3
         until
            i > str.count
         loop
            c := str.item(i)
            if c = '%U' then
               info.extend('%/192/')
               info.extend('%/128/')
            else
               info.extend(c)
            end
            i := i + 1
         end
      end

   set_integer (i: STRING) is
      require
         i.count = 4
      do
         tag := Constant_integer
         info.copy(i)
      end

   set_float (i: STRING) is
      require
         i.count = 4
      do
         tag := Constant_float
         info.copy(i)
      end

   set_long (i: STRING) is
      require
         i.count = 8
      do
         tag := Constant_long
         info.copy(i)
      end

   set_double (i: STRING) is
      require
         i.count = 8
      do
         tag := Constant_double
         info.copy(i)
      end

   set_name_and_type (i: STRING) is
      require
         i.count = 4
      do
         tag := Constant_name_and_type
         info.copy(i)
      end

   set_utf8 (i: STRING) is
      require
         i.count >= 2
      do
         tag := Constant_utf8
         info.copy(i)
      ensure
         info.count = u2_to_integer(1) + 2
      end

feature {ANY} -- Testing :
   is_class: BOOLEAN is
      do
         Result := tag = Constant_class
      end

   is_fieldref: BOOLEAN is
      do
         Result := tag = Constant_fieldref
      end

   is_methodref: BOOLEAN is
      do
         Result := tag = Constant_methodref
      end

   is_interface_methodref: BOOLEAN is
      do
         Result := tag = Constant_interfacemethodref
      end

   is_string: BOOLEAN is
      do
         Result := tag = Constant_string
      end

   is_integer: BOOLEAN is
      do
         Result := tag = Constant_integer
      end

   is_float: BOOLEAN is
      do
         Result := tag = Constant_float
      end

   is_long: BOOLEAN is
      do
         Result := tag = Constant_long
      end

   is_double: BOOLEAN is
      do
         Result := tag = Constant_double
      end

   is_name_and_type: BOOLEAN is
      do
         Result := tag = Constant_name_and_type
      end

   is_utf8: BOOLEAN is
      do
         Result := tag = Constant_utf8
      end

feature {ANY}
   view_in (str: STRING) is
         -- Append in `str' a human readable version.
         -- Note: assume `constant_pool' is checked.
      local
         idx, length, i: INTEGER
      do
         inspect
            tag
         when Constant_class then
            idx := u2_to_integer(1)
            constant_pool.view_in(str, idx)
         when Constant_fieldref then
            idx := u2_to_integer(1)
            constant_pool.view_in(str, idx)
            str.extend('.')
            idx := u2_to_integer(3)
            constant_pool.view_in(str, idx)
         when Constant_methodref then
            idx := u2_to_integer(1)
            constant_pool.view_in(str, idx)
            str.extend('.')
            idx := u2_to_integer(3)
            constant_pool.view_in(str, idx)
         when Constant_interfacemethodref then
            idx := u2_to_integer(1)
            constant_pool.view_in(str, idx)
            str.extend('.')
            idx := u2_to_integer(3)
            constant_pool.view_in(str, idx)
         when Constant_string then
            idx := u2_to_integer(1)
            constant_pool.view_in(str, idx)
         when Constant_integer then
         when Constant_float then
         when Constant_long then
         when Constant_double then
         when Constant_name_and_type then
            idx := u2_to_integer(1)
            constant_pool.view_in(str, idx)
            str.extend(':')
            idx := u2_to_integer(3)
            constant_pool.view_in(str, idx)
         when Constant_utf8 then
            from
               length := u2_to_integer(1)
               i := 3
            until
               length = 0
            loop
               str.extend(info.item(i))
               i := i + 1
               length := length - 1
            end
         end
      end

feature {CONSTANT_POOL}
   b_put is
      do
         jvm.b_put_u1(tag)
         jvm.b_put_byte_string(info)
      end

feature {CONSTANT_POOL}
   -- Update and search :
   --|*** ACOMPLETER AU FUR ET A MESURE ***
   is_class_idx (utf8: INTEGER): BOOLEAN is
      do
         if Constant_class = tag then
            Result := u2_to_integer(1) = utf8
         end
      end

   is_fieldref_idx (c, nt: INTEGER): BOOLEAN is
      do
         if Constant_fieldref = tag then
            if u2_to_integer(1) = c then
               Result := u2_to_integer(3) = nt
            end
         end
      end

   is_methodref_idx (c, nt: INTEGER): BOOLEAN is
      do
         if Constant_methodref = tag then
            if u2_to_integer(1) = c then
               Result := u2_to_integer(3) = nt
            end
         end
      end

   is_name_and_type_idx (n, d: INTEGER): BOOLEAN is
      do
         if Constant_name_and_type = tag then
            if u2_to_integer(1) = n then
               Result := u2_to_integer(3) = d
            end
         end
      end

   is_string_idx (utf8: INTEGER): BOOLEAN is
      do
         if Constant_string = tag then
            Result := u2_to_integer(1) = utf8
         end
      end

   is_utf8_idx (contents: STRING): BOOLEAN is
      local
         i1, i2: INTEGER
      do
         if Constant_utf8 = tag then
            if u2_to_integer(1) = contents.count then
               from
                  i1 := contents.count + 1
                  i2 := info.count + 1
                  check
                     i1 + 2 = i2
                  end
                  Result := True
               until
                  not Result or else i1 = 1
               loop
                  i1 := i1 - 1
                  i2 := i2 - 1
                  Result := contents.item(i1) = info.item(i2)
               end
            end
         end
      end

feature {}
   u2_to_integer (i: INTEGER): INTEGER is
      do
         Result := info.item(i).code * 256
         Result := Result + info.item(i + 1).code
      end

end -- class CP_INFO
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
