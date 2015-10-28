-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of th file.
--
class MOCKER_EXPECT

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

insert
   MOCK_EXPECT
      redefine default_create
      end

feature {ANY}
   mock: #(2)

feature {}
   default_create
      do
         create {#(3)} mock.make(Current)
      end

   target: MOCK_TYPED_OBJECT[like Current]
      local
         t: #(3)
      do
         t ::= mock
         Result := t
      end


                                 ]"
                                 # expect_name # source_name # mock_name)

         node.node_at(node.lower+5).accept(Current)

         output.put_string(once "[

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "{#(1)}")
      end

end -- class #(1)

                                 ]"
                                 # expect_name)
      end

feature {EIFFEL_NON_TERMINAL_NODE_IMPL}
   visit_eiffel_non_terminal_node_impl (node: EIFFEL_NON_TERMINAL_NODE_IMPL)
      local
         expectation_type: ABSTRACT_STRING
      do
         inspect node.name
         when "Class" then
            node.node_at(node.lower).accept(Current)
         when "One_Class" then
            generate_class(node)
         when "Feature" then
            create deferred_lookup.make(node)
            if deferred_lookup.has_deferred_features then
               node.node_at(node.lower + 2).accept(Current)
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

            if signature.result_type = Void then
               expectation_type := once "MOCK_PROCEDURE_EXPECTATION[#(1)]" # signature.simple_argument_types
            else
               expectation_type := once "MOCK_FUNCTION_EXPECTATION[#(1), #(2)]" # signature.simple_argument_types # signature.result_type
            end

            output.put_line(once "[
feature {ANY}
   #(1)#(2): #(3)
      do
         create Result.make(target, feature_name_#(1), #(4))
      end

                                ]"
                                # signature.feature_name
                                # signature.simple_arguments_signature
                                # expectation_type
                                # signature.matcher_arguments)

            if signature.arguments_count > 0 then
               output.put_line(once "[
feature {ANY}
   #(1)__match#(2): #(3)
      do
         create Result.make(target, feature_name_#(1), create {MOCK_MATCHERS}.make#(4)#(5))
      end

                                   ]"
                                   # signature.feature_name
                                   # signature.matcher_arguments_signature
                                   # expectation_type
                                   # &signature.arguments_count
                                   # signature.simple_arguments)
            end

            output.put_line(once "[
feature {#(1)}
   assert_#(2)#(3): #(4)
      do
         Result ::= scenario.check_call(target, feature_name_#(2), #(5))
         if Result = Void then
            label_assert("Unexpected call to #(2) - missing expect?", False)
            if target.can_add_missing_expectation then
               target.add_missing_expectation(create {#(4)}.make(target, feature_name_#(2), #(6)))
            else
               label_assert("Unwanted call to #(2) - missing replay_all?", False)
            end
         end
      end

   feature_name_#(2): FIXED_STRING
      once
         Result := "#(2)".intern
      end

                                ]"
                                # mock_name
                                # signature.feature_name
                                # signature.simple_arguments_signature
                                # expectation_type
                                # signature.argument_arguments
                                # signature.matcher_arguments)
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

end -- class MOCKER_EXPECT
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
