/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright (C) 2015-2018: by all the people cited in the AUTHORS file.
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
*/
#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
 #include <termios.h>
#endif

#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
 #define termios_fd(FILE_p) fileno(FILE_p)
 #define termios_tcdrain(FILE_p) ((tcdrain(termios_fd(FILE_p))) == 0 ? 0 : errno)
 #define termios_cfgetispeed(s_termios) (cfgetispeed(s_termios))
 #define termios_cfgetospeed(s_termios) (cfgetospeed(s_termios))
 #define termios_cfsetispeed(s_termios, speed) (cfsetispeed(s_termios, speed))
 #define termios_cfsetospeed(s_termios, speed) (cfsetospeed(s_termios, speed))
 #define termios_tcgetattr(fp, s_termios) (tcgetattr(termios_fd(fp), s_termios) == 0 ? 0 : errno)
 #define termios_tcsetattr(fp, s_termios) (tcsetattr(termios_fd(fp), TCSADRAIN, s_termios) == 0 ? 0 : errno)
 #define termios_allocate() ((EIF_POINTER) se_malloc(sizeof(struct termios)))
 #define termios_free(s_termios_p) (free(s_termios_p))
 #define termios_strerror(err) (strerror(err))
#else
 #error TERMINAL_SETTINGS currently not implemented on this platform (please port termios.h)
#endif
