-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_MAPPER
   -- Produce C code when current is called and when the concrete type of target is unique (`cpp' is in
   -- charge of the context).

inherit
   RUN_FEATURE_VISITOR
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

feature {ANY}
   compile (run_feature: RUN_FEATURE)
      do
         run_feature.accept(Current)
      end

feature {}
   make
      do
      end

   frozen default_mapping_procedure (run_feature: RUN_FEATURE)
         -- Default mapping for procedure calls with target.
      do
         default_mapping_function(run_feature)
         function_body.append(once ";%N")
      end

   frozen default_mapping_function (run_feature: RUN_FEATURE)
         -- Default mapping for function calls with target.
      require
         cpp.pending_c_function
      local
         no_check, uc, tcbd: BOOLEAN
      do
         no_check := ace.no_check
         uc := run_feature.use_current
         if not uc then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               cpp.pending_c_function_body.extend(',')
            end
         end
         run_feature.mapping_name_in(function_body)
         default_mapping_arg(run_feature, no_check, uc, tcbd)
      end

   frozen default_mapping_arg (run_feature: RUN_FEATURE; no_check, uc, tcbd: BOOLEAN)
      local
         bf: ANONYMOUS_FEATURE
         i, j: INTEGER; local_name: LOCAL_ARGUMENT_DEF
      do
         function_body.extend('(')
         if no_check then
            function_body.append(once "&ds")
         end
         if ace.profile then
            if function_body.last /= '(' then
               function_body.extend(',')
            end
            function_body.append(once "&local_profile")
         end
         if uc then
            if function_body.last /= '(' then
               function_body.extend(',')
            end
            if run_feature.type_of_current.is_boolean then
               function_body.append(once "(T6)(")
            end
            cpp.put_target_as_target(run_feature.type_of_current)
            if run_feature.type_of_current.is_boolean then
               function_body.extend(')')
            end
         end
         if run_feature.arguments /= Void then
            if function_body.last /= '(' then
               function_body.extend(',')
            end
            cpp.put_arguments(run_feature.arguments.count)
         end
         bf := run_feature.base_feature
         if bf.closure_arguments /= Void then
            from
               i := bf.closure_arguments.lower
            until
               i > bf.closure_arguments.upper
            loop
               if bf.closure_arguments.item(i) /= Void then
                  from
                     j := 1
                  until
                     j > bf.closure_arguments.item(i).count
                  loop
                     local_name := bf.closure_arguments.item(i).name(j)
                     if local_name.is_outside(run_feature.type_of_current) then
                        if function_body.last /= '(' then
                           function_body.extend(',')
                        end
                        function_body.append(once "/*`")
                        function_body.append(local_name.to_string)
                        function_body.append(once "'*/CA_")
                        (i - bf.closure_arguments.lower + 1).append_in(function_body)
                        function_body.extend('_')
                        j.append_in(function_body)
                     end
                     j := j + 1
                  end
               end
               i := i + 1
            end
         end
         if bf.closure_local_vars /= Void then
            from
               i := bf.closure_local_vars.lower
            until
               i > bf.closure_local_vars.upper
            loop
               if bf.closure_local_vars.item(i) /= Void then
                  from
                     j := 1
                  until
                     j > bf.closure_local_vars.item(i).count
                  loop
                     local_name := bf.closure_local_vars.item(i).name(j)
                     if local_name.is_used(run_feature.type_of_current) and then local_name.is_outside(run_feature.type_of_current) then
                        if function_body.last /= '(' then
                           function_body.extend(',')
                        end
                        function_body.append(once "CL_")
                        function_body.append(local_name.to_string)
                     end
                     j := j + 1
                  end
               end
               i := i + 1
            end
         end
         function_body.extend(')')
         if not uc and then tcbd then
            function_body.extend(')')
         end
      end

feature {RUN_FEATURE_1}
   visit_run_feature_1 (visited: RUN_FEATURE_1)
      local
         has_target: BOOLEAN
      do
         if cpp.target_cannot_be_dropped then
            has_target := True
            function_body.extend(',')
         end
         function_body.append(once "/*RF1:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         cpp.code_compiler.compile(visited.value, visited.type_of_current)
         if has_target then
            cpp.pending_c_function_body.extend(')')
         end
         function_body.append(once "/*:RF1*/")
      end

feature {RUN_FEATURE_2}
   visit_run_feature_2 (visited: RUN_FEATURE_2)
      do
         function_body.append(once "(/*RF2:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         if visited.type_of_current.is_kernel_expanded then
            error_handler.append("Kernel classes don't have attributes!!! This class has been tampered with.")
            error_handler.add_position(visited.start_position)
            error_handler.print_as_internal_error
         elseif visited.need_c_function and then cpp.use_c_function_call_for_attribute_read then
            default_mapping_function(visited)
         elseif visited.type_of_current.is_reference then
            function_body.extend('(')
            cpp.put_target_as_target(visited.type_of_current)
            function_body.append(once ")->")
            put_c_field_name(visited)
         elseif visited.type_of_current.is_empty_expanded then
            function_body.append(once "((T")
            visited.result_type.id.append_in(function_body)
            function_body.append(once ")/*")
            function_body.append(visited.name.to_string)
            function_body.append(once "*/0)")
         else
            check
               visited.type_of_current.is_user_expanded
            end
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.append(once ").")
            put_c_field_name(visited)
         end
         function_body.append(once "/*:RF2*/)")
      end

feature {RUN_FEATURE_3}
   visit_run_feature_3 (visited: RUN_FEATURE_3)
      do
         function_body.append(once "/*RF3:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         if ace.boost and then visited.empty_body_side_effect_free_in_boost then
            function_body.append(once "/*empty*/")
            if cpp.cannot_drop_all then
               function_body.append(once ");%N")
            end
         else
            default_mapping_procedure(visited)
         end
         function_body.append(once "/*:RF3*/")
      end

feature {RUN_FEATURE_4}
   visit_run_feature_4 (visited: RUN_FEATURE_4)
      do
         function_body.append(once "/*RF4:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         default_mapping_function(visited)
         function_body.append(once "/*:RF4*/")
      end

feature {RUN_FEATURE_5}
   visit_run_feature_5 (visited: RUN_FEATURE_5)
      do
         function_body.append(once "/*RF5:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         default_mapping_procedure(visited)
         function_body.append(once "/*:RF5*/")
      end

feature {RUN_FEATURE_6}
   visit_run_feature_6 (visited: RUN_FEATURE_6)
      do
         function_body.append(once "/*RF6:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         if visited.is_precomputable_once then
            once_routine_pool.unique_result_in(function_body, visited.base_feature)
         else
            default_mapping_function(visited)
         end
         function_body.append(once "/*:RF6*/")
      end

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7)
      local
         bf: EXTERNAL_PROCEDURE
      do
         function_body.append(once "/*RF7:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         bf := visited.base_feature
         if rf7_does_need_c_wrapper(visited) then
            default_mapping_procedure(visited)
         else
            cpp.native_procedure_mapper.compile(visited)
         end
         function_body.append(once "/*:RF7*/")
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8)
      local
         bf: EXTERNAL_FUNCTION
      do
         function_body.append(once "/*RF8:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         bf := visited.base_feature
         if rf8_does_need_c_wrapper(visited) then
            default_mapping_function(visited)
         else
            cpp.native_function_mapper.compile(visited)
         end
         function_body.append(once "/*:RF8*/")
      end

feature {RUN_FEATURE_9}
   visit_run_feature_9 (visited: RUN_FEATURE_9)
      do
         function_body.append(once "/*RF9:")
         function_body.append(visited.name.to_string)
         function_body.append(once "*/")
         if ace.no_check then
            if visited.result_type = Void then
               default_mapping_procedure(visited)
            else
               default_mapping_function(visited)
            end
         elseif visited.result_type /= Void then
            function_body.append(cpp.initializer.for(visited.result_type))
         else
            function_body.append(once "(void)0;")
         end
         function_body.append(once "/*:RF9*/")
      end

end -- class C_MAPPER
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
