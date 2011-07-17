class EXAMPLE6
	-- Compilation:
	--    compile_to_jvm example6
	-- Execution:
	--    java example6
	-- This example demonstrates how to set Java field attributes of Eiffel
	-- class attributes, how to declare a method synchronized, and how to
	-- construct a synchronized block.

creation {ANY}
	make

feature {ANY}
	make is
		do
			field_attributes
			synchronized_test
			monitor_test
		end

feature {ANY}
	field_attributes is
			-- have to look at dump of classfile to verify that
			-- var1 is public
			-- var2 is public and transient
			-- var3 is public and volatile
			-- var4 is public and transient and volatile
			-- Note: The field_is_transient and field_is_volatile procedure calls
			-- must be in a routine in the Eiffel class that will not be optimized
			-- out at compile time. The best place to put them is in a creation
			-- procedure that you know will be called at runtime.
		do
			field_is_transient("var2")
			field_is_volatile("var3")
			field_is_transient("var4")
			field_is_volatile("var4")
			var1 := 1
			var2 := 1
			var3 := 1
			var4 := 1
		end

feature {ANY}
	var1: INTEGER

	var2: INTEGER

	var3: INTEGER

	var4: INTEGER

feature {ANY}
	synchronized_test is
			-- have to look at dump of classfile to verify that this method is synchronized
			-- Note: The routine_is_synchronized procedure call must be within the Eiffel routine
			-- to be declared synchronized. It generates no code.
		local
			i: INTEGER
		do
			routine_is_synchronized
			i := 1
		end

	monitor_test is
			-- have to look at dump of classfile to verify that this Eifel routine has
			-- monitorenter and monitorexit calls ( in Java, this would be a
			-- synchronized block )
			-- the user is responsible for ensuring that each monitorenter is matched
			-- by a correspondng monitorexit on the same object
		local
			i: INTEGER
		do
			i := 0 -- start of synchronized block
			monitor_enter(Current.to_pointer)
			i := 1
			monitor_exit(Current.to_pointer)
			-- end of synchronized block
			i := 2
		end

feature {ANY} -- externals
	field_is_transient (s: STRING) is
		external "Java transient"
		end

	field_is_volatile (s: STRING) is
		external "Java volatile"
		end

	routine_is_synchronized is
		external "Java synchronized"
		end

	monitor_enter (p: POINTER) is
		external "Java monitorenter"
		end

	monitor_exit (p: POINTER) is
		external "Java monitorexit"
		end

end -- class EXAMPLE6
