-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MOCK_SIGNATURE

   --| **** TODO this code may need some refinement :-)

inherit
   FORMAL_ARG_LIST_VISITOR
   DECLARATION_VISITOR
   CLIENT_LIST_VISITOR
   TYPE_MARK_LIST_VISITOR

create {MOCK_GENERATOR}
   make

feature {MOCK_GENERATOR}
   prepare (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE)
      require
         not is_ready
      do
         is_ready := True

         feature_name := once ""
         feature_name.clear_count
         fn.complete_name_in(feature_name)
         feature_name := string_pool.new_twin(feature_name)

         exports := once ""
         if af.clients = Void then
            exports.copy(once "ANY")
         else
            exports.clear_count
            af.clients.accept(Current)
         end
         exports := string_pool.new_twin(exports)

         if af.arguments = Void or else af.arguments.count = 0 then
            set_no_arguments
         else
            set_arguments(af.arguments)
         end
         commit_arguments

         if af.result_type = Void then
            result_type := Void
         else
            result_type := af.result_type.written_mark
         end
      ensure
         is_ready
      end

   recycle
      require
         is_ready
      do
         if feature_name /= Void then
            string_pool.recycle(feature_name)
            string_pool.recycle(exports)
         end
         clean_arguments
         result_type := Void

         is_ready := False
      ensure
         not is_ready
      end

   is_ready: BOOLEAN

   result_type: STRING
      require
         is_ready
      attribute
      end

   feature_name: STRING
      require
         is_ready
      attribute
      end

   exports: STRING
      require
         is_ready
      attribute
      end

   arguments_count: INTEGER
      require
         is_ready
      attribute
      end

   simple_arguments: STRING
      require
         is_ready
      attribute
      end

   simple_argument_types: STRING
      require
         is_ready
      attribute
      end

   simple_arguments_signature: STRING
      require
         is_ready
      attribute
      end

   matcher_arguments: STRING
      require
         is_ready
      attribute
      end

   matcher_arguments_signature: STRING
      require
         is_ready
      attribute
      end

   argument_arguments: STRING
      require
         is_ready
      attribute
      end

feature {FORMAL_ARG_LIST}
   visit_formal_arg_list (visited: FORMAL_ARG_LIST)
      local
         i: INTEGER
      do
         check
            arguments_count = visited.count
         end
         from
            i := visited.list.lower
         until
            i > visited.list.upper
         loop
            if i > visited.list.lower then
               simple_arguments_signature.append(once "; ")
               matcher_arguments_signature.append(once "; ")
            end
            visited.list.item(i).accept(Current)
            i := i + 1
         end
      end

feature {DECLARATION_GROUP}
   visit_declaration_group (visited: DECLARATION_GROUP)
      local
         i: INTEGER; type: STRING
      do
         from
            i := visited.name_list.lower
         invariant
            visited.name_list.item(i).result_type.written_mark = visited.name_list.first.result_type.written_mark
         until
            i > visited.name_list.upper
         loop
            if i > visited.name_list.lower then
               simple_arguments_signature.append(once ", ")
               matcher_arguments_signature.append(once ", ")
            end
            type := visited.name_list.item(i).result_type.written_mark
            extend_argument(visited.name_list.item(i).to_string, type)
            i := i + 1
         end
         check
            type = visited.name_list.first.result_type.written_mark
         end
         extend_argument_signature(type)
      end

feature {DECLARATION_1}
   visit_declaration_1 (visited: DECLARATION_1)
      local
         type: STRING
      do
         type := visited.name.result_type.written_mark
         extend_argument(visited.name.to_string, type)
         extend_argument_signature(type)
      end

feature {CLIENT_LIST}
   visit_client_list (visited: CLIENT_LIST)
      do
         if visited.is_omitted then
            exports.append(once "ANY")
         elseif visited.type_mark_list /= Void then
            visited.type_mark_list.accept(Current)
         end
      end

feature {TYPE_MARK_LIST}
   visit_type_mark_list (visited: TYPE_MARK_LIST)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > visited.count
         loop
            if i > 1 then
               exports.append(once ", ")
            end
            exports.append(visited.item(i).written_mark)
            i := i + 1
         end
      end

