class ECHOER

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   check_echo (x: STRING)
      local
         y: STRING
      do
         echo.ping
         y := echo.echo(x)
         assert(y.is_equal(x))
      end

feature {}
   make (a_echo: like echo)
      require
         a_echo /= Void
      do
         echo := a_echo
      ensure
         echo = a_echo
      end

   echo: ECHO

invariant
   echo /= Void

end
