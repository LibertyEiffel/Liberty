-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_PLUGIN

inherit
   PLUGIN

insert
   RUNNER_FACET
      undefine
         is_equal
      end

creation {RUNNER_PLUGIN_FACTORY, FAKE_PLUGIN}
   make

feature {RUNNER_FACET}
   call (processor: RUNNER_PROCESSOR) is
      local
         function: FOREIGN_AGENT
         parameters: FOREIGN_PARAMETERS
         return: FOREIGN_OBJECT
         extractor: FUNCTION[TUPLE[RUNNER_PROCESSOR, FOREIGN_OBJECT], RUNNER_OBJECT]
      do
         function := foreign_agent(processor)
         if function /= Void then
            parameters.set(eval_parameters(processor))
            if processor.current_frame.type_of_result = Void then
               function.call(parameters)
            else
               return := function.item(parameters)
               extractor := foreign_types_map.fast_at(processor.current_frame.type_of_result).second
               processor.current_frame.set_return(extractor.item([processor, return]))
            end
         end
      end

   foreign_agent (processor: RUNNER_PROCESSOR): FOREIGN_AGENT is
      local
         dll_name_, agent_name_: STRING
         dll_name, agent_name: FIXED_STRING
         loader: FOREIGN_DLL_LOADER
         dll: FOREIGN_DLL
         arg_types: like foreign_types
         res_type: like foreign_type
      do
         agent_name_ := once ""
         agent_name_.copy(once "liberty_plugin__")
         agent_name_.append(processor.current_frame.rf.feature_stamp.anonymous_feature(processor.current_frame.type_of_current).class_text.name.to_string)
         agent_name_.append(once "__")
         agent_name_.append(processor.current_frame.rf.name.to_string)
         agent_name := agent_name_.intern

         Result := processor.plugin_agent(agent_name)
         if Result = Void then
            dll_name_ := once ""
            dll_name_.copy(path)
            dll_name_.extend('/') --| **** TODO: use some platform-specific separator
            dll_name_.append(name)
            dll_name_.append(once "/run/") --| **** TODO: use some platform-specific separator
            dll_name_.append(name)
            dll_name_.append(once ".so") --| **** TODO: use some platform-specific extension
            dll_name := dll_name_.intern
            dll := loader.library(dll_name_)
            if dll = Void then
               -- basic (old) scheme
               check
                  name.has_prefix(once "basic_")
               end
               dll_name_.copy(path)
               dll_name_.extend('/') --| **** TODO: use some platform-specific separator
               dll_name_.append(name)
               dll_name_.append(once ".so") --| **** TODO: use some platform-specific extension
               dll_name := dll_name_.intern
               dll := loader.library(dll_name_)
            end
            if dll = Void then
               processor.set_exception(exceptions.System_level_type_error, once "Unknown plugin")
            else
               arg_types := foreign_types(processor, processor.current_frame.type_of_current, processor.current_frame.rf.arguments)
               res_type := foreign_type(processor, processor.current_frame.type_of_result)

               Result := dll.function(agent_name, arg_types, res_type)
               if Result = Void then
                  processor.set_exception(exceptions.System_level_type_error, once "Unknown plugin function")
               else
                  processor.set_plugin_agent(Result, agent_name)
               end
            end
         end
      ensure
         Result = Void implies processor.exception /= Void
      end

   foreign_type (processor: RUNNER_PROCESSOR; a_type: TYPE): FOREIGN_TYPE is
      local
         types: FOREIGN_TYPES
      do
         if a_type /= Void then
            if foreign_types_map.fast_has(a_type) then
               Result := foreign_types_map.fast_at(a_type).first
            else
               processor.set_exception(exceptions.System_level_type_error, once "Cannot map {" | a_type.name.to_string | once "} to foreign type")
            end
         else
            Result := types.nothing
         end
      end

   foreign_types (processor: RUNNER_PROCESSOR; current_type: TYPE; types: FORMAL_ARG_LIST): COLLECTION[FOREIGN_TYPE] is
      local
         i: INTEGER
      do
         if types = Void then
            create {FAST_ARRAY[FOREIGN_TYPE]} Result.make(0)
         else
            create {FAST_ARRAY[FOREIGN_TYPE]} Result.with_capacity(types.count)
            from
               i := 1
            until
               i > types.count
            loop
               Result.add_last(foreign_type(processor, types.name(i).resolve_in(current_type)))
               i := i + 1
            end
         end
      end

   eval_parameters (processor: RUNNER_PROCESSOR): FAST_ARRAY[FOREIGN_OBJECT] is
      local
         args: TRAVERSABLE[RUNNER_OBJECT]; i: INTEGER
      do
         args := processor.current_frame.arguments
                  sedb_breakpoint
         if args = Void then
            create Result.make(0)
         else
            create Result.with_capacity(args.count)
            from
               i := args.lower
            until
               i > args.upper
            loop
               Result.add_last(args.item(i).as_foreign_object)
               i := i + 1
            end
         end
      end

feature {SYSTEM_TOOLS}
   try_auto_init is
      do
      end

feature {ANY}
   auto_init_done: BOOLEAN

feature {NATIVE_PLUG_IN}
   include (position: POSITION) is
      do
      end

