-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_INTERPRETER_OBJECT_PRINTER

inherit
   LIBERTY_TYPE_VISITOR

creation {LIBERTY_INTERPRETER}
   make

feature {ANY}
   print_object (o: like stream; obj: like object; i: like indent) is
      do
         if obj = Void then
            o.put_line(once "<Void>")
         elseif obj.is_void then
            o.put_line(once "Void")
         else
            stream := o
            object := obj
            indent := i
            obj.type.accept(Current)
            stream := Void
            object := Void
         end
      end

   put_indent (o: OUTPUT_STREAM; tabs: like indent) is
         -- `show_stack' helper.
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > tabs
         loop
            o.put_string(once "   ")
            i := i + 1
         end
      end

feature {LIBERTY_UNIVERSE}
   visit_type_any (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_arguments (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_platform (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_pointer (type: LIBERTY_ACTUAL_TYPE) is
      do
         stream.put_character('@')
         object.show_stack(stream, indent)
      end

   visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_character (type: LIBERTY_ACTUAL_TYPE) is
      local
         code: INTEGER; char: LIBERTY_INTERPRETER_OBJECT_NATIVE[CHARACTER]
      do
         char ::= object
         inspect
            char.item
         when '%N' then
            stream.put_line(once "'%%N'")
         when '%T' then
            stream.put_line(once "'%%T'")
         when '%R' then
            stream.put_line(once "'%%R'")
         when '%%' then
            stream.put_line(once "'%%%%'")
         when '%'' then
            stream.put_line(once "'%%''")
         else
            code := char.item.code
            if code < ' '.code then
               stream.put_string(once "'%%/")
               stream.put_integer(code)
               stream.put_line(once "/'")
            else
               stream.put_character('%'')
               stream.put_character(char.item)
               stream.put_character('%'')
               stream.put_new_line
            end
         end
      end

   visit_type_string (type: LIBERTY_ACTUAL_TYPE) is
      local
         string: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
         i, n: INTEGER; storage: LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[CHARACTER]
         count: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
         c: CHARACTER; multiline: BOOLEAN
      do
         string ::= object
         if string.has_attribute(storage_attribute) and then string.has_attribute(count_attribute) then
            storage ::= string.attribute_object(storage_attribute)
            count ::= string.attribute_object(count_attribute)
            n := count.item.to_integer_32 - 1
            multiline := storage.elements.fast_has('%N')
            if multiline then
               stream.put_line(once "%"[")
            else
               stream.put_character('"')
            end
            check
               storage.elements.lower = 0
            end
            from
               i := 0
            until
               i > n
            loop
               c := storage.elements.item(i)
               inspect
                  c
               when  '%N' then
                  stream.put_new_line
                  put_indent(stream, indent + 1)
               when '%R' then
                  stream.put_string(once "%%R")
               when '%T' then
                  stream.put_string(once "%%T")
               when '%%' then
                  stream.put_string(once "%%%%")
               when '"' then
                  stream.put_string(once "%%%"")
               else
                  if c.code < ' '.code then
                     stream.put_character('%%')
                     stream.put_character('/')
                     stream.put_integer(c.code)
                     stream.put_character('/')
                  else
                     stream.put_character(c)
                  end
               end
               i := i + 1
            end
            if multiline then
               stream.put_new_line
               put_indent(stream, indent)
               stream.put_string(once "%"]")
            else
               stream.put_character('"')
            end
         end
         string.show_stack(stream, indent)
      end

   visit_type_boolean (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_native_array (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_tuple (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_routine (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_procedure (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_function (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_type_predicate (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

   visit_user_type (type: LIBERTY_ACTUAL_TYPE) is
      do
         object.show_stack(stream, indent)
      end

feature {LIBERTY_VOID_TYPE}
   visit_void (type: LIBERTY_VOID_TYPE) is
      do
         check object.is_void end
         object.show_stack(stream, indent)
      end

feature {}
   make (a_interpreter: like interpreter) is
      require
         a_interpreter /= Void
      do
         interpreter := a_interpreter
      ensure
         interpreter = a_interpreter
      end

   interpreter: LIBERTY_INTERPRETER

   object: LIBERTY_INTERPRETER_OBJECT
   indent: INTEGER
   stream: OUTPUT_STREAM

   storage_attribute: FIXED_STRING is
      once
         Result := "storage".intern
      end

   count_attribute: FIXED_STRING is
      once
         Result := "count".intern
      end

invariant
   interpreter /= Void

end -- class LIBERTY_INTERPRETER_OBJECT_PRINTER
