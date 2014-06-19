class AUX_CLI_07_CUSTOM_OPTION

create {TEST_CLI_07}
   make

feature {TEST_CLI_07}
   items: MAP[FIXED_STRING, FIXED_STRING]
      do
         Result := items_
      end

feature {}
   make (val: STRING)
      local
         done: BOOLEAN
         key, value: FIXED_STRING
      do
         create items_.make
         from
            done := not pattern.match(val)
         until
            done
         loop
            check
               pattern.named_group_matched(once "key")
            end
            key := pattern.named_group_value(val, once "key").intern
            if pattern.named_group_matched(once "value") then
               value := pattern.named_group_value(val, once "value").intern
            else
               value := Void
            end
            items_.add(value, key)
            done := not pattern.match_next(val)
         end
      end

   pattern: REGULAR_EXPRESSION
      local
         re: REGULAR_EXPRESSION_BUILDER
      once
         Result := re.convert_python_pattern("\s*(?P<key>[^=;]+?)(?:\s*?=\s*(?P<value>[^;]*?))?\s*(?:;|$)")
      end

   items_: HASHED_DICTIONARY[FIXED_STRING, FIXED_STRING]

invariant
   items_ /= Void

end
