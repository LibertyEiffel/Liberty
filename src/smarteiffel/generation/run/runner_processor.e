-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_PROCESSOR

insert
   RUNNER_FACET
      rename
         default_pointer as default_pointer_
      end
   STRING_HANDLER
      rename
         default_pointer as default_pointer_
      end

create {RUNNER}
   make

feature {RUNNER_FACET}
   features: RUNNER_FEATURES
   instructions: RUNNER_INSTRUCTIONS
   expressions: RUNNER_EXPRESSIONS
   old_expressions: RUNNER_OLD_EXPRESSIONS
   assignment: RUNNER_ASSIGNMENT

   memory: RUNNER_MEMORY
         -- shared by all processors

   current_frame: RUNNER_FRAME
      do
         Result := features.current_frame
      end

feature {RUNNER_FACET} -- Exceptions
   exception: RUNNER_EXCEPTION

   set_exception (a_exception: INTEGER; a_message: ABSTRACT_STRING)
      do
         create exception.make(a_exception, a_message.intern, Current, exception)
         break --| **** useful breakpoint for debug.
      ensure
         exception.message = a_message.intern
      end

   clear_exception
      do
         exception := Void
      end

feature {RUNNER_FEATURES} -- Contract checking
   check_invariant (type: TYPE)
      require
         type /= Void
         current_frame.target.type = type
         current_frame.target.is_initialized
      local
         class_invariant: CLASS_INVARIANT
      do
         if exception = Void and then type.class_text.invariant_check then
            class_invariant := type.class_invariant
            if class_invariant /= Void then
               debug ("run.callstack")
                  std_output.put_line(once "~~8<~~ INVARIANT OF #(1) ~~8<~~" # type.name.to_string)
               end
               check_assertions(exceptions.Class_invariant, class_invariant)
               debug ("run.callstack")
                  std_output.put_line(once "~~>8~~ invariant of #(1) ~~>8~~" # type.name.to_string)
               end
            end
         end
      end

   check_require (target: RUNNER_OBJECT; rf: RUN_FEATURE)
      require
         target /= Void
         rf /= Void
      local
         require_assertion: REQUIRE_ASSERTION
         original_exception, last_exception: RUNNER_EXCEPTION
         i: INTEGER; ok: BOOLEAN
      do
         if exception = Void then
            require_assertion := rf.require_assertion
            if require_assertion /= Void and then not require_assertion.is_always_true(target.type)
               and then target.check_and_set_position(require_assertion.start_position)
            then
               debug ("run.callstack")
                  std_output.put_line(once "~~8<~~ PRECONDITION OF {#(1)}.#(2) ~~8<~~" # target.type.name.to_string # rf.name.to_string)
               end
               from
                  i := require_assertion.lower
               invariant
                  exception = Void
               until
                  ok or else i > require_assertion.upper
               loop
                  check_assertions(exceptions.Precondition, require_assertion.item(i))
                  if exception = Void then
                     ok := True
                  elseif original_exception = Void then
                     original_exception := exception
                     last_exception := exception
                  else
                     exception.set_parent(last_exception)
                     last_exception := exception
                     clear_exception
                  end
                  i := i + 1
               end
               if not ok then
                  check
                     original_exception /= Void
                  end
                  exception := original_exception
               end
               target.clear_position(require_assertion.start_position)
               debug ("run.callstack")
                  std_output.put_line(once "~~>8~~ precondition of {#(1)}.#(2) ~~>8~~" # target.type.name.to_string # rf.name.to_string)
               end
            end
         end
      end

   prepare_old (target: RUNNER_OBJECT; rf: RUN_FEATURE)
      require
         rf /= Void
      local
         ensure_assertion: ENSURE_ASSERTION
         i: INTEGER; assertion: ASSERTION
      do
         if exception = Void then
            ensure_assertion := rf.ensure_assertion
            if ensure_assertion /= Void and then not ensure_assertion.is_always_true(current_frame.target.type) then
               debug ("run.callstack")
                  std_output.put_line(once "~~8<~~ PREPARE OLD OF {#(1)}.#(2) ~~8<~~" # target.type.name.to_string # rf.name.to_string)
               end
               from
                  i := ensure_assertion.lower
               until
                  exception /= Void or else i > ensure_assertion.upper
               loop
                  assertion := ensure_assertion.item(i)
                  if assertion.expression /= Void then
                     old_expressions.execute(assertion.expression, rf)
                  end
                  i := i + 1
               end
               debug ("run.callstack")
                  std_output.put_line(once "~~>8~~ prepare old of {#(1)}.#(2) ~~>8~~" # target.type.name.to_string # rf.name.to_string)
               end
            end
         end
      end

   check_ensure (target: RUNNER_OBJECT; rf: RUN_FEATURE)
      require
         rf /= Void
      local
         ensure_assertion: ENSURE_ASSERTION
      do
         if exception = Void then
            ensure_assertion := rf.ensure_assertion
            if ensure_assertion /= Void then
               debug ("run.callstack")
                  std_output.put_line(once "~~8<~~ POSTCONDITION OF {#(1)}.#(2) ~~8<~~" # target.type.name.to_string # rf.name.to_string)
               end
               check_assertions(exceptions.Postcondition, ensure_assertion)
               debug ("run.callstack")
                  std_output.put_line(once "~~>8~~ postcondition of {#(1)}.#(2) ~~>8~~" # target.type.name.to_string # rf.name.to_string)
               end
            end
         end
      end

feature {RUNNER_FACET}
   check_assertions (exception_type: INTEGER; assertions: ASSERTION_LIST)
      require
         exception = Void
         assertions /= Void
      local
         i: INTEGER; assertion: ASSERTION; value: RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         if current_frame.target.check_and_set_position(assertions.start_position)
            and then not assertions.is_always_true(current_frame.target.type)
         then
            from
               i := assertions.lower
            until
               exception /= Void or else i > assertions.upper
            loop
               assertion := assertions.item(i)
               if assertion.expression /= Void then
                  value ::= expressions.eval(assertion.expression)
                  if not value.item then
                     set_exception(exception_type, assertion_string(exception_type, assertion))
                  end
               end
               i := i + 1
            end
            current_frame.target.clear_position(assertions.start_position)
         end
      end

feature {}
   assertion_string (exception_type: INTEGER; assertion: ASSERTION): STRING
      do
         Result := once ""
         Result.copy(exceptions.name_of_exception(exception_type))
         Result.append(once " failed: ")
         if assertion.tag /= Void then
            Result.append(assertion.tag.to_string)
         elseif assertion.source_view /= Void then
            Result.append(assertion.source_view)
         elseif assertion.comment /= Void then
            not_yet_implemented
         else
            check
               assertion.expression /= Void
            end
            assertion_displayer_stream.clear
            assertion.expression.accept(assertion_displayer)
            Result.append(assertion_displayer_stream.to_string)
         end
      end

   assertion_displayer: RUNNER_DISPLAYER
      once
         create Result.make(assertion_displayer_stream)
      end

   assertion_displayer_stream: STRING_OUTPUT_STREAM
      once
         create Result.make
      end

feature {} -- fly-weights
   booleans:       FAST_ARRAY[RUNNER_NATIVE_EXPANDED[BOOLEAN]]
   characters:     HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[CHARACTER],     CHARACTER]
   integers_8:     HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_64],    INTEGER_64]
   integers_16:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_64],    INTEGER_64]
   integers_32:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_64],    INTEGER_64]
   integers_64:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_64],    INTEGER_64]
   naturals_8:     HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_64],    NATURAL_64]
   naturals_16:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_64],    NATURAL_64]
   naturals_32:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_64],    NATURAL_64]
   naturals_64:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_64],    NATURAL_64]
   reals_32:       HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[REAL_EXTENDED], REAL_EXTENDED]
   reals_64:       HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[REAL_EXTENDED], REAL_EXTENDED]
   reals_extended: HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[REAL_EXTENDED], REAL_EXTENDED]

