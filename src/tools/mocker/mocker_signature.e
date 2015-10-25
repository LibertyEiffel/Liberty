-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of th file.
--
class MOCKER_SIGNATURE

inherit
   EIFFEL_NODE_VISITOR
      redefine
         visit_eiffel_non_terminal_node_impl
      end

insert
   LOGGING
   EIFFEL_NODE_HANDLER

create {ANY}
   make

feature {ANY}
   result_type: STRING
   feature_name: STRING

   arguments_count: INTEGER
      do
         if argument_names /= Void then
            Result := argument_names.count
         end
      end

   simple_arguments: LAZY_STRING
   simple_argument_types: LAZY_STRING
   simple_arguments_signature: LAZY_STRING

   matcher_arguments: LAZY_STRING
   matcher_arguments_signature: LAZY_STRING

   argument_arguments: LAZY_STRING

feature {EIFFEL_NON_TERMINAL_NODE_IMPL}
   visit_eiffel_non_terminal_node_impl (node: EIFFEL_NON_TERMINAL_NODE_IMPL)
      local
         buf: STRING_OUTPUT_STREAM
      do
         inspect
            node.name
         when "Feature_Name" then
            Precursor(node)
            feature_name := last_image
         when "Signature" then
            Precursor(node)
         when "Type_Definition" then
            result_type := ""
            create buf.connect_to(result_type)
            node.generate(buf)
         when "Declaration" then
            from
               Precursor(node)
               check
                  argument_names /= Void
                  argument_types.count < argument_names.count
               end
            until
               argument_types.count = argument_names.count - 1
            loop
               argument_types.add_last(Void)
            end
            argument_types.add_last(result_type)
            result_type := Void
         when "Variable" then
            Precursor(node)
            if argument_names = Void then
               create argument_names.make(0)
               create argument_types.make(0)
            end
            argument_names.add_last(last_image)
         else
            Precursor(node)
         end
      end

feature {EIFFEL_TERMINAL_NODE_IMPL}
   visit_eiffel_terminal_node_impl (node: EIFFEL_TERMINAL_NODE_IMPL)
      do
         last_image := node.image.image
      end

feature {}
   make (a_node: EIFFEL_NON_TERMINAL_NODE_IMPL)
      require
         a_node.name.same_as(once "Signature")
      do
         a_node.accept(Current)
         if argument_names /= Void and then argument_names.count > 10 then
            std_error.put_line("#(1): too many arguments, cannot mock" # feature_name)
            die_with_code(1)
         end

         create simple_arguments.make(agent build_arguments)
         create simple_argument_types.make(agent build_argument_types)
         create simple_arguments_signature.make(agent build_arguments_signature("#(1)"))
         create matcher_arguments.make(agent build_mock_arguments("MOCK_MATCHERS", "MOCK_EQ"))
         create matcher_arguments_signature.make(agent build_arguments_signature("MOCK_TYPED_MATCHER[#(1)]"))
         create argument_arguments.make(agent build_mock_arguments("MOCK_ARGUMENTS", "MOCK_TYPED_ARGUMENT"))
      end

   build_arguments: ABSTRACT_STRING
      local
         i: INTEGER
         arg, args: ABSTRACT_STRING
      do
         if argument_names = Void then
            Result := ""
         else
            from
               i := argument_names.lower
            until
               i > argument_names.upper
            loop
               arg := argument_names.item(i)
               if args = Void then
                  args := arg
               else
                  args := "#(1), #(2)" # args #arg
               end
               i := i + 1
            end
            Result := "(#(1))" # args
         end
      end

   build_arguments_signature (type_format: STRING): ABSTRACT_STRING
      require
         argument_names /= Void implies argument_names.count = argument_types.count
      local
         i: INTEGER; type, arg: ABSTRACT_STRING
      do
         if argument_names = Void then
            Result := ""
         else
            from
               i := argument_names.lower
            until
               i > argument_names.upper
            loop
               if argument_types.item(i) = Void then
                  arg := argument_names.item(i)
               else
                  type := type_format # argument_types.item(i)
                  arg := "#(1): #(2)" # argument_names.item(i) # type
               end
               if Result = Void then
                  Result := arg
               elseif argument_types.item(i - 1) = Void then
                  Result := "#(1), #(2)" # Result # arg
               else
                  Result := "#(1); #(2)" # Result # arg
               end
               i := i + 1
            end
            Result := " (#(1))" # Result
         end
      end

   build_mock_arguments (container_type, item_type: STRING): ABSTRACT_STRING
      local
         i, j: INTEGER
         type, arg, args: ABSTRACT_STRING
      do
         if argument_names = Void then
            Result := "create {#(1)}.make0" # container_type
         else
            from
               i := argument_names.lower
            until
               i > argument_names.upper
            loop
               from
                  type := Void
                  j := i
               until
                  type /= Void
               loop
                  type := argument_types.item(j)
                  j := j + 1
               end
               arg := "create {#(1)[#(2)]}.make(#(3))" # item_type # type # argument_names.item(i)
               if args = Void then
                  args := arg
               else
                  args := "#(1), #(2)" # args # arg
               end
               i := i + 1
            end
            Result := "create {#(1)}.make#(2)(#(3))" # container_type # &i # args
         end
      end

   build_argument_types: ABSTRACT_STRING
      local
         i, j: INTEGER
         type: ABSTRACT_STRING
      do
         if argument_names = Void then
            Result := "TUPLE"
         else
            from
               i := argument_names.lower
            until
               i > argument_names.upper
            loop
               from
                  type := Void
                  j := i
               until
                  type /= Void
               loop
                  type := argument_types.item(j)
                  j := j + 1
               end
               if Result = Void then
                  Result := type
               else
                  Result := "#(1), #(2)" # Result # type
               end
               i := i + 1
            end
            Result := "TUPLE[#(1)]" # Result
         end
      end

   last_image: STRING
   argument_names: FAST_ARRAY[STRING]
   argument_types: FAST_ARRAY[STRING]

end -- class MOCKER_SIGNATURE
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
