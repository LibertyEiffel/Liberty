-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MOCK_MOCK_GENERATOR

inherit
   MOCK_GENERATOR

create {MOCK}
   make

feature {}
   generate_class_header
      do
         file.put_string(once "%Ninherit%N   ")
         file.put_string(mocked_class.name.to_string)
         file.put_string(once "%N      redefine out_in_tagged_out_memory%N      end%N   MOCK_TYPED_OBJECT[")
         file.put_string(sibling.class_name)
         file.put_string(once "]%N%Ncreate {")
         file.put_string(sibling.class_name)
         file.put_string(once "}%N   make%N%N")
         file.put_string(once "[
feature {}
   make (a_expect: like expect__)
      require
         a_expect /= Void
      do
         expect__ := a_expect
      ensure
         expect__ = a_expect
      end

         ]")
         file.put_string(once "%N   expect__: ")
         file.put_line(sibling.class_name)
      end

   generate_class_footer
      do
         file.put_string(once "%Nfeature {ANY}%N%
                              %   out_in_tagged_out_memory%N%
                              %      do%N%
                              %         tagged_out_memory.append(once %"{")
         file.put_string(class_name)
         file.put_string(once "}%")%N%
                              %      end%N%N")
      end

   generate_feature
      do
         file.put_string(once "%Nfeature {")
         file.put_string(signature.exports)
         file.put_string(once "}%N   ")
         file.put_string(signature.feature_name)
         file.put_string(signature.simple_arguments_signature)
         if signature.result_type /= Void then
            file.put_string(once ": ")
            file.put_string(signature.result_type)
         end
         file.put_string(once "%N%
                              %      local%N%
                              %         exp: ")
         if signature.result_type = Void then
            file.put_string(once "MOCK_PROCEDURE_EXPECTATION[")
            file.put_string(signature.simple_argument_types)
            file.put_string(once "]")
         else
            file.put_string(once "MOCK_FUNCTION_EXPECTATION[")
            file.put_string(signature.simple_argument_types)
            file.put_string(once ", ")
            file.put_string(signature.result_type)
            file.put_string(once "]")
         end
         file.put_string(once "%N%
                              %      do%N%
                              %         exp := expect__.assert__")
         file.put_string(signature.feature_name)
         file.put_string(signature.simple_arguments)
         file.put_string(once "%N%
                              %         if exp /= Void then%N")
         if signature.result_type = Void then
            file.put_string(once "            exp.call(")
         else
            file.put_string(once "            Result := exp.item(")
         end
         file.put_string(signature.argument_arguments)
         file.put_string(once ")%N%
                              %         end%N%
                              %      end%N")
      end

end -- class MOCK_MOCK_GENERATOR
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
-- Copyright (C) 2011-2022: Cyril ADRIAN
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
