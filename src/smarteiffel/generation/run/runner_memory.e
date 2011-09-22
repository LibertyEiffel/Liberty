-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_MEMORY

create {RUNNER}
   make

feature {RUNNER_FACET}
   new_object (processor: RUNNER_PROCESSOR; type: TYPE): RUNNER_OBJECT is
      require
         alive: type.live_type /= Void
         processing: processor /= Void
      do
      ensure
         exists: Result /= Void
         good_type: Result.type = type
         good_processor: Result.processor = processor
      end

feature {}
   make is
      do
      end

end -- class RUNNER_MEMORY
