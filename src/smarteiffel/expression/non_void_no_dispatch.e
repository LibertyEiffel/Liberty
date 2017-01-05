-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NON_VOID_NO_DISPATCH
   --
   -- Used each time we have a non Void object with no need for dynamic dispatch because we know its dynamic type.
   --
   -- As an example, such an object is created for precomputed once function for which we are able to determine
   -- the exact dynamic type (this is the most common usage of NON_VOID_NO_DISPATCH).
   -- As another example, NON_VOID_NO_DISPATCH class is also used to manipulate some external for well known
   -- entities like `stdin', `stdout' or `stderr' (we are also sure of the non-Void properties here).
   --

inherit
   NON_WRITTEN_EXPRESSION

create {ONCE_ROUTINE_POOL, EXTERNAL_FUNCTION}
   make

feature {ANY}
   dynamic_type: TYPE
         -- The unique type of this NON_VOID_NO_DISPATCH expression.

   external_function: EXTERNAL_FUNCTION
         -- Non void in the case of the corresponding `external_function'.
      do
         Result ?= feature_stamp.anonymous_feature(context_type)
      end

   feature_stamp: FEATURE_STAMP

   context_type: TYPE
         -- Comes with `feature_stamp' to retrieve the corresponding ANONYMOUS_FEATURE.

   once_function: ONCE_FUNCTION
         -- Non Void in the case of some precomputed once function.
      do
         Result ?= feature_stamp.anonymous_feature(context_type)
      end

   start_position: POSITION
      do
         Result := feature_stamp.anonymous_feature(context_type).start_position
      end

   is_writable: BOOLEAN False

   is_static: BOOLEAN True

   is_result: BOOLEAN False

   resolve_in (type: TYPE): TYPE
      do
         Result := dynamic_type
      end

   declaration_type: TYPE
      do
         Result := dynamic_type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := declaration_type.canonical_type_mark
      end

   collect (type: TYPE): TYPE
      do
         if once_function /= Void then
            once_routine_pool.collect_precomputable_function(Current, feature_stamp, context_type)
         else
            smart_eiffel.collect_external_function(Current, feature_stamp, context_type)
         end
         Result := dynamic_type
      end

   use_current (type: TYPE): BOOLEAN
      do
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   safety_check (type: TYPE)
      do
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := dynamic_type
      end

   simplify (type: TYPE): EXPRESSION
      do
         Result := Current
      end

   accept (visitor: NON_VOID_NO_DISPATCH_VISITOR)
      do
         visitor.visit_non_void_no_dispatch(Current)
      end

feature {ANY}
   run_feature: RUN_FEATURE
      do
         Result := feature_stamp.run_feature_for(context_type)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (dt: like dynamic_type; fs: like feature_stamp; ct: like context_type)
      require
         dt /= Void
         fs /= Void
         ct /= Void
         fs.has_anonymous_feature_for(ct)
      do
         dynamic_type := dt
         feature_stamp := fs
         context_type := ct
      ensure
         dynamic_type = dt
         feature_stamp = fs
         context_type = ct
      end

invariant
   dynamic_type.live_type /= Void

   feature_stamp /= Void

   context_type /= Void

end -- class NON_VOID_NO_DISPATCH
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
