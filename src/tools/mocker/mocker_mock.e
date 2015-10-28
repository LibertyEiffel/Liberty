-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of th file.
--
class MOCKER_MOCK

inherit
   EIFFEL_NODE_VISITOR
      redefine
         visit_eiffel_list_node_impl,
         visit_eiffel_non_terminal_node_impl
      end

insert
   LOGGING
   EIFFEL_NODE_HANDLER

create {ANY}
   make

feature {EIFFEL_LIST_NODE_IMPL}
   visit_eiffel_list_node_impl (node: EIFFEL_LIST_NODE_IMPL)
      do
         Precursor(node)
         node.generate_forgotten(output)
      end

feature {}
   generate_class (node: EIFFEL_NON_TERMINAL_NODE_IMPL)
      local
         source_name: ABSTRACT_STRING
         class_header_node: EIFFEL_NON_TERMINAL_NODE_IMPL
         class_name_terminal: EIFFEL_TERMINAL_NODE_IMPL
      do
         class_header_node ::= node.node_at(node.lower)
         class_name_terminal ::= class_header_node.node_at(node.lower + 2)
         inspect
            class_name_terminal.name
         when "KW class name" then
            source_name := class_name_terminal.image.image
         end

         output.put_string(once "[
-- Generated file, don't edit
class #(1)

inherit
   #(2)
      redefine
         out_in_tagged_out_memory
      end
   MOCK_TYPED_OBJECT[#(3)]

create {#(3)}
   make

feature {}
   make (a_expect: like expect_)
      require
         a_expect /= Void
      do
         expect_ := a_expect
      ensure
         expect_ = a_expect
      end

   expect_: #(3)


                                 ]"
                                 # mock_name # source_name # expect_name)

         node.node_at(node.lower+5).accept(Current)

         output.put_string(once "[

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{#(1)}")
      end

end -- class #(1)

                                 ]"
                                 # mock_name)
      end

feature {EIFFEL_NON_TERMINAL_NODE_IMPL}
   visit_eiffel_non_terminal_node_impl (node: EIFFEL_NON_TERMINAL_NODE_IMPL)
      do
         inspect node.name
         when "Class" then
            node.node_at(node.lower).accept(Current)
         when "One_Class" then
            generate_class(node)
         when "Feature" then
            create deferred_lookup.make(node)
            if deferred_lookup.has_deferred_features then
               Precursor(node)
            end
            deferred_lookup := Void
         when "Feature_Definition" then
            check
               deferred_lookup.has_deferred_features
            end
            if deferred_lookup.is_deferred(node) then
               node.node_at(node.lower + 1).accept(Current)
            end
         when "Signature" then
            create signature.make(node)
            output.put_new_line
            if signature.result_type = Void then
               output.put_string(once "   #(1)#(4)%N%
                                      %      local%N%
                                      %         exp: MOCK_PROCEDURE_EXPECTATION[#(2)]%N%
                                      %      do%N%
                                      %         exp := expect_.assert_#(1)#(3)%N%
                                      %         if exp /= Void then%N%
                                      %            exp.call(#(5))%N%
                                      %         end%N%
                                      %      end%N"
                                 # signature.feature_name
                                 # signature.simple_argument_types
                                 # signature.simple_arguments
                                 # signature.simple_arguments_signature
                                 # signature.argument_arguments)
            else
               output.put_string(once "   #(1)#(5): #(3)%N%
                                      %      local%N%
                                      %         exp: MOCK_FUNCTION_EXPECTATION[#(2), #(3)]%N%
                                      %      do%N%
                                      %         exp := expect_.assert_#(1)#(4)%N%
                                      %         if exp /= Void then%N%
                                      %            Result := exp.item(#(6))%N%
                                      %         end%N%
                                      %      end%N"
                                 # signature.feature_name
                                 # signature.simple_argument_types
                                 # signature.result_type
                                 # signature.simple_arguments
                                 # signature.simple_arguments_signature
                                 # signature.argument_arguments)
            end
         else
            Precursor(node)
         end
      end

feature {EIFFEL_TERMINAL_NODE_IMPL}
   visit_eiffel_terminal_node_impl (node: EIFFEL_TERMINAL_NODE_IMPL)
      do
         inspect
            node.name
         when "KW deferred" then
         else
            output.put_string(node.image.blanks)
            output.put_string(node.image.image)
            node.generate_forgotten(output)
         end
      end

feature {}
   make (a_output: like output; a_mock_name, a_expect_name: ABSTRACT_STRING)
      require
         a_output.is_connected
         a_mock_name /= Void
         a_expect_name /= Void
      do
         output := a_output
         mock_name := a_mock_name
         expect_name := a_expect_name
      ensure
         output = a_output
         mock_name = a_mock_name
         expect_name = a_expect_name
      end

   output: OUTPUT_STREAM
   mock_name, expect_name: ABSTRACT_STRING
   deferred_lookup: MOCKER_DEFERRED_LOOKUP
   signature: MOCKER_SIGNATURE

invariant
   output.is_connected
   mock_name /= Void
   expect_name /= Void

end -- class MOCKER_MOCK
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as publhed by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2013-2015: Cyril ADRIAN
--
-- http://www.gnu.org/software/liberty-eiffel/
--
-- ------------------------------------------------------------------------------------------------------------------------------
