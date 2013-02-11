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
deferred class LIBERTY_FEATURE_LOCAL_CONTEXT

feature {ANY}
   current_type: LIBERTY_ACTUAL_TYPE is
      deferred
      ensure
         exists: Result /= Void
      end

   result_type: LIBERTY_TYPE is
      deferred
      end

   parameters: TRAVERSABLE[LIBERTY_PARAMETER] is
      deferred
      ensure
         exists: Result /= Void
      end

   locals: TRAVERSABLE[LIBERTY_LOCAL] is
      deferred
      ensure
         exists: Result /= Void
      end

   is_parameter (name: ABSTRACT_STRING): BOOLEAN is
      require
         name /= Void
      deferred
      end

   parameter (name: ABSTRACT_STRING): LIBERTY_PARAMETER is
      require
         name /= Void
         is_parameter(name)
      deferred
      ensure
         exists: Result /= Void
      end

   is_local (name: ABSTRACT_STRING): BOOLEAN is
      require
         name /= Void
      deferred
      end

   local_var (name: ABSTRACT_STRING): LIBERTY_LOCAL is
      require
         name /= Void
         is_local(name)
      deferred
      ensure
         exists: Result /= Void
      end

   current_entity: LIBERTY_CURRENT is
      deferred
      end

   result_entity: LIBERTY_RESULT is
      deferred
      end

   can_retry: BOOLEAN is
      deferred
      end

   retry_instruction (a_position: LIBERTY_POSITION): LIBERTY_RETRY is
      require
         can_retry
      deferred
      ensure
         exists: Result /= Void
      end

feature {LIBERTY_BUILDER_TOOLS, LIBERTY_FEATURE_LOCAL_CONTEXT}
   add_parameter (a_parameter: LIBERTY_PARAMETER) is
      require
         a_parameter /= Void
         not is_local(a_parameter.name)
      deferred
      ensure
         is_parameter(a_parameter.name)
      end

   add_local (a_local: LIBERTY_LOCAL) is
      require
         a_local /= Void
         not is_parameter(a_local.name)
      deferred
      ensure
         is_local(a_local.name)
      end

   reconcile_retry_instructions (a_feature: LIBERTY_FEATURE) is
      require
         can_retry
      deferred
      end

   set_result_type (a_result_type: like result_type) is
      require
         a_result_type /= Void
      deferred
      ensure
         result_type = a_result_type
      end

feature {LIBERTY_SEMANTICS_BUILDER}
   specialized_in (a_type: like current_type): like Current is
      deferred
      end

end
