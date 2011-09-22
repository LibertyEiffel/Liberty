-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUNNER_OBJECT

feature {ANY}
   processor: RUNNER_PROCESSOR is
      deferred
      end

   type: TYPE is
      deferred
      end

   set_field (a_name: ABSTRACT_STRING; a_value: RUNNER_OBJECT) is
      deferred
      end

   field (a_name: ABSTRACT_STRING): RUNNER_OBJECT is
      deferred
      end

invariant
   processor /= Void
   type /= Void

end -- class RUNNER_OBJECT
