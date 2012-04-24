-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_JAVA
   -- defines mini language for external clause for interfacing to Java classes
   -- examples:
   --
   -- object creation:                  JAVA class java.lang.String new (char[])
   -- object cast:                      JAVA class java.lang.String checkcast
   -- object instanceof:                JAVA class java.lang.String instanceof
   --                                   JAVA class int[] instanceof
   -- static method call:               JAVA class java.lang.String method static java.lang.String valueOf(char[])
   -- method call:                      JAVA class java.lang.String method int length()
   -- interface method call:            JAVA interface java.lang.Comparable method int compareTo(java.lang.Object)
   -- static field read:                JAVA class MyClass get field static int theClassInteger
   -- static field write:               JAVA class MyClass set field static int theClassInteger
   -- instance field read:              JAVA class MyClass get field int aInstanceInteger
   -- instance field write:             JAVA class MyClass set field int aInstanceInteger
   -- array creation:                   JAVA array java.lang.Object new
   --                                   JAVA array int new
   -- array length:                     JAVA array java.lang.Object length
   --                                   JAVA array int length
   -- array read:                       JAVA array java.lang.Object get
   --                                   JAVA array int get
   -- array write:                      JAVA array java.lang.Object set
   --                                   JAVA array int set
   -- multidimensional array creation:  JAVA multiarray 2 java.lang.Object new
   --                                   JAVA multiarray 2 int new
   -- multidimensional array length:    JAVA multiarray 2 java.lang.Object length
   --                                   JAVA multiarray 2 int length
   -- multidimensional array read:      JAVA multiarray 2 java.lang.Object get
   --                                   JAVA multiarray 2 int get
   -- multidimensional array write:     JAVA multiarray 2 java.lang.Object set
   --                                   JAVA multiarray 2 int set
   -- throw exception:                  JAVA exception java.lang.Exception throw
   -- get exception (in rescue clause): JAVA exception java.lang.Exception get
   -- declare method synchronized:      JAVA synchronized
   -- monitor enter:                    JAVA monitorenter
   -- monitor exit:                     JAVA monitorexit
   -- declare field transient:          JAVA transient
   -- declare field volatile:           JAVA volatile

inherit
   NATIVE
   FROZEN_STRING_LIST

creation {ANY}
   make

feature {ANY}
   accept (visitor: NATIVE_JAVA_VISITOR) is
      do
         visitor.visit_native_java(Current)
      end

feature {ANY}
   class_keyword_index: INTEGER is 2

   class_name_index: INTEGER is 3

   member_index: INTEGER is 4

   min_method_token_count: INTEGER is 6

   min_field_token_count: INTEGER is 7

   new_class_count: INTEGER is 5

   new_descriptor_index: INTEGER is 5

   simple_token_count: INTEGER is 2

   simple_index: INTEGER is 2

   simple_class_token_count: INTEGER is 4

   array_count: INTEGER is 4

   exception_count: INTEGER is 4

   multiarray_count: INTEGER is 5

   multiarray_dimensions_index: INTEGER is 3

   multiarray_class_name_index: INTEGER is 4

   multiaray_member_index: INTEGER is 5

