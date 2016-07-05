-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--

class TERMINAL_SETTINGS
   -- Terminal settings for serial communication lines.
   -- see termios.h in POSIX

   --| **** TODO: make objects recyclable?
insert
   DISPOSABLE

create {FILE_STREAM}
   make

feature {FILE_STREAM}
   make(a_fd: POINTER; a_fs: FILE_STREAM)
      require
         valid_stream: a_fs /= Void
         valid_file_descriptor: (not a_fd.is_null) = (a_fs /= Void and then a_fs.is_connected)
      do
         fd := a_fd
         associated_stream := a_fs
         termios := termios_allocate
      ensure
         associated_stream = a_fs
         fd = a_fd
      end

   dispose
      do
         termios_free(termios)
      end

feature {ANY}
   set_speed(a_speed: INTEGER)
         -- set input and output communication speed to `a_speed'
      require
         valid_speed: is_valid_speed(a_speed)
      do
         set_input_speed(a_speed)
         set_output_speed(a_speed)
      end

   set_input_speed(a_speed: INTEGER)
         -- set input communication speed to `a_speed' baud
      require
         valid_speed: is_valid_speed(a_speed)
      do
         last_error := termios_tcgetattr(fd, termios)
         if last_error = 0 then
            last_error := termios_cfsetispeed(termios, encode_speed(a_speed))
            if last_error = 0 then
               last_error := termios_tcsetattr(fd, termios)
            end
         end
      end

   set_output_speed(a_speed: INTEGER)
         -- set output communication speed to `a_speed' baud
      require
         valid_speed: is_valid_speed(a_speed)
      do
         last_error := termios_tcgetattr(fd, termios)
         if last_error = 0 then
            last_error := termios_cfsetospeed(termios, encode_speed(a_speed))
            if last_error = 0 then
               last_error := termios_tcsetattr(fd, termios)
            end
         end
      end

   output_speed: INTEGER
         -- return the currently configured output speed
      do
         last_error := termios_tcgetattr(fd, termios)
         if last_error = 0 then
            Result := decode_speed(termios_cfgetospeed(termios))
         end
      ensure
         valid_speed: is_valid_speed(Result)
      end

   input_speed: INTEGER
         -- return the currently configured input speed
      do
         last_error := termios_tcgetattr(fd, termios)
         if last_error = 0 then
            Result := decode_speed(termios_cfgetispeed(termios))
         end
      ensure
         valid_speed: is_valid_speed(Result)
      end

   drain
         -- wait until all data in tx buffer is transmitted
      require
         connected: associated_stream.is_connected
      do
         -- call tcdrain(int fd);
         not_yet_implemented
      end

   associated_stream: FILE_STREAM
         -- the file stream associated with the terminal settings

   fd: POINTER
         -- pointer to the underlaying FILE handle

   last_error: INTEGER
         -- last error code

   last_error_description: STRING
      do
         if error_string_storage = Void then
            create error_string_storage.make(30)
         end
         Result := error_string_storage
         Result.from_external_copy(termios_strerror(last_error))
      end

   error_string_storage: STRING

   is_valid_speed(a_speed: INTEGER): BOOLEAN
         -- check if a given terminal speed is valid
         -- some day we might want to consider non-standard baudrates
         -- with termios2
      do
         inspect a_speed
         when 50, 75, 110, 134, 150, 200, 300, 600, 1200, 1800,
            2400, 4800, 9600, 19200, 38400, 57600, 115200, 230400
          then
            Result := True
         else
            Result := False
         end
      end

feature {}
   termios: POINTER

   decode_speed(a_speed: INTEGER): INTEGER
         -- internal helper to convert POSIX speed constants to
         -- numeric values
      do
         if a_speed = termios_b50 then
            Result := 50
         elseif a_speed = termios_b75 then
            Result := 75
         elseif a_speed = termios_b110 then
            Result := 110
         elseif a_speed = termios_b134 then
            Result := 134
         elseif a_speed = termios_b150 then
            Result := 150
         elseif a_speed = termios_b200 then
            Result := 200
         elseif a_speed = termios_b300 then
            Result := 300
         elseif a_speed = termios_b600 then
            Result := 600
         elseif a_speed = termios_b1200 then
            Result := 1200
         elseif a_speed = termios_b1800 then
            Result := 1800
         elseif a_speed = termios_b2400 then
            Result := 2400
         elseif a_speed = termios_b4800 then
            Result := 4800
         elseif a_speed = termios_b9600 then
            Result := 9600
         elseif a_speed = termios_b19200 then
            Result := 19200
         elseif a_speed = termios_b38400 then
            Result := 38400
         elseif a_speed = termios_b57600 then
            Result := 57600
         elseif a_speed = termios_b115200 then
            Result := 115200
         elseif a_speed = termios_b230400 then
            Result := 230400
         else
            Result := 0
         end
      ensure
         valid_speed: is_valid_speed(Result)
      end

   encode_speed(a_speed: INTEGER): INTEGER
         -- internal helper to convert baud rates to POSIX speed
         -- constants
      require
         valid_speed: is_valid_speed(a_speed)
      do
         if a_speed = 50 then
            Result := termios_b50
         elseif a_speed = 75 then
            Result := termios_b75
         elseif a_speed = 110 then
            Result := termios_b110
         elseif a_speed = 134 then
            Result := termios_b134
         elseif a_speed = 150 then
            Result := termios_b150
         elseif a_speed = 200 then
            Result := termios_b200
         elseif a_speed = 300 then
            Result := termios_b300
         elseif a_speed = 600 then
            Result := termios_b600
         elseif a_speed = 1200 then
            Result := termios_b1200
         elseif a_speed = 1800 then
            Result := termios_b1800
         elseif a_speed = 2400 then
            Result := termios_b2400
         elseif a_speed = 4800 then
            Result := termios_b4800
         elseif a_speed = 9600 then
            Result := termios_b9600
         elseif a_speed = 19200 then
            Result := termios_b19200
         elseif a_speed = 38400 then
            Result := termios_b38400
         elseif a_speed = 57600 then
            Result := termios_b57600
         elseif a_speed = 115200 then
            Result := termios_b115200
         elseif a_speed = 230400 then
            Result := termios_b230400
         else
            Result := 0
         end
      end

   termios_tcgetattr(a_fd: POINTER; a_termios: POINTER): INTEGER
         -- low level tcgetattr in termios.h
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_tcgetattr"
         }"
      end

   termios_tcsetattr(a_fd: POINTER; a_termios: POINTER): INTEGER
         -- low level tcsetattr in termios.h
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_tcsetattr"
         }"
      end

   termios_cfgetispeed (a_termios: POINTER): INTEGER
         -- low level cfgetispeed in termios.h
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_cfgetispeed"
         }"
      end

   termios_cfgetospeed (a_termios: POINTER): INTEGER
         -- low level cfgetospeed in termios.h
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_cfgetospeed"
         }"
      end

   termios_cfsetispeed (a_termios: POINTER; s_speed: INTEGER): INTEGER
         -- low level cfsetispeed in termios.h
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_cfsetispeed"
         }"
      end

   termios_cfsetospeed (a_termios: POINTER; s_speed: INTEGER): INTEGER
         -- low level cfsetospeed in termios.h
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_cfsetospeed"
         }"
      end

   termios_tctrain (a_fp: POINTER): INTEGER
         -- low level tctrain in termios.h
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_tcdrain"
         }"
      end

   termios_allocate: POINTER
         -- allocate a internal termios struct
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_allocate()"
         }"
      end

   termios_free(a_termios: POINTER)
         -- allocate a internal termios struct
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_free"
         }"
      end

   termios_strerror(a_errno: INTEGER): POINTER
         -- allocate a internal termios struct
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "termios_strerror"
         }"
      end

   termios_b50: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B50"
         }"
      end

   termios_b75: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B75"
         }"
      end

   termios_b110: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B110"
         }"
      end

   termios_b134: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B134"
         }"
      end

   termios_b150: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B150"
         }"
      end

   termios_b200: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B200"
         }"
      end

   termios_b300: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B300"
         }"
      end

   termios_b600: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B600"
         }"
      end

   termios_b1200: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B1200"
         }"
      end

   termios_b1800: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B1800"
         }"
      end

   termios_b2400: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B2400"
         }"
      end

   termios_b4800: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B4800"
         }"
      end

   termios_b9600: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B9600"
         }"
      end

   termios_b19200: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B19200"
         }"
      end

   termios_b38400: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B38400"
         }"
      end

   termios_b57600: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B57600"
         }"
      end

   termios_b115200: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B115200"
         }"
      end

   termios_b230400: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/io"
         module_name: "io_termios"
         feature_name: "B230400"
         }"
      end

invariant
   valid_termios: not termios.is_null
end -- class TERMINAL_SETTINGS
--
-- Copyright (C) 2015-2016: by all the people cited in the AUTHORS file.
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
