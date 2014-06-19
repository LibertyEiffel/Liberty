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
deferred class LIBERTY_KNOWN_TYPE
   --
   -- A known type. May be either LIBERTY_ACTUAL_TYPE or LIBERTY_VOID_TYPE.
   --

inherit
   LIBERTY_TYPE
      export {LIBERTY_TYPE_LISTENER, LIBERTY_TYPE}
         add_listener, has_listener
      undefine
         mark_reachable_code, add_listener
      end

feature {ANY}
   current_entity: LIBERTY_CURRENT
      deferred
      end

   is_known: BOOLEAN True

   file: FIXED_STRING
      deferred
      end

   hash_code: INTEGER
      deferred
      end

   is_obsolete: BOOLEAN
      deferred
      end

   cluster: LIBERTY_CLUSTER
      deferred
      end

   name: FIXED_STRING
      deferred
      end

   parameters: TRAVERSABLE[LIBERTY_TYPE]
      deferred
      end

   full_name: FIXED_STRING
      local
         buffer: STRING
      do
         if full_name_memory /= Void then
            Result := full_name_memory
         else
            buffer := full_name_pool.new
            full_name_in(buffer)
            Result := buffer.intern
            full_name_memory := Result
            full_name_pool.recycle(buffer)
         end
      end

   is_deferred: BOOLEAN
      require
         is_runtime_category_set
      deferred
      end

   is_expanded: BOOLEAN
      require
         is_runtime_category_set
      deferred
      end

   is_separate: BOOLEAN
      require
         is_runtime_category_set
      deferred
      end

   is_reference: BOOLEAN
      require
         is_runtime_category_set
      deferred
      end

   is_runtime_category_set: BOOLEAN
      deferred
      end

   the_invariant: LIBERTY_INVARIANT
      deferred
      end

   has_feature (a_feature_name: LIBERTY_FEATURE_NAME): BOOLEAN
      deferred
      end

   feature_definition (a_feature_name: LIBERTY_FEATURE_NAME): LIBERTY_FEATURE_DEFINITION
      require
         has_feature(a_feature_name)
      deferred
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      do
         Result := Current
      end

   accept (visitor: LIBERTY_TYPE_VISITOR)
      deferred
      end

feature {ANY}
   debug_display (o: OUTPUT_STREAM; show_features: BOOLEAN)
      deferred
      end

feature {LIBERTY_KNOWN_TYPE}
   full_name_in (buffer: STRING)
      deferred
      end

   same_base_class_as (other: LIBERTY_ACTUAL_TYPE): BOOLEAN
      require
         other /= Void
      deferred
      end

feature {ANY} -- Inheritance
   is_conform_to (other: LIBERTY_KNOWN_TYPE): BOOLEAN
      require
         other /= Void
      deferred
      ensure
         Result implies is_child_of(other)
      end

   is_child_of (other: LIBERTY_KNOWN_TYPE): BOOLEAN
      require
         other /= Void
      do
         Result := is_conform_to(other) or else is_non_conformant_child_of(other)
      end

   is_non_conformant_child_of (other: LIBERTY_KNOWN_TYPE): BOOLEAN
      require
         other /= Void
      deferred
      ensure
         Result implies is_child_of(other)
      end

   common_conformant_parent_with (other: LIBERTY_KNOWN_TYPE): LIBERTY_KNOWN_TYPE
      require
         other /= Void
      do
         if other = Current then
            Result := Current
         elseif other.is_conform_to(Current) then
            Result := Current
         elseif is_conform_to(other) then
            Result := other
         else
            Result := common_parent(other)
            if Result = Void then
               --| *** TODO: check if the symmetric lookup is mandatory
               Result := other.common_parent(Current)
            end
         end
      end

   converts_to (target_type: LIBERTY_KNOWN_TYPE): BOOLEAN
      require
         target_type /= Void
      deferred
      end

   do_convert (target_type: LIBERTY_ACTUAL_TYPE; a_converter: LIBERTY_TYPE_CONVERTER)
      require
         target_type /= Void
         converts_to(target_type)
         a_converter /= Void
      deferred
      end

feature {ANY} -- Representation
   out_in_tagged_out_memory
      do
         full_name_in(tagged_out_memory)
      end

feature {LIBERTY_KNOWN_TYPE}
   common_parent (other: LIBERTY_KNOWN_TYPE): LIBERTY_KNOWN_TYPE
         -- To implement `common_conformant_parent_with'.
         -- Conformant common parent lookup.
      require
         not_trivial: Current /= other and then not is_conform_to(other) and then not other.is_conform_to(Current)
      deferred
      end

feature {LIBERTY_TYPE_BUILDER}
   has_no_parents: BOOLEAN
      deferred
      end

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_BUILDER}
   has_loaded_features: BOOLEAN
      deferred
      end

feature {LIBERTY_UNIVERSE}
   set_reachable (mark: INTEGER)
      do
         mark_reachable_code(mark)
      end

feature {}
   full_name_memory: FIXED_STRING

   full_name_pool: STRING_RECYCLING_POOL
      once
         create Result.make
      end

invariant
   file /= Void
   parameters /= Void
   result_entity /= Void
   is_known

end -- class LIBERTY_KNOWN_TYPE