feature {ANY}
   parse_external_tag is
      local
         s: STRING; i: INTEGER; next_index: INTEGER
      do
         s := external_tag.to_string
         tokens.clear_count
         s.split_in(tokens)
         if tokens.valid_index(class_keyword_index) and tokens.valid_index(class_name_index) and then tokens.item(class_keyword_index).is_equal(once "class") then
            is_class := True
            jvm_class_name := tokens.item(class_name_index)
            jvm_class_descriptor := java_to_jvm_class_descriptor(jvm_class_name)
         end
         if tokens.valid_index(class_keyword_index) and tokens.valid_index(class_name_index) and then tokens.item(class_keyword_index).is_equal(once "interface") then
            is_interface := True
            jvm_class_name := tokens.item(class_name_index)
            jvm_class_descriptor := java_to_jvm_class_descriptor(jvm_class_name)
         end
         if tokens.count = new_class_count and then tokens.item(member_index).is_equal(once "new") then
            is_class_new := True
            tmp_name.clear_count
            from
               i := new_descriptor_index
            until
               i > tokens.count
            loop
               tmp_name.append(tokens.item(i))
               i := i + 1
            end
            tmp_name.remove_all_occurrences(' ')
            tmp_name.remove_all_occurrences('%T')
            tmp_name.remove_all_occurrences('%N')
            i := tmp_name.index_of('(', 1)
            jvm_method_descriptor := get_method_descriptor(once "Void", tmp_name.substring(i + 1, tmp_name.count))
         end
         if tokens.count >= min_method_token_count and then tokens.item(member_index).is_equal(once "method") then
            if tokens.count >= min_method_token_count + 1 and then tokens.item(member_index + 1).is_equal(once "static") then
               is_static_method := True
               next_index := member_index + 2
            else
               if is_class then
                  is_method := True
               elseif is_interface then
                  is_interface_method := True
               end
               next_index := member_index + 1
            end
            jvm_field_or_return_type := tokens.item(next_index)
            tmp_name.clear_count
            from
               i := next_index + 1
            until
               i > tokens.count
            loop
               tmp_name.append(tokens.item(i))
               i := i + 1
            end
            tmp_name.remove_all_occurrences(' ')
            tmp_name.remove_all_occurrences('%T')
            tmp_name.remove_all_occurrences('%N')
            i := tmp_name.index_of('(', 1)
            jvm_method_name := tmp_name.substring(1, i - 1)
            jvm_method_descriptor := get_method_descriptor(jvm_field_or_return_type, tmp_name.substring(i + 1, tmp_name.count))
         end
         if tokens.count >= min_field_token_count and then (tokens.item(member_index + 1).is_equal(once "field") and tokens.item(member_index).is_equal(once "get")) then
            if tokens.count >= min_field_token_count + 1 and then tokens.item(member_index + 2).is_equal(once "static") then
               is_static_field_get := True
               next_index := member_index + 3
            else
               is_field_get := True
               next_index := member_index + 2
            end
            jvm_field_or_return_type := tokens.item(next_index)
            jvm_field_descriptor := java_to_jvm_descriptor(tokens.item(next_index))
            jvm_field_name := tokens.item(next_index + 1)
         end
         if tokens.count >= min_field_token_count and then (tokens.item(member_index + 1).is_equal(once "field") and tokens.item(member_index).is_equal(once "set")) then
            if tokens.count >= min_field_token_count + 1 and then tokens.item(member_index + 2).is_equal(once "static") then
               is_static_field_set := True
               next_index := member_index + 3
            else
               is_field_set := True
               next_index := member_index + 2
            end
            jvm_field_or_return_type := tokens.item(next_index)
            jvm_field_descriptor := java_to_jvm_descriptor(tokens.item(next_index))
            jvm_field_name := tokens.item(next_index + 1)
         end
         if tokens.count = simple_class_token_count and then tokens.item(member_index).is_equal(once "checkcast") then
            is_checkcast := True
         end
         if tokens.count = simple_class_token_count and then tokens.item(member_index).is_equal(once "instanceof") then
            is_instanceof := True
         end
         if tokens.count = simple_token_count and then tokens.item(simple_index).is_equal(once "synchronized") then
            is_synchronized := True
         end
         if tokens.count = simple_token_count and then tokens.item(simple_index).is_equal(once "monitorenter") then
            is_monitorenter := True
         end
         if tokens.count = simple_token_count and then tokens.item(simple_index).is_equal(once "monitorexit") then
            is_monitorexit := True
         end
         if tokens.count = simple_token_count and then tokens.item(simple_index).is_equal(once "transient") then
            is_transient := True
         end
         if tokens.count = simple_token_count and then tokens.item(simple_index).is_equal(once "volatile") then
            is_volatile := True
         end
         if tokens.count = array_count and then tokens.item(class_keyword_index).is_equal(once "array") then
            is_array := True
            jvm_array_type := tokens.item(class_name_index)
            jvm_array_descriptor := java_to_jvm_descriptor(jvm_array_type)
            if tokens.item(member_index).is_equal(once "length") then
               is_array_length := True
            elseif tokens.item(member_index).is_equal(once "get") then
               is_array_get := True
            elseif tokens.item(member_index).is_equal(once "set") then
               is_array_set := True
            elseif tokens.item(member_index).is_equal(once "new") then
               is_array_new := True
            end
         end
         if tokens.count = multiarray_count and then (tokens.item(class_keyword_index).is_equal(once "multiarray") and tokens.item(multiarray_dimensions_index).is_integer) then
            is_multiarray := True
            jvm_multiarray_dimensions_count := tokens.item(multiarray_dimensions_index).to_integer
            jvm_array_type := tokens.item(multiarray_class_name_index)
            jvm_array_descriptor := java_to_jvm_descriptor(jvm_array_type)
            jvm_multiarray_descriptor := java_to_jvm_descriptor_multiarray(jvm_array_type, jvm_multiarray_dimensions_count)
            if tokens.item(multiaray_member_index).is_equal(once "length") then
               is_array_length := True
            elseif tokens.item(multiaray_member_index).is_equal(once "get") then
               is_array_get := True
            elseif tokens.item(multiaray_member_index).is_equal(once "set") then
               is_array_set := True
            elseif tokens.item(multiaray_member_index).is_equal(once "new") then
               is_array_new := True
            end
         end
         if tokens.count = exception_count and then tokens.item(class_keyword_index).is_equal(once "exception") then
            is_exception := True
            jvm_exception_type := tokens.item(class_name_index)
            jvm_exception_descriptor := java_to_jvm_descriptor(jvm_exception_type)
            if tokens.item(member_index).is_equal(once "throw") then
               is_exception_throw := True
            elseif tokens.item(member_index).is_equal(once "get") then
               is_exception_get := True
            end
         end
      end

   check_external_tag (rf: RUN_FEATURE) is
      local
         b: BOOLEAN
      do
         -- class
         if is_class and then (jvm_class_name /= Void and is_class_new and jvm_method_descriptor /= Void) then
            b := True
         end
         if is_class and then (jvm_class_name /= Void and is_static_method and jvm_method_descriptor /= Void) then
            b := True
         end
         if is_class and then (jvm_class_name /= Void and is_method and jvm_method_descriptor /= Void) then
            b := True
         end
         if is_class and then (jvm_class_name /= Void and is_static_field_get and jvm_field_descriptor /= Void) then
            b := True
         end
         if is_class and then (jvm_class_name /= Void and is_static_field_set and jvm_field_descriptor /= Void) then
            b := True
         end
         if is_class and then (jvm_class_name /= Void and is_field_get and jvm_field_descriptor /= Void) then
            b := True
         end
         if is_class and then (jvm_class_name /= Void and is_field_set and jvm_field_descriptor /= Void) then
            b := True
         end
         -- interface
         if is_interface and then (jvm_class_name /= Void and is_interface_method and jvm_method_descriptor /= Void) then
            b := True
         end
         if is_interface and then (jvm_class_name /= Void and is_static_field_get and jvm_method_descriptor /= Void) then
            b := True
         end
         -- array
         if is_array and then (is_array_new and jvm_array_descriptor /= Void) then
            b := True
         end
         if is_array and then (is_array_get and jvm_array_descriptor /= Void) then
            b := True
         end
         if is_array and then (is_array_set and jvm_array_descriptor /= Void) then
            b := True
         end
         if is_array and then is_array_length then
            b := True
         end
         -- multiarray
         if is_multiarray and then (is_array_new and jvm_array_descriptor /= Void and jvm_multiarray_dimensions_count > 0) then
            b := True
         end
         if is_multiarray and then (is_array_get and jvm_array_descriptor /= Void and jvm_multiarray_dimensions_count > 0) then
            b := True
         end
         if is_multiarray and then (is_array_set and jvm_array_descriptor /= Void and jvm_multiarray_dimensions_count > 0) then
            b := True
         end
         if is_multiarray and then (is_array_length and jvm_multiarray_dimensions_count > 0) then
            b := True
         end
         -- exception
         if is_exception and then is_exception_get then
            b := True
         end
         if is_exception and then is_exception_throw then
            b := True
         end
         -- checkcast
         if is_class and then (is_checkcast and jvm_class_name /= Void) then
            b := True
         end
         -- instanceof
         if is_class and then (is_instanceof and jvm_class_name /= Void) then
            b := True
         end
         -- singles
         if is_synchronized or is_monitorenter or is_monitorexit or is_transient or is_volatile then
            b := True
         end
         if b = False then
            fe_c2jvm(rf)
         end
      end