feature {}
   make (position: POSITION; a_name, a_path: STRING) is
      require
         a_name /= Void
         a_path /= Void
      do
         name := a_name
         path := a_path
      ensure
         name = a_name
         path = a_path
      end

   foreign_types_map: HASHED_DICTIONARY[TUPLE[FOREIGN_TYPE,
                                              FUNCTION[TUPLE[RUNNER_PROCESSOR, FOREIGN_OBJECT], RUNNER_OBJECT]
                                              ], TYPE] is
      local
         types: FOREIGN_TYPES
      once
         Result := {HASHED_DICTIONARY[TUPLE[FOREIGN_TYPE,
                                            FUNCTION[TUPLE[RUNNER_PROCESSOR, FOREIGN_OBJECT], RUNNER_OBJECT]
                                            ], TYPE]
         <<
            [types.sint32  , agent from_foreign_boolean               ], smart_eiffel.type_boolean;
            [types.schar   , agent from_foreign_character             ], smart_eiffel.type_character;
            [types.pointer , agent from_foreign_pointer               ], smart_eiffel.type_pointer;
            [types.c_string, agent from_foreign_native_array_character], smart_eiffel.type_native_array_character;
            [types.sint8   , agent from_foreign_integer_8             ], smart_eiffel.type_integer_8;
            [types.sint16  , agent from_foreign_integer_16            ], smart_eiffel.type_integer_16;
            [types.sint32  , agent from_foreign_integer_32            ], smart_eiffel.type_integer_32;
            [types.sint64  , agent from_foreign_integer_64            ], smart_eiffel.type_integer_64;
            [types.uint8   , agent from_foreign_natural_8             ], smart_eiffel.type_natural_8;
            [types.uint16  , agent from_foreign_natural_16            ], smart_eiffel.type_natural_16;
            [types.uint32  , agent from_foreign_natural_32            ], smart_eiffel.type_natural_32;
            [types.uint64  , agent from_foreign_natural_64            ], smart_eiffel.type_natural_64;
            [types.float   , agent from_foreign_real_32               ], smart_eiffel.type_real_32;
            [types.double  , agent from_foreign_real_64               ], smart_eiffel.type_real_64;
            --types., smart_eiffel.type_real_extended;
         >>}
      end

   from_foreign_boolean (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_boolean: FOREIGN_TYPED_OBJECT[BOOLEAN]
      do
         foreign_boolean ::= foreign
         Result := processor.new_boolean(foreign_boolean.item)
      end

   from_foreign_character (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_character: FOREIGN_TYPED_OBJECT[CHARACTER]
      do
         foreign_character ::= foreign
         Result := processor.new_character(foreign_character.item)
      end

   from_foreign_pointer (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_pointer: FOREIGN_TYPED_OBJECT[POINTER]
      do
         foreign_pointer ::= foreign
         Result := processor.new_pointer(foreign_pointer.item)
      end

   from_foreign_native_array_character (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_native_array_character: FOREIGN_TYPED_OBJECT[NATIVE_ARRAY[CHARACTER]]
         count: INTEGER
      do
         foreign_native_array_character ::= foreign
         from
         until
            foreign_native_array_character.item.item(count) = '%U'
         loop
            count := count + 1
         end
         Result := processor.new_native_array_character(count + 1, foreign_native_array_character.item)
      end

   from_foreign_integer_8 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_integer_8: FOREIGN_TYPED_OBJECT[INTEGER_8]
      do
         foreign_integer_8 ::= foreign
         Result := processor.new_integer_8(foreign_integer_8.item)
      end

   from_foreign_integer_16 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_integer_16: FOREIGN_TYPED_OBJECT[INTEGER_16]
      do
         foreign_integer_16 ::= foreign
         Result := processor.new_integer_16(foreign_integer_16.item)
      end

   from_foreign_integer_32 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_integer_32: FOREIGN_TYPED_OBJECT[INTEGER_32]
      do
         foreign_integer_32 ::= foreign
         Result := processor.new_integer_32(foreign_integer_32.item)
      end

   from_foreign_integer_64 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_integer_64: FOREIGN_TYPED_OBJECT[INTEGER_64]
      do
         foreign_integer_64 ::= foreign
         Result := processor.new_integer_64(foreign_integer_64.item)
      end

   from_foreign_natural_8 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_natural_8: FOREIGN_TYPED_OBJECT[NATURAL_8]
      do
         foreign_natural_8 ::= foreign
         Result := processor.new_natural_8(foreign_natural_8.item.to_natural_64)
      end

   from_foreign_natural_16 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_natural_16: FOREIGN_TYPED_OBJECT[NATURAL_16]
      do
         foreign_natural_16 ::= foreign
         Result := processor.new_natural_16(foreign_natural_16.item.to_natural_64)
      end

   from_foreign_natural_32 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_natural_32: FOREIGN_TYPED_OBJECT[NATURAL_32]
      do
         foreign_natural_32 ::= foreign
         Result := processor.new_natural_32(foreign_natural_32.item.to_natural_64)
      end

   from_foreign_natural_64 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_natural_64: FOREIGN_TYPED_OBJECT[NATURAL_64]
      do
         foreign_natural_64 ::= foreign
         Result := processor.new_natural_64(foreign_natural_64.item)
      end

   from_foreign_real_32 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_real_32: FOREIGN_TYPED_OBJECT[REAL_32]
      do
         foreign_real_32 ::= foreign
         Result := processor.new_real_32(foreign_real_32.item.to_real_64)
      end

   from_foreign_real_64 (processor: RUNNER_PROCESSOR; foreign: FOREIGN_OBJECT): RUNNER_OBJECT is
      local
         foreign_real_64: FOREIGN_TYPED_OBJECT[REAL_64]
      do
         foreign_real_64 ::= foreign
         Result := processor.new_real_64(foreign_real_64.item)
      end

end -- class RUNNER_PLUGIN
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
