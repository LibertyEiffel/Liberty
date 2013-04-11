-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class VOID_CALL
   --
   -- Such an object is created when a Void target call on a function (or an attribute) is detected.
   -- (See also VOID_PROC_CALL.)
   --
inherit
   NON_WRITTEN_EXPRESSION

creation {ANY}
   make

feature {ANY}
   start_position: POSITION

   feature_stamp: FEATURE_STAMP
         -- Of the Void call.

   target_type: TYPE
         --  Of the Void call (the one to be used with `feature_stamp').

   is_writable: BOOLEAN is False

   is_result: BOOLEAN is False

   use_current (type: TYPE): BOOLEAN is
      do
      end

   is_static: BOOLEAN is True

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
      end

   simplify (type: TYPE): EXPRESSION is
      do
         Result := Current
      end

   declaration_type: TYPE is
      local
         anonymous_feature: ANONYMOUS_FEATURE
      do
         anonymous_feature := feature_stamp.anonymous_feature(target_type)
         Result := anonymous_feature.result_type.declaration_type.type
      end

   collect (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
      end

   resolve_in (type: TYPE): TYPE is
      local
         anonymous_feature: ANONYMOUS_FEATURE
      do
         anonymous_feature := feature_stamp.anonymous_feature(target_type)
         Result := anonymous_feature.result_type.resolve_in(target_type)
      end

   adapt_for (type: TYPE): like Current is
      do
         Result := Current
      end

   safety_check (type: TYPE) is
      do
         error_handler.append(once "Call on a Void target in the live code (when the type of Current is ")
         error_handler.append(type.name.to_string)
         error_handler.append(once ").")
         error_handler.add_position(start_position)
         error_handler.print_as_warning
      end

   accept (visitor: VOID_CALL_VISITOR) is
      do
         visitor.visit_void_call(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (sp: like start_position; fs: like feature_stamp; tt: like target_type) is
      require
         not sp.is_unknown
         fs /= Void
         tt /= Void
      do
         start_position := sp
         target_type := tt
         feature_stamp := fs
      ensure
         start_position = sp
         feature_stamp = fs
         target_type = tt
      end

invariant
   feature_stamp /= Void

   target_type /= Void

end -- class VOID_CALL
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
