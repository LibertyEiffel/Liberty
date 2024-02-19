note
   description:
      "Cursor for Postgresql database."
   copyright:
      "(C) 2006 Paolo Redaelli "
   license:
      "LGPL v2 or later"
   date:
      "$Date:$"
   revision:
      "$Revision:$"

deferred class POSTGRESQL_CURSOR

insert
   LIBPQ_FE_EXTERNALS

feature {ANY}
   rowcount: INTEGER
      do
         not_yet_implemented
      end

   close
         -- Close the cursor.
      deferred
      end

   execute (some_sql: STRING; some_parameters: COLLECTION[ANY])
         -- Prepare and execute a database operation (query or command).
      do
         not_yet_implemented
      end

   execute_many (an_operation: STRING; some_parametes: COLLECTION[COLLECTION[ANY]])
         -- Prepare a database operation (query or command) and then execute it
         -- against `some_paramaters'.
      deferred
      end

   fetchone: RESULT_ROW
         -- Fetch the next row of a query result set, returning a
         -- single sequence, or Void when no more data is available.
      deferred
      end

   fetchmany (row_number: INTEGER): TRAVERSABLE[RESULT_ROW]
         -- Fetch `row_number' rows of a query result.
      deferred
      end

   fetch_all: TRAVERSABLE[RESULT_ROW]
         -- Fetch all (remaining) rows of a query result.
      deferred
      end

end -- class POSTGRESQL_CURSOR
