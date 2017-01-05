-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CALL_PREFIX
   --
   -- For all sort of prefix operators.
   -- Root of all CALL_PREFIX_*.
   --

inherit
   CALL_0
      redefine pretty_target
      end

feature {ANY}
   extra_bracket_flag: BOOLEAN True

   operator: STRING
      deferred
      end

   frozen bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   frozen pretty (indent_level: INTEGER)
      do
         feature_name.pretty(indent_level)
         if feature_name.to_string.last.is_letter then
            pretty_printer.put_character(' ')
         end
         if target.precedence < precedence then
            pretty_printer.put_character('(')
            target.pretty(indent_level)
            pretty_printer.put_character(')')
         else
            target.pretty(indent_level)
         end
      end

   frozen pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   frozen short (type: TYPE)
      do
         short_printer.put_prefix_name(feature_name)
         if target.precedence < precedence then
            target.bracketed_short(type)
         else
            target.short(type)
         end
      end

   frozen short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

feature {}
   frozen with (t: like target; fn: like feature_name)
      require
         t /= Void
         fn /= Void
      do
         target := t
         feature_name := fn
      ensure
         target = t
         feature_name = fn
      end

end -- class CALL_PREFIX
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
