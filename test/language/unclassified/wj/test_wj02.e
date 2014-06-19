class TEST_WJ02
   -- From: Gabriel Weiﬂelberg <gabriel.weisselberg@brokat-le.com>

create {}
   make

feature {}
   make
      local
         a: AUX_WJ02A1; c: AUX_WJ02C1
      do
         create a.make("a")
         create c
         if c.output(a) /= Void then
         end
      end

end -- class TEST_WJ02
