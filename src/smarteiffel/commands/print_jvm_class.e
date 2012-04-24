-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PRINT_JVM_CLASS
   --
   -- The `print_jvm_class' command.
   --

inherit
   COMMAND_LINE_TOOLS
   CP_INFO_TAGS

creation {}
   make

feature {ANY}
   command_line_name: STRING is "print_jvm_class"

   command_line_help_summary: STRING is "[
      Usage: print_jvm_class [options] <Path>[.class]

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing

      ]"

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN is
      do
         check
            False
         end
      end

   valid_argument_for_ace_mode: STRING is
      do
         check
            False
         end
      end

feature {}
   bytes: FAST_ARRAY[INTEGER] is
         -- All bytes of the class file.
      once
         create Result.with_capacity(4096)
      end

   constant_pool_count: INTEGER

   this_class_idx: INTEGER

   super_class_idx: INTEGER

   interfaces_count: INTEGER

   fields_count: INTEGER

   methods_count: INTEGER

   attributes_count: INTEGER

   make is
      local
         arg, class_name: STRING; i: INTEGER
      do
         if argument_count = 0 then
            system_tools.bad_use_exit(command_line_name, command_line_help_summary)
         end
         search_for_verbose_flag
         from
            i := 1
         until
            i > argument_count
         loop
            arg := argument(i)
            if is_some_flag(arg) then
               if is_version_flag(arg) or else is_help_flag(arg) or else is_verbose_flag(arg) then
                  i := i + 1
               else
                  unknown_flag_exit(arg)
               end
            elseif class_name /= Void then
               system_tools.bad_use_exit(command_line_name, command_line_help_summary)
            else
               class_name := arg
               i := i + 1
            end
         end
         if class_name /= Void then
            print_jvm_class(class_name)
         end
      end

   print_jvm_class (arg: STRING) is
      local
         path: STRING; file_of_bytes: BINARY_FILE_READ; byte, i, index: INTEGER; s: STRING
         interface_idx: INTEGER; access_flags: INTEGER
      do
         path := arg.twin
         if not path.has_suffix(once ".class") then
            path.append(once ".class")
         end
         create file_of_bytes.connect_to(path)
         if file_of_bytes.is_connected then
            from
               io.put_string(once "Contents of file %"")
               io.put_string(file_of_bytes.path)
               io.put_string(once "%".%N")
               file_of_bytes.read_byte
               if file_of_bytes.end_of_input then
                  bad_class_file(once "Invalid empty class file.", 0)
               end
            until
               file_of_bytes.end_of_input
            loop
               byte := file_of_bytes.last_byte
               bytes.add_last(byte)
               file_of_bytes.read_byte
            end
            file_of_bytes.disconnect
            io.put_string(once "Total bytes: ")
            io.put_integer(bytes.count)
            io.put_new_line
            io.put_string(once "Magic number: ")
            s := hexa4_at(0)
            if not (once "0xCAFEBABE").is_equal(s) then
               bad_class_file(once "Invalid Magic number.", 0)
            else
               io.put_string(s)
               io.put_new_line
            end
            io.put_string(once "Minor version: ")
            io.put_string(hexa2_at(4))
            io.put_new_line
            io.put_string(once "Major version: ")
            io.put_string(hexa2_at(6))
            io.put_new_line
            io.put_string(once "Constant pool count: ")
            constant_pool_count := u2_integer_at(8)
            io.put_integer(constant_pool_count)
            io.put_new_line
            io.put_string(once "Loading constant pool items :%N")
            from
               constant_pool.reset(constant_pool_count - 1)
               index := 10 -- of first item in constant pool.
               i := 1
            until
               i >= constant_pool_count
            loop
               index := load_cp_info(i, constant_pool_count, index)
               i := i + 1
            end
            io.put_string(once "Constant pool view :%N")
            from
               index := 10 -- of first item in constant pool.
               i := 1
            until
               i >= constant_pool_count
            loop
               tmp_string.clear_count
               integer_to_hexa_in(i, tmp_string)
               tmp_string.extend(' ')
               extend_string(tmp_string, ' ', 6)
               i.append_in(tmp_string)
               tmp_string.extend(' ')
               extend_string(tmp_string, ' ', 12)
               tmp_string.extend('(')
               integer_to_hexa_in(index, tmp_string)
               tmp_string.extend(')')
               extend_string(tmp_string, ' ', 20)
               tmp_string.append(once " : ")
               io.put_string(tmp_string)
               index := print_cp_info(i, index)
               io.put_new_line
               i := i + 1
            end
            io.put_string(once "Access flag: ")
            io.put_string(hexa2_at(index))
            io.put_character(' ')
            access_flags := bytes.item(index + 1)
            if (access_flags & 0x00000001).to_boolean then
               io.put_string(once "public ")
            end
            if (access_flags & 0x00000010).to_boolean then
               io.put_string(once "final (no subclass)")
            end
            if (access_flags & 0x00000020).to_boolean then
               io.put_string(once "invokespecial (for superclass) ")
            end
            access_flags := bytes.item(index)
            if (access_flags & 0x00000002).to_boolean then
               io.put_string(once "interface ")
            end
            if (access_flags & 0x00000004).to_boolean then
               io.put_string(once "abstract ")
            end
            io.put_new_line
            index := index + 2
            io.put_new_line
            io.put_string(once "This Class: ")
            this_class_idx := u2_integer_at(index)
            index := index + 2
            if constant_pool.is_class(this_class_idx) then
               tmp_string.copy(once " is ")
               constant_pool.view_in(tmp_string, this_class_idx)
               io.put_string(tmp_string)
            else
               io.put_string(once "??%N")
               bad_class_file(once "Bad `this_class' value.", index - 2)
            end
            io.put_new_line
            io.put_string(once "Super Class: ")
            super_class_idx := u2_integer_at(index)
            index := index + 2
            if constant_pool.is_class(super_class_idx) then
               tmp_string.copy(once "is ")
               constant_pool.view_in(tmp_string, super_class_idx)
               io.put_string(tmp_string)
            else
               io.put_string(once "??%N")
               bad_class_file(once "Bad `super_class' value.", index - 2)
            end
            io.put_new_line
            io.put_string(once "Interfaces count: ")
            interfaces_count := u2_integer_at(index)
            index := index + 2
            io.put_integer(interfaces_count)
            i := interfaces_count
            if i > 0 then
               io.put_string(once " {")
               from
               until
                  i = 0
               loop
                  interface_idx := u2_integer_at(index)
                  index := index + 2
                  io.put_integer(interface_idx)
                  i := i - 1
                  if i > 0 then
                     io.put_character(',')
                  end
               end
               io.put_character('}')
            end
            io.put_new_line
            io.put_string(once "----- Fields count: ")
            fields_count := u2_integer_at(index)
            index := index + 2
            io.put_integer(fields_count)
            io.put_new_line
            from
               i := 1
            until
               i > fields_count
            loop
               io.put_integer(i)
               if i < 10 then
                  io.put_string(once "   ")
               elseif i < 100 then
                  io.put_string(once "  ")
               else
                  io.put_string(once " ")
               end
               io.put_string(once ": ")
               index := print_field_info(index)
               io.put_new_line
               i := i + 1
            end
            io.put_string(once "----- Methods count: ")
            methods_count := u2_integer_at(index)
            index := index + 2
            io.put_integer(methods_count)
            io.put_new_line
            from
               i := 1
            until
               i > methods_count
            loop
               io.put_integer(i)
               if i < 10 then
                  io.put_string(once "   ")
               elseif i < 100 then
                  io.put_string(once "  ")
               else
                  io.put_string(once " ")
               end
               io.put_string(once ": ")
               index := print_method_info(index)
               io.put_new_line
               i := i + 1
            end
            io.put_string(once "Attributes count: ")
            attributes_count := u2_integer_at(index)
            index := index + 2
            io.put_integer(attributes_count)
            io.put_new_line
            from
               i := 1
            until
               i > attributes_count
            loop
               io.put_integer(i)
               if i < 10 then
                  io.put_string(once "   ")
               elseif i < 100 then
                  io.put_string(once "  ")
               else
                  io.put_string(once " ")
               end
               io.put_string(once ": ")
               index := print_attribute_info(index, access_flags)
               io.put_new_line
               i := i + 1
            end
            check
               index = bytes.upper + 1
            end
         else
            io.put_string(once "File %"")
            io.put_string(path)
            io.put_string(once "%" not found.%N")
         end
      end

feature {} -- Low level access in `bytes' :
   character_at (index: INTEGER): CHARACTER is
      do
         Result := bytes.item(index).to_character
      end

   u2_at (index: INTEGER): STRING is
      do
         create Result.make(2)
         Result.extend(character_at(index + 0))
         Result.extend(character_at(index + 1))
      end

   u4_at (index: INTEGER): STRING is
      do
         create Result.make(4)
         Result.extend(character_at(index + 0))
         Result.extend(character_at(index + 1))
         Result.extend(character_at(index + 2))
         Result.extend(character_at(index + 3))
      end

   u8_at (index: INTEGER): STRING is
      do
         create Result.make(8)
         Result.extend(character_at(index + 0))
         Result.extend(character_at(index + 1))
         Result.extend(character_at(index + 2))
         Result.extend(character_at(index + 3))
         Result.extend(character_at(index + 4))
         Result.extend(character_at(index + 5))
         Result.extend(character_at(index + 6))
         Result.extend(character_at(index + 7))
      end

   hexa1_at (index: INTEGER): STRING is
      do
         create Result.copy(once "0x")
         bytes.item(index).to_character.to_hexadecimal_in(Result)
      end

   hexa2_at (index: INTEGER): STRING is
      do
         create Result.copy(once "0x")
         bytes.item(index + 0).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 1).to_character.to_hexadecimal_in(Result)
      end

   hexa4_at (index: INTEGER): STRING is
      do
         create Result.copy(once "0x")
         bytes.item(index + 0).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 1).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 2).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 3).to_character.to_hexadecimal_in(Result)
      end

   hexa8_at (index: INTEGER): STRING is
      do
         create Result.copy(once "0x")
         bytes.item(index + 0).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 1).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 2).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 3).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 4).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 5).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 6).to_character.to_hexadecimal_in(Result)
         bytes.item(index + 7).to_character.to_hexadecimal_in(Result)
      end

   u2_integer_at (index: INTEGER): INTEGER is
      do
         Result := bytes.item(index)
         Result := Result |<< 8 | bytes.item(index + 1)
      end

   u4_integer_at (index: INTEGER): INTEGER is
      do
         Result := bytes.item(index)
         Result := Result |<< 8 | (bytes.item(index + 1) & 0x000000FF)
         Result := Result |<< 8 | (bytes.item(index + 2) & 0x000000FF)
         Result := Result |<< 8 | (bytes.item(index + 3) & 0x000000FF)
         debug
            inst.extend('[')
            bytes.item(index).append_in(inst)
            inst.extend(',')
            bytes.item(index + 1).append_in(inst)
            inst.extend(',')
            bytes.item(index + 2).append_in(inst)
            inst.extend(',')
            bytes.item(index + 3).append_in(inst)
            inst.extend(']')
         end
      end

feature {} -- Basic stuff to view values:
   integer_to_hexa_in (int: INTEGER; str: STRING) is
      require
         int >= 0
      do
         str.append(once "0x")
         inspect
            int
         when 0 .. 255 then
            int.to_character.to_hexadecimal_in(str)
         when 256 .. 65535 then
            (int \\ 256).to_character.to_hexadecimal_in(str)
            (int // 256).to_character.to_hexadecimal_in(str)
         end
      end

   integer_to_offset_in(int, max: INTEGER; str: STRING) is
      require
         int.in_range(0, max)
      do
         str.append(once "0x")
         inspect
            int
         when 0 .. 255 then
            if not max.in_range(0, 255) then
               str.append(once "00")
            end
            int.to_character.to_hexadecimal_in(str)
         when 256 .. 65535 then
            (int \\ 256).to_character.to_hexadecimal_in(str)
            (int // 256).to_character.to_hexadecimal_in(str)
         end
      end

   integer_to_line_index_in(int, max: INTEGER; str: STRING) is
      require
         int.in_range(0, max)
      do
         tmp_string2.clear_count
         max.append_in(tmp_string2)
         int.append_in_format(str, tmp_string2.count)
      end

   extend_string (s: STRING; c: CHARACTER; length: INTEGER) is
      do
         from
         until
            s.count >= length
         loop
            s.extend(c)
         end
      end

   bad_class_file (msg: STRING; at: INTEGER) is
         -- If `at' is greater than 0, the corresponding byte
         -- is shown during the class file dump.
      require
         bytes.valid_index(at)
      local
         fz_visible, fz_hexadec: STRING; index: INTEGER; byte: CHARACTER; left_margin: INTEGER
      do
         io.put_string(msg)
         io.put_new_line
         io.put_string(once "Class file dump:%N")
         from
            create fz_visible.make(16)
            create fz_hexadec.make(32)
         until
            index > bytes.upper
         loop
            if fz_visible.is_empty then
               tmp_string.clear_count
               integer_to_hexa_in(index, tmp_string)
               tmp_string.extend(' ')
               extend_string(tmp_string, ' ', 9)
               index.append_in(tmp_string)
               tmp_string.extend(' ')
               extend_string(tmp_string, ' ', 15)
               io.put_string(tmp_string)
               left_margin := tmp_string.count
            end
            byte := character_at(index)
            byte.to_hexadecimal_in(fz_hexadec)
            inspect
               byte.code
            when 32 .. 126 then
               fz_visible.extend(byte)
            else
               fz_visible.extend('.')
            end
            if fz_visible.count = 16 then
               show_dump_line(fz_hexadec, fz_visible, left_margin, index, at)
            end
            index := index + 1
         end
         if fz_visible.count > 0 then
            from
               index := index - 1
            until
               fz_visible.count = 16
            loop
               fz_visible.extend(' ')
               fz_hexadec.append(once "  ")
               index := index + 1
            end
            show_dump_line(fz_hexadec, fz_visible, left_margin, index, at)
         end
         die_with_code(exit_failure_code)
      end

   show_dump_line (hexadec, visible: STRING; left_margin, index, at: INTEGER) is
         -- Where `index - 15' is the index of `visible.item(1)'.
      require
         bytes.valid_index(at)
         visible.count = 16
         hexadec.count = 32
      local
         min, max, i: INTEGER
      do
         io.put_string(hexadec)
         io.put_string(once " ")
         io.put_string(visible)
         io.put_new_line
         min := index - 15
         max := index
         if at > 0 and min <= at and at <= max then
            from
               tmp_string.clear_count
               extend_string(tmp_string, '_', left_margin)
               i := min
            until
               i = at
            loop
               tmp_string.append(once "__")
               i := i + 1
            end
            io.put_string(tmp_string)
            io.put_string(once "^^%N*** Error at this byte%N")
            io.put_string(once "Remainder of the class file :%N")
         end
         visible.clear_count
         hexadec.clear_count
      ensure
         visible.is_empty
         hexadec.is_empty
      end

   load_cp_info (i, max: INTEGER; index: INTEGER): INTEGER is
         -- Gives the index of the following item.
      local
         tag, i2, length: INTEGER; utf8: STRING
      do
         tmp_string.clear_count
         tmp_string.append(once "item #")
         i.append_in(tmp_string)
         tmp_string2.clear_count
         max.append_in(tmp_string2)
         extend_string(tmp_string, ' ', 6 + tmp_string2.count)
         tmp_string.append(once " : ")
         io.put_string(tmp_string)
         tag := bytes.item(index)
         inspect
            tag.to_character
         when Constant_class then
            io.put_string(once "CONSTANT_Class")
            constant_pool.set_class(i, u2_at(index + 1))
            Result := index + 3
         when Constant_fieldref then
            io.put_string(once "CONSTANT_Fieldref")
            constant_pool.set_fieldref(i, u4_at(index + 1))
            Result := index + 5
         when Constant_methodref then
            io.put_string(once "CONSTANT_Methodref")
            constant_pool.set_methodref(i, u4_at(index + 1))
            Result := index + 5
         when Constant_interfacemethodref then
            io.put_string(once "CONSTANT_InterfaceMethodref")
            constant_pool.set_interface_methodref(i, u4_at(index + 1))
            Result := index + 5
         when Constant_string then
            io.put_string(once "CONSTANT_String")
            constant_pool.set_string(i, u2_at(index + 1))
            Result := index + 3
         when Constant_integer then
            io.put_string(once "CONSTANT_Integer")
            constant_pool.set_integer(i, u4_at(index + 1))
            Result := index + 5
         when Constant_float then
            io.put_string(once "CONSTANT_Float")
            constant_pool.set_float(i, u4_at(index + 1))
            Result := index + 5
         when Constant_long then
            io.put_string(once "CONSTANT_Long")
            constant_pool.set_long(i, u8_at(index + 1))
            Result := index + 9
         when Constant_double then
            io.put_string(once "CONSTANT_Double")
            constant_pool.set_double(i, u8_at(index + 1))
            Result := index + 9
         when Constant_name_and_type then
            io.put_string(once "CONSTANT_NameandType")
            constant_pool.set_name_and_type(i, u4_at(index + 1))
            Result := index + 5
         when Constant_utf8 then
            io.put_string(once "CONSTANT_Utf8")
            length := u2_integer_at(index + 1)
            Result := index + 3
            create utf8.make(length + 2)
            utf8.extend(character_at(index + 1))
            utf8.extend(character_at(index + 2))
            from
               i2 := length
            until
               i2 = 0
            loop
               utf8.extend(character_at(Result))
               Result := Result + 1
               i2 := i2 - 1
            end
            constant_pool.set_utf8(i, utf8)
         else
            io.put_string(once "Error while loading constant pool.%N")
            io.put_string(once "Problem with item #")
            io.put_integer(i)
            io.put_string(once "%NBad cp_info tag : ")
            io.put_integer(tag)
            io.put_string(once "%N")
            bad_class_file(once "Bad constant pool.", index)
         end
         io.put_new_line
      end

   u2_to_integer (u2: STRING): INTEGER is
      require
         u2.count = 2
      do
         Result := u2.item(1).code
         Result := Result * 256
         Result := Result + u2.item(2).code
      ensure
         Result >= 0
      end

   print_cp_info (i: INTEGER; index: INTEGER): INTEGER is
         -- Gives the index of the following item.
      local
         tag: INTEGER; cp_info: CP_INFO; info: STRING; class_idx, name_idx, type_idx, string_idx: INTEGER
      do
         tag := bytes.item(index)
         cp_info := constant_pool.item(i)
         info := cp_info.info
         check
            tag.to_character = cp_info.tag
         end
         inspect
            tag.to_character
         when Constant_class then
            -- CONSTANT_Class :
            io.put_string(once "class at ")
            class_idx := u2_to_integer(info)
            if constant_pool.valid_index(class_idx) then
               io.put_integer(class_idx)
               io.put_string(once ": ")
               cp_info := constant_pool.item(class_idx)
               if cp_info.tag.code = 1 then
                  tmp_string.clear_count
                  constant_pool.view_in(tmp_string, i)
                  io.put_string(tmp_string)
               else
                  io.put_string(once "%NUtf8 index expected.%N")
                  bad_class_file(once "Bad constant pool.", index + 1)
               end
            else
               io.put_string(once "Class index out of range.%N")
               bad_class_file(once "Bad constant pool.", index + 1)
            end
            Result := index + 3
         when Constant_fieldref then
            -- CONSTANT_Fieldref :
            io.put_string(once "fieldref class: ")
            print_cp_info_fields_methods(index, info)
            Result := index + 5
         when Constant_methodref then
            -- CONSTANT_Methodref :
            io.put_string(once "methodref class: ")
            print_cp_info_fields_methods(index, info)
            Result := index + 5
         when Constant_interfacemethodref then
            -- CONSTANT_InterfaceMethodref :
            io.put_string(once "interface methodref class: ")
            print_cp_info_fields_methods(index, info)
            Result := index + 5
         when Constant_string then
            -- CONSTANT_String :
            io.put_string(once "string at ")
            string_idx := u2_to_integer(info)
            if constant_pool.valid_index(string_idx) then
               io.put_integer(string_idx)
               io.put_string(once " : %"")
               cp_info := constant_pool.item(string_idx)
               if cp_info.tag.code = 1 then
                  tmp_string.clear_count
                  constant_pool.view_in(tmp_string, i)
                  io.put_string(tmp_string)
                  io.put_string(once "%"")
               else
                  io.put_string(once "%NUtf8 index expected.%N")
                  bad_class_file(once "Bad constant pool.", index + 1)
               end
            else
               io.put_string(once "??%NString index out of range.%N")
               bad_class_file(once "Bad constant pool.", index + 1)
            end
            Result := index + 3
         when Constant_integer then
            -- CONSTANT_Integer :
            io.put_string(once "integer: ")
            io.put_string(hexa4_at(index + 1))
            Result := index + 5
         when Constant_float then
            -- CONSTANT_Float :
            io.put_string(once "float: ")
            io.put_string(hexa4_at(index + 1))
            Result := index + 5
         when Constant_long then
            -- CONSTANT_Long :
            io.put_string(once "long: ")
            io.put_string(hexa8_at(index + 1))
            Result := index + 9
         when Constant_double then
            -- CONSTANT_Double :
            io.put_string(once "double: ")
            io.put_string(hexa8_at(index + 1))
            Result := index + 9
         when Constant_name_and_type then
            -- CONSTANT_NameandType :
            io.put_string(once "name: ")
            name_idx := u2_to_integer(info.substring(1, 2))
            if constant_pool.valid_index(name_idx) then
               cp_info := constant_pool.item(name_idx)
               if cp_info.tag.code = 1 then
                  tmp_string.clear_count
                  constant_pool.view_in(tmp_string, name_idx)
                  io.put_string(tmp_string)
                  io.put_string(once " type: ")
                  type_idx := u2_to_integer(info.substring(3, 4))
                  if constant_pool.valid_index(type_idx) then
                     cp_info := constant_pool.item(type_idx)
                     if cp_info.tag.code = 1 then
                        tmp_string.clear_count
                        constant_pool.view_in(tmp_string, type_idx)
                        io.put_string(tmp_string)
                     else
                        io.put_string(once "??%NUtf8 index expected.%N")
                        bad_class_file(once "Bad constant pool.", index + 3)
                     end
                  else
                     io.put_string(once "%NType index out of range.%N")
                     bad_class_file(once "Bad constant pool.", index + 3)
                  end
               else
                  io.put_string(once "%NUtf8 index expected.%N")
                  bad_class_file(once "Bad constant pool.", index + 1)
               end
            else
               io.put_string(once "??%NClass index out of range.%N")
               bad_class_file(once "Bad constant pool.", index + 1)
            end
            Result := index + 5
         when Constant_utf8 then
            -- CONSTANT_Utf8 :
            io.put_string(once "utf8: %"")
            tmp_string.clear_count
            constant_pool.view_in(tmp_string, i)
            io.put_string(tmp_string)
            io.put_string(once "%"")
            Result := index + 1 + cp_info.info.count
         end
      end

   print_cp_info_fields_methods (index: INTEGER; info: STRING) is
      local
         cp_info: CP_INFO; class_idx, utf8_idx, name_and_type_idx: INTEGER
      do
         class_idx := u2_to_integer(info.substring(1, 2))
         name_and_type_idx := u2_to_integer(info.substring(3, 4))
         if constant_pool.valid_index(class_idx) then
            cp_info := constant_pool.item(class_idx)
            if cp_info.tag.code = 7 then
               utf8_idx := u2_to_integer(cp_info.info)
               if constant_pool.valid_index(utf8_idx) then
                  tmp_string.clear_count
                  constant_pool.view_in(tmp_string, class_idx)
                  io.put_string(tmp_string)
                  io.put_string(once " name_and_type: ")
                  if constant_pool.valid_index(name_and_type_idx) then
                     tmp_string.clear_count
                     constant_pool.view_in(tmp_string, name_and_type_idx)
                     io.put_string(tmp_string)
                  else
                     io.put_string(once "??%N*** Error: name_and_type_index expected.")
                     bad_class_file(once "Bad constant pool.", index + 3)
                  end
               else
                  io.put_string(once "??%N*** Error: Class index expected.")
               end
            else
               io.put_string(once "%NClass index expected.%N")
               bad_class_file(once "Bad constant pool.", index + 1)
            end
         else
            io.put_string(once "??%NClass index out of range.%N")
            bad_class_file(once "Bad constant pool.", index + 1)
         end
      end

   print_field_info (index: INTEGER): INTEGER is
      local
         access_flags_idx, name_idx: INTEGER; descriptor_idx, field_attributes_count: INTEGER
         access_flags: INTEGER
      do
         access_flags_idx := index
         Result := index + 2
         io.put_string(once "access flags (")
         io.put_string(hexa2_at(access_flags_idx))
         io.put_string(once "): ")
         access_flags := bytes.item(access_flags_idx + 1)
         if (access_flags & 0x00000001).to_boolean then
            io.put_string(once "public ")
         end
         if (access_flags & 0x00000002).to_boolean then
            io.put_string(once "private ")
         end
         if (access_flags & 0x00000004).to_boolean then
            io.put_string(once "protected ")
         end
         if (access_flags & 0x00000008).to_boolean then
            io.put_string(once "static ")
         end
         if (access_flags & 0x00000010).to_boolean then
            io.put_string(once "final ")
         end
         if (access_flags & 0x00000040).to_boolean then
            io.put_string(once "volatile ")
         end
         if (access_flags & 0x00000080).to_boolean then
            io.put_string(once "transient ")
         end
         io.put_new_line
         io.put_string(once "Field name: ")
         name_idx := u2_integer_at(Result)
         Result := Result + 2
         if constant_pool.valid_index(name_idx) then
            tmp_string.clear_count
            constant_pool.view_in(tmp_string, name_idx)
            io.put_string(tmp_string)
            descriptor_idx := u2_integer_at(Result)
            Result := Result + 2
            io.put_string(once " descriptor: ")
            if constant_pool.valid_index(descriptor_idx) then
               tmp_string.clear_count
               constant_pool.view_in(tmp_string, descriptor_idx)
               io.put_string(tmp_string)
               field_attributes_count := u2_integer_at(Result)
               Result := Result + 2
               io.put_new_line
               io.put_string(once "Attributes count: ")
               io.put_integer(field_attributes_count)
               io.put_new_line
               from
               until
                  field_attributes_count = 0
               loop
                  Result := print_attribute_info(Result, access_flags)
                  field_attributes_count := field_attributes_count - 1
               end
            else
               io.put_string(once "??%NDescriptor index out of range.%N")
               bad_class_file(once "Bad constant pool.", Result - 2)
            end
         else
            io.put_string(once "??%NName index out of range.%N")
            bad_class_file(once "Bad constant pool.", Result - 2)
         end
      end

   print_attribute_info (index, flags : INTEGER): INTEGER is
      local
         attribute_name_idx, attribute_length: INTEGER; attribute_name: STRING; tmp: INTEGER
      do
         attribute_name_idx := u2_integer_at(index)
         Result := index + 2
         io.put_string(once "Attribute Name: ")
         tmp_string.clear_count
         constant_pool.view_in(tmp_string, attribute_name_idx)
         io.put_string(tmp_string)
         attribute_name := tmp_string.twin
         attribute_length := u4_integer_at(Result)
         Result := Result + 4
         io.put_string(once " length: ")
         io.put_integer(attribute_length)
         io.put_character(' ')
         if (once "Code").is_equal(attribute_name) then
            tmp := print_code_attribute(Result, attribute_length, flags)
            Result := Result + attribute_length
         else
            io.put_string(once " Ignored (skipped)%N")
            Result := Result + attribute_length
         end
      end

   print_method_info (index: INTEGER): INTEGER is
      local
         access_flags_idx, name_idx: INTEGER; descriptor_idx, method_attributes_count: INTEGER
         access_flags: INTEGER
      do
         access_flags_idx := index
         Result := index + 2
         io.put_string(once "access flags (")
         io.put_string(hexa2_at(access_flags_idx))
         io.put_string(once "): ")
         access_flags := bytes.item(access_flags_idx + 1)
         if (access_flags & 0x00000001).to_boolean then
            io.put_string(once "public ")
         end
         if (access_flags & 0x00000002).to_boolean then
            io.put_string(once "private ")
         end
         if (access_flags & 0x00000004).to_boolean then
            io.put_string(once "protected ")
         end
         if (access_flags & 0x00000008).to_boolean then
            io.put_string(once "static ")
         end
         if (access_flags & 0x00000010).to_boolean then
            io.put_string(once "final ")
         end
         if (access_flags & 0x00000020).to_boolean then
            io.put_string(once "synchronized ")
         end
         access_flags := bytes.item(access_flags_idx)
         if (access_flags & 0x00000001).to_boolean then
            io.put_string(once "native ")
         end
         if (access_flags & 0x00000004).to_boolean then
            io.put_string(once "abstract ")
         end
         io.put_new_line
         name_idx := u2_integer_at(Result)
         Result := Result + 2
         io.put_string(once "Method name: ")
         tmp_string.clear_count
         constant_pool.view_in(tmp_string, name_idx)
         io.put_string(tmp_string)
         io.put_string(once " descriptor: ")
         descriptor_idx := u2_integer_at(Result)
         Result := Result + 2
         tmp_string.clear_count
         constant_pool.view_in(tmp_string, descriptor_idx)
         io.put_string(tmp_string)
         io.put_new_line
         io.put_string(once "Attributes count: ")
         method_attributes_count := u2_integer_at(Result)
         Result := Result + 2
         io.put_integer(method_attributes_count)
         io.put_new_line
         from
         until
            method_attributes_count = 0
         loop
            Result := print_attribute_info(Result, access_flags)
            method_attributes_count := method_attributes_count - 1
         end
      end

   print_code_attribute (index, length, flags: INTEGER): INTEGER is
      local
         code_length: INTEGER; exception_table_length: INTEGER; max_stack, max_locals: INTEGER
         local_attributes_count: INTEGER
      do
         -- idx: INTEGER
         io.put_string(once "%Nmax_stack: ")
         max_stack := u2_integer_at(index)
         Result := index + 2
         io.put_integer(max_stack)
         io.put_string(once " max_locals: ")
         max_locals := u2_integer_at(Result)
         Result := Result + 2
         io.put_integer(max_locals)
         io.put_string(once " code_length: ")
         code_length := u4_integer_at(Result)
         Result := Result + 4
         io.put_integer(code_length)
         io.put_new_line
         print_byte_code(Result, code_length, flags)
         Result := Result + code_length
         exception_table_length := u2_integer_at(Result)
         Result := Result + 2
         io.put_string(once "Exception(s): ")
         io.put_integer(exception_table_length)
         io.put_new_line
         print_exception_table(Result, exception_table_length)
         Result := Result + exception_table_length * 8
         io.put_string(once "Attributes count: ")
         local_attributes_count := u2_integer_at(Result)
         Result := Result + 2
         io.put_integer(local_attributes_count)
         io.put_new_line
         from
         until
            local_attributes_count = 0
         loop
            Result := print_attribute_info(Result, flags)
            local_attributes_count := local_attributes_count - 1
         end
      end

   inst_view (byte_idx: INTEGER; cp_idx_type: CHARACTER) is
      local
         cp_idx: INTEGER; cp_info: CP_INFO
      do
         cp_idx := u2_integer_at(byte_idx)
         if constant_pool.valid_index(cp_idx) then
            cp_info := constant_pool.item(cp_idx)
            if cp_info.tag = cp_idx_type then
               constant_pool.view_in(inst, cp_idx)
            else
               tmp_string.clear_count
               tmp_string.append(once "????%N")
               tmp_string.append(once "Invalid type entry in constant pool at: ")
               cp_idx.append_in(tmp_string)
               tmp_string.append(once " : ")
               constant_pool.view_in(tmp_string, cp_idx)
               tmp_string.append(once "%NExpected tag: ")
               cp_idx_type.code.append_in(tmp_string)
               tmp_string.append(once " (")
               cp_info_tag_name_in(cp_idx_type, tmp_string)
               tmp_string.append(once ")%NActual   tag: ")
               cp_info.tag.code.append_in(tmp_string)
               tmp_string.append(once " (")
               cp_info_tag_name_in(cp_info.tag, tmp_string)
               tmp_string.append(once ")%N")
               io.put_string(tmp_string)
               bad_class_file(once "Constant pool type index error.", byte_idx)
            end
         else
            io.put_string(once "????%N")
            bad_class_file(once "Valid index in constant pool expected.", byte_idx)
         end
      end

   u2sign_extended_view (str: STRING; idx: INTEGER) is
      local
         byte: INTEGER
      do
         byte := bytes.item(idx)
         str.append(hexa1_at(idx))
         str.append(once " (")
         if byte < 128 then
            byte.append_in(str)
         else
            (byte - 256).append_in(str)
         end
         str.append(once ")")
      end

   print_one_instruction (pc_idx, pc, flags: INTEGER): INTEGER is
         -- Return the following `pc_idx'.
      local
         opcode: INTEGER; idx, i: INTEGER; low, up, cnt: INTEGER; in: like inst
      do
         in := inst -- for debug purposes (show the contents of the `inst' buffer)
         debug
            inst.extend('<')
            pc.append_in(inst)
            inst.extend('>')
         end
         Result := pc_idx + 1
         opcode := bytes.item(pc_idx)
         inspect
            opcode
         when 0 then
            inst_opcode(once "nop (Do nothing)")
         when 1 then
            inst_opcode(once "aconst_null (Push null)")
         when 2 then
            inst_opcode(once "iconst_m1 (Push int -1)")
         when 3 .. 8 then
            inst_opcode(once "iconst_")
            (opcode - 3).append_in(inst)
            inst.append(once " (Push int ")
            (opcode - 3).append_in(inst)
            inst.extend(')')
         when 9 then
            inst_opcode(once "lconst_0 (Push long 0)")
         when 10 then
            inst_opcode(once "lconst_1 (Push long 1)")
         when 11 .. 13 then
            inst_opcode(once "fconst_")
            (opcode - 11).append_in(inst)
         when 14 .. 15 then
            inst_opcode(once "dconst_")
            (opcode - 14).append_in(inst)
         when 16 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "bipush ")
            u2sign_extended_view(inst, pc_idx + 1)
            Result := Result + 1
         when 17 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            character_at(pc_idx + 2).to_hexadecimal_in(inst)
            inst_opcode(once "sipush ")
            inst.append(hexa2_at(pc_idx + 1))
            inst_opcode(once "(Push short with sign-extension) => ")
            u2_integer_at(pc_idx + 1).append_in(inst)
            Result := Result + 2
         when 18 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            idx := bytes.item(pc_idx + 1)
            inst_opcode(once "ldc at ")
            idx.append_in(inst)
            inst.append(once " : ")
            if constant_pool.valid_index(idx) then
               constant_pool.view_in(inst, idx)
            else
               io.put_string(once "??%N")
               bad_class_file(once "Constant pool index out of range.", pc_idx + 1)
            end
            Result := Result + 1
         when 19 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            character_at(pc_idx + 2).to_hexadecimal_in(inst)
            inst_opcode(once "ldc_w ")
            idx := u2_integer_at(pc_idx + 1)
            if constant_pool.valid_index(idx) then
               constant_pool.view_in(inst, idx)
            else
               io.put_string(once "????%N")
               bad_class_file(once "Constant pool index out of range.", pc_idx + 1)
            end
            Result := Result + 2
         when 20 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            character_at(pc_idx + 2).to_hexadecimal_in(inst)
            inst_opcode(once "ldc2_w ")
            idx := u2_integer_at(pc_idx + 1)
            if constant_pool.valid_index(idx) then
               constant_pool.view_in(inst, idx)
            else
               io.put_string(once "????%N")
               bad_class_file(once "CONSTANT_Long or CONSTANT_Double expected.", pc_idx + 1)
            end
            Result := Result + 2
         when 21 then
            inst_opcode(once "iload ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (load int from local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 22 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "lload ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (load long from local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 23 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "fload ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (load float from local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 24 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "dload ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (load double from local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 25 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "aload ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (load reference from local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 26 .. 29 then
            inst_opcode(once "iload_")
            (opcode - 26).append_in(inst)
            inst.append(once " (load int from local #")
            (opcode - 26).append_in(inst)
            inst.extend(')')
         when 30 .. 33 then
            inst_opcode(once "lload_")
            (opcode - 30).append_in(inst)
            inst.append(once " (load long from local #")
            (opcode - 30).append_in(inst)
            inst.extend(')')
         when 34 .. 37 then
            inst_opcode(once "fload_")
            (opcode - 34).append_in(inst)
            inst.append(once " (load float from local #")
            (opcode - 34).append_in(inst)
            inst.extend(')')
         when 38 .. 41 then
            inst_opcode(once "dload_")
            (opcode - 38).append_in(inst)
            inst.append(once " (load double from local #")
            (opcode - 38).append_in(inst)
            inst.extend(')')
         when 42 then
            inst_opcode(once "aload_0 (load ")
            if (flags & 0x00000008).to_boolean then
               inst.append(once "reference from local #0)")
            else
               inst.append(once "'Current')")
            end
         when 43 .. 45 then
            inst_opcode(once "aload_")
            (opcode - 42).append_in(inst)
            inst.append(once " (load reference from local #")
            (opcode - 42).append_in(inst)
            inst.extend(')')
         when 46 then
            inst_opcode(once "iaload")
         when 47 then
            inst_opcode(once "laload")
         when 48 then
            inst_opcode(once "faload")
         when 49 then
            inst_opcode(once "daload")
         when 50 then
            inst_opcode(once "aaload")
         when 51 then
            inst_opcode(once "baload")
         when 52 then
            inst_opcode(once "caload")
         when 53 then
            inst_opcode(once "saload")
         when 54 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "istore ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (store int into local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 55 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "lstore ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (store long into local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 56 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "fstore ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (store float into local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 57 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "dstore ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (store double into local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 58 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            inst_opcode(once "astore ")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " (store reference into local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.extend(')')
            Result := Result + 1
         when 59 .. 62 then
            inst_opcode(once "istore_")
            (opcode - 59).append_in(inst)
         when 63 .. 66 then
            inst_opcode(once "lstore_")
            (opcode - 63).append_in(inst)
            inst.append(once " (store long into local #")
            (opcode - 63).append_in(inst)
            inst.extend(')')
         when 67 .. 70 then
            inst_opcode(once "fstore_")
            (opcode - 67).append_in(inst)
            inst.append(once " (store float into local #")
            (opcode - 67).append_in(inst)
            inst.extend(')')
         when 71 .. 74 then
            inst_opcode(once "dstore_")
            (opcode - 71).append_in(inst)
            inst.append(once " (store double into local #")
            (opcode - 71).append_in(inst)
            inst.extend(')')
         when 75 .. 78 then
            inst_opcode(once "astore_")
            (opcode - 75).append_in(inst)
            inst.append(once " (store reference into local #")
            (opcode - 75).append_in(inst)
            inst.extend(')')
         when 79 then
            inst_opcode(once "iastore")
         when 80 then
            inst_opcode(once "lastore")
         when 81 then
            inst_opcode(once "fastore")
         when 82 then
            inst_opcode(once "dastore")
         when 83 then
            inst_opcode(once "aastore")
         when 84 then
            inst_opcode(once "bastore")
         when 85 then
            inst_opcode(once "castore")
         when 86 then
            inst_opcode(once "sastore")
         when 87 then
            inst_opcode(once "pop (...,w => ...)")
         when 88 then
            inst_opcode(once "pop2 (...,w1,w2 => ...)")
         when 89 then
            inst_opcode(once "dup (...,w => ...,w,w)")
         when 90 then
            inst_opcode(once "dup_x1 (...,w2,w1 => ...,w1,w2,w1)")
         when 91 then
            inst_opcode(once "dup_x2 (...,w3,w2,w1 => ...,w1,w3,w2,w1)")
         when 92 then
            inst_opcode(once "dup2 (...,w2,w1 => ...,w2,w1,w2,w1)")
         when 93 then
            inst_opcode(once "dup2_x1 (...,w3,w2,w1 => ...,w2,w1,w3,w2,w1)")
         when 94 then
            inst_opcode(once "dup2_x2 (...,w4,w3,w2,w1 => ...,w2,w1,w4,w3,w2,w1)")
         when 95 then
            inst_opcode(once "swap (...,w2,w1 => ...,w1,w2)")
         when 96 then
            inst_opcode(once "iadd")
         when 97 then
            inst_opcode(once "ladd")
         when 98 then
            inst_opcode(once "fadd")
         when 99 then
            inst_opcode(once "dadd")
         when 100 then
            inst_opcode(once "isub")
         when 101 then
            inst_opcode(once "lsub")
         when 102 then
            inst_opcode(once "fsub")
         when 103 then
            inst_opcode(once "dsub")
         when 104 then
            inst_opcode(once "imul")
         when 105 then
            inst_opcode(once "lmul")
         when 106 then
            inst_opcode(once "fmul")
         when 107 then
            inst_opcode(once "dmul")
         when 108 then
            inst_opcode(once "idiv")
         when 109 then
            inst_opcode(once "ldiv")
         when 110 then
            inst_opcode(once "fdiv")
         when 111 then
            inst_opcode(once "ddiv")
         when 112 then
            inst_opcode(once "irem")
         when 113 then
            inst_opcode(once "lrem")
         when 114 then
            inst_opcode(once "frem")
         when 115 then
            inst_opcode(once "drem")
         when 116 then
            inst_opcode(once "ineg")
         when 117 then
            inst_opcode(once "lneg")
         when 118 then
            inst_opcode(once "fneg")
         when 119 then
            inst_opcode(once "dneg")
         when 120 then
            inst_opcode(once "ishl")
         when 121 then
            inst_opcode(once "lshl")
         when 122 then
            inst_opcode(once "ishr")
         when 123 then
            inst_opcode(once "lshr")
         when 124 then
            inst_opcode(once "iushr")
         when 125 then
            inst_opcode(once "lushr")
         when 126 then
            inst_opcode(once "iand")
         when 127 then
            inst_opcode(once "land")
         when 128 then
            inst_opcode(once "ior")
         when 129 then
            inst_opcode(once "lor")
         when 130 then
            inst_opcode(once "ixor")
         when 131 then
            inst_opcode(once "lxor")
         when 132 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            character_at(pc_idx + 2).to_hexadecimal_in(inst)
            inst_opcode(once "iinc local #")
            bytes.item(pc_idx + 1).append_in(inst)
            inst.append(once " with : ")
            inst.append(hexa1_at(pc_idx + 2))
            inst.append(once " (sign-extended) => ")
            character_at(pc_idx + 2).to_integer_8.append_in(inst)
            Result := Result + 2
         when 133 then
            inst_opcode(once "i2l (Convert int to long)")
         when 134 then
            inst_opcode(once "i2f (Convert int to float)")
         when 135 then
            inst_opcode(once "i2d (Convert int to double)")
         when 136 then
            inst_opcode(once "l2i (Convert long to int)")
         when 137 then
            inst_opcode(once "l2f (Convert long to float)")
         when 138 then
            inst_opcode(once "l2d (Convert long to double)")
         when 139 then
            inst_opcode(once "f2i (Convert float to int)")
         when 140 then
            inst_opcode(once "f2l (Convert float to long)")
         when 141 then
            inst_opcode(once "f2d (Convert float to double)")
         when 142 then
            inst_opcode(once "d2i (Convert double to int)")
         when 143 then
            inst_opcode(once "d2l (Convert double to long)")
         when 144 then
            inst_opcode(once "d2f (Convert double to float)")
         when 145 then
            inst_opcode(once "i2b (Convert int to byte)")
         when 146 then
            inst_opcode(once "i2c (Convert int to char)")
         when 147 then
            inst_opcode(once "i2s (Convert int to short)")
         when 148 then
            inst_opcode(once "lcmp")
         when 149 then
            inst_opcode(once "fcmpl")
         when 150 then
            inst_opcode(once "fcmpg")
         when 151 .. 152 then
            inst_opcode(once "dcmp")
            inspect
               opcode
            when 151 then
               inst.append(once "l")
            when 152 then
               inst.append(once "g")
            end
         when 153 .. 158 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            character_at(pc_idx + 2).to_hexadecimal_in(inst)
            inst_opcode(once "if")
            inspect
               opcode
            when 153 then
               inst.append(once "eq")
            when 154 then
               inst.append(once "ne")
            when 155 then
               inst.append(once "lt")
            when 156 then
               inst.append(once "ge")
            when 157 then
               inst.append(once "gt")
            when 158 then
               inst.append(once "le")
            end
            inst.extend(' ')
            view_pc(u2_integer_at(pc_idx + 1), pc)
            Result := Result + 2
         when 159 .. 166 then
            character_at(pc_idx + 1).to_hexadecimal_in(inst)
            character_at(pc_idx + 2).to_hexadecimal_in(inst)
            inst_opcode(once "if_")
            inspect
               opcode
            when 159 .. 164 then
               inst.extend('i')
            else
               inst.extend('a')
            end
            inst.append(once "cmp")
            inspect
               opcode
            when 159 then
               inst.append(once "eq")
            when 160 then
               inst.append(once "ne")
            when 161 then
               inst.append(once "lt")
            when 162 then
               inst.append(once "ge")
            when 163 then
               inst.append(once "gt")
            when 164 then
               inst.append(once "le")
            when 165 then
               inst.append(once "eq")
            when 166 then
               inst.append(once "ne")
               end
               inst.extend(' ')
               view_pc(u2_integer_at(pc_idx + 1), pc)
               Result := Result + 2
            when 167 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "goto ")
               view_pc(u2_integer_at(pc_idx + 1), pc)
               Result := Result + 2
            when 168 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "jsr ")
               view_pc(u2_integer_at(pc_idx + 1), pc)
               Result := Result + 2
            when 169 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               inst_opcode(once "ret ")
               view_pc(bytes.item(pc_idx + 1), pc)
               Result := Result + 1
            when 170 then
               inst_opcode(once "tableswitch (")
               Result := pc_idx + 1
               from
               until
                  (pc + Result - pc_idx) & 0x03 = 0
               loop
                  Result := Result + 1
               end
               low := u4_integer_at(Result + 4)
               low.append_in(inst)
               inst.append(once "..")
               up := u4_integer_at(Result + 8)
               up.append_in(inst)
               inst.append(once ")%N                     default: ")
               view_pc(u4_integer_at(Result), pc)
               from
                  i := low
                  Result := Result + 12
               until
                  i > up
               loop
                  inst.append(once "%N                     ")
                  i.append_in(inst)
                  inst.append(once ": ")
                  view_pc(u4_integer_at(Result), pc)
                  i := i + 1
                  Result := Result + 4
               end
            when 171 then
               inst_opcode(once "lookupswitch (")
               Result := pc_idx + 1
               from
               until
                  (pc + Result - pc_idx) & 0x03 = 0
               loop
                  debug
                     inst.append(once "[pad:")
                     bytes.item(Result).append_in(inst)
                     inst.extend(']')
                  end
                  Result := Result + 1
               end
               cnt := u4_integer_at(Result + 4)
               cnt.append_in(inst)
               inst.append(once ")%N                     default: ")
               view_pc(u4_integer_at(Result), pc)
               from
                  i := 0
                  Result := Result + 8
               until
                  i >= cnt
               loop
                  inst.append(once "%N                     ")
                  u4_integer_at(Result).append_in(inst)
                  inst.append(once ": ")
                  view_pc(u4_integer_at(Result + 4), pc)
                  i := i + 1
                  Result := Result + 8
               end
            when 172 then
               inst_opcode(once "ireturn")
            when 173 then
               inst_opcode(once "lreturn")
            when 174 then
               inst_opcode(once "freturn")
            when 175 then
               inst_opcode(once "dreturn")
            when 176 then
               inst_opcode(once "areturn")
            when 177 then
               inst_opcode(once "return")
            when 178 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "getstatic ")
               inst_view(pc_idx + 1, Constant_fieldref)
               Result := Result + 2
            when 179 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "putstatic ")
               inst_view(pc_idx + 1, Constant_fieldref)
               Result := Result + 2
            when 180 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "getfield ")
               inst_view(pc_idx + 1, Constant_fieldref)
               Result := Result + 2
            when 181 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "putfield ")
               inst_view(pc_idx + 1, Constant_fieldref)
               Result := Result + 2
            when 182 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "invokevirtual ")
               inst_view(pc_idx + 1, Constant_methodref)
               Result := Result + 2
            when 183 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "invokespecial ")
               inst_view(pc_idx + 1, Constant_methodref)
               Result := Result + 2
            when 184 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "invokestatic ")
               inst_view(pc_idx + 1, Constant_methodref)
               Result := Result + 2
            when 185 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "invokeinterface ")
               inst_view(pc_idx + 1, Constant_interfacemethodref)
               inst.append(once " with ")
               (character_at(pc_idx + 3).to_integer_8 - 1).append_in(inst)
               inst.append(once " arg(s)")
               Result := Result + 4
            when 187 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "new ")
               inst_view(pc_idx + 1, Constant_class)
               Result := Result + 2
            when 188 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               inst_opcode(once "newarray of ")
               inspect
                  bytes.item(pc_idx + 1)
               when 4 then
                  inst.append(once "boolean")
               when 5 then
                  inst.append(once "character")
               when 6 then
                  inst.append(once "float")
               when 7 then
                  inst.append(once "double")
               when 8 then
                  inst.append(once "byte")
               when 9 then
                  inst.append(once "short")
               when 10 then
                  inst.append(once "int")
               when 11 then
                  inst.append(once "long")
               else
                  io.put_string(once "??%NInvalid newarray instruction.%N")
                  bad_class_file(once "Bad array type.", pc_idx + 1)
               end
               Result := Result + 1
            when 189 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "anewarray of ")
               inst_view(pc_idx + 1, Constant_class)
               Result := Result + 2
            when 190 then
               inst_opcode(once "arraylength")
            when 191 then
               inst_opcode(once "athrow")
            when 192 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "checkcast ")
               inst_view(pc_idx + 1, Constant_class)
               Result := Result + 2
            when 193 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "instanceof ")
               inst_view(pc_idx + 1, Constant_class)
               Result := Result + 2
            when 194 then
               inst_opcode(once "monitorenter")
            when 195 then
               inst_opcode(once "monitorexit")
            when 196 then
               inst_opcode(once "wide <opcode=")
               character_at(pc_idx + 1).to_integer_8.append_in(inst)
               inst.append("> : ")
               if (character_at(pc_idx + 1) = (132).to_character) then -- Avoid 'warning: comparison is always false due to limited range of data type' (!int_16 vs int_16)
               --if (character_at(pc_idx + 1).to_integer = 132) then
                  inst_opcode(once "iinc local #")
                  u2_integer_at(pc_idx + 1).append_in(inst)
                  inst.append(once " with : ")
                  inst.append(hexa2_at(pc_idx + 3))
                  inst.append(once " (sign-extended) => ")
                  u2_integer_at(pc_idx + 3).append_in(inst)
                  Result := Result + 4
               else
                  inst.append("deal with local #")
                  u2_integer_at(pc_idx + 1).append_in(inst)
                  Result := Result + 2
               end
            when 197 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               character_at(pc_idx + 3).to_hexadecimal_in(inst)
               inst_opcode(once "multianewarray of ")
               if constant_pool.is_class(u2_integer_at(pc_idx + 1)) then
                  constant_pool.view_in(inst, u2_integer_at(pc_idx + 1))
                  inst.append(" - dimensions arg = ")
                  character_at(pc_idx + 3).to_integer_8.append_in(inst)
               else
                  io.put_string(once "??%N")
                  bad_class_file(once "Bad `class' value.", pc_idx + 1)
               end
               Result := Result + 3
            when 198 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "ifnull ")
               view_pc(u2_integer_at(pc_idx + 1), pc)
               Result := Result + 2
            when 199 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               inst_opcode(once "ifnonnull ")
               view_pc(u2_integer_at(pc_idx + 1), pc)
               Result := Result + 2
            when 200 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               character_at(pc_idx + 3).to_hexadecimal_in(inst)
               character_at(pc_idx + 4).to_hexadecimal_in(inst)
               inst_opcode(once "goto_w ")
               view_pc(u4_integer_at(pc_idx + 1), pc)
               Result := Result + 4
            when 201 then
               character_at(pc_idx + 1).to_hexadecimal_in(inst)
               character_at(pc_idx + 2).to_hexadecimal_in(inst)
               character_at(pc_idx + 3).to_hexadecimal_in(inst)
               character_at(pc_idx + 4).to_hexadecimal_in(inst)
               inst_opcode(once "jsr_w ")
               view_pc(u4_integer_at(pc_idx + 1), pc)
               Result := Result + 4
            when 203 .. 219 then
               bad_class_file(once "quick Opcode", pc_idx)
            when 221 .. 228 then
               bad_class_file(once "quick Opcode", pc_idx)
            else
               io.put_string(inst)
               io.put_new_line
               io.put_string(once "Unknown Opcode: ")
               io.put_integer(opcode)
               io.put_string(once " (0x")
               io.put_string(opcode.to_character.to_hexadecimal)
               io.put_string(once ")%N")
               bad_class_file(once "Unknown Opcode.", pc_idx)
            end
      ensure
         Result >= pc_idx + 1
      end

   print_byte_code (start_idx, length, flags: INTEGER) is
         -- Print the byte code stored in range :
         --    [`start_idx' .. `start_idx' + `length']
      require
         bytes.valid_index(start_idx)
         length >= 0
      local
         pc_idx, pc: INTEGER
      do
         from
            pc_idx := start_idx
         until
            pc_idx = start_idx + length
         loop
            pc := pc_idx - start_idx
            tmp_string.copy(once "  ")
            integer_to_offset_in(pc, length, tmp_string)
            tmp_string.append(once "  ")
            integer_to_line_index_in(pc, length, tmp_string)
            tmp_string.append(once "  ")
            character_at(pc_idx).to_hexadecimal_in(tmp_string)
            io.put_string(tmp_string)
            inst.clear_count
            pc_idx := print_one_instruction(pc_idx, pc_idx - start_idx, flags)
            io.put_string(inst)
            io.put_new_line
         end
      end

   print_exception_table (index, length: INTEGER) is
      local
         i, idx: INTEGER
      do
         from
            i := length
            idx := index
         until
            i = 0
         loop
            io.put_string(once "start:   ")
            io.put_integer(u2_integer_at(idx))
            io.put_string(once "%Nend:     ")
            io.put_integer(u2_integer_at(idx + 2))
            io.put_string(once "%Nhandler: ")
            io.put_integer(u2_integer_at(idx + 4))
            io.put_string(once "%Ntype:    ")
            io.put_integer(u2_integer_at(idx + 6))
            inst.copy(once "")
            inst_view(idx + 6, Constant_class)
            io.put_string(once " (class ")
            io.put_string(inst)
            io.put_string(once ")%N")
            i := i - 1
            idx := idx + 8
         end
      end

   tmp_string: STRING is
      once
         create Result.make(32)
      end

   tmp_string2: STRING is
         -- Buffer used by integer_to_line_index_in() et load_cp_info()
      once
         create Result.make(32)
      end

   inst_opcode (msg: STRING) is
      do
         extend_string(inst, ' ', 4)
         inst.extend(' ')
         inst.append(msg)
      end

   inst: STRING is
      once
         create Result.make(80)
      end

   view_pc (offset, pc: INTEGER) is
      local
         view: INTEGER
      do
         if offset < 0x00007FFF then --2 ^ 15 - 1
            view := pc + offset
         else
            view := offset - 0x00010000 + pc --2 ^ 16
         end
         view.append_in(inst)
      end

end -- class PRINT_JVM_CLASS
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
