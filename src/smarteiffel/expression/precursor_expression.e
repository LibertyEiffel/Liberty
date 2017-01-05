-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PRECURSOR_EXPRESSION
   --
   -- Handling of the `Precursor' function call.
   --

inherit
   EXPRESSION
   PRECURSOR_CALL

create {ANY}
   make

feature {ANY}
   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_result: BOOLEAN False

   is_void: BOOLEAN False

   is_static: BOOLEAN False

   is_writable: BOOLEAN False

   extra_bracket_flag: BOOLEAN False

   declaration_type: TYPE
      do
         Result := written_declaration_type_mark.type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := specialized_anonymous_feature.result_type.declaration_type
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := specialized_anonymous_feature.result_type.resolve_in(type)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         --|*** To be done. *** (Dom. june 18th 2004) ***
      end

   precedence: INTEGER
      do
         Result := dot_precedence
      end

   pretty (indent_level: INTEGER)
      do
         pretty_(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty(indent_level)
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty(indent_level)
         pretty_printer.put_character('.')
      end

   short (type: TYPE)
      do
         if parent /= Void then
            short_printer.hook_or(once "open_curly_bracket", once "{")
            parent.short(type)
            short_printer.hook_or(once "close_curly_bracket", once "}")
         end
         short_printer.hook_or(as_precursor, as_precursor)
         if arguments /= Void then
            arguments.short(type)
         end
      end

   short_target (type: TYPE)
      do
         short(type)
         short_printer.put_dot
      end

   collect (t: TYPE): TYPE
      do
         -- TODO: translate comment
         --|*** Attention ici on fait simple : si le Precursor s'appelle
         --| lui-même, la liaison dynamique est suivie (-> rappel de la
         --| fonction redéfinie).
         --| Le choix contraire (qui consiste à dire qu'il s'agit d'un double
         --| héritage + redéfinition => suivre "la bonne branche") est très
         --| complexe à implanter, est-ce utile ?
         specialized_anonymous_feature.collect(t)
         Result := specialized_anonymous_feature.result_type.resolve_in(t)
         if arguments /= Void then
            arguments.simple_collect(t, specialized_anonymous_feature.arguments)
         end
      end

   accept (visitor: PRECURSOR_EXPRESSION_VISITOR)
      do
         visitor.visit_precursor_expression(Current)
      end

end -- class PRECURSOR_EXPRESSION
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
