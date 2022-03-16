-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PRECURSOR_INSTRUCTION
   --
   -- Handling of the `Precursor' procedure call.
   --

inherit
   INSTRUCTION
   PRECURSOR_CALL

create {ANY}
   make

feature {ANY}
   end_mark_comment: BOOLEAN False

   accept (visitor: PRECURSOR_INSTRUCTION_VISITOR)
      do
         visitor.visit_precursor_instruction(Current)
      end

   collect (t: TYPE): TYPE
      do
         --|*** Attention ici on fait simple : si le Precursor s'appelle
         --| lui-même, la liaison dynamique est suivie (-> rappel de la
         --| fonction redéfinie).
         --| Le choix contraire (qui consiste à dire qu'il s'agit d'un double
         --| héritage + redéfinition => suivre "la bonne branche") est très
         --| complexe à implanter, est-ce utile ?
         specialized_anonymous_feature.collect(t)
         if arguments /= Void then
            arguments.simple_collect(t, specialized_anonymous_feature.arguments)
         end
      end

   pretty (indent_level: INTEGER)
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_(indent_level)
         if pretty_printer.semi_colon_flag then
            pretty_printer.put_character(';')
         end
      end

end -- class PRECURSOR_INSTRUCTION
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
