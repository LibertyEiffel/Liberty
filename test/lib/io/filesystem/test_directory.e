class TEST_DIRECTORY

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         bd: BASIC_DIRECTORY
         path: STRING
         d: DIRECTORY
      do
         bd.ensure_system_notation
         path := ""
         bd.system_notation.to_default_root(path)
         create d.scan(path)
         assert(d.exists)
      end

end