feature {EXTERNAL_ROUTINE}
   collect (type: TYPE; external_routine: EXTERNAL_ROUTINE) is
      do
         notify_external_assignments(type, external_routine)
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE) is
      do
         not_yet_implemented
      end

feature {ANY}
   tokens: ARRAY[STRING] is
      once
         create Result.with_capacity(20, 1)
      end

   method_parameters: ARRAY[STRING] is
      once
         create Result.with_capacity(20, 1)
      end

   is_class: BOOLEAN

   is_interface: BOOLEAN

   is_class_new: BOOLEAN

   is_static_method: BOOLEAN

   is_method: BOOLEAN

   is_interface_method: BOOLEAN

   is_static_field_get: BOOLEAN

   is_static_field_set: BOOLEAN

   is_field_get: BOOLEAN

   is_field_set: BOOLEAN

   is_array: BOOLEAN

   is_array_get: BOOLEAN

   is_array_set: BOOLEAN

   is_array_new: BOOLEAN

   is_array_length: BOOLEAN

   jvm_array_type: STRING

   jvm_array_descriptor: STRING

   is_multiarray: BOOLEAN

   jvm_multiarray_dimensions_count: INTEGER

   jvm_multiarray_descriptor: STRING

   is_exception: BOOLEAN

   is_exception_get: BOOLEAN

   is_exception_throw: BOOLEAN

   is_checkcast: BOOLEAN

   is_instanceof: BOOLEAN

   is_synchronized: BOOLEAN

   is_monitorenter: BOOLEAN

   is_monitorexit: BOOLEAN

   is_transient: BOOLEAN

   is_volatile: BOOLEAN

   jvm_class_name: STRING

   jvm_class_descriptor: STRING

   jvm_method_name: STRING

   jvm_field_name: STRING

   jvm_method_descriptor: STRING

   jvm_field_or_return_type: STRING

   jvm_field_descriptor: STRING

   jvm_exception_type: STRING

   jvm_exception_descriptor: STRING

