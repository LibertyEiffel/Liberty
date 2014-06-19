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
class LIBERTY_INTERPRETER_OBJECT_STRUCTURE

inherit
   LIBERTY_INTERPRETER_OBJECT

create {LIBERTY_INTERPRETER_OBJECT_CREATOR, LIBERTY_INTERPRETER_OBJECT_STRUCTURE}
   make

create {LIBERTY_INTERPRETER_OBJECT_STRUCTURE}
   with_attributes

feature {ANY}
   type: LIBERTY_ACTUAL_TYPE
   hash_code: INTEGER

   is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN
      local
         is_equal_feature: LIBERTY_FEATURE_DEFINITION
         expanded_equal: LIBERTY_INTERPRETER_OBJECT_BOOLEAN
      do
         if other.is_void then
            -- Obviously this object is not Void.
         elseif type = other.type then
            if type.is_expanded then
               is_equal_feature := type.feature_definition(is_equal_feature_name)
               expanded_equal ::= interpreter.item_feature(Current, is_equal_feature, {FAST_ARRAY[LIBERTY_EXPRESSION] << other >> }, position)
               Result := expanded_equal.item
            else
               Result := Current = other
            end
         end
      end

   converted_to (target_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT
      do
         not_yet_implemented
      end

   put_attribute (a_attribute_name: FIXED_STRING; a_attribute: LIBERTY_INTERPRETER_OBJECT)
      require
         a_attribute /= Void
      do
         attributes.put(a_attribute, a_attribute_name)
      ensure
         attribute_object(a_attribute_name) = a_attribute
      end

   del_attribute (a_attribute_name: FIXED_STRING)
      require
         a_attribute_name /= Void
      do
      ensure
         not has_attribute(a_attribute_name)
      end

   has_attribute (a_attribute_name: FIXED_STRING): BOOLEAN
      require
         a_attribute_name /= Void
      do
         Result := attributes.fast_has(a_attribute_name)
      end

   attribute_object (a_attribute_name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT
      require
         a_attribute_name /= Void
      do
         Result := attributes.fast_at(a_attribute_name)
      end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
   builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN
      local
         source: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
         i: INTEGER
      do
         if other.type /= type then
            interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name, a_position)
         else
            source ::= other
            Result := attributes.count = source.attributes.count
            from
               i := source.attributes.lower
            until
               not Result or else i > source.attributes.upper
            loop
               -- That "and then" expression may look funny but it ensures that both structures have exactly
               -- the same keys.
               Result := attributes.item(i).is_equal(source.attributes.at(attributes.key(i)))
                  and then source.attributes.item(i).is_equal(attributes.at(source.attributes.key(i)))
               i := i + 1
            end
         end
      end

   builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN
      do
         Result := builtin_is_equal(other, a_position)
      end

   builtin_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION)
      local
         source: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
         i: INTEGER; o: LIBERTY_INTERPRETER_OBJECT
      do
         if other.type /= type then
            interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name, a_position)
         else
            source ::= other
            attributes.clear_count
            from
               i := source.attributes.lower
            until
               i > source.attributes.upper
            loop
               o := source.attributes.item(i).as_right_value
               attributes.put(o, source.attributes.key(i))
               i := i + 1
            end
         end
      end

   builtin_twin (a_position: LIBERTY_POSITION): like Current
      local
         copy_feature: LIBERTY_FEATURE_DEFINITION
      do
         Result ::= interpreter.new_object(type, a_position)
         copy_feature := type.feature_definition(copy_feature_name)
         interpreter.call_feature(Result, copy_feature, {FAST_ARRAY[LIBERTY_EXPRESSION] << Current >> }, a_position)
      end

   builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION)
      do
         builtin_copy(other, a_position)
      end

   builtin_standard_twin (a_position: LIBERTY_POSITION): like Current
      local
         copy_feature: LIBERTY_FEATURE_DEFINITION
      do
         Result ::= interpreter.new_object(type, a_position)
         copy_feature := type.feature_definition(standard_copy_feature_name)
         interpreter.call_feature(Result, copy_feature, {FAST_ARRAY[LIBERTY_EXPRESSION] << Current >> }, a_position)
      end

