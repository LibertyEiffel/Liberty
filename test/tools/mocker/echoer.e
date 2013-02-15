class ECHOER

create {ANY}
   make

feature {ANY}
   check_echo (x: STRING) is
      local
         y: STRING
      do
         echo.ping
         y := echo.echo(x)
         check
            y.is_equal(x)
         end
      end

feature {}
   make (a_echo: like echo) is
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
