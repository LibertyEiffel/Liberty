-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class HTTP_SERVER
   --
   -- A {SERVER} used to manage http requests
   --


insert
   SERVER[HTTP_CONNECTION]
      redefine
         log
      end

create {ANY}
   make

feature {} -- Initialisation

   make (a_error_handler: like error_handler; a_connection_factory: like connection_factory)
         -- Initialisation of `Current' using `a_error_handler' as `error_handler'
         -- and `a_connection_factory' as `connection_factory'.
      do
         error_handler := a_error_handler
         connection_factory := a_connection_factory
      end

feature {ANY} -- Access

   is_alive: BOOLEAN
         -- `Current' is still listening to connection
      do
         Result := not server_job.done
      end

   log (a_message: ABSTRACT_STRING)
         -- Write `a_message' in the `logger'
      local
         l_message: STRING
      do
         if logger /= Void then
            l_message := once ""
            l_message.copy(once "[")
            l_message.append(current_time)
            l_message.append(once "] ")
            l_message.append(a_message)
            logger.call([l_message])
         end
      end

feature {} -- Implementation

   current_time: STRING
         -- An HTTP comatible text representation of the
         -- present date/time.
      local
         l_date: TIME;
         l_time: MICROSECOND_TIME;
         l_microsecond: INTEGER
      do
         l_time.update
         l_date := l_time.time
         l_microsecond := l_time.microsecond // 1000
         check
            l_microsecond.in_range(0, 999)
         end
         Result := once ""
         Result.clear_count
         l_date.year.append_in(Result)
         Result.extend('/')
         if l_date.month < 10 then
            Result.extend('0')
         end
         l_date.month.append_in(Result)
         Result.extend('/')
         if l_date.day < 10 then
            Result.extend('0')
         end
         l_date.day.append_in(Result)
         Result.extend(' ')
         if l_date.hour < 10 then
            Result.extend('0')
         end
         l_date.hour.append_in(Result)
         Result.extend(':')
         if l_date.minute < 10 then
            Result.extend('0')
         end
         l_date.minute.append_in(Result)
         Result.extend(':')
         if l_date.second < 10 then
            Result.extend('0')
         end
         l_date.second.append_in(Result)
         Result.extend('.')
         if l_microsecond < 100 then
            Result.extend('0')
            if l_microsecond < 10 then
               Result.extend('0')
            end
         end
         l_microsecond.append_in(Result)
      end

feature {HTTP_CONNECTION} -- HTTP connection implementation

   shutdown
         -- A connection asked the server to shut down
      do
         server_job.shutdown
      end

   halt
         -- A connection asked the server to halt
      do
         server_job.halt
      end

   connection_done (a_connection: HTTP_CONNECTION)
         -- A connection is about to finish.
      do
         release_connection(a_connection)
         connections := connections - 1
         if server_job.done then
            handle_shutdown(server_job)
         end
      end

feature {}
   error_handler: PROCEDURE[TUPLE[STRING]]
         -- error handler

   connection_factory: FUNCTION[TUPLE, HTTP_CONNECTION]
         -- the HTTP connection factory

   handle_error (a_message: STRING)
         -- Manage an error that is explain by `a_message'
      do
         if error_handler /= Void then
            error_handler.call([a_message])
         else
            std_error.put_string(a_message)
            std_error.put_new_line
         end
      end

   connections_pool: RECYCLING_POOL[HTTP_CONNECTION]
         -- A pool structure used to recycle {HTTP_CONNECTION}
      once
         create Result.make
      end

   new_connection: HTTP_CONNECTION
         -- An {HTTP_CONNECTION} freshly instanciate
      do
         if connections_pool.is_empty then
            Result := connection_factory.item([])
         else
            Result := connections_pool.item
         end
         Result.set_server(Current)
      end

   release_connection (a_connection: HTTP_CONNECTION)
         -- Recycle `a_connection'.
         -- See: `connections_pool' to get the recycled connections.
      do
         connections_pool.recycle(a_connection)
      end

end -- class HTTP_SERVER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
