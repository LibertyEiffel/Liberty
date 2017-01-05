-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_NATIVE_C_DEFINITION
   --
   -- In fact, only for C++ who systematically need C wrappers
   --

inherit
   RUN_FEATURE_7_VISITOR
      undefine
         is_equal
      end
   RUN_FEATURE_8_VISITOR
      undefine
         is_equal
      end
   NATIVE_C_VISITOR
      undefine
         is_equal
      end
   NATIVE_C_PLUS_PLUS_VISITOR
      undefine
         is_equal
      end

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   SINGLETON

create {C_PRETTY_PRINTER}
   make

feature {C_PRETTY_PRINTER}
   compile (native: NATIVE; rf: RUN_FEATURE)
      do
         rf7 := Void
         rf8 := Void
         rf.accept(Current)
         native.accept(Current)
      end

feature {}
   rf7: RUN_FEATURE_7
   rf8: RUN_FEATURE_8

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7)
      do
         rf7 := visited
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8)
      do
         rf8 := visited
      end

feature {NATIVE_C}
   visit_native_c (visited: NATIVE_C)
      do
         -- nothing
      end

feature {NATIVE_C_PLUS_PLUS}
   visit_native_c_plus_plus (visited: NATIVE_C_PLUS_PLUS)
      do
        if rf8 /= Void then
           c_plus_plus_function_definition(visited)
        else
           c_plus_plus_procedure_definition(visited)
        end
      end

feature {}
   c_plus_plus_function_definition (visited: NATIVE_C_PLUS_PLUS)
      require
         rf8 /= Void
      local
         er: EXTERNAL_ROUTINE; args_count: INTEGER
      do
         er := rf8.base_feature
         if not external_routine_memory.fast_has(er) then
            external_routine_memory.add_last(er)
            cpp.prepare_c_function
            extra_c_prototype_in_cpp_out_h_buffer(visited.start_position, rf8.type_of_current, rf8.base_feature)
            function_signature.append(out_h)
            function_body.append(once "return ((")
            function_body.append(cpp.external_type.for(rf8.result_type))
            function_body.extend(')')
            if rf8.arguments /= Void then
               args_count := rf8.arguments.count
            end
            visited.parse_external_in(function_body, args_count, visited.external_tag.to_string, er)
            function_body.append(once ");%N")
            cpp.dump_pending_c_function(True)
         end
      end

   c_plus_plus_procedure_definition (visited: NATIVE_C_PLUS_PLUS)
      require
         rf7 /= Void
      local
         er: EXTERNAL_ROUTINE; args_count: INTEGER
      do
         er := rf7.base_feature
         if not external_routine_memory.fast_has(er) then
            external_routine_memory.add_last(er)
            cpp.prepare_c_function
            extra_c_prototype_in_cpp_out_h_buffer(visited.start_position, rf7.type_of_current, rf7.base_feature)
            function_signature.append(out_h)
            if rf7.arguments /= Void then
               args_count := rf7.arguments.count
            end
            visited.parse_external_in(function_body, args_count, visited.external_tag.to_string, er)
            function_body.append(once ";%N")
            cpp.dump_pending_c_function(True)
         end
      end

   external_routine_memory: FAST_ARRAY[EXTERNAL_ROUTINE]

   make
      do
         create external_routine_memory.with_capacity(4)
      end

invariant
   rf7 /= Void implies rf8 = Void
   rf8 /= Void implies rf7 = Void

end -- class C_NATIVE_C_DEFINITION
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
