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
   arguments_list: LAZY_STRING
   arguments_tuple: LAZY_STRING
   arguments: LAZY_STRING

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
            --inspect
            --   node.count
            --when 3, 6 then
            --   -- there is a result type
            --when 1, 4 then
            --   -- there is no result type
            --   result_type := Void
            --end
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
         create arguments_list.make(agent build_arguments(once "(#(1))", once ""))
         create arguments_tuple.make(agent build_arguments(once "[#(1)]", once "[]"))
         create arguments.make(agent build_arguments_signature)
      end

   build_arguments (format, empty_list: STRING): ABSTRACT_STRING
      local
         i: INTEGER
         args: STRING
      do
         if argument_names = Void then
            Result := empty_list
         else
            args := ""
            from
               i := argument_names.lower
            until
               i > argument_names.upper
            loop
               if not args.is_empty then
                  args.append(once ", ")
               end
               args.append(argument_names.item(i))
               i := i + 1
            end
            Result := format # args
         end
      end

   build_arguments_signature: STRING
      require
         argument_names /= Void implies argument_names.count = argument_types.count
      local
         i: INTEGER
      do
         Result := ""
         if argument_names /= Void then
            Result.extend(' ')
            Result.extend('(')
            from
               i := argument_names.lower
            until
               i > argument_names.upper
            loop
               if i > argument_types.lower then
                  if argument_types.item(i - 1) = Void then
                     Result.append(once ", ")
                  else
                     Result.append(once "; ")
                  end
               end
               Result.append(argument_names.item(i))
               if argument_types.item(i) /= Void then
                  Result.extend(':')
                  Result.append(argument_types.item(i))
               end
               i := i + 1
            end
            Result.extend(')')
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
