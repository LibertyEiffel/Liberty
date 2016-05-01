class EXAMPLE7
   -- This example demonstrates creating and calling agents.

create {}
   make

feature {}
   f1: FUNCTION[TUPLE, INTEGER]
      -- f1 is a function that takes no argument and that returns
      -- an INTEGER

   f2: FUNCTION[TUPLE[STRING], STRING]
      -- f2 is a function that takes a STRING argument and returns
      -- a STRING

   p1: PROCEDURE[TUPLE]
      -- p1 is a procedure that takes no argument

   p2: PROCEDURE[TUPLE[STRING, INTEGER]]
      -- p2 is a procedure that takes a STRING and an INTEGER
      -- argument

feature {}
   make
      local
         random: PRESS_RANDOM_NUMBER_GENERATOR; s: STRING
      do
         -- Creating and calling agents with no open arguments.  Any
         -- argument that is needed by the agent is supplied when
         -- creating the agent.  No argument needs to be supplied
         -- when calling the agent, hence the empty tuple [].
         create random.with_seed(25)
         f1 := agent random.last_integer(100)
         p1 := agent random.next
         random := Void
         io.put_string("Calling f1 ")
         io.put_integer(f1.item([]))
         io.put_new_line
         io.put_string("Calling p1")
         p1.call([])
         io.put_new_line
         io.put_string("Calling f1 ")
         io.put_integer(f1.item([]))
         io.put_new_line
         -- Creating and calling an agent with an open argument.  The
         -- open arguments are replaced with question marks when
         -- creating the agent.  When calling the agent, the open
         -- arguments must be supplied in the tuple.

         f2 := agent "Agents " + ?
         io.put_string("Calling f2(%"are easy%") ")
         io.put_string(f2.item(["are easy"]))
         io.put_new_line
         -- The target of an agent can also be open.  To this effect,
         -- just replace the target of the call with a type between
         -- curly braces.  When calling the agent, the open target
         -- treated exactly like an open argument.

         f2 := agent {STRING}.as_upper
         io.put_string("Calling f2(%"abcdexxxyz%") ")
         io.put_string(f2.item(["abcdexxxyz"]))
         io.put_new_line
         -- Procedure agents can also have open arguments
         p2 := agent {STRING}.remove(?)
         s := "SmartXEiffel"
         io.put_string("value of s ")
         io.put_string(s)
         io.put_new_line
         io.put_string("Calling p2(s, 6) ")
         p2.call([s, {INTEGER_32 6}])
         io.put_new_line
         io.put_string("value of s ")
         io.put_string(s)
         io.put_new_line
         -- Discarding extra arguments is allowed
         p2 := agent ("Test").print_on(std_output)
         io.put_string("Calling p2(%"Abracadabra%", 32) ")
         p2.call(["Abracadabra", {INTEGER_32 32}])
         io.put_new_line
      end

end -- class EXAMPLE7
