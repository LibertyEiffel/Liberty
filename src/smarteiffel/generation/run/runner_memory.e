-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_MEMORY

insert
   RUNNER_FACET

create {RUNNER}
   make

feature {RUNNER_PROCESSOR}
   new_object (processor: RUNNER_PROCESSOR; type: TYPE): RUNNER_OBJECT
      require
         alive: type.live_type /= Void
         processing: processor /= Void
      local
         builtins: RUNNER_UNTYPED_BUILTINS
      do
         builtins := find_builtins_for(type)
         Result := builtins.new(processor)
      ensure
         exists: Result /= Void
         good_type: Result.type = type
         good_processor: Result.processor = processor
      end

   new_agent (processor: RUNNER_PROCESSOR; agent_creation: AGENT_CREATION): RUNNER_AGENT_OBJECT
      local
         arg_count: INTEGER; type: TYPE
      do
         if agent_creation.open_operand_list /= Void then
            arg_count := agent_creation.open_operand_list.count
         end
         if agent_creation.closed_operand_list /= Void then
            arg_count := arg_count + agent_creation.closed_operand_list.count
         end

         type := agent_creation.resolve_in(processor.current_frame.target.type)
         create Result.make(processor, type,
                            agent_creation.code, arg_count,
                            agent_creation.feature_stamp,
                            agent_builtins(type))

         if agent_creation.open_operand_list /= Void then
            agent_creation.open_operand_list.for_each(agent add_new_open_operand(processor, Result, ?))
         end
         if agent_creation.closed_operand_list /= Void then
            agent_creation.closed_operand_list.for_each(agent add_new_closed_operand(processor, Result, ?))
         end
         if Result.target = Void then
            Result.set_operand(-1, processor.current_frame.target)
         end
      ensure
         Result.target /= Void
      end

   new_boolean (processor: RUNNER_PROCESSOR; boolean: BOOLEAN): RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         create Result.make(processor, smart_eiffel.type_boolean, boolean, boolean_builtins)
      end

   new_character (processor: RUNNER_PROCESSOR; character: CHARACTER): RUNNER_NATIVE_EXPANDED[CHARACTER]
      do
         create Result.make(processor, smart_eiffel.type_character, character, character_builtins)
      end

   new_native_array_character (processor: RUNNER_PROCESSOR; capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]): RUNNER_NATIVE_ARRAY[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]]
         -- should only be used for manifest string creations
      do
         Result := native_array_character_builtins.with_storage(processor, capacity, storage)
      end

   new_pointer (processor: RUNNER_PROCESSOR; pointer: POINTER): RUNNER_NATIVE_EXPANDED[POINTER]
      do
         create Result.make(processor, smart_eiffel.type_pointer, pointer, pointer_builtins)
      end

   new_integer_8 (processor: RUNNER_PROCESSOR; integer_8: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         create Result.make(processor, smart_eiffel.type_integer_8, integer_8, integer_8_builtins)
      end

   new_integer_16 (processor: RUNNER_PROCESSOR; integer_16: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         create Result.make(processor, smart_eiffel.type_integer_16, integer_16, integer_16_builtins)
      end

   new_integer_32 (processor: RUNNER_PROCESSOR; integer_32: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         create Result.make(processor, smart_eiffel.type_integer_32, integer_32, integer_32_builtins)
      end

   new_integer_64 (processor: RUNNER_PROCESSOR; integer_64: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         create Result.make(processor, smart_eiffel.type_integer_64, integer_64, integer_64_builtins)
      end

   new_natural_8 (processor: RUNNER_PROCESSOR; natural_8: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         create Result.make(processor, smart_eiffel.type_natural_8, natural_8, Void) --| **** TODO
      end

   new_natural_16 (processor: RUNNER_PROCESSOR; natural_16: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         create Result.make(processor, smart_eiffel.type_natural_16, natural_16, Void) --| **** TODO
      end

   new_natural_32 (processor: RUNNER_PROCESSOR; natural_32: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         create Result.make(processor, smart_eiffel.type_natural_32, natural_32, Void) --| **** TODO
      end

   new_natural_64 (processor: RUNNER_PROCESSOR; natural_64: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64]
      do
         create Result.make(processor, smart_eiffel.type_natural_64, natural_64, Void) --| **** TODO
      end

   new_internals_handler_if_exists (processor: RUNNER_PROCESSOR; internals_handler: INTERNALS_HANDLER): RUNNER_OBJECT
      do
         --| **** TODO
      end

   new_real_32 (processor: RUNNER_PROCESSOR; real_32: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         create Result.make(processor, smart_eiffel.type_real_32, real_32, real_32_builtins)
      end

   new_real_64 (processor: RUNNER_PROCESSOR; real_64: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         create Result.make(processor, smart_eiffel.type_real_64, real_64, real_64_builtins)
      end

   new_real_extended (processor: RUNNER_PROCESSOR; real_extended: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      do
         create Result.make(processor, smart_eiffel.type_real_extended, real_extended, real_extended_builtins)
      end

feature {RUNNER_FACET}
   is_gc_started: BOOLEAN
      do
         Result := gc.collecting
      end

   start_gc
      do
         gc.collection_on
      end

   stop_gc
      do
         gc.collection_off
      end

   run_gc
      do
         gc.full_collect
      end

   gc_count: INTEGER
      do
         Result := gc.collector_counter
      end

feature {}
   add_new_open_operand (processor: RUNNER_PROCESSOR; a_new_agent: RUNNER_AGENT_OBJECT; a_open_operand: OPEN_OPERAND)
      local
         arg: RUNNER_OPEN_OPERAND
      do
         debug ("run.data")
            std_output.put_line(once "AGENT: open ##(1)" # a_open_operand.rank.out)
         end
         create arg.make(a_new_agent, a_open_operand.resolve_in(processor.current_frame.target.type))
         a_new_agent.set_operand(a_open_operand.rank, arg)
      end

   add_new_closed_operand (processor: RUNNER_PROCESSOR; a_new_agent: RUNNER_AGENT_OBJECT; a_closed_operand: CLOSED_OPERAND)
      local
         exp: EXPRESSION; arg: RUNNER_OBJECT
      do
         exp := a_closed_operand.capture_memory.at(processor.current_frame.target.type)
         arg := processor.expressions.eval(exp)
         debug ("run.data")
            std_output.put_line(once "AGENT: closed ##(1) = #(2)" # a_closed_operand.rank.out # arg.out)
         end
         if arg = Void then
            break
         end
         a_new_agent.set_operand(a_closed_operand.rank, arg)
      end

feature {}
   make
      do
      end

   gc: MEMORY

   builtins_map: HASHED_DICTIONARY[RUNNER_UNTYPED_BUILTINS, TYPE]
      once
         Result := {HASHED_DICTIONARY[RUNNER_UNTYPED_BUILTINS, TYPE]
         <<
            boolean_builtins, smart_eiffel.type_boolean;
            character_builtins, smart_eiffel.type_character;
            integer_8_builtins, smart_eiffel.type_integer_8;
            integer_16_builtins, smart_eiffel.type_integer_16;
            integer_32_builtins, smart_eiffel.type_integer_32;
            integer_64_builtins, smart_eiffel.type_integer_64;
            real_32_builtins, smart_eiffel.type_real_32;
            real_64_builtins, smart_eiffel.type_real_64;
            real_extended_builtins, smart_eiffel.type_real_extended;
            native_array_character_builtins, smart_eiffel.type_native_array_character;
            any_builtins(smart_eiffel.type_any), smart_eiffel.type_any;
         >>}
      end

   find_builtins_for (type: TYPE): RUNNER_UNTYPED_BUILTINS
      local
         i: INTEGER
      do
         Result := builtins_map.fast_reference_at(type)
         if Result = Void then
            if type.parents = Void then
               Result := any_builtins(type)
            else
               inspect
                  type.name.to_string --| **** TODO: also check the cluster
               when "ARGUMENTS" then
                  create {RUNNER_ARGUMENTS_BUILTINS} Result.make(type)
               when "MEMORY" then
                  create {RUNNER_MEMORY_BUILTINS} Result.make(type)
               when "PLATFORM" then
                  Result := platform_builtins(type)
               when "NATIVE_ARRAY[BOOLEAN]" then
                  create {RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[BOOLEAN, RUNNER_NATIVE_EXPANDED[BOOLEAN]]} Result.make(type, smart_eiffel.type_boolean,
                                                                                                                    agent new_boolean,
                                                                                                                    agent {RUNNER_NATIVE_EXPANDED[BOOLEAN]}.item)
               when "NATIVE_ARRAY[INTEGER_8]" then
                  create {RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[INTEGER_8, RUNNER_NATIVE_EXPANDED[INTEGER_64]]} Result.make(type, smart_eiffel.type_integer_8,
                                                                                                                         agent retrieve_integer_8,
                                                                                                                         agent set_integer_8)
               when "NATIVE_ARRAY[INTEGER_16]" then
                  create {RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[INTEGER_16, RUNNER_NATIVE_EXPANDED[INTEGER_64]]} Result.make(type, smart_eiffel.type_integer_16,
                                                                                                                          agent retrieve_integer_16,
                                                                                                                          agent set_integer_16)
               when "NATIVE_ARRAY[INTEGER]", "NATIVE_ARRAY[INTEGER_32]" then
                  create {RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[INTEGER_32, RUNNER_NATIVE_EXPANDED[INTEGER_64]]} Result.make(type, smart_eiffel.type_integer_32,
                                                                                                                          agent retrieve_integer_32,
                                                                                                                          agent set_integer_32)
               when "NATIVE_ARRAY[INTEGER_64]" then
                  create {RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[INTEGER_64, RUNNER_NATIVE_EXPANDED[INTEGER_64]]} Result.make(type, smart_eiffel.type_integer_64,
                                                                                                                          agent retrieve_integer_64,
                                                                                                                          agent set_integer_64)
               else
                  if type.name.to_string.has_prefix(once "NATIVE_ARRAY[") then
                     create {RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[RUNNER_STRUCTURED_OBJECT, RUNNER_STRUCTURED_OBJECT]} Result.make(type, type.generic_list.first,
                                                                                                                                 agent trivial_retrieve,
                                                                                                                                 agent trivial_set)
                  else
                     create {RUNNER_NO_BUILTINS} Result.make(type)
                  end
               end

               if type.parents_count = 0 then
                  Result.add_parent(any_builtins(type))
               else
                  from
                     i := type.parents.lower
                  until
                     i > type.parents.upper
                  loop
                     Result.add_parent(find_builtins_for(type.parents.item(i)))
                     i := i + 1
                  end
               end
            end
            builtins_map.add(Result, type)
         end
      ensure
         Result /= Void
      end

   any_builtins (type: TYPE): RUNNER_ANY_BUILTINS
      do
         create Result.make(type)
      end

   platform_builtins (type: TYPE): RUNNER_PLATFORM_BUILTINS
      do
         create Result.make(type)
      end

   agent_builtins (type: TYPE): RUNNER_AGENT_BUILTINS
      do
         Result ::= builtins_map.fast_reference_at(type)
         if Result = Void then
            create Result.make(type)
            Result.add_parent(any_builtins(type))
            builtins_map.add(Result, type)
         end
      end

   boolean_builtins: RUNNER_BOOLEAN_BUILTINS
      once
         create Result.make
         Result.add_parent(any_builtins(smart_eiffel.type_boolean))
      end

   character_builtins: RUNNER_CHARACTER_BUILTINS
      once
         create Result.make
         Result.add_parent(any_builtins(smart_eiffel.type_character))
         Result.add_parent(platform_builtins(smart_eiffel.type_character))
      end

   pointer_builtins: RUNNER_POINTER_BUILTINS
      once
         create Result.make
         Result.add_parent(any_builtins(smart_eiffel.type_pointer))
      end

   integer_builtins (type: TYPE): RUNNER_NUMERIC_BUILTINS[INTEGER_64]
      do
         create Result.make(type)
         Result.add_parent(any_builtins(type))
         Result.add_parent(platform_builtins(type))
      end

   integer_8_builtins: RUNNER_INTEGRAL_BUILTINS
      once
         create Result.make(smart_eiffel.type_integer_8, agent (processor: RUNNER_PROCESSOR; integer: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
                                                            do
                                                               Result := processor.new_integer_8(integer & 0xff)
                                                            end)
         Result.add_parent(integer_builtins(smart_eiffel.type_integer_8))
      end

   integer_16_builtins: RUNNER_INTEGRAL_BUILTINS
      once
         create Result.make(smart_eiffel.type_integer_16, agent (processor: RUNNER_PROCESSOR; integer: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
                                                             do
                                                                Result := processor.new_integer_16(integer & 0xffff)
                                                             end)
         Result.add_parent(integer_builtins(smart_eiffel.type_integer_16))
      end

   integer_32_builtins: RUNNER_INTEGRAL_BUILTINS
      once
         create Result.make(smart_eiffel.type_integer_32, agent (processor: RUNNER_PROCESSOR; integer: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
                                                             do
                                                                Result := processor.new_integer_32(integer & 0xffffffff)
                                                             end)
         Result.add_parent(integer_builtins(smart_eiffel.type_integer_32))
      end

   integer_64_builtins: RUNNER_INTEGRAL_BUILTINS
      once
         create Result.make(smart_eiffel.type_integer_64, agent {RUNNER_PROCESSOR}.new_integer_64)
         Result.add_parent(integer_builtins(smart_eiffel.type_integer_64))
      end

   real_builtins (type: TYPE): RUNNER_NUMERIC_BUILTINS[REAL_EXTENDED]
      do
         create Result.make(type)
         Result.add_parent(any_builtins(type))
      end

   real_32_builtins: RUNNER_FLOAT_BUILTINS[REAL_EXTENDED]
      once
         create Result.make(smart_eiffel.type_real_32)
         Result.add_parent(real_builtins(smart_eiffel.type_real_32))
      end

   real_64_builtins: RUNNER_FLOAT_BUILTINS[REAL_EXTENDED]
      once
         create Result.make(smart_eiffel.type_real_64)
         Result.add_parent(real_builtins(smart_eiffel.type_real_64))
      end

   real_extended_builtins: RUNNER_FLOAT_BUILTINS[REAL_EXTENDED]
      once
         create Result.make(smart_eiffel.type_real_extended)
         Result.add_parent(real_builtins(smart_eiffel.type_real_extended))
      end

   native_array_character_builtins: RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]]
      once
         create Result.make(smart_eiffel.type_native_array_character, smart_eiffel.type_character,
                            agent new_character, agent {RUNNER_NATIVE_EXPANDED[CHARACTER]}.item,)
         Result.add_parent(any_builtins(smart_eiffel.type_native_array_character))
      end

   trivial_retrieve (p: RUNNER_PROCESSOR; o: RUNNER_STRUCTURED_OBJECT): RUNNER_STRUCTURED_OBJECT
      do
         Result := o
      end

   trivial_set (o: RUNNER_STRUCTURED_OBJECT): RUNNER_STRUCTURED_OBJECT
      do
         c_inline_c("/* KEEP ME */") --| **** TODO: Liberty Eiffel bug -- otherwise the agent mysteriously disappears
         Result := o
      end

   retrieve_integer_8 (p: RUNNER_PROCESSOR; o: INTEGER_8): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_8(p, o.to_integer_64)
      end

   retrieve_integer_16 (p: RUNNER_PROCESSOR; o: INTEGER_16): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_16(p, o.to_integer_64)
      end

   retrieve_integer_32 (p: RUNNER_PROCESSOR; o: INTEGER_32): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_32(p, o.to_integer_64)
      end

   retrieve_integer_64 (p: RUNNER_PROCESSOR; o: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := new_integer_64(p, o)
      end

   set_integer_8 (o: RUNNER_NATIVE_EXPANDED[INTEGER_64]): INTEGER_8
      do
         Result := o.item.to_integer_8
      end

   set_integer_16 (o: RUNNER_NATIVE_EXPANDED[INTEGER_64]): INTEGER_16
      do
         Result := o.item.to_integer_16
      end

   set_integer_32 (o: RUNNER_NATIVE_EXPANDED[INTEGER_64]): INTEGER_32
      do
         Result := o.item.to_integer_32
      end

   set_integer_64 (o: RUNNER_NATIVE_EXPANDED[INTEGER_64]): INTEGER_64
      do
         Result := o.item
      end

end -- class RUNNER_MEMORY
