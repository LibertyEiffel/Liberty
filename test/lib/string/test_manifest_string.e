class TEST_MANIFEST_STRING

insert
   EIFFELTEST_TOOLS
   STRING_HANDLER

create {}
   make

feature {}
   make is
      local
         s: STRING
      do
         s := ""
         s.append(once "abc")
         debug
            assert(s.has_storage_signature)
         end
         assert(s.has_storage_signature implies s.check_storage_signature)
         io.put_line(s)
         s := once "abc"
         debug
            assert(s.has_storage_signature)
         end
         assert(s.has_storage_signature implies s.check_storage_signature)
         s.clear_count
         s.append(once "def")
         assert(s.has_storage_signature implies s.check_storage_signature)
         io.put_line(s)
      end

end
