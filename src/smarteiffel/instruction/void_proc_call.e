-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class VOID_PROC_CALL
   --
   -- Such an object is created when a Void target call on a procedure is detected.
   -- (See also VOID_CALL.)
   --

inherit
   NON_WRITTEN_INSTRUCTION

create {ANY}
   make

feature {ANY}
   start_position: POSITION
         -- Of the Void call.

   feature_stamp: FEATURE_STAMP
         -- Of the Void call.

   target_type: TYPE
         -- Of the Void call (the one to be used with `feature_stamp').

   use_current (type: TYPE): BOOLEAN
      do
      end

   simplify (type: TYPE): INSTRUCTION
      do
         Result := Current
      end

   collect (type: TYPE): TYPE
      do
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         -- No because it produces a crash.
      end

   safety_check (type: TYPE)
      do
         error_handler.append(once "Call on a Void target in the live code (when the type of Current is ")
         error_handler.append(type.name.to_string)
         error_handler.append(once ").")
         error_handler.add_position(start_position)
         error_handler.print_as_warning
      end

   adapt_for (t: TYPE): like Current
      do
         Result := Current
      end

   accept (visitor: VOID_PROC_CALL_VISITOR)
      do
         visitor.visit_void_proc_call(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (sp: like start_position; fs: like feature_stamp; tt: like target_type)
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

end -- class VOID_PROC_CALL
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
