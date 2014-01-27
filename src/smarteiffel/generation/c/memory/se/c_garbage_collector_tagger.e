class C_GARBAGE_COLLECTOR_TAGGER

inherit
   TYPE_MARK_VISITOR

insert
   GLOBALS

create {GC_HANDLER}
   make

feature {GC_HANDLER}
   for (lt: LIVE_TYPE): HASHED_STRING is
      require
         lt.writable_attributes /= Void
      do
         check
            tag.is_empty
            type = Void
         end
         type := lt.type
         fill_tag(lt)
         Result := string_aliaser.hashed_string(tag)
         tag.clear_count
         type := Void
      ensure
         string_aliaser.registered_one(Result)
      end

feature {C_GARBAGE_COLLECTOR_TAGGER}
   fill_tag (lt: LIVE_TYPE) is
      require
         lt.writable_attributes /= Void
      local
         i: INTEGER; wa: ARRAY[RUN_FEATURE_2]
      do
         from
            wa := lt.writable_attributes
            i := wa.lower
         until
            i > wa.upper
         loop
            wa.item(i).result_type.accept(Current)
            i := i + 1
         end
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK) is
      local
         lt: LIVE_TYPE
      do
         if visited.is_expanded then
            tag.extend('x')
            lt := visited.type.live_type
            if lt /= Void and then lt.writable_attributes /= Void then
               fill_tag(lt)
            end
            tag.extend('y')
         else
            tag.extend('p')
         end
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {LIKE_ARGUMENT_TYPE_MARK}
   visit_like_argument_type_mark (visited: LIKE_ARGUMENT_TYPE_MARK) is
      do
         crash
      end

feature {LIKE_FEATURE_TYPE_MARK}
   visit_like_feature_type_mark (visited: LIKE_FEATURE_TYPE_MARK) is
      do
         crash
      end

feature {LIKE_CURRENT_TYPE_MARK}
   visit_like_current_type_mark (visited: LIKE_CURRENT_TYPE_MARK) is
      do
         crash
      end

feature {CLIENT_TYPE_MARK}
   visit_client_type_mark (visited: CLIENT_TYPE_MARK) is
      do
         crash
      end

feature {FORMAL_GENERIC_TYPE_MARK}
   visit_formal_generic_type_mark (visited: FORMAL_GENERIC_TYPE_MARK) is
      do
         crash
      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK) is
      local
         lt: LIVE_TYPE
      do
         if visited.is_expanded then
            tag.extend('x')
            lt := visited.type.live_type
            if lt /= Void and then lt.writable_attributes /= Void then
               fill_tag(lt)
            end
            tag.extend('y')
         else
            tag.extend('p')
         end
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK) is
      do
         tag.extend('z')
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK) is
      do
         tag.extend('c')
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK) is
      do
         tag.extend('i')
         visited.bit_count.append_in(tag)
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK) is
      do
         tag.extend('u')
         visited.bit_count.append_in(tag)
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK) is
      do
         tag.extend('f')
         visited.bit_count.append_in(tag)
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK) is
      do
         tag.extend('p')
      end

feature {}
   make is
      do
         tag := ""
      end

   tag: STRING
   type: TYPE

end -- class C_GARBAGE_COLLECTOR_TAGGER
