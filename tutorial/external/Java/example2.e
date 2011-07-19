class EXAMPLE2
	-- Compilation:
	--    compile_to_jvm example2
	--    javac ISimple.java
	--    javac ASimple.java
	-- Execution:
	--    java example2
	-- This example demonstrates how to read and write Java object class and instance
	-- fields from Eiffel.

creation {ANY}
	make

feature {ANY}
	make is
		local
			a1: POINTER; b: BOOLEAN; i: INTEGER; d: DOUBLE
		do
			-- create new ASimple instance
			a1 := new_ASimple -- verify that it is an instance of ASimple
			b := instanceof_ASimple(a1)
			io.put_string("is a1 an instance of ASimple? " + b.to_string + "%N")
			-- get the instance variable theInteger
			i := get_theInteger(checkcast_ASimple(a1))
			io.put_string("value of theInteger: " + i.to_string + "%N")
			-- set the instance variable theInteger to 13
			set_theInteger(checkcast_ASimple(a1), 13)
			-- get the instance variable theInteger
			i := get_theInteger(checkcast_ASimple(a1))
			io.put_string("value of theInteger after setting to 13: " + i.to_string + "%N")
			-- get the class variable theStaticInteger
			i := get_theStaticInteger
			io.put_string("value of theStaticInteger: " + i.to_string + "%N")
			-- set the class variable theStaticInteger to -11
			set_theStaticInteger(-11)
			-- get the class variable theStaticInteger
			i := get_theStaticInteger
			io.put_string("value of theStaticInteger after setting to -11: " + i.to_string + "%N")
			-- get the class constant dConstant from ISimple
			d := get_dConstant
			io.put_string("value of dConstant: " + d.to_string + "%N")
		end

feature {ANY} -- externals
	new_ASimple: POINTER is
		external "Java class ASimple new ()"
		end

	checkcast_ASimple (p: POINTER): POINTER is
		external "Java class ASimple checkcast"
		end

	instanceof_ASimple (p: POINTER): BOOLEAN is
		external "Java class ASimple instanceof"
		end

	get_theStaticInteger: INTEGER is
		external "Java class ASimple get field static int theStaticInteger"
		end

	set_theStaticInteger (a: INTEGER) is
		external "Java class ASimple set field static int theStaticInteger"
		end

	get_theInteger (p: POINTER): INTEGER is
		external "Java class ASimple get field int theInteger"
		end

	set_theInteger (p: POINTER; a: INTEGER) is
		external "Java class ASimple set field int theInteger"
		end

	get_dConstant: DOUBLE is
		external "Java class ISimple get field static double dConstant"
		end

end -- class EXAMPLE2
