class TEST_ECHO

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         echo: ECHO_EXPECT
         echoer: ECHOER
      do
         create echo
         create echoer.make(echo.mock)
         expect(<<
                echo.ping.times(3),
                echo.echo("foo").then_return("foo"),
                echo.echo("bar").times(0),
                echo.echo("blah").times(2).then_return("blah"),
                >>)
         replay_all
         echoer.check_echo("foo")
         echoer.check_echo("blah")
         echoer.check_echo("blah")
      end

end
