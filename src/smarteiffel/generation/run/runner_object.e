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
   builtins: RUNNER_UNTYPED_BUILTINS is
      deferred
      end

   processor: RUNNER_PROCESSOR is
      deferred
      end

   type: TYPE is
      deferred
      end

feature {RUNNER_UNTYPED_BUILTINS}
   builtin_to_pointer: POINTER is
      deferred
      end

   builtin_copy (other: RUNNER_OBJECT) is
      require
         other /= Void
         other.type = type
         other.processor = processor
      deferred
      end

   builtin_is_equal (other: RUNNER_OBJECT): BOOLEAN is
      require
         other /= Void
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

   as_foreign_object: FOREIGN_OBJECT is
      deferred
      end

feature {RUNNER_PROCESSOR} -- Contract checking anti-infinite recursion
   check_and_set_position (position: POSITION): BOOLEAN is
         -- True if the position was added
      do
         if checking_positions = Void then
            create checking_positions.make
         end
         if not checking_positions.fast_has(position) then
            Result := True
            checking_positions.fast_add(position)
         end
      ensure
         checking_positions.fast_has(position)
         Result implies old (checking_positions = Void or else not checking_positions.fast_has(position))
      end

   clear_position (position: POSITION) is
      require
         checking_positions.fast_has(position)
      do
         checking_positions.fast_remove(position)
      ensure
         not checking_positions.fast_has(position)
      end

feature {}
   checking_positions: HASHED_SET[POSITION]

invariant
   processor /= Void
   type /= Void

end -- class RUNNER_OBJECT
