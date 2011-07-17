class EXAMPLE5
	-- Compilation:
	--    compile_to_jvm example5
	--    del example5.class (Windows), rm example5.class (Unix)
	--    javac CSimple.java
	-- Execution:
	--    java CSimple
	-- This example demonstrates how to create and call a compiled Eiffel system
	-- from  Java, how to throw Java exceptions from Eiffel, and how Eiffel
	-- contract assertion violations throw Java exceptions.

creation {ANY}
	make

feature {ANY}
	make is
		do
			-- set attribute eiffel_integer
			eiffel_integer := 1 -- fake a call to proc1 and proc2 so they won't be optimized out at compile time
			if False then
				proc1(0)
				proc2(0)
			end
		end

feature {ANY}
	eiffel_integer: INTEGER

feature {ANY}
	proc1 (i: INTEGER) is
			-- throws a Java exception depending on argument value
		local
			e: POINTER; javaString: POINTER; javaStringBytes: POINTER; string_length: INTEGER; s: STRING
			flag: BOOLEAN
		do
			if i >= 0 then
				eiffel_integer := i
			else
				create s.make(48)
				s.append("Exception in example5.proc1: i=")
				s.append(i.out)
				s.append(" < 0")
				javaString := new_java_lang_String(checkcast_aB(s.to_external), 0, s.count)
				e := new_java_lang_Exception(checkcast_java_lang_String(javaString))
				throw_exception(checkcast_java_lang_Exception(e))
			end
		end

	proc2 (i: INTEGER) is
			-- precondition assertion violation throws Java exception
		require
			i_ok: i >= 0
		do
			eiffel_integer := i
		end

feature {ANY} -- externals
	new_java_lang_String (a1: POINTER; a2: INTEGER; a3: INTEGER): POINTER is
		external "Java class java.lang.String new (byte[],int,int)"
		end

	checkcast_java_lang_String (p: POINTER): POINTER is
		external "Java class java.lang.String checkcast"
		end

	checkcast_aB (p: POINTER): POINTER is
		external "Java class byte[] checkcast"
		end

	new_java_lang_Exception (a1: POINTER): POINTER is
		external "Java class java.lang.Exception new (java.lang.String)"
		end

	checkcast_java_lang_Exception (p: POINTER): POINTER is
		external "Java class java.lang.Exception checkcast"
		end

	throw_exception (p: POINTER) is
		external "Java exception java.lang.Exception throw"
		end

end -- class EXAMPLE5