feature {}
   extend_argument (name, type: STRING)
      require
         not name.is_empty
         not type.is_empty
      do
         if simple_arguments.count > 1 then -- because it contains at least the opening parenthesis
            simple_arguments.append(once ", ")
            simple_argument_types.append(once ", ")
            matcher_arguments.append(once ", ")
            argument_arguments.append(once ", ")
         end

         simple_arguments.append(name)
         simple_argument_types.append(type)
         simple_arguments_signature.append(name)
         matcher_arguments.append(once "create {MOCK_EQ[")
         matcher_arguments.append(type)
         matcher_arguments.append(once "]}.make(")
         matcher_arguments.append(name)
         matcher_arguments.extend(')')
         matcher_arguments_signature.append(name)
         argument_arguments.append(once "create {MOCK_TYPED_ARGUMENT[")
         argument_arguments.append(type)
         argument_arguments.append(once "]}.make(")
         argument_arguments.append(name)
         argument_arguments.extend(')')
      end

   extend_argument_signature (type: STRING)
      require
         not type.is_empty
      do
         simple_arguments_signature.append(once ": ")
         simple_arguments_signature.append(type)
         matcher_arguments_signature.append(once ": MOCK_TYPED_MATCHER[")
         matcher_arguments_signature.append(type)
         matcher_arguments_signature.append(once "]")
      end

   clean_arguments
      do
         if simple_arguments /= Void then
            string_pool.recycle(simple_arguments)
            string_pool.recycle(simple_argument_types)
            string_pool.recycle(simple_arguments_signature)
            string_pool.recycle(matcher_arguments)
            string_pool.recycle(matcher_arguments_signature)
            string_pool.recycle(argument_arguments)
         end
      end

   set_no_arguments
      do
         arguments_count := 0
         simple_arguments := once ""
         simple_argument_types := once "TUPLE"
         simple_arguments_signature := once ""
         matcher_arguments := once "create {MOCK_MATCHERS}.make0"
         matcher_arguments_signature := once ""
         argument_arguments := once "create {MOCK_ARGUMENTS}.make0"
      end

   set_arguments (arguments: FORMAL_ARG_LIST)
      require
         arguments.count > 0
      do
         arguments_count := arguments.count
         simple_arguments := once ""
         simple_arguments.copy(once "(")
         simple_argument_types := once ""
         simple_argument_types.copy(once "TUPLE[")
         simple_arguments_signature := once ""
         simple_arguments_signature.copy(once " (")
         matcher_arguments := once ""
         matcher_arguments.copy(once "create {MOCK_MATCHERS}.make")
         arguments_count.append_in(matcher_arguments)
         matcher_arguments.extend('(')
         matcher_arguments_signature := once ""
         matcher_arguments_signature.copy(once " (")
         argument_arguments := once ""
         argument_arguments.copy(once "create {MOCK_ARGUMENTS}.make")
         arguments_count.append_in(argument_arguments)
         argument_arguments.extend('(')

         arguments.accept(Current)

         simple_arguments.extend(')')
         simple_argument_types.extend(']')
         simple_arguments_signature.extend(')')
         matcher_arguments.extend(')')
         matcher_arguments_signature.extend(')')
         argument_arguments.extend(')')
      end

   commit_arguments
      do
         simple_arguments := string_pool.new_twin(simple_arguments)
         simple_argument_types := string_pool.new_twin(simple_argument_types)
         simple_arguments_signature := string_pool.new_twin(simple_arguments_signature)
         matcher_arguments := string_pool.new_twin(matcher_arguments)
         matcher_arguments_signature := string_pool.new_twin(matcher_arguments_signature)
         argument_arguments := string_pool.new_twin(argument_arguments)
      end

feature {}
   make
      do
      end

   string_pool: STRING_RECYCLING_POOL
      once
         create Result.make
      end

end -- class MOCK_SIGNATURE
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
-- Copyright (C) 2011-2018: Cyril ADRIAN
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
