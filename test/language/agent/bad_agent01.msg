****** Fatal Error: Local name `i' is not writable (reached through
closure). Cannot use `i' for the left-hand side of an assignment.

Line 18 column 22 in BAD_AGENT01 (/home/cadrian/Workspace/Dev/Liberty/test/language/agent/bad_agent01.e):
         (agent do i := 3; assert(i = 3); end).call([])
                     ^                                 
------
