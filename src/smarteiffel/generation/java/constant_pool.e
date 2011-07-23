-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CONSTANT_POOL
   --
   -- Unique Global Object in charge of the CONSTANT_POOL
   -- handling (the CONSTANT_POOL is an important part of a
   -- JVM *.class file).
   --

inherit
   CP_INFO_TAGS

feature {}
   cp_up: INTEGER

   cp: FAST_ARRAY[CP_INFO] is
         -- Range [1.. `cp_up'] has no Void elements.
         -- By the way, index 0 is not used and elements
         -- are recycled.
      once
         create Result.make(1)
      end

feature {PRINT_JVM_CLASS}
   item (i: INTEGER): CP_INFO is
      do
         Result := cp.item(i)
      end

feature {PRINT_JVM_CLASS}
   reset (new_upper: INTEGER) is
      require
         new_upper > 0
      local
         i: INTEGER
      do
         from
            cp_up := 0
         until
            i = new_upper
         loop
            add_last.clear
            i := i + 1
         end
      ensure
         cp_up = new_upper
      end

feature {JVM}
   clear is
      do
         cp_up := 0 -- Compute minimum standard idx :
         idx_java_lang_object := idx_class2(once "java/lang/Object")
         idx_jvm_root_class := idx_class2(jvm_root_class)
         idx_constant_utf8 := idx_utf8("Code")
      end

   write_bytes is
      local
         i: INTEGER
      do
         echo.put_string("Constant pool: ")
         echo.put_integer(cp_up)
         echo.put_new_line
         jvm.b_put_u2(cp_up + 1)
         from
            i := 1
         until
            i > cp_up
         loop
            cp.item(i).b_put
            i := i + 1
         end
      end

feature {ANY} -- Acces to some common idx :
   idx_constant_utf8: INTEGER

   idx_java_lang_object: INTEGER

   idx_jvm_root_class: INTEGER

feature {ANY}
   valid_index (idx: INTEGER): BOOLEAN is
      do
         Result := 1 <= idx and then idx <= cp_up
      end

feature {PRINT_JVM_CLASS} -- Setting :
   set_class (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_class(info)
      end

   set_fieldref (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_fieldref(info)
      end

   set_methodref (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_methodref(info)
      end

   set_interface_methodref (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_interface_methodref(info)
      end

   set_string (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_string(info)
      end

   set_integer (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_integer(info)
      end

   set_float (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_float(info)
      end

   set_long (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_long(info)
      end

   set_double (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_double(info)
      end

   set_name_and_type (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_name_and_type(info)
      end

   set_utf8 (i: INTEGER; info: STRING) is
      do
         cp.item(i).set_utf8(info)
      end

feature {ANY} -- Testing :
   is_class (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_class
      end

   is_fieldref (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_fieldref
      end

   is_methodref (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_methodref
      end

   is_interface_methodref (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_interface_methodref
      end

   is_string (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_string
      end

   is_integer (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_integer
      end

   is_float (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_float
      end

   is_double (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_double
      end

   is_name_and_type (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_name_and_type
      end

   is_utf8 (idx: INTEGER): BOOLEAN is
      do
         Result := cp.item(idx).is_utf8
      end

feature {ANY} -- Update and search :
   idx_class2 (name: STRING): INTEGER is
         -- Where `name' can be fully qualified or unqualified.
      local
         utf8: INTEGER
      do
         utf8 := idx_utf8(name)
         from
            Result := cp_up
         until
            Result = 0 or else cp.item(Result).is_class_idx(utf8)
         loop
            Result := Result - 1
         end
         if Result = 0 then
            tmp_info.clear_count
            tmp_info_append_u2(utf8)
            add_last.set_class(tmp_info)
            Result := cp_up
         end
      end

   idx_fieldref_for_manifest_string (key: STRING): INTEGER is
      require
         key /= Void
      local
         c, nt: INTEGER
      do
         c := idx_class2(jvm_root_class)
         nt := idx_name_and_type2(key, jvm_string_descriptor)
         Result := idx_fieldref2(c, nt)
      ensure
         valid_index(Result)
      end

   idx_fieldref (rf: RUN_FEATURE): INTEGER is
      require
         rf /= Void
      local
         c, nt: INTEGER
      do
         c := rf.type_of_current.live_type.jvm_constant_pool_index
         nt := idx_name_and_type(rf)
         Result := idx_fieldref2(c, nt)
      ensure
         valid_index(Result)
      end

   idx_fieldref2 (c, nt: INTEGER): INTEGER is
      require
         valid_index(c)
         valid_index(nt)
      do
         from
            Result := cp_up
         until
            Result = 0 or else cp.item(Result).is_fieldref_idx(c, nt)
         loop
            Result := Result - 1
         end
         if Result = 0 then
            tmp_info.clear_count
            tmp_info_append_u2(c)
            tmp_info_append_u2(nt)
            add_last.set_fieldref(tmp_info)
            Result := cp_up
         end
      ensure
         valid_index(Result)
      end

   idx_fieldref3 (class_name, field_name, descriptor: STRING): INTEGER is
         -- Where `class_name' is the fully qualified name.
      require
         not class_name.is_empty
         not field_name.is_empty
         not descriptor.is_empty
      local
         c: INTEGER
      do
         c := idx_class2(class_name)
         Result := idx_fieldref4(c, field_name, descriptor)
      end

   idx_fieldref4 (c: INTEGER; field_name, descriptor: STRING): INTEGER is
      local
         nt: INTEGER
      do
         nt := idx_name_and_type2(field_name, descriptor)
         Result := idx_fieldref2(c, nt)
      end

   idx_fieldref5 (c, n, t: INTEGER): INTEGER is
      local
         nt: INTEGER
      do
         nt := idx_name_and_type3(n, t)
         Result := idx_fieldref2(c, nt)
      end

   idx_methodref (rf: RUN_FEATURE): INTEGER is
      require
         rf /= Void
      local
         c, nt: INTEGER
      do
         c := rf.type_of_current.live_type.jvm_constant_pool_index
         nt := idx_name_and_type(rf)
         Result := idx_methodref2(c, nt)
      ensure
         valid_index(Result)
      end

   idx_methodref1 (c: INTEGER; method_name, descriptor: STRING): INTEGER is
      require
         valid_index(c)
         not method_name.is_empty
         not descriptor.is_empty
      local
         nt: INTEGER
      do
         nt := idx_name_and_type2(method_name, descriptor)
         Result := idx_methodref2(c, nt)
      end

   idx_methodref2 (c, nt: INTEGER): INTEGER is
      require
         valid_index(c)
         valid_index(nt)
      do
         from
            Result := cp_up
         until
            Result = 0 or else cp.item(Result).is_methodref_idx(c, nt)
         loop
            Result := Result - 1
         end
         if Result = 0 then
            tmp_info.clear_count
            tmp_info_append_u2(c)
            tmp_info_append_u2(nt)
            add_last.set_methodref(tmp_info)
            Result := cp_up
         end
      ensure
         valid_index(Result)
      end

   idx_methodref3 (class_name, method_name, descriptor: STRING): INTEGER is
         -- Where `class_name' is the fully qualified name.
      require
         not class_name.is_empty
         not method_name.is_empty
         not descriptor.is_empty
      local
         c: INTEGER
      do
         c := idx_class2(class_name)
         Result := idx_methodref1(c, method_name, descriptor)
      end

   idx_interface_methodref (rf: RUN_FEATURE): INTEGER is
      require
         rf /= Void
      local
         c, nt: INTEGER
      do
         c := rf.type_of_current.live_type.jvm_constant_pool_index
         nt := idx_name_and_type(rf)
         Result := idx_interface_methodref2(c, nt)
      ensure
         valid_index(Result)
      end

   idx_interface_methodref1 (c: INTEGER; method_name, descriptor: STRING): INTEGER is
      require
         valid_index(c)
         not method_name.is_empty
         not descriptor.is_empty
      local
         nt: INTEGER
      do
         nt := idx_name_and_type2(method_name, descriptor)
         Result := idx_interface_methodref2(c, nt)
      end

   idx_interface_methodref2 (c, nt: INTEGER): INTEGER is
      require
         valid_index(c)
         valid_index(nt)
      do
         from
            Result := cp_up
         until
            Result = 0 or else cp.item(Result).is_methodref_idx(c, nt)
         loop
            Result := Result - 1
         end
         if Result = 0 then
            tmp_info.clear_count
            tmp_info_append_u2(c)
            tmp_info_append_u2(nt)
            add_last.set_interface_methodref(tmp_info)
            Result := cp_up
         end
      ensure
         valid_index(Result)
      end

   idx_interface_methodref3 (class_name, method_name, descriptor: STRING): INTEGER is
         -- Where `class_name' is the fully qualified name.
      require
         not class_name.is_empty
         not method_name.is_empty
         not descriptor.is_empty
      local
         c: INTEGER
      do
         c := idx_class2(class_name)
         Result := idx_interface_methodref1(c, method_name, descriptor)
      end

   idx_string (str: STRING): INTEGER is
         -- Assume `str' has no '%/0/' and no ['%/128/'..'%/255/']
      local
         utf8: INTEGER
      do
         utf8 := idx_utf8(str)
         from
            Result := cp_up
         until
            Result = 0 or else cp.item(Result).is_string_idx(utf8)
         loop
            Result := Result - 1
         end
         if Result = 0 then
            tmp_info.clear_count
            tmp_info_append_u2(utf8)
            add_last.set_string(tmp_info)
            Result := cp_up
         end
      end

   idx_string2 (str: STRING): INTEGER is
         -- For all kinds of STRINGs (see idx_string)
      local
         i: INTEGER; c: CHARACTER
      do
         from
            tmp_utf8.clear_count
            i := 1
         until
            i > str.count
         loop
            c := str.item(i)
            inspect
               c.code
            when 0 then
               tmp_utf8.extend((192).to_character)
               tmp_utf8.extend((128).to_character)
            when 1 .. 127 then
               tmp_utf8.extend(c)
            when 128 .. 191 then
               tmp_utf8.extend((194).to_character)
               tmp_utf8.extend(c)
            when 192 .. 255 then
               tmp_utf8.extend((195).to_character)
               tmp_utf8.extend((c.code - 64).to_character)
            end
            i := i + 1
         end
         Result := idx_string(tmp_utf8)
      end

   idx_name_and_type2 (name, descriptor: STRING): INTEGER is
      local
         d: INTEGER
      do
         d := idx_utf8(descriptor)
         Result := idx_name_and_type1(name, d)
      ensure
         valid_index(Result)
      end

   idx_name_and_type3 (n, d: INTEGER): INTEGER is
      do
         from
            Result := cp_up
         until
            Result = 0 or else cp.item(Result).is_name_and_type_idx(n, d)
         loop
            Result := Result - 1
         end
         if Result = 0 then
            tmp_info.clear_count
            tmp_info_append_u2(n)
            tmp_info_append_u2(d)
            add_last.set_name_and_type(tmp_info)
            Result := cp_up
         end
      ensure
         valid_index(Result)
      end

   idx_name_and_type1 (name: STRING; d: INTEGER): INTEGER is
      local
         n: INTEGER
      do
         n := idx_utf8(name)
         Result := idx_name_and_type3(n, d)
      ensure
         valid_index(Result)
      end

   idx_name_and_type (rf: RUN_FEATURE): INTEGER is
      local
         buffer: STRING
      do
         buffer := once "...................."
         buffer.clear_count
         rf.name.mapping_c_in(buffer)
         Result := idx_name_and_type2(buffer, rf.jvm_descriptor)
      ensure
         valid_index(Result)
      end

   idx_utf8 (contents: STRING): INTEGER is
      do
         from
            Result := cp_up
         until
            Result = 0 or else cp.item(Result).is_utf8_idx(contents)
         loop
            Result := Result - 1
         end
         if Result = 0 then
            string_to_utf8(contents, tmp_info)
            add_last.set_utf8(tmp_info)
            Result := cp_up
         end
      ensure
         valid_index(Result)
      end

feature {ANY}
   idx_fieldref_generating_type (c: INTEGER): INTEGER is
      local
         idx, nt: INTEGER
      do
         idx := idx_eiffel_string_descriptor
         nt := idx_name_and_type1(as_generating_type, idx)
         Result := idx_fieldref2(c, nt)
      end

   idx_fieldref_generator (c: INTEGER): INTEGER is
      local
         idx, nt: INTEGER
      do
         idx := idx_eiffel_string_descriptor
         nt := idx_name_and_type1(as_generator, idx)
         Result := idx_fieldref2(c, nt)
      end

feature {PRINT_JVM_CLASS, CP_INFO}
   view_in (str: STRING; idx: INTEGER) is
         -- Append in `str' a human readable version.
      require
         valid_index(idx)
         str /= Void
      do
         cp.item(idx).view_in(str)
      end

feature {CODE_ATTRIBUTE, MANIFEST_STRING_INSPECTOR}
   idx_eiffel_string_class: INTEGER is
      do
         Result := idx_class2(jvm_string_class)
      end

   idx_eiffel_string_count_fieldref: INTEGER is
      local
         idx: INTEGER
      do
         idx := idx_name_and_type2(as_count, once "I")
         Result := idx_fieldref2(idx_eiffel_string_class, idx)
      end

   idx_eiffel_string_capacity_fieldref: INTEGER is
      local
         idx: INTEGER
      do
         idx := idx_name_and_type2(as_capacity, once "I")
         Result := idx_fieldref2(idx_eiffel_string_class, idx)
      end

   idx_eiffel_string_storage_fieldref: INTEGER is
      local
         idx: INTEGER
      do
         idx := idx_name_and_type2(as_storage, once "[B")
         Result := idx_fieldref2(idx_eiffel_string_class, idx)
      end

feature {ANY}
   idx_eiffel_string_descriptor: INTEGER is
      do
         Result := idx_utf8(jvm_string_descriptor)
      end

feature {}
   add_last: CP_INFO is
      do
         if cp.upper > cp_up then
            cp_up := cp_up + 1
            Result := cp.item(cp_up)
         else
            create Result.clear
            cp.add_last(Result)
            cp_up := cp_up + 1
         end
      ensure
         cp_up = 1 + old cp_up
      end

   tmp_utf8: STRING is
      once
         create Result.make(32)
      end

   tmp_info: STRING is
      once
         create Result.make(32)
      end

   tmp_info_append_u2 (u2: INTEGER) is
      do
         append_u2(tmp_info, u2)
      end

feature {}
   jvm_string_descriptor: STRING is
         -- Descriptor for class STRING: "L<Package>/string;"
      once
         create Result.make(12)
         Result.extend('L')
         Result.append(jvm_string_class)
         Result.extend(';')
      end

   jvm_string_class: STRING is
         -- Fully qualified name for class STRING
      once
         create Result.make(12)
         Result.append(ace.executable_name)
         Result.append(once "/string")
      end

invariant
   cp_up <= cp.upper

end -- class CONSTANT_POOL
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
