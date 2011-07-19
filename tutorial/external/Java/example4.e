class EXAMPLE4
	-- Compilation:
	--    compile_to_jvm example4
	--    javac BSimple.java
	-- Execution:
	--    java example4
	-- This example demonstrates how to catch exceptions in Eiffel that were
	-- thrown in an external Java object.

creation {ANY}
	make

feature {ANY}
	make is
		local
			a1: POINTER; b: BOOLEAN; i: INTEGER; d: DOUBLE
		do
			-- create new BSimple instance
			a1 := new_BSimple -- get the instance variable theInteger
			i := get_theInteger(checkcast_BSimple(a1))
			io.put_string("value of theInteger: " + i.to_string + "%N")
			-- call proc with argument 13
			call_proc(a1, 13)
			-- get the instance variable theInteger
			i := get_theInteger(checkcast_BSimple(a1))
			io.put_string("value of theInteger after calling proc: " + i.to_string + "%N")
			-- call proc again with argument -11
			call_proc(a1, -11)
			-- get the instance variable theInteger
			i := get_theInteger(checkcast_BSimple(a1))
			io.put_string("value of theInteger after calling proc: " + i.to_string + "%N")
		end

feature {ANY}
	call_proc (a1: POINTER; i: INTEGER) is
		local
			e: POINTER; javaString: POINTER; javaStringBytes: POINTER; string_length: INTEGER; s: STRING
			flag: BOOLEAN
		do
			if flag = False then
				-- call proc with argument i if not in retry
				proc(checkcast_BSimple(a1), i)
			end
		rescue
			-- get the exception and print out its message
			e := get_exception
			javaString := getMessage(checkcast_java_lang_Exception(e))
			string_length := length(checkcast_java_lang_String(javaString))
			create s.make_filled('%U', string_length)
			javaStringBytes := getBytes(checkcast_java_lang_String(javaString))
			arraycopy(javaStringBytes, 0, s.to_external, 0, string_length)
			io.put_string("Exception was thrown: " + s + "%N")
			flag := True
			retry
		end

feature {ANY} -- externals
	new_BSimple: POINTER is
		external "Java class BSimple new ()"
		end

	checkcast_BSimple (p: POINTER): POINTER is
		external "Java class BSimple checkcast"
		end

	get_theStaticInteger: INTEGER is
		external "Java class BSimple get field static int theStaticInteger"
		end

	set_theStaticInteger (a: INTEGER) is
		external "Java class BSimple set field static int theStaticInteger"
		end

	get_theInteger (p: POINTER): INTEGER is
		external "Java class BSimple get field int theInteger"
		end

	set_theInteger (p: POINTER; a: INTEGER) is
		external "Java class BSimple set field int theInteger"
		end

	proc (p: POINTER; a: INTEGER) is
		external "Java class BSimple method void proc(int)"
		end

	get_exception: POINTER is
		external "Java exception java.lang.Exception get"
		end

	getMessage (p: POINTER): POINTER is
		external "Java class java.lang.Exception method java.lang.String getMessage()"
		end

	checkcast_java_lang_Exception (p: POINTER): POINTER is
		external "Java class java.lang.Exception checkcast"
		end

	checkcast_java_lang_String (p: POINTER): POINTER is
		external "Java class java.lang.String checkcast"
		end

	length (p: POINTER): INTEGER is
		external "Java class java.lang.String method int length()"
		end

	getBytes (p: POINTER): POINTER is
		external "Java class java.lang.String method byte[] getBytes()"
		end

	arraycopy (a1: POINTER; a2: INTEGER; a3: POINTER; a4: INTEGER; a5: INTEGER) is
		external "Java class java.lang.System method static void arraycopy(java.lang.Object,int,java.lang.Object,int,int)"
		end

end -- class EXAMPLE4
