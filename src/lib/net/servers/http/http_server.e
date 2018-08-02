-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class HTTP_SERVER

insert
   SERVER[HTTP_CONNECTION]
      redefine
         log
      end

create {ANY}
   make

feature {ANY}
   is_alive: BOOLEAN
      do
         Result := not server.done
      end

   log (a_message: ABSTRACT_STRING)
      local
         msg: STRING
      do
         if logger /= Void then
            msg := once ""
            msg.copy(once "[")
            msg.append(current_time)
            msg.append(once "] ")
            msg.append(a_message)
            logger.call([msg])
         end
      end

feature {}
   current_time: STRING
      local
         date: TIME; t: MICROSECOND_TIME; ms: INTEGER
      do
         t.update
         date := t.time
         ms := t.microsecond // 1000
         check
            ms.in_range(0, 999)
         end
         Result := once ""
         Result.clear_count
         date.year.append_in(Result)
         Result.extend('/')
         if date.month < 10 then
            Result.extend('0')
         end
         date.month.append_in(Result)
         Result.extend('/')
         if date.day < 10 then
            Result.extend('0')
         end
         date.day.append_in(Result)
         Result.extend(' ')
         if date.hour < 10 then
            Result.extend('0')
         end
         date.hour.append_in(Result)
         Result.extend(':')
         if date.minute < 10 then
            Result.extend('0')
         end
         date.minute.append_in(Result)
         Result.extend(':')
         if date.second < 10 then
            Result.extend('0')
         end
         date.second.append_in(Result)
         Result.extend('.')
         if ms < 100 then
            Result.extend('0')
            if ms < 10 then
               Result.extend('0')
            end
         end
         ms.append_in(Result)
      end

feature {HTTP_CONNECTION}
   shutdown
         -- A connection asked the server to shut down
      do
         server.shutdown
      end

   halt
         -- A connection asked the server to halt
      do
         server.halt
      end

   connection_done (a_connection: HTTP_CONNECTION)
         -- A connection is about to finish.
      do
         release_connection(a_connection)
         connections := connections - 1
         if server.done then
            handle_shutdown(server)
         end
      end

feature {}
   error_handler: PROCEDURE[TUPLE[STRING]]
         -- error handler

   connection_factory: FUNCTION[TUPLE, HTTP_CONNECTION]
         -- the HTTP connection factory

   make (a_error_handler: like error_handler; a_connection_factory: like connection_factory)
      do
         error_handler := a_error_handler
         connection_factory := a_connection_factory
      end

   handle_error (msg: STRING)
      do
         if error_handler /= Void then
            error_handler.call([msg])
         else
            std_error.put_string(msg)
            std_error.put_new_line
         end
      end

   connections_pool: RECYCLING_POOL[HTTP_CONNECTION]
      once
         create Result.make
      end

   new_connection: HTTP_CONNECTION
      do
         if connections_pool.is_empty then
            Result := connection_factory.item([])
         else
            Result := connections_pool.item
         end
         Result.set_server(Current)
      end

   release_connection (cnx: HTTP_CONNECTION)
      do
         connections_pool.recycle(cnx)
      end

end -- class HTTP_SERVER
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
