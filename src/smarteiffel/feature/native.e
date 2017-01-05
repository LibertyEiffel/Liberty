-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class NATIVE
   --
   -- An external feature definition (external "plug_in", external "built_in",
   -- external "C ...", external "C++ ...", ...
   --

inherit
   VISITABLE
   HASHABLE

insert
   GLOBALS

feature {ANY}
   hash_code: INTEGER
      do
         Result := to_pointer.hash_code
      end

   external_tag: MANIFEST_STRING
         -- The external language call description.

   start_position: POSITION
         -- Of the `external_tag'.
      do
         Result := external_tag.start_position
      end

   frozen pretty (indent_level: INTEGER; is_inline_agent: BOOLEAN)
      do
         check
            indent_level = 1
            not is_inline_agent
         end
         external_tag.pretty(3)
      end

   use_current (er: EXTERNAL_ROUTINE): BOOLEAN
         -- Is `Current' used by such a call?
      require
         er /= Void
      deferred
      end

feature {EXTERNAL_FUNCTION}
   side_effect_free (target_type: TYPE; feature_text: FEATURE_TEXT): BOOLEAN
      do
         -- The default is False.
      end

feature {EXTERNAL_ROUTINE}
   collect (type: TYPE; external_routine: EXTERNAL_ROUTINE)
         -- Note1 : as an example the `collect' call is used to collect actually used NATIVE_PLUG_IN.
         -- Note 2: also used to notify to the `assignment_handler' of possible weird assignments which may be
         -- done outside of the Eiffel code.
      require
         type /= Void
         external_routine /= Void
      deferred
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE)
      deferred
      end

feature {}
   frozen notify_external_assignments (type: TYPE; external_routine: EXTERNAL_ROUTINE)
         -- Must be call during `collect' by native which are not trusted.
      do
         assignment_handler.from_external(type, external_routine.arguments, external_routine.result_type)
      end

   make (et: like external_tag)
      require
         et /= Void
      do
         external_tag := et
      ensure
         external_tag = et
      end

invariant
   external_tag /= Void implies not external_tag.once_flag

end -- class NATIVE
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