feature {LIBERTY_INTERPRETER_OBJECT}
   do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT
      local
         i: INTEGER; o: LIBERTY_INTERPRETER_OBJECT
         att: like attributes
      do
         Result := deep_twin_memory.reference_at(Current)
         if Result = Void then
            create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} att.with_capacity(attributes.capacity)
            from
               i := attributes.lower
            until
               i > attributes.upper
            loop
               o := attributes.item(i).do_deep_twin(deep_twin_memory, a_position)
               att.put(o, attributes.key(i))
               i := i + 1
            end
            create {LIBERTY_INTERPRETER_OBJECT_STRUCTURE} Result.with_attributes(interpreter, type, att, hash_code, a_position)
            deep_twin_memory.put(Result, Current)
         end
      end

   do_deep_equal (object: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): BOOLEAN
      local
         i: INTEGER; o: LIBERTY_INTERPRETER_OBJECT
         compared: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
      do
         if deep_equal_memory.fast_has(Current) then
            Result := True
         elseif object.type /= type then
            interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + object.type.full_name, a_position)
         elseif compared ?:= object then -- may be Void!
            compared ::= object
            Result := attributes.count = compared.attributes.count
            from
               i := attributes.lower
            until
               not Result or else i > attributes.upper
            loop
               o := compared.attributes.reference_at(attributes.key(i))
               Result := o /= Void and then attributes.item(i).do_deep_equal(o, deep_equal_memory, a_position)
               i := i + 1
            end
         end
         deep_equal_memory.fast_add(Current)
      end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
   show_stack (o: OUTPUT_STREAM; indent: INTEGER)
      local
         i: INTEGER
      do
         o.put_character('{')
         o.put_string(type.full_name)
         if not type.is_expanded then
            o.put_character('@')
            o.put_integer(hash_code)
         end
         if showing then
            check
               expanded_objects_cannot_be_recursively_referenced: not type.is_expanded
            end
         else
            showing := True
            o.put_line(once " [")
            from
               i := attributes.lower
            until
               i > attributes.upper
            loop
               interpreter.object_printer.put_indent(o, indent + 1)
               o.put_string(attributes.key(i))
               o.put_string(once " = ")
               interpreter.object_printer.print_object(o, attributes.item(i), indent + 1)
               i := i + 1
            end
            interpreter.object_printer.put_indent(o, indent)
            o.put_string(once "] ")
            showing := False
         end
         o.put_character('}')
         o.put_new_line
      end

feature {}
   showing: BOOLEAN

   make (a_interpreter: like interpreter; a_type: like type; a_position: like position)
      require
         a_interpreter /= Void
         a_type /= Void
         a_position /= Void
      do
         interpreter := a_interpreter
         type := a_type
         position := a_position
         create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} attributes.with_capacity(2)
         hash_code := new_hash_code
      ensure
         interpreter = a_interpreter
         type = a_type
         position = a_position
      end

   with_attributes (a_interpreter: like interpreter; a_type: like type; a_attributes: like attributes; a_hash_code: like hash_code; a_position: like position)
      require
         a_interpreter /= Void
         a_type /= Void
         a_attributes /= Void
         a_position /= Void
      do
         interpreter := a_interpreter
         type := a_type
         attributes := a_attributes
         position := a_position
         hash_code := a_hash_code
      ensure
         interpreter = a_interpreter
         type = a_type
         attributes = a_attributes
         position = a_position
         hash_code = a_hash_code
      end

feature {LIBERTY_INTERPRETER_OBJECT_STRUCTURE}
   attributes: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]

feature {}
   expanded_is_equal (other: like Current): BOOLEAN
      require
         other.type = type
         type.is_expanded
      local
         i: INTEGER; name: FIXED_STRING
      do
         if attributes.count = other.attributes.count then
            from
               Result := True
               i := attributes.lower
            until
               not Result or else i > attributes.upper
            loop
               name := attributes.key(i)
               Result := other.attributes.fast_has(name) and then attributes.item(i).is_equal(other.attributes.fast_at(name))
               i := i + 1
            end
         end
      end

   expanded_twin: like Current
      local
         i: INTEGER; att: like attributes
      do
         create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} att.with_capacity(attributes.count)
         from
            i := attributes.lower
         until
            i > attributes.upper
         loop
            att.add(attributes.item(i).as_right_value, attributes.key(i))
            i := i + 1
         end
         create Result.with_attributes(interpreter, type, att, hash_code, position)
      end

   copy_feature_name: LIBERTY_FEATURE_NAME
      once
         create Result.make("copy".intern)
      end

   standard_copy_feature_name: LIBERTY_FEATURE_NAME
      once
         create Result.make("standard_copy".intern)
      end

   is_equal_feature_name: LIBERTY_FEATURE_NAME
      once
         create Result.make("is_equal".intern)
      end

   new_hash_code: INTEGER
      do
         if type.is_expanded then
            hash_code_producer.increment
            Result := hash_code_producer.value
         else
            Result := to_pointer.hash_code
         end
      end

   hash_code_producer: COUNTER
      once
         create Result
      end

invariant
   attributes /= Void

end -- class LIBERTY_INTERPRETER_OBJECT_STRUCTURE
