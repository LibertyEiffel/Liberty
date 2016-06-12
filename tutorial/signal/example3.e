class EXAMPLE3
   -- This example shows that by using TUPLE you are able to send a signal
   -- with an arbitrary amount of information using SIGNAL_1
   -- Of course it is simpler to use SIGNAL_2 for 2 variables.
   -- NOTE: you can un-register your procedure from the signal. Have a look
   -- at `last_connect_id' and `disconnect' in signal_*.e
   -- `last_connect_id' has to be called just after `connect' call. Principle
   -- is based on the same ideas as `last_string' in TEXT_FILE_READ.

create {ANY}
   make

feature {ANY}
   value_changed: SIGNAL_1[TUPLE[STRING, INTEGER, INTEGER]] --declare variable of SIGNAL type, never inherit form SIGNAL.

   value: INTEGER

   desc: STRING

feature {}
   make
      do
         create value_changed.make
         value_changed.connect(agent foo(?))
         value_changed.connect(agent foo(?))
         value_changed.connect(agent foo(?))
         io.put_string("Enter description: ")
         io.read_line
         desc := io.last_string.twin
         io.put_string("Enter integer value: ")
         io.read_integer
         value := io.last_integer
         value_changed.emit([desc, value, value * value])
         value := value + 1
         value_changed.emit([desc, value, value * value])
         value := value + 1
         value_changed.emit([desc, value, value * value])
      end

feature {ANY}
   foo (v: TUPLE[STRING, INTEGER, INTEGER])
      do
         io.put_string(v.first)
         io.put_string(once ": ")
         io.put_integer(v.second)
         io.put_string(once " ")
         io.put_integer(v.third)
         io.put_new_line
      end

end -- class EXAMPLE3
