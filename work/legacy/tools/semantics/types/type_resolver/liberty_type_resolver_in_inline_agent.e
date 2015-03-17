-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_TYPE_RESOLVER_IN_INLINE_AGENT

inherit
   LIBERTY_TYPE_RESOLVER

create {LIBERTY_SEMANTICS_BUILDER}
   make

feature {ANY}
   local_context: LIBERTY_INLINE_AGENT_CONTEXT

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "resolver in inline agent")
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      do
         Result := Current --| TODO: ???
      end

feature {}
   lookup_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE
      local
         name: FIXED_STRING
      do
         if type_definition.is_like_result then
            if local_context.result_type = Void then
               --|*** TODO: error: not a function
               not_yet_implemented
            end
            Result := local_context.result_type
         elseif type_definition.is_like_entity then
            -- If it's an anchor to a parameter or a local, resolve it immediately. (TODO: beware of cycles!)
            -- Other cases will be caught by parent resolvers.
            name := type_definition.entity_anchor.image.image.intern
            if local_context.is_parameter(name) then
               Result := local_context.parameter(name).result_type
            elseif local_context.is_local(name) then
               Result := local_context.local_var(name).result_type
            end
         end
      end

   lookup_export_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE
      do
         check Result = Void end
      end

   lookup_position (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_POSITION
      do
         check Result = Void end
      end

feature {}
   make (a_local_context: like local_context)
      require
         a_local_context /= Void
      do
         local_context := a_local_context
      ensure
         local_context = a_local_context
      end

invariant
   local_context /= Void

end -- class LIBERTY_TYPE_RESOLVER_IN_INLINE_AGENT
