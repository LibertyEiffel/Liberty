-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright(C) 2006-2009: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class TEST1

insert
   EDC

create {}
   test_all, test_xml, test_sqlite, test_gda

feature {} -- root procedures
   test_all
      do
         test_xml
         test_sqlite
         test_gda
      end

   test_xml
      do
         register_driver(create {EDC_STORABLE_XML_FILE_DRIVER})
         io.put_new_line
         io.put_string("== XML ==")
         io.put_new_line
         test("xml://test.xml", Void)
      end

   test_sqlite
      local
--         info: DICTIONARY[STRING, STRING]
      do
--         register_driver(create {EDC_SQLITE_DRIVER}.make(default_error_handler))
         -- the SQLite supports extra information that are passed to the SQLite database as PRAGMAs.
         -- REMEMBER: in Eiffel the values come before the key!
--         info := {HASHED_DICTIONARY[STRING, STRING] << "OFF", "synchronous";
--                                                       "EXCLUSIVE", "locking_mode";
--                                                       "1", "count_changes";
--                                                       "full", "auto_vacuum" >> }
         io.put_new_line
         io.put_string("== SQLite ==")
         io.put_new_line
--         test("sqlite://test.db", info)
      end

   test_gda
      local
         info: DICTIONARY[STRING, STRING]
      do
         -- we use the sqlite backed of gda, to access the same database than test_sqlite :-)
         --register_driver(create {EDC_GDA_DRIVER})
         --io.put_new_line
         --io.put_string("== GDA ==")
         --io.put_new_line
         --test("gda:sqlite://test.db", info)
      end

feature {} -- test implementation
   test (url: STRING; info: DICTIONARY[STRING, STRING])
      local
         cnx: EDC_CONNECTION; set: EDC_RESULT_SET; query: EDC_SELECT; users: EDC_TABLE
         user_id, user_name: EDC_STRING_COLUMN
      do
         -- Start a new connection using the most appropriate driver
         cnx := connect_to(url, info)
         std_error.put_line("Connection type: " + cnx.generating_type)
         if cnx.has_table_name("users") then
            -- Pick data structure from the connection
            users := cnx.table("users")
            check
               users.connection = cnx
            end
            user_id ::= users.column("id")
            user_name ::= users.column("name")
         else
            -- CREATE THE TABLE
            create users.make("users")
            create {EDC_STRING_COLUMN} user_id.make("id", 8)
            create {EDC_STRING_COLUMN} user_name.make("name", 30)
            users.add_column(user_id)
            users.add_column(user_name)
            users.add_index({EDC_PRIMARY_KEY << user_id >> })
            std_error.put_line(once "-- creating users table")
            cnx.create_table(users)
            std_error.put_line(once "-- inserting data")
            cnx.insert_data({FAST_ARRAY[EDC_COLUMN] << user_id, user_name >> }).values({FAST_ARRAY[EDC_VALUE] << user_id @ "1", user_name @ "Farad'n" >> }).call
            cnx.commit
         end
         -- --------------------------------------------------------------------------------
         -- SIMPLE QUERY
         set := cnx.select_data({FAST_ARRAY[EDC_COLUMN] << user_id, user_name >> }).where(user_id ~= (user_id @ "1%%") and user_name == (user_name @ "Farad'n")).call(Void)
         -- the where clause could also have been written:
         -- .where(user_id.as_value.is_like(user_id.manifest("1.*"))
         --        and user_name.as_value.equals(user_name.manifest("Dupont")))
         std_error.put_line(once "-- simple query:")
         -- Should display: user_id = 1, user_name = "Farad'n"
         show_result_set(set)
         -- --------------------------------------------------------------------------------
         -- PARAMETERIZED QUERY
         query := cnx.select_data({FAST_ARRAY[EDC_COLUMN] << user_id, user_name >> }).where(user_name == #user_name)
         -- parameter is an hash and its column name (denotes the parameter type)
         -- the where clause could also have been written:
         -- .where(user_name.as_value.equals(user_name.parameter))
         std_error.put_line(once "-- parameterized query with good data:")
         -- Should display: user_id = 1, user_name = "Farad'n"
         show_result_set(query.call({FAST_ARRAY[EDC_VALUE] << user_name @ "Farad'n" >> }))
         std_error.put_line(once "-- parameterized query with unknown data:")
         -- Should display nothing (no row selected)
         show_result_set(query.call({FAST_ARRAY[EDC_VALUE] << user_name @ "Dupont" >> }))
      end

   show_result_set (set: EDC_RESULT_SET)
      local
         i: INTEGER; id, name: EDC_TYPED_DATUM[STRING]
      do
         if set = Void then
            io.put_line(once "no result set!")
         else
            -- any object returned by EDC has this type. It is either Void, or its item is not Void.
            set.next
            if set.is_after_last then
               io.put_line(once "empty result set!")
            else
               from
                  i := 1
               until
                  set.is_after_last
               loop
                  id ::= set.column_named("id").item(set)
                  name ::= set.column_named("name").item(set)
                  io.put_integer(i)
                  io.put_string(once ":%T")
                  if id = Void then
                     io.put_string(once "Void")
                  else
                     io.put_string(id.item)
                  end
                  io.put_string(once " -> ")
                  if name = Void then
                     io.put_string(once "Void")
                  else
                     io.put_string(name.item)
                  end
                  io.put_new_line
                  set.next
               end
               io.put_line(once "----------------------------------------------------------------------")
            end
         end
      end

end -- class TEST1
