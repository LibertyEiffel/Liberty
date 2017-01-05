-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EXTERNAL_TOOL
   -- A simple way to create external tools without bothering too much about "how it works". Simply "fill the
   -- blanks".
   --
   -- If your tool must parse many Eiffel files, or for any other needs, maybe you will have to redefine
   -- `argument_count' and `argument'.
   --
   -- You should call `bootstrap' first.
   --
inherit
   COMMAND_LINE_TOOLS
      rename
         command_line_help_summary as usage
      end

feature {ANY}
   command_line_name: STRING
      do
         Result := argument(0)
      end

feature {}
   bootstrap
      do
         -- Be sure that `system_tools' is created as soon as possible
         if system_tools /= Void then
         end

         -- Maybe set the short flag
         if use_short_mode then
            smart_eiffel.set_short_or_class_check_flag
         end

         -- Now parse the arguments
         if not ace_file_mode then
            parse_arguments
            ace.set_root_class_name_using(root_class_name)
            if root_procedure_name /= Void then
               ace.set_root_procedure_name(root_procedure_name)
            end
            ace.command_line_parsed(command_name)
         end
      end

   parse_arguments
         -- You can use `flag_match' and the like (many features are predefined to help parsing)
         --
         -- Be sure, also, to correctly define `is_valid_argument_for_ace_mode' if some arguments must be
         -- used in ACE file mode.
         --
         -- At last, don't forget to fill in `root_class_name' and `procedure_class_name' if you don't use an
         -- ACE file.
      deferred
      ensure
         root_class_name /= Void
      end

   root_class_name: STRING
         -- The name of the root class, if an ACE file is not used.

   root_procedure_name: STRING
         -- The name of the root procedure, if an ACE file is not used.

   use_short_mode: BOOLEAN
         -- The "compilation" mode of the compiler is maybe too strict. In most cases, short is better
         -- suited. Hence you should redefine this feature as `True'. In some cases though you may want to set
         -- it to `False' and see what it brings.
         --
         -- To be more precise, when set to true, it:
         -- - bypasses the optimizer
         -- - doesn't warn about obsolete features
         -- - restricts VWEQ checks when we have sure positive (remember we don't scan all the program then)
         -- BUT:
         -- - keeps comments (otherwise they're cut out), and merges them in case of feature merge
         -- - keeps the real aspect of manifest strings as written in the code (otherwise, only a compiled
         --   version is kept)
      deferred
      end

end -- EXTERNAL_TOOL
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
