-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class PLUGIN
   --
   -- Plugin handling
   --
   -- Note that all the exported features return the same STRING object.
   --

inherit
   HASHABLE

insert
   GLOBALS
      redefine is_equal
      end

feature {SYSTEM_TOOLS}
   try_auto_init
         -- try to write init code for this plugin, provided all dependencies are satisfied.
      require
         not auto_init_done
      deferred
      end

feature {ANY}
   auto_init_done: BOOLEAN
         -- True when the auto_init code was written.
      deferred
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := name.same_as(other.name) and then path.same_as(other.path)
      end

   hash_code: INTEGER

feature {PLUGIN, NATIVE}
   name: STRING

   path: STRING

feature {NATIVE_PLUG_IN}
   include (position: POSITION)
      deferred
      end

feature {} -- directory handling
   bd: BASIC_DIRECTORY

   cwd: STRING ""

   absolute_path (some_path: STRING): STRING
      do
         Result := once ""
         Result.copy(cwd)
         bd.ensure_system_notation
         bd.system_notation.to_absolute_path_in(Result, some_path)
      end

   tfr: TEXT_FILE_READ
      once
         create Result.make
      end

invariant
   name /= Void
   path /= Void

end -- class PLUGIN
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
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- https://www.liberty-eiffel.org
-- ------------------------------------------------------------------------------------------------------------------------------
