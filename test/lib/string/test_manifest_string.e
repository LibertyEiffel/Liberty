class TEST_MANIFEST_STRING

insert
   EIFFELTEST_TOOLS
   STRING_HANDLER

create {}
   make

feature {}
   check_mode: BOOLEAN

   make
      local
         s: STRING
      do
         check
            set_check_mode
         end
         s := ""
         s.append(once "abc")
         debug
            assert(check_mode implies s.has_storage_signature)
         end
         assert(s.has_storage_signature implies s.check_valid_storage_signature)
         io.put_line(s)
         s := once "abc"
         debug
            assert(check_mode implies s.has_storage_signature)
         end
         assert(s.has_storage_signature implies s.check_valid_storage_signature)
         s.clear_count
         s.append(once "def")
         assert(s.has_storage_signature implies s.check_valid_storage_signature)
         io.put_line(s)
      end

   set_check_mode: BOOLEAN
      do
         check_mode := True
         Result := True
      end

end
