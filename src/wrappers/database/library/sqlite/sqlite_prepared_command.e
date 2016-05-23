note
   description:
      "."
   copyright:
      "(C) 2006 Paolo Redaelli "
   license:
      "LGPL v2 or later"
   date:
      "$Date:$"
   revision:
      "$Revision:$"

class SQLITE_PREPARED_COMMAND

inherit
   PREPARED_COMMAND
      undefine copy, is_equal
      end
   SQLITE_PREPARED_STATEMENT

create {ANY, SQLITE_DATABASE}
   make

feature {ANY}

   execute (some_parameters: TRAVERSABLE[SQLITE_VALUE];)
         -- Execute the current query with `some_parameters'
      local
         i: INTEGER; query_index: INTEGER
      do
         from
            i := some_parameters.lower;
            query_index := 1;
         until
            i > some_parameters.upper
         loop
            bind_parameter(some_parameters.item(i), query_index);
            i := i + 1;
            query_index := query_index + 1;
         end-- loop
         res_code := sqlite3_step(handle);
         res_code := sqlite3_clear_bindings(handle);
         res_code := sqlite3_reset(handle);
      end -- execute

   last_affected_rows: INTEGER
      do
         Result := sqlite3_changes(sqlite_db.handle);
      end -- last_affected_rows

end -- class SQLITE_PREPARED_COMMAND
