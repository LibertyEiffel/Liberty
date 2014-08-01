-- See the Copyright notice at the end of this file.
--
class HTTP_GET_HANDLER

inherit
   HTTP_METHOD_HANDLER

create {HTTP_CONNECTION}
   make

feature {HTTP_CONNECTION}
   method: STRING

   expect_body: BOOLEAN True

   prepare_ok: BOOLEAN

   prepare_answer
      local
         f: TEXT_FILE_READ
      do
         f := file
         if f = Void then
            code := 404
         else
            check
               f.is_connected
            end
            fill_body(f)
            f.disconnect
            code := 200
         end

         prepare_ok := True
      end

   add_header (header: STRING)
      do
         std_output.put_string(once "HEADER: ")
         std_output.put_line(header)
      end

   add_body (body: STRING)
      do
         std_output.put_string(once "BODY: ")
         std_output.put_line(body)
      end

   make (a_method: like method; a_uri, a_version: STRING)
      require
         a_method.is_equal(once "GET") or else a_method.is_equal(once "POST")
      local
         i: INTEGER
      do
         method := a_method
         if uri = Void then
            uri := a_uri.twin
            version := a_version.twin
            create response_header.with_capacity(2)
            create response_body.make_empty
         else
            uri.copy(a_uri)
            version.copy(a_version)
            response_header.clear_count
            response_body.clear_count
         end
         -- remove any trailing part
         i := uri.first_index_of('#')
         if i > 0 then
            uri.shrink(1, i - 1)
         end

         i := uri.first_index_of('?')
         if i > 0 then
            uri.shrink(1, i - 1)
         end

         prepare_ok := False
      ensure
         version.is_equal(a_version)
      end

   expect (events: EVENTS_SET)
      local
         t: TIME_EVENTS
      do
         events.expect(t.timeout(0))
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         Result := True
      end

feature {}
   file: TEXT_FILE_READ
      local
         cwd, path: STRING; bd: BASIC_DIRECTORY; ft: FILE_TOOLS; i, o: INTEGER
      do
         cwd := once ""
         cwd.make_from_string(bd.current_working_directory)
         path := once ""
         o := 1
         from
            i := uri.first_index_of('/')
            if i = 0 then
               path.copy(uri)
            end
         until
            i = 0
         loop
            o := i
            i := uri.index_of('/', i + 1)
            if i = 0 then
               path.copy(uri)
               path.shrink(o + 1, path.count)
            else
               path.copy(uri)
               path.shrink(o + 1, i - 1)
               if path.same_as(once "..") then
                  -- security risk, do not answer
                  i := 0
                  path.clear_count
               end

               bd.compute_subdirectory_with(cwd, path)
               cwd.copy(bd.last_entry)
            end
         end
         -- here should be the name of the file without its directory components
         if not path.is_empty then
            bd.compute_file_path_with(cwd, path)
            if ft.file_exists(bd.last_entry) then
               tfr.connect_to(bd.last_entry)
               if tfr.is_connected then
                  Result := tfr
               end
            end
         end
      ensure
         Result /= Void implies Result.is_connected
      end

   tfr: TEXT_FILE_READ
      once
         create Result.make
      end

feature {}
   fill_body (f: TEXT_FILE_READ)
      do
         from
         until
            f.end_of_input
         loop
            f.read_line
            response_body.append(f.last_string)
            if not f.end_of_input then
               response_body.append(once "%R%N")
            end
         end
      end

end -- class HTTP_GET_HANDLER
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
