-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUN_FEATURE
   --
   -- A feature at run time: a specialized version of a feature for a given type.
   --
   -- Created at the "adapt" phase, i.e. the latest phase before the back-end generation. An important
   -- property is that during that phase, each run feature is created only once.
   --
   -- * RUN_FEATURE_1: constant attribute.
   -- * RUN_FEATURE_2: attribute.
   -- * RUN_FEATURE_3: procedure.
   -- * RUN_FEATURE_4: function.
   -- * RUN_FEATURE_5: once procedure.
   -- * RUN_FEATURE_6: once function.
   -- * RUN_FEATURE_7: external procedure.
   -- * RUN_FEATURE_8: external function.
   -- * RUN_FEATURE_9: deferred routine.
   --

inherit
   HASHABLE
   VISITABLE

insert
   GLOBALS
   TAGGED

feature {ANY}
   type_of_current: TYPE
         -- The real type of Current in this feature.

   name: FEATURE_NAME
         -- Final name (the only one really used) of the feature.

   base_feature: ANONYMOUS_FEATURE
         -- Original base feature definition.

   feature_stamp: FEATURE_STAMP
      do
         Result := type_of_current.lookup(name)
      ensure
         Result.anonymous_feature(type_of_current) = base_feature
      end

   arguments: FORMAL_ARG_LIST
         -- Runnable arguments list if any.
      deferred
      end

   result_type: TYPE_MARK
         -- Runnable Result type if any.
      deferred
      end

   require_assertion: REQUIRE_ASSERTION
         -- Runnable collected require assertion if any.
      deferred
      end

   local_vars: LOCAL_VAR_LIST
         -- Runnable local var list if any.
      deferred
      end

   routine_body: INSTRUCTION
         -- Runnable routine body if any.
      deferred
      end

   ensure_assertion: ENSURE_ASSERTION
         -- Runnable collected ensure assertion if any.
      deferred
      end

   rescue_compound: INSTRUCTION
         -- Runnable rescue compound if any.
      deferred
      end

   is_once_procedure: BOOLEAN
         -- This is not only True for RUN_FEATURE_5, but it may be also
         -- True when some once procedure is wrapped (RUN_FEATURE_10).
      deferred
      ensure
         Result implies result_type = Void
      end

   is_once_function: BOOLEAN
         -- This is not only True for RUN_FEATURE_6, but it may be also
         -- True when some once function is wrapped (RUN_FEATURE_11).
      deferred
      ensure
         Result implies result_type /= Void
      end

   is_deferred: BOOLEAN
      deferred
      end

   hash_code: INTEGER
      do
         Result := to_pointer.hash_code
      end

   is_root: BOOLEAN
         -- True if `Current' is the root creation feature. Can only be set
         -- once in RUN_FEATURE_3. This function is called via a require
         -- assertion. (This way, no extra memory is used for a production
         -- compiler because this is dead code.)

   frozen is_once_routine: BOOLEAN
         -- Is it a once routine?
      do
         Result := is_once_function or else is_once_procedure
      end

   side_effect_free: BOOLEAN
         -- If calling `Current' has no side effect at all.
      require
         smart_eiffel.is_ready
      deferred
      end

   frozen use_current: BOOLEAN
      require
         smart_eiffel.is_ready
      do
         inspect
            use_current_state
         when True_state then
            Result := True
         when False_state then
         when Unknown_state then
            use_current_state := Computing_state
            compute_use_current
            Result := use_current_state = True_state
         when Computing_state then
            use_current_state := True_state
            Result := True
         end
      end

   frozen debug_info_in (buffer: STRING)
         -- For debugging only.
      local
         i: INTEGER
      do
         buffer.extend('{')
         buffer.append(type_of_current.name.to_string)
         buffer.extend('}')
         buffer.extend('.')
         name.complete_name_in(buffer)
         if arguments /= Void then
            buffer.extend('(')
            from
               i := 1
            until
               i > arguments.count
            loop
               arguments.type_mark(i).debug_info_in(buffer)
               i := i + 1
               if i <= arguments.count then
                  buffer.extend(',')
               end
            end
            buffer.extend(')')
         end
         if result_type /= Void then
            buffer.extend(':')
            result_type.debug_info_in(buffer)
         end
      end

   frozen start_position: POSITION
      do
         Result := base_feature.start_position
      end

   mapping_name_in (buffer: STRING)
      do
         buffer.extend('r')
         type_of_current.live_type.id.append_in(buffer)
         name.mapping_c_in(buffer)
      end

   has_closures: BOOLEAN
      deferred
      end

feature {RUN_FEATURE}
   is_in_computation: BOOLEAN
      do
         Result := use_current_state = Computing_state
      end

feature {RUN_FEATURE_VISITOR}
   old_list: FAST_ARRAY[E_OLD]
         -- Non Void when `ensure_assertion' actually has "old" expression.

feature {}
   use_current_state: INTEGER
         -- Memory cache for `use_current' (see below *_state constants).

   False_state,    -- already computed and False.
   True_state,     -- already computed and True.
   Unknown_state,  -- not yet computed.
   Computing_state -- during computation.
   : INTEGER unique

   frozen std_compute_use_current
      require
         is_in_computation
      do
         smart_eiffel.push_context(base_feature)
         if use_current_state = Computing_state then
            if require_assertion /= Void then
               if require_assertion.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            if routine_body /= Void then
               if routine_body.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            if rescue_compound /= Void then
               if rescue_compound.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            if ensure_assertion /= Void then
               if ensure_assertion.use_current(type_of_current) then
                  use_current_state := True_state
               end
            end
         end
         if use_current_state = Computing_state then
            use_current_state := False_state
         end
         smart_eiffel.pop_context(base_feature)
      ensure
         use_current_state = False_state or else use_current_state = True_state
      end

   compute_use_current
      require
         is_in_computation
      deferred
      ensure
         use_current_state = True_state or else use_current_state = False_state
      end

   frozen for (lt: LIVE_TYPE; origin: like base_feature; fn: FEATURE_NAME)
         -- Creation feature for the new lookup. Just creates the run feature, without adapting it yet.
      require
         not smart_eiffel.is_ready
         origin /= Void
      local
         buffer: STRING
      do
         type_of_current := lt.type
         base_feature := origin
         name := fn
         use_current_state := Unknown_state
         debug
            buffer := "Creating "
            buffer.append(type_of_current.name.to_string)
            buffer.extend('.')
            name.complete_name_in(buffer)
            buffer.extend('%N')
            echo.put_string(buffer)
         end
         set_result_type
         smart_eiffel.register_run_feature(Current)
      end

   set_result_type
      deferred
      end

   debug_info: STRING -- To view more under sedb.

   do_adapt
         -- Called by `adapt'.
      deferred
      end

feature {LIVE_TYPE}
   frozen adapt
         -- Adapt the feature to make it suitable for use by the good old C_PRETTY_PRINTER.
      require
         smart_eiffel.registered(Current)
         type_of_current.live_type.registered(Current)
      do
         debug
            debug_info := "<adapting> {"
            debug_info.append(type_of_current.name.to_string)
            debug_info.append(once "}.")
            name.complete_name_in(debug_info)
         end
         base_feature.hook_for(type_of_current.live_type)
         smart_eiffel.push_context(base_feature)
         do_adapt
         smart_eiffel.pop_context(base_feature)
         debug
            debug_info.clear_count
            debug_info_in(debug_info)
         end
      end

invariant
   type_of_current /= Void

   name /= Void

   base_feature /= Void

end -- class RUN_FEATURE
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
