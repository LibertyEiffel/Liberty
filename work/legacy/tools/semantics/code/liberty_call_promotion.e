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
class LIBERTY_CALL_PROMOTION[C_ -> LIBERTY_CALL]

inherit
   LIBERTY_TYPE_LISTENER

create {LIBERTY_CALL}
   make

feature {LIBERTY_TYPE}
   on_type_known (type: LIBERTY_TYPE) is
      do
         if not done and then target_type.is_known and then arg_type.is_known then
            done := True
            check_and_set_promotion
         end
      end

   on_type_built (type: LIBERTY_ACTUAL_TYPE) is
      do
         -- nothing
      end

feature {}
   check_and_set_promotion is
      require
         target_type.is_known
         arg_type.is_known
      local
         actual_target_type, actual_arg_type: LIBERTY_ACTUAL_TYPE
      do
         actual_target_type ::= target_type.known_type
         if actual_target_type.may_promote_current -- TODO: replace by checking that the argument is "like Current"
            and then actual_arg_type ?:= arg_type.known_type
          then
            actual_arg_type ::= arg_type.known_type
            if actual_target_type /= actual_arg_type
               and then not actual_arg_type.is_conform_to(actual_target_type)
               and then not actual_arg_type.converts_to(actual_target_type)
               and then actual_target_type.converts_to(actual_arg_type)
            then
               -- TODO: check that the target feature exists!!
               -- TODO: check that both features share the same ancestor? (otherwise it's only duck-typing)
               call.set_target(create {LIBERTY_CAST_EXPRESSION}.make(call.target, actual_arg_type))
               call.set_entity(create {LIBERTY_FEATURE_ENTITY}.make(call.entity.feature_name, actual_arg_type))
            end
         end
      end

feature {}
   make (a_call: like call; a_target_type: like target_type; a_arg_type: like arg_type) is
      require
         a_call /= Void
         a_target_type /= Void
         a_arg_type /= Void
      do
         call := a_call
         target_type := a_target_type
         arg_type := a_arg_type

         a_target_type.add_listener(Current)
         if a_arg_type /= a_target_type then
            a_arg_type.add_listener(Current)
         end
      ensure
         call = a_call
         target_type = a_target_type
         arg_type = a_arg_type
      end

   call: C_
   target_type, arg_type: LIBERTY_TYPE
   done: BOOLEAN

invariant
   call /= Void
   target_type /= Void
   arg_type /= Void

end -- class LIBERTY_CALL_PROMOTION
