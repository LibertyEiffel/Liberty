-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AGENT_ARGS
   --
   --|*** A better name: AGENT_LAUNCHER_SIGNATURE ? ***
   --| Is it useful ?
   --|*** (Dom. june 22th 2004) ***
   --

inherit
   VISITABLE
      redefine is_equal
      end
   HASHABLE

insert
   GLOBALS
      redefine is_equal
      end

creation {AGENT_POOL}
   make

feature {ANY}
   signature: STRING
         -- To identify the launcher by its arguments and its result type.
         -- Also used for the name of the C function to be called.

   agent_type: TYPE

   hash_code: INTEGER is
      do
         Result := signature.hash_code
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := signature.is_equal(other.signature)
      end

   accept (visitor: AGENT_ARGS_VISITOR) is
      do
         visitor.visit_agent_args(Current)
      end

feature {AGENT_POOL}
   c_define_agent_launcher is
      local
         boost: BOOLEAN
      do
         cpp.prepare_c_function
         boost := c_define_agent_launcher_heading(once "(live)")
         if agent_result /= Void then
            agent_result.canonical_type_mark.c_type_for_result_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(" R=")
            if agent_result.is_reference then
               cpp.pending_c_function_body.append(once "NULL;%N")
            else
               cpp.pending_c_function_body.append(once "M")
               agent_result.live_type.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ";%N")
            end
         end
         if ace.profile then
            smart_eiffel.local_profile
            smart_eiffel.start_profile_agent_switch(agent_type)
         end
         cpp.pending_c_function_body.append(once "/*")
         cpp.pending_c_function_body.append(agent_type.name.to_string)
         cpp.pending_c_function_body.append(once "*/switch(((se_agent0*)a)->creation_mold_id){%N")
         agent_pool.c_switch_in(cpp.pending_c_function_body, agent_type, agent_result)
         if not boost then
            cpp.pending_c_function_body.append(once "[
               default:
               error0("Internal error in agent launcher.",NULL);
                                ]")
         end
         cpp.pending_c_function_body.append(once "}%N")
         if ace.profile then
            smart_eiffel.stop_profile
         end
         if agent_result /= Void then
            cpp.pending_c_function_body.append(once "return R;%N")
         end
         cpp.dump_pending_c_function(True)
      end

   jvm_define (actual: BOOLEAN) is
         -- Define both the deferred wrapper or the `actual' definition.
      local
         flags, i: INTEGER; descripteur: STRING; ca: CODE_ATTRIBUTE; cp: CONSTANT_POOL; open: ARRAY[TYPE]
      do
         ca := code_attribute
         cp := constant_pool
         flags := 9
         descripteur := once "...................."
         descripteur.clear_count
         descripteur.extend('(')
         open := agent_type.open_arguments
         if open /= Void then
            from
               i := open.lower
            until
               i > open.upper
            loop
               open.item(i).canonical_type_mark.jvm_descriptor_in(descripteur)
               i := i + 1
            end
         end
         descripteur.append(once ")V")
         method_info.start(flags, signature, descripteur)
         if actual then
            ca.opcode_return
         else
            ca.opcode_return
         end
         method_info.finish
      end

feature {AGENT_INSTRUCTION, AGENT_EXPRESSION}
   c_agent_definition_call (type: TYPE; agent_target: EXPRESSION; fake_tuple: FAKE_TUPLE) is
         -- Generate the C code to launch the execution of the `agent_target'.
      require
         cpp.pending_c_function
         agent_target /= Void
      local
         boost: BOOLEAN
      do
         cpp.pending_c_function_body.append(signature)
         cpp.pending_c_function_body.extend('(')
         boost := ace.boost
         if not boost then
            cpp.pending_c_function_body.append(once "&ds,")
         end
         if ace.profile then
            cpp.pending_c_function_body.append(once "&local_profile,")
         end
         if not boost then
            cpp.pending_c_function_body.append(once "vc(")
         end
         agent_target.compile_to_c(type)
         if not boost then
            cpp.pending_c_function_body.extend(',')
            cpp.put_position(agent_target.start_position)
            cpp.pending_c_function_body.extend(')')
         end
         if fake_tuple.count > 0 then
            cpp.pending_c_function_body.extend(',')
            fake_tuple.compile_to_c(type)
         end
         cpp.pending_c_function_body.extend(')')
      end

feature {}
   agent_result: TYPE is
      do
         Result := agent_type.agent_result
      end

   make (s: like signature; at: like agent_type) is
      require
         s /= Void
         at.canonical_type_mark.is_agent
      do
         signature := s
         agent_type := at
      ensure
         signature = s
         agent_type = at
      end

   c_define_agent_launcher_heading (tag: STRING): BOOLEAN is
      local
         boost: BOOLEAN; i: INTEGER; ar: like agent_result; open: ARRAY[TYPE]
      do
         echo.put_string(once "Defining ")
         echo.put_string(tag)
         echo.put_string(once " agent wrapper: ")
         echo.put_string(signature)
         echo.put_string(once "%N")
         boost := ace.boost
         ar := agent_result
         if ar = Void then
            cpp.pending_c_function_signature.append(once "void")
         else
            ar.c_type_for_result_in(cpp.pending_c_function_signature)
         end
         cpp.pending_c_function_signature.extend(' ')
         cpp.pending_c_function_signature.append(signature)
         cpp.pending_c_function_signature.extend('(')
         if not boost then
            cpp.pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            cpp.pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         cpp.pending_c_function_signature.append(once "/*agent*/T0*a")
         open := agent_type.open_arguments
         if open /= Void then
            from
               i := open.lower
            until
               i > open.upper
            loop
               cpp.pending_c_function_signature.extend(',')
               open.item(i).canonical_type_mark.c_type_for_argument_in(cpp.pending_c_function_signature)
               cpp.pending_c_function_signature.extend(' ')
               cpp.pending_c_function_signature.extend('a')
               i.append_in(cpp.pending_c_function_signature)
               i := i + 1
            end
         end
         cpp.pending_c_function_signature.extend(')')
         Result := boost
      end

invariant
   agent_type.canonical_type_mark.is_agent

   not signature.is_empty

end -- class AGENT_ARGS
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