feature {RUNNER_FACET}
   new_object (type: TYPE): RUNNER_OBJECT
      require
         alive: type.live_type /= Void
      do
         if type.is_expanded then
            Result := default_expanded(type)
         else
            Result := memory.new_object(Current, type)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = type
         good_processor: Result.processor = Current
      end

   default_expanded (type: TYPE): RUNNER_OBJECT
      require
         type.is_expanded
      local
         default_value: FUNCTION[TUPLE, RUNNER_OBJECT]
      do
         default_value := defaults.fast_reference_at(type)
         if default_value /= Void then
            Result := default_value.item([])
         else
            Result := memory.new_object(Current, type)
         end
      ensure
         Result /= Void
      end

   default_boolean: RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         Result := new_boolean(False)
      end

   new_boolean (boolean: BOOLEAN): RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         Result := booleans.item(boolean.to_integer)
         if Result = Void then
            Result := memory.new_boolean(Current, boolean)
            booleans.put(Result, boolean.to_integer)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_boolean
         good_processor: Result.processor = Current
      end

   default_character: RUNNER_NATIVE_EXPANDED[CHARACTER]
      do
         Result := new_character('%U')
      end

   new_character (character: CHARACTER): RUNNER_NATIVE_EXPANDED[CHARACTER]
      do
         Result := characters.fast_reference_at(character)
         if Result = Void then
            Result := memory.new_character(Current, character)
            characters.add(Result, character)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_character
         good_processor: Result.processor = Current
      end

   default_native_array_character: RUNNER_NATIVE_ARRAY[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]]
      local
         storage: NATIVE_ARRAY[CHARACTER]
      do
         Result := new_native_array_character(0, storage)
      end

   new_native_array_character (capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]): RUNNER_NATIVE_ARRAY[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]]
      do
         Result := memory.new_native_array_character(Current, capacity, storage)
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_native_array_character
         good_processor: Result.processor = Current
      end

   default_pointer: RUNNER_NATIVE_EXPANDED[POINTER]
      do
         Result := new_pointer(default_pointer_)
      end

   new_pointer (pointer: POINTER): RUNNER_NATIVE_EXPANDED[POINTER]
      do
         Result := memory.new_pointer(Current, pointer)
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_pointer
         good_processor: Result.processor = Current
      end

   new_integer (a_integer: INTEGER_64): RUNNER_OBJECT
      do
         if a_integer.fit_integer_8 then
            Result := new_integer_8(a_integer.to_integer_8)
         elseif a_integer.fit_integer_16 then
            Result := new_integer_16(a_integer.to_integer_16)
         elseif a_integer.fit_integer_32 then
            Result := new_integer_32(a_integer.to_integer_32)
         else
            Result := new_integer_64(a_integer)
         end
      end

   default_integer_8: RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_8(0)
      end

   new_integer_8 (integer_8: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := integers_8.fast_reference_at(integer_8)
         if Result = Void then
            Result := memory.new_integer_8(Current, integer_8)
            integers_8.add(Result, integer_8)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_8
         good_processor: Result.processor = Current
      end

   default_integer_16: RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_16(0)
      end

   new_integer_16 (integer_16: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := integers_16.fast_reference_at(integer_16)
         if Result = Void then
            Result := memory.new_integer_16(Current, integer_16)
            integers_16.add(Result, integer_16)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_16
         good_processor: Result.processor = Current
      end

   default_integer_32: RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_32(0)
      end

   new_integer_32 (integer_32: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := integers_32.fast_reference_at(integer_32)
         if Result = Void then
            Result := memory.new_integer_32(Current, integer_32)
            integers_32.add(Result, integer_32)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_32
         good_processor: Result.processor = Current
      end

   default_integer_64: RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_64(0)
      end

   new_integer_64 (integer_64: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := integers_64.fast_reference_at(integer_64)
         if Result = Void then
            Result := memory.new_integer_64(Current, integer_64)
            integers_64.add(Result, integer_64)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_64
         good_processor: Result.processor = Current
      end

   default_natural_8: RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := new_natural_8(0.to_natural_64)
      end

   new_natural_8 (natural_8: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := naturals_8.fast_reference_at(natural_8)
         if Result = Void then
            Result := memory.new_natural_8(Current, natural_8)
            naturals_8.add(Result, natural_8)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_8
         good_processor: Result.processor = Current
      end

   default_natural_16: RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := new_natural_16(0.to_natural_64)
      end

   new_natural_16 (natural_16: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := naturals_16.fast_reference_at(natural_16)
         if Result = Void then
            Result := memory.new_natural_16(Current, natural_16)
            naturals_16.add(Result, natural_16)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_16
         good_processor: Result.processor = Current
      end

   default_natural_32: RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := new_natural_32(0.to_natural_64)
      end

   new_natural_32 (natural_32: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := naturals_32.fast_reference_at(natural_32)
         if Result = Void then
            Result := memory.new_natural_32(Current, natural_32)
            naturals_32.add(Result, natural_32)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_32
         good_processor: Result.processor = Current
      end

   default_natural_64: RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := new_natural_64(0.to_natural_64)
      end

   new_natural_64 (natural_64: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         Result := naturals_64.fast_reference_at(natural_64)
         if Result = Void then
            Result := memory.new_natural_64(Current, natural_64)
            naturals_64.add(Result, natural_64)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_64
         good_processor: Result.processor = Current
      end

   default_internals_handler_if_exists: RUNNER_OBJECT
      do
         Result := new_internals_handler_if_exists(Void) --| **** TODO
      end

   new_internals_handler_if_exists (internals_handler: INTERNALS_HANDLER): RUNNER_OBJECT
      do
         Result := memory.new_internals_handler_if_exists(Current, internals_handler)
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_internals_handler_if_exists
         good_processor: Result.processor = Current
      end

   default_real_32: RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         Result := new_real_32(0.0)
      end

   new_real_32 (real_32: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         Result := reals_32.fast_reference_at(real_32)
         if Result = Void then
            Result := memory.new_real_32(Current, real_32)
            reals_32.add(Result, real_32)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_real_32
         good_processor: Result.processor = Current
      end

   default_real_64: RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         Result := new_real_64(0.0)
      end

   new_real_64 (real_64: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         Result := reals_64.fast_reference_at(real_64)
         if Result = Void then
            Result := memory.new_real_64(Current, real_64)
            reals_64.add(Result, real_64)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_real_64
         good_processor: Result.processor = Current
      end

   default_real_extended: RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         Result := new_real_extended(0.0)
      end

   new_real_extended (real_extended: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         Result := reals_extended.fast_reference_at(real_extended)
         if Result = Void then
            Result := memory.new_real_extended(Current, real_extended)
            reals_extended.add(Result, real_extended)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_real_extended
         good_processor: Result.processor = Current
      end

   new_manifest_string (content: ABSTRACT_STRING; is_once: BOOLEAN): RUNNER_OBJECT
      local
         manifest_string: FIXED_STRING
      do
         manifest_string := content.intern
         if is_once then
            Result := once_manifest_strings.fast_reference_at(manifest_string)
            if Result = Void then
               Result := new_manifest_string_(manifest_string)
               once_manifest_strings.add(Result, manifest_string)
            end
         else
            Result := new_manifest_string_(manifest_string)
         end
      end

   new_agent (agent_creation: AGENT_CREATION): RUNNER_AGENT_OBJECT
      do
         Result := memory.new_agent(Current, agent_creation)
      end

feature {}
   once_manifest_strings: HASHED_DICTIONARY[RUNNER_OBJECT, FIXED_STRING]

   new_manifest_string_ (manifest_string: FIXED_STRING): RUNNER_STRUCTURED_OBJECT
      do
         Result ::= new_object(smart_eiffel.type_string)
         Result.set_field(once "count",         new_integer_32(manifest_string.count))
         Result.set_field(once "capacity",      new_integer_32(manifest_string.capacity))
         Result.set_field(once "storage_lower", new_integer_32(0))
         Result.set_field(once "storage",       new_native_array_character(manifest_string.capacity, manifest_string.storage)) -- should be OK to share the storage
      end

feature {RUNNER}
   run (rf: RUN_FEATURE)
      do
         features.run(rf)
         check_exception
      end

feature {}
   check_exception
      do
         if exception /= Void then
            print_exception(exception)
            die_with_code(1)
         end
      ensure
         no_exception_or_dead: old exception = Void
      end

   print_exception (a_exception: RUNNER_EXCEPTION)
      require
         a_exception /= Void
      do
         if a_exception.parent /= Void then
            print_exception(a_exception.parent)
            std_error.put_string(once "%N----------------------------------------%N%N")
         end

         std_error.put_string(once "**** Exception: ")
         std_error.put_line(a_exception.message)

         a_exception.print_stack

         std_error.put_string(once "**** Exception: ")
         std_error.put_line(a_exception.message)
      end

feature {RUNNER_PLUGIN}
   plugin_agent (a_name: FIXED_STRING): FOREIGN_AGENT
      do
         Result := plugin_agents.fast_reference_at(a_name)
      end

   set_plugin_agent (a_agent: FOREIGN_AGENT; a_name: FIXED_STRING)
      require
         a_agent /= Void
         a_name /= Void
         plugin_agent(a_name) = Void
      do
         plugin_agents.add(a_agent, a_name)
      ensure
         plugin_agent(a_name) = a_agent
      end

feature {}
   make (a_memory: like memory)
      require
         a_memory /= Void
      do
         create features.make(Current)
         create instructions.make(Current)
         create expressions.make(Current)
         create old_expressions.make(Current)
         create assignment.make(Current)

         create booleans.make(2)
         create characters.make
         create integers_8.make
         create integers_16.make
         create integers_32.make
         create integers_64.make
         create naturals_8.make
         create naturals_16.make
         create naturals_32.make
         create naturals_64.make
         create reals_32.make
         create reals_64.make
         create reals_extended.make

         defaults := {HASHED_DICTIONARY[FUNCTION[TUPLE, RUNNER_OBJECT], TYPE]
         <<
            agent default_boolean,                smart_eiffel.type_boolean;
            agent default_character,              smart_eiffel.type_character;
            agent default_native_array_character, smart_eiffel.type_native_array_character;
            agent default_pointer,                smart_eiffel.type_pointer;
            agent default_integer_8,              smart_eiffel.type_integer_8;
            agent default_integer_16,             smart_eiffel.type_integer_16;
            agent default_integer_32,             smart_eiffel.type_integer_32;
            agent default_integer_64,             smart_eiffel.type_integer_64;
            agent default_natural_8,              smart_eiffel.type_natural_8;
            agent default_natural_16,             smart_eiffel.type_natural_16;
            agent default_natural_32,             smart_eiffel.type_natural_32;
            agent default_natural_64,             smart_eiffel.type_natural_64;
            agent default_real_32,                smart_eiffel.type_real_32;
            agent default_real_64,                smart_eiffel.type_real_64;
            agent default_real_extended,          smart_eiffel.type_real_extended;
         >>}

         create plugin_agents.make
         create once_manifest_strings.make

         memory := a_memory
      ensure
         memory = a_memory
      end

   defaults: HASHED_DICTIONARY[FUNCTION[TUPLE, RUNNER_OBJECT], TYPE]
   plugin_agents: HASHED_DICTIONARY[FOREIGN_AGENT, FIXED_STRING]

invariant
   memory /= Void

   features        /= Void and then features.processor        = Current
   instructions    /= Void and then instructions.processor    = Current
   expressions     /= Void and then expressions.processor     = Current
   old_expressions /= Void and then old_expressions.processor = Current
   assignment      /= Void and then assignment.processor      = Current

   booleans       /= Void
   characters     /= Void
   integers_8     /= Void
   integers_16    /= Void
   integers_32    /= Void
   integers_64    /= Void
   naturals_8     /= Void
   naturals_16    /= Void
   naturals_32    /= Void
   naturals_64    /= Void
   reals_32       /= Void
   reals_64       /= Void
   reals_extended /= Void

   defaults       /= Void
   plugin_agents  /= Void

end -- class RUNNER_PROCESSOR
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
