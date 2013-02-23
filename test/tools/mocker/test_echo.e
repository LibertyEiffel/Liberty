class TEST_ECHO

create {}
   make

feature {}
   make is
      local
         echo: ECHO_MOCK
         echoer: ECHOER
      do
         create echo
         create echoer.make(echo)
         echo.expect.ping
         echo.expect.echo("foo").then_return("foo")
         echoer.check_echo("foo")
      end

end
