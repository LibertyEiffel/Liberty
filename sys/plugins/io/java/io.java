/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
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
*/

import java.io.*;
import java.util.*;
import java.lang.*;

public class io {

    public static Object stdin() {
	return System.in;
    }

    public static Object stdout() {
	return System.out;
    }

    public static Object stderr() {
	return System.err;
    }

    public static int basic_io_eof() {
	return -1;
    }

    public static Object basic_io_binary_file_read_open (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	File file = new File(name);
	try {
	    return new FileInputStream (file);
	} catch (FileNotFoundException e) {
	    return null;
	}
    }

    public static Object basic_io_binary_file_write_open (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	File file = new File(name);
	try {
	    return new FileOutputStream (file);
	} catch (IOException e) {
	    return null;
	}
    }

    public static Object basic_io_binary_file_write_append (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	try {
	    return new FileOutputStream (name, true);
	} catch (IOException e) {
	    return null;
	}
    }

    public static Object basic_io_text_file_read_open (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	File file = new File(name);
	try {
	    return new FileInputStream (file);
	} catch (FileNotFoundException e) {
	    return null;
	}
    }

    public static Object basic_io_text_file_write_open (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	File file = new File(name);
	try {
	    return new FileOutputStream (file);
	} catch (IOException e) {
	    return null;
	}
    }

    public static Object basic_io_text_file_write_append (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	try {
	    return new FileOutputStream (name, true);
	} catch (IOException e) {
	    return null;
	}
    }

    public static Object basic_io_text_file_read_write_open (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	RandomAccessFile rfile;
        try {
            rfile = new RandomAccessFile(name, "rw");
        } catch (IOException e) {
            return null;
        }
	return rfile;
    }

    public static Object basic_io_text_file_read_write_append (Object bytes) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(bytes);
	RandomAccessFile rfile;
	try {
            rfile = new RandomAccessFile(name, "rw");
	} catch (IOException e) {
	    return null;
	}
	try {
	    long len = rfile.length();
	    rfile.seek( len );
	} catch (IOException e) {
	}
	return rfile;
    }

    public static boolean basic_io_feof (Object stream) {
	boolean result;
	result = false;
	try {
	    long fpointer = ((RandomAccessFile)stream).getFilePointer();
	    long len =  ((RandomAccessFile)stream).length();
	    if ( fpointer == len ) {
		result = true;
	    }
	} catch (IOException e) {
	}
	return result;
    }

    public static void basic_io_rename (Object old_path, Object new_path) {
	String oldPath = SmartEiffelRuntime.NullTerminatedBytesToString(old_path);
	String newPath = SmartEiffelRuntime.NullTerminatedBytesToString(new_path);
	File oldFile = new File(oldPath);
	File newFile = new File(newPath);
	oldFile.renameTo(newFile);
    }

    public static void basic_io_remove (Object path) {
	String name = SmartEiffelRuntime.NullTerminatedBytesToString(path);
	File file = new File(name);
	file.delete();
    }

    public static void basic_io_fclose (Object stream) {
	try { ((InputStream)stream).close(); return ; }
	catch (Exception e) {
	    try {((OutputStream)stream).close(); return ; }
	    catch (Exception f) {
	    }
	}
    }

    public static int basic_io_getc (Object stream) {
	try {
	    return ((InputStream)stream).read();
	} catch (IOException e) {
	    return -1;
	} catch (ClassCastException cce) {
	    try {
		return ((RandomAccessFile)stream).read();
	    } catch (IOException e) {
		return -1;
	    }
	}
    }

    public static void basic_io_putc (byte b, Object stream) {
	try {
	    ((OutputStream)stream).write(b);
	} catch (IOException e) {
	} catch (ClassCastException cce) {
	    try {
		((RandomAccessFile)stream).write(b);
	    } catch (IOException e) {
	    }
	}
    }

    public static void io_flush(Object dirstream_pointer) {
	try {
	    ((PrintStream)dirstream_pointer).flush();
	} catch (ClassCastException cce) {
	}
    }

    public static int read_stdin (byte[] bytes, int max_count) {
	try {
	    return (System.in).read(bytes,0,max_count);
	} catch (IOException e) {
	    return -1;
	}
    }

    public static int basic_io_fread (byte[] bytes, int max_count, Object stream) {
	try {
	    return ((InputStream)stream).read(bytes, 0, max_count);
	} catch (IOException e) {
	    return -1;
	} catch (ClassCastException cce) {
	    try {
		return ((RandomAccessFile)stream).read(bytes, 0, max_count);
	    } catch (IOException e) {
		return -1;
	    }
	}
    }

    public static void io_fwrite (byte[] bytes, int count, Object stream) {
	try {
	    ((OutputStream)stream).write(bytes,0,count);
	} catch (IOException e) {
	} catch (ClassCastException cce) {
	    try {
		((RandomAccessFile)stream).write(bytes,0,count);
	    } catch (IOException e) {
	    }
	}
    }
}
