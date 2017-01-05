-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MOCK_EXPECT_GENERATOR

inherit
   MOCK_GENERATOR

create {MOCK}
   make

feature {}
   generate_class_header
      do
         file.put_string(once "%Ninsert%N%
                              %   MOCK_EXPECT%N%
                              %      redefine default_create%N%
                              %      end%N%
                              %%N%
                              %feature {ANY}%N%
                              %   mock: ")
         file.put_string(mocked_class.name.to_string)
         file.put_string(once "%N%
                              %%N%
                              %feature {}%N%
                              %   default_create%N%
                              %      do%N%
                              %         create {")
         file.put_string(sibling.class_name)
         file.put_string(once "} mock.make(Current)%N%
                              %      end%N%
                              %%N%
                              %   target: MOCK_TYPED_OBJECT[")
         file.put_string(class_name)
         file.put_string(once "]%N%
                              %      local%N%
                              %         t: ")
         file.put_string(sibling.class_name)
         file.put_string(once "%N%
                              %      do%N%
                              %         t ::= mock%N%
                              %         Result := t%N%
                              %      end%N")
      end

   generate_class_footer
      do
         file.put_string(once "%N%
                             %feature {ANY}%N%
                             %   out_in_tagged_out_memory%N%
                             %      do%N%
                             %         tagged_out_memory.append(once %"{")
         file.put_string(class_name)
         file.put_string(once "}%")%N%
                              %      end%N%
                              %%N")
      end

   generate_feature
      local
         et: like expectation_type
      do
         et := expectation_type

         file.put_string(once "%N%
                              %feature {ANY}%N%
                              %   ")
         file.put_string(signature.feature_name)
         file.put_string(signature.simple_arguments_signature)
         file.put_string(once ": ")
         file.put_string(et)
         file.put_string(once "%N%
                              %      do%N%
                              %         create Result.make(target, feature_name__")
         file.put_string(signature.feature_name)
         file.put_string(once ", ")
         file.put_string(signature.matcher_arguments)
         file.put_string(once ")%N%
                              %      end%N")

         if signature.arguments_count > 0 then
            file.put_string(once "%N%
                                 %feature {ANY}%N%
                                 %   ")
            file.put_string(signature.feature_name)
            file.put_string(once "__match")
            file.put_string(signature.matcher_arguments_signature)
            file.put_string(once ": ")
            file.put_string(et)
            file.put_string(once "%N%
                                 %      do%N%
                                 %         create Result.make(target, feature_name__")
            file.put_string(signature.feature_name)
            file.put_string(once ", create {MOCK_MATCHERS}.make")
            file.put_integer(signature.arguments_count)
            file.put_string(signature.simple_arguments)
            file.put_string(once ")%N%
                                 %      end%N")
         end

         file.put_string(once "%N%
                              %feature {")
         file.put_string(sibling.class_name)
         file.put_string(once "}%N%
                              %   assert__")
         file.put_string(signature.feature_name)
         file.put_string(signature.simple_arguments_signature)
         file.put_string(once ": ")
         file.put_string(et)
         file.put_string(once "%N%
                              %      do%N%
                              %         Result ::= scenario.check_call(target, feature_name__")
         file.put_string(signature.feature_name)
         file.put_string(once ", ")
         file.put_string(signature.argument_arguments)
         file.put_string(once ")%N%
                              %         if Result = Void then%N%
                              %            label_assert(once %"Unexpected call to ")
         file.put_string(signature.feature_name)
         file.put_string(once " - missing expect?%", False)%N%
                              %            if target.can_add_missing_expectation then%N%
                              %               target.add_missing_expectation(create {")
         file.put_string(et)
         file.put_string(once "}.make(target, feature_name__")
         file.put_string(signature.feature_name)
         file.put_string(once ", ")
         file.put_string(signature.matcher_arguments)
         file.put_string(once "))%N%
                              %            else%N%
                              %               label_assert(once %"Unwanted call to ")
         file.put_string(signature.feature_name)
         file.put_string(once " - missing replay_all?%", False)%N%
                              %            end%N%
                              %         end%N%
                              %      end%N")

         file.put_string(once "%N%
                              %   feature_name__")
         file.put_string(signature.feature_name)
         file.put_string(once ": FIXED_STRING%N%
                              %      once%N%
                              %         Result := %"")
         file.put_string(signature.feature_name)
         file.put_string(once "%".intern%N%
                              %      end%N")
      end

   expectation_type: STRING
      do
         Result := once ""
         if signature.result_type = Void then
            Result.copy(once "MOCK_PROCEDURE_EXPECTATION[")
            Result.append(signature.simple_argument_types)
            Result.extend(']')
         else
            Result.copy(once "MOCK_FUNCTION_EXPECTATION[")
            Result.append(signature.simple_argument_types)
            Result.append(once ", ")
            Result.append(signature.result_type)
            Result.extend(']')
         end
      end

end -- class MOCK_EXPECT_GENERATOR
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
-- Copyright (C) 2011-2017: Cyril ADRIAN
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