feature {ANY}
   use_current (er: EXTERNAL_ROUTINE): BOOLEAN is
      do
      end

   jvm_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      local
         space, stack_space, i, j, idx, idx_class: INTEGER; ca: like code_attribute; s: STRING
      do
         parse_external_tag
         check_external_tag(rf8)
         s := external_tag.to_string
         if s.has_substring(once "class") then
            space := 2
         end
         ca := code_attribute
         if is_static_method then
            space := jvm.push_arguments
            idx := constant_pool.idx_methodref3(jvm_class_descriptor, jvm_method_name, jvm_method_descriptor)
            space := rf8.result_type.jvm_stack_space - space
            ca.opcode_invokestatic(idx, space)
         end
         if is_class_new then
            idx_class := constant_pool.idx_class2(jvm_class_descriptor)
            idx := constant_pool.idx_methodref3(jvm_class_descriptor, once "<init>", jvm_method_descriptor)
            ca.opcode_new(idx_class)
            ca.opcode_dup
            space := - jvm.push_arguments
            ca.opcode_invokespecial(idx, space)
         end
         if is_method then
            space := jvm.push_arguments
            idx := constant_pool.idx_methodref3(jvm_class_descriptor, jvm_method_name, jvm_method_descriptor)
            space := rf8.result_type.jvm_stack_space - space
            ca.opcode_invokevirtual(idx, space)
         end
         if is_interface_method then
            stack_space := jvm.push_arguments
            idx := constant_pool.idx_interface_methodref3(jvm_class_descriptor, jvm_method_name, jvm_method_descriptor)
            space := rf8.result_type.jvm_stack_space - stack_space
            ca.opcode_invokeinterface(idx, space, stack_space)
         end
         if is_static_field_get then
            space := jvm.push_arguments
            idx := constant_pool.idx_fieldref3(jvm_class_descriptor, jvm_field_name, jvm_field_descriptor)
            space := rf8.result_type.jvm_stack_space - space
            ca.opcode_getstatic(idx, space)
         end
         if is_field_get then
            space := jvm.push_arguments
            idx := constant_pool.idx_fieldref3(jvm_class_descriptor, jvm_field_name, jvm_field_descriptor)
            space := rf8.result_type.jvm_stack_space - space
            ca.opcode_getfield(idx, space)
         end
         if is_checkcast then
            space := jvm.push_arguments
            idx_class := constant_pool.idx_class2(jvm_class_descriptor)
            space := rf8.result_type.jvm_stack_space - space
            ca.opcode_checkcast(idx_class)
         end
         if is_instanceof then
            space := jvm.push_arguments
            idx_class := constant_pool.idx_class2(jvm_class_descriptor)
            space := rf8.result_type.jvm_stack_space - space
            ca.opcode_instanceof(idx_class)
         end
         if is_array_new and is_array then
            space := jvm.push_arguments
            if jvm_array_descriptor.is_equal(once "Z") then
               ca.opcode_newarray(4)
            elseif jvm_array_descriptor.is_equal(once "C") then
               ca.opcode_newarray(5)
            elseif jvm_array_descriptor.is_equal(once "F") then
               ca.opcode_newarray(6)
            elseif jvm_array_descriptor.is_equal(once "D") then
               ca.opcode_newarray(7)
            elseif jvm_array_descriptor.is_equal(once "B") then
               ca.opcode_newarray(8)
            elseif jvm_array_descriptor.is_equal(once "S") then
               ca.opcode_newarray(9)
            elseif jvm_array_descriptor.is_equal(once "I") then
               ca.opcode_newarray(10)
            elseif jvm_array_descriptor.is_equal(once "J") then
               ca.opcode_newarray(11)
            else
               idx_class := constant_pool.idx_class2(jvm_array_descriptor)
               space := rf8.result_type.jvm_stack_space - space
               ca.opcode_anewarray(idx_class)
            end
         end
         if is_array_get and is_array then
            space := jvm.push_arguments
            if jvm_array_descriptor.is_equal("Z") then
               ca.opcode_baload
            elseif jvm_array_descriptor.is_equal("C") then
               ca.opcode_caload
            elseif jvm_array_descriptor.is_equal("F") then
               ca.opcode_faload
            elseif jvm_array_descriptor.is_equal("D") then
               ca.opcode_daload
            elseif jvm_array_descriptor.is_equal("B") then
               ca.opcode_baload
            elseif jvm_array_descriptor.is_equal("S") then
               ca.opcode_saload
            elseif jvm_array_descriptor.is_equal("I") then
               ca.opcode_iaload
            elseif jvm_array_descriptor.is_equal("J") then
               ca.opcode_laload
            else
               ca.opcode_aaload
            end
         end
         if is_array_length and is_array then
            space := jvm.push_arguments
            ca.opcode_arraylength
         end
         if is_array_new and is_multiarray then
            space := jvm.push_arguments
            idx_class := constant_pool.idx_class2(jvm_multiarray_descriptor)
            space := rf8.result_type.jvm_stack_space - space
            ca.opcode_multianewarray(idx_class, jvm_multiarray_dimensions_count)
         end
         if is_array_get and is_multiarray then
            space := jvm.push_ith_argument(1)
            from
               i := jvm.arg_count
               j := 1
            until
               i < 2
            loop
               if j /= jvm_multiarray_dimensions_count then
                  space := jvm.push_ith_argument(i)
                  ca.opcode_aaload
               else
                  space := jvm.push_ith_argument(i)
                  if jvm_array_descriptor.is_equal("Z") then
                     ca.opcode_baload
                  elseif jvm_array_descriptor.is_equal("C") then
                     ca.opcode_caload
                  elseif jvm_array_descriptor.is_equal("F") then
                     ca.opcode_faload
                  elseif jvm_array_descriptor.is_equal("D") then
                     ca.opcode_daload
                  elseif jvm_array_descriptor.is_equal("B") then
                     ca.opcode_baload
                  elseif jvm_array_descriptor.is_equal("S") then
                     ca.opcode_saload
                  elseif jvm_array_descriptor.is_equal("I") then
                     ca.opcode_iaload
                  elseif jvm_array_descriptor.is_equal("J") then
                     ca.opcode_laload
                  else
                     ca.opcode_aaload
                  end
               end
               i := i - 1
               j := j + 1
            end
         end
         if is_array_length and is_multiarray then
            space := jvm.push_ith_argument(1)
            from
               i := jvm.arg_count
            until
               i < 2
            loop
               space := jvm.push_ith_argument(i)
               ca.opcode_aaload
               i := i - 1
            end
            ca.opcode_arraylength
         end
         if is_exception_get then
            idx := constant_pool.idx_string("Exceptions")
            ca.opcode_aload(jvm.current_frame.jvm_max_locals - 1)
         end
      end

   jvm_define_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
      end

   jvm_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      local
         space, stack_space, i, j, idx, idx_name: INTEGER; ca: like code_attribute; s: STRING
      do
         parse_external_tag
         check_external_tag(rf7)
         s := external_tag.to_string
         if s.has_substring(once "class") then
            space := 2
         end
         ca := code_attribute
         if is_static_method then
            space := jvm.push_arguments
            idx := constant_pool.idx_methodref3(jvm_class_descriptor, jvm_method_name, jvm_method_descriptor)
            ca.opcode_invokestatic(idx, space)
         end
         if is_method then
            space := - jvm.push_arguments
            idx := constant_pool.idx_methodref3(jvm_class_descriptor, jvm_method_name, jvm_method_descriptor)
            ca.opcode_invokevirtual(idx, space)
         end
         if is_interface_method then
            space := - jvm.push_arguments
            stack_space := - space
            idx := constant_pool.idx_interface_methodref3(jvm_class_descriptor, jvm_method_name, jvm_method_descriptor)
            ca.opcode_invokeinterface(idx, space, stack_space)
         end
         if is_static_field_set then
            idx := constant_pool.idx_fieldref3(jvm_class_descriptor, jvm_field_name, jvm_field_descriptor)
            space := - jvm.push_arguments
            ca.opcode_putstatic(idx, space)
         end
         if is_field_set then
            idx := constant_pool.idx_fieldref3(jvm_class_descriptor, jvm_field_name, jvm_field_descriptor)
            space := - jvm.push_arguments
            ca.opcode_putfield(idx, space)
         end
         if is_array_set and is_array then
            space := jvm.push_arguments
            if jvm_array_descriptor.is_equal("Z") then
               ca.opcode_bastore
            elseif jvm_array_descriptor.is_equal("C") then
               ca.opcode_castore
            elseif jvm_array_descriptor.is_equal("F") then
               ca.opcode_fastore
            elseif jvm_array_descriptor.is_equal("D") then
               ca.opcode_dastore
            elseif jvm_array_descriptor.is_equal("B") then
               ca.opcode_bastore
            elseif jvm_array_descriptor.is_equal("S") then
               ca.opcode_sastore
            elseif jvm_array_descriptor.is_equal("I") then
               ca.opcode_iastore
            elseif jvm_array_descriptor.is_equal("J") then
               ca.opcode_lastore
            else
               ca.opcode_aastore
            end
         end
         if is_array_set and is_multiarray then
            space := jvm.push_ith_argument(1)
            from
               i := jvm.arg_count
               j := 1
            until
               i < 3
            loop
               if i /= 3 then
                  space := jvm.push_ith_argument(i)
                  ca.opcode_aaload
               elseif j = jvm_multiarray_dimensions_count then
                  space := jvm.push_ith_argument(i)
                  space := jvm.push_ith_argument(2)
                  if jvm_array_descriptor.is_equal("Z") then
                     ca.opcode_bastore
                  elseif jvm_array_descriptor.is_equal("C") then
                     ca.opcode_castore
                  elseif jvm_array_descriptor.is_equal("F") then
                     ca.opcode_fastore
                  elseif jvm_array_descriptor.is_equal("D") then
                     ca.opcode_dastore
                  elseif jvm_array_descriptor.is_equal("B") then
                     ca.opcode_bastore
                  elseif jvm_array_descriptor.is_equal("S") then
                     ca.opcode_sastore
                  elseif jvm_array_descriptor.is_equal("I") then
                     ca.opcode_iastore
                  elseif jvm_array_descriptor.is_equal("J") then
                     ca.opcode_lastore
                  else
                     ca.opcode_aastore
                  end
               else
                  space := jvm.push_ith_argument(i)
                  space := jvm.push_ith_argument(2)
                  ca.opcode_aastore
               end
               i := i - 1
               j := j + 1
            end
         end
         if is_synchronized then
            method_info.set_synchronized
         end
         if is_monitorenter then
            space := - jvm.push_arguments
            ca.opcode_monitorenter
         end
         if is_monitorexit then
            space := - jvm.push_arguments
            ca.opcode_monitorexit
         end
         if is_exception_throw then
            space := jvm.push_arguments
            ca.opcode_athrow
         end
         if is_transient then
            s := jvm.ith_argument_as_manifest_string(1)
            if s /= Void then
               idx_name := constant_pool.idx_utf8(s)
               field_info.field_set_transient(idx_name)
            end
         end
         if is_volatile then
            s := jvm.ith_argument_as_manifest_string(1)
            if s /= Void then
               idx_name := constant_pool.idx_utf8(s)
               field_info.field_set_volatile(idx_name)
            end
         end
      end

   jvm_define_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
      end

   jvm_add_method_for_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
      end

   jvm_add_method_for_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
      end

