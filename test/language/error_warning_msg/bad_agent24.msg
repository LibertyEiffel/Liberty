****** Fatal Error: Incompatible actual argument for agent call.
Cannot pass `Void' into formal argument of type CHARACTER because
CHARACTER is expanded. (The whole type of the agent your are trying
to launch is PROCEDURE[TUPLE[CHARACTER]].)

Line 12 column 32 in BAD_AGENT24 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent24.e):
         (agent proc(?)).call([Void])
                               ^     
------
