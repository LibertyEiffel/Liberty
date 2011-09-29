-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUNNER_OBJECT

insert
   RUNNER_FACET
      undefine
         out_in_tagged_out_memory, is_equal
      end

feature {ANY}
   processor: RUNNER_PROCESSOR is
      deferred
      end

   type: TYPE is
      deferred
      end

feature {RUNNER_FACET}
   copy_if_expanded: like Current is
      deferred
      ensure
         Result.is_equal(Current)
         type.is_reference implies Result = Current
      end

   eq (other: RUNNER_OBJECT): BOOLEAN is
      local
         o: like Current
      do
         if other /= Void and then other.same_dynamic_type(Current) then
            o ::= other
            Result := is_equal(o)
         end
      end

invariant
   processor /= Void
   type /= Void

end -- class RUNNER_OBJECT