feature {}
   idx_fieldref (er: EXTERNAL_ROUTINE): INTEGER is
      local
         i: INTEGER; ms: MANIFEST_STRING; alias_string: STRING; cp: like constant_pool
      do
         cp := constant_pool
         ms := er.alias_string
         if ms = Void then
            error_handler.add_position(er.start_position)
            error_handler.append("Missing %"alias%" field description (see external.html documentation).")
         end
         alias_string := ms.to_string
         from
            i := 1
            tmp_class.clear_count
         until
            alias_string.item(i) = '.'
         loop
            tmp_class.extend(alias_string.item(i))
            i := i + 1
         end
         from
            i := i + 1
            tmp_name.clear_count
         until
            alias_string.item(i) = ' '
         loop
            tmp_name.extend(alias_string.item(i))
            i := i + 1
         end
         from
            i := i + 1
            tmp_descriptor.clear_count
         until
            i > alias_string.count
         loop
            tmp_descriptor.extend(alias_string.item(i))
            i := i + 1
         end
         Result := cp.idx_fieldref3(tmp_class, tmp_name, tmp_descriptor)
      end

   idx_utf8ref (er: EXTERNAL_ROUTINE): INTEGER is
      local
         alias_string: MANIFEST_STRING; cp: like constant_pool
      do
         cp := constant_pool
         alias_string := er.alias_string
         if alias_string = Void then
            error_handler.add_position(er.start_position)
            error_handler.append("Missing %"alias%" field description (see external.html documentation).")
         end
         Result := cp.idx_utf8(alias_string.to_string)
      end

   idx_interface_methodref (er: EXTERNAL_ROUTINE): INTEGER is
      local
         i: INTEGER; ms: MANIFEST_STRING; alias_string: STRING; cp: like constant_pool
      do
         cp := constant_pool
         ms := er.alias_string
         if ms = Void then
            error_handler.add_position(er.start_position)
            error_handler.append("Missing %"alias%" field description (see external.html documentation).")
         end
         alias_string := ms.to_string
         from
            i := 1
            tmp_class.clear_count
         until
            alias_string.item(i) = '.'
         loop
            tmp_class.extend(alias_string.item(i))
            i := i + 1
         end
         from
            i := i + 1
            tmp_name.clear_count
         until
            alias_string.item(i) = ' '
         loop
            tmp_name.extend(alias_string.item(i))
            i := i + 1
         end
         from
            i := i + 1
            tmp_descriptor.clear_count
         until
            i > alias_string.count
         loop
            tmp_descriptor.extend(alias_string.item(i))
            i := i + 1
         end
         Result := cp.idx_interface_methodref3(tmp_class, tmp_name, tmp_descriptor)
      end

   tmp_class: STRING is
      once
         create Result.make(32)
      end

   tmp_name: STRING is
      once
         create Result.make(32)
      end

   tmp_descriptor: STRING is
      once
         create Result.make(32)
      end

   spec_string: STRING is
      once
         create Result.make(64)
      end

   string_buffer: STRING is
      once
         create Result.make(256)
      end

   get_method_descriptor (return_type: STRING; parameter_string: STRING): STRING is
      local
         i: INTEGER; amp: ARRAY[STRING]
      do
         amp := get_method_parameters(parameter_string)
         create Result.make(256)
         Result.extend('(')
         from
            i := 1
         until
            i > amp.count
         loop
            Result.append(java_to_jvm_descriptor(amp.item(i)))
            i := i + 1
         end
         Result.extend(')')
         Result.append(java_to_jvm_descriptor(return_type))
      end

   get_method_parameters (s: STRING): ARRAY[STRING] is
      local
         state, i: INTEGER; c: CHARACTER
      do
         -- state = 0: waiting next word.
         -- state = 1: inside a new word.
         Result := method_parameters
         Result.clear_count
         if s.count > 0 then
            from
               i := 1
            until
               i > s.count
            loop
               c := s.item(i)
               if state = 0 then
                  if c /= ',' and c /= ')' then
                     string_buffer.clear_count
                     string_buffer.append_character(c)
                     state := 1
                  end
               else
                  if c /= ',' and c /= ')' then
                     string_buffer.append_character(c)
                  else
                     Result.add_last(string_buffer.twin)
                     state := 0
                  end
               end
               i := i + 1
            end
            if state = 1 then
               Result.add_last(string_buffer.twin)
            end
         end
      end
      --   Xjava_to_jvm_class_descriptor( s: STRING ): STRING is
      --      local
      --         i: INTEGER
      --         ac: INTEGER
      --      do
      --         create Result.make_from_string( s )
      --
      ---- check for array
      --
      --         i := Result.index_of( '[', 1 )
      --         if i /= 0 then
      --            ac := Result.occurrences( '[' )
      --            Result.remove_all_occurrences( '[' )
      --            Result.remove_all_occurrences( ']' )
      --         end
      --
      ---- change dots to slashes
      --
      --         from
      --            i := 1
      --         until
      --            i > Result.count
      --         loop
      --            if Result.item(i) = '.' then
      --               Result.put( '/', i )
      --            end
      --            i := i + 1
      --         end
      --
      ---- if was array, add preceeding [s
      --
      --         if ac /= 0 then
      --            Result.precede( 'L' )
      --            Result.extend( ';' )
      --            from
      --               i := 1
      --            until
      --               i > ac
      --            loop
      --               Result.precede( '[' )
      --               i := i + 1
      --            end
      --
      --         end
      --
      --      end

   java_to_jvm_class_descriptor (s: STRING): STRING is
      local
         i: INTEGER; ac: INTEGER; is_primitive: BOOLEAN
      do
         create Result.make_from_string(s)
         -- check for array
         i := Result.index_of('[', 1)
         if i /= 0 then
            ac := Result.occurrences('[')
            Result.remove_all_occurrences('[')
            Result.remove_all_occurrences(']')
         end
         -- check for primitive type and convert
         if Result.is_equal(once "boolean") then
            Result.make_from_string(once "Z")
            is_primitive := True
         elseif Result.is_equal(once "char") then
            Result.make_from_string(once "C")
            is_primitive := True
         elseif Result.is_equal(once "byte") then
            Result.make_from_string(once "B")
            is_primitive := True
         elseif Result.is_equal(once "short") then
            Result.make_from_string(once "S")
            is_primitive := True
         elseif Result.is_equal(once "int") then
            Result.make_from_string(once "I")
            is_primitive := True
         elseif Result.is_equal(once "long") then
            Result.make_from_string(once "J")
            is_primitive := True
         elseif Result.is_equal(once "float") then
            Result.make_from_string(once "F")
            is_primitive := True
         elseif Result.is_equal(once "double") then
            Result.make_from_string(once "D")
            is_primitive := True
         elseif Result.is_equal(once "Void") then
            Result.make_from_string(once "V")
         else
            -- is class
            -- change dots to slashes
            from
               i := 1
            until
               i > Result.count
            loop
               if Result.item(i) = '.' then
                  Result.put('/', i)
               end
               i := i + 1
            end
         end
         -- if was array, add preceeding L, post ;, and preceeding [s
         if ac /= 0 then
            if not is_primitive then
               Result.extend(';')
               Result.precede('L')
            end
            from
               i := 1
            until
               i > ac
            loop
               Result.precede('[')
               i := i + 1
            end
         end
      end

   java_to_jvm_descriptor (s: STRING): STRING is
      local
         i: INTEGER; ac: INTEGER
      do
         create Result.make_from_string(s)
         -- check for array
         i := Result.index_of('[', 1)
         if i /= 0 then
            ac := Result.occurrences('[')
            Result.remove_all_occurrences('[')
            Result.remove_all_occurrences(']')
         end
         -- check for primitive type and convert
         if Result.is_equal(once "boolean") then
            Result.make_from_string(once "Z")
         elseif Result.is_equal(once "char") then
            Result.make_from_string(once "C")
         elseif Result.is_equal(once "byte") then
            Result.make_from_string(once "B")
         elseif Result.is_equal(once "short") then
            Result.make_from_string(once "S")
         elseif Result.is_equal(once "int") then
            Result.make_from_string(once "I")
         elseif Result.is_equal(once "long") then
            Result.make_from_string(once "J")
         elseif Result.is_equal(once "float") then
            Result.make_from_string(once "F")
         elseif Result.is_equal(once "double") then
            Result.make_from_string(once "D")
         elseif Result.is_equal(once "Void") then
            Result.make_from_string(once "V")
         else
            -- is class
            -- change dots to slashes
            from
               i := 1
            until
               i > Result.count
            loop
               if Result.item(i) = '.' then
                  Result.put('/', i)
               end
               i := i + 1
            end
            -- add leading L and trailing ;
            Result.precede('L')
            Result.extend(';')
         end
         -- if was array, add preceeding [s
         if ac /= 0 then
            from
               i := 1
            until
               i > ac
            loop
               Result.precede('[')
               i := i + 1
            end
         end
      end

   java_to_jvm_descriptor_multiarray (s: STRING; dims: INTEGER): STRING is
      local
         i: INTEGER
      do
         Result := java_to_jvm_descriptor(s)
         from
            i := 1
         until
            i > dims
         loop
            Result.precede('[')
            i := i + 1
         end
      end

end -- class NATIVE_JAVA
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
