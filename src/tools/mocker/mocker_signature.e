-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
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
   arguments: LAZY_STRING

feature {EIFFEL_NON_TERMINAL_NODE_IMPL}
   visit_eiffel_non_terminal_node_impl (node: EIFFEL_NON_TERMINAL_NODE_IMPL) is
      local
         buf: STRING_OUTPUT_STREAM
      do
         inspect
            node.name
         when "Feature_Name" then
            Precursor(node)
            feature_name := last_image
         when "Type_Definition" then
            result_type := ""
            create buf.connect_to(result_type)
            node.generate(buf)
         when "Variable" then
            Precursor(node)
            if arguments_list = Void then
               create arguments_list.make(0)
            end
            arguments_list.add_last(last_image)
         else
            Precursor(node)
         end
      end

feature {EIFFEL_TERMINAL_NODE_IMPL}
   visit_eiffel_terminal_node_impl (node: EIFFEL_TERMINAL_NODE_IMPL) is
      do
         last_image := node.image.image
      end

feature {}
   make (a_node: EIFFEL_NON_TERMINAL_NODE_IMPL) is
      require
         a_node.name.same_as(once "Signature")
      do
         a_node.accept(Current)
         create arguments.make(agent list_arguments)
      end

   list_arguments: ABSTRACT_STRING is
      local
         i: INTEGER
         args: STRING
      do
         if arguments_list = Void then
            Result := once ""
         else
            args := ""
            from
               i := arguments_list.lower
            until
               i > arguments_list.upper
            loop
               if not args.is_empty then
                  args.append(once ", ")
               end
               args.append(arguments_list.item(i))
               i := i + 1
            end
            Result := once "(#(1))" # args
         end
      end

   last_image: STRING
   arguments_list: FAST_ARRAY[STRING]

end -- class MOCKER_SIGNATURE
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
-- Copyright(C) 2013: Cyril ADRIAN
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
-- ------------------------------------------------------------------------------------------------------------------------------
