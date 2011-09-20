-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER
   --
   -- Singleton in charge of handling Eiffel interpretation.
   -- This singleton is shared via the GLOBALS.`runner' once function.
   --

inherit
   CODE_PRINTER -- not really a "printer", but it consumes code semantics all the same; and that's what SMART_EIFFEL.`compile' expects

create {ANY}
   make

feature {SMART_EIFFEL}
   compile is
         -- Code interpretation happens here.
      do
      end

feature {}
   make is
      do
      end

end -- class RUNNER
