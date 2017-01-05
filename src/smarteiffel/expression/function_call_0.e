-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FUNCTION_CALL_0
   --
   -- Other calls without argument.
   --

inherit
   CALL_0

create {ANY}
   make

create {MANIFEST_STRING_INSPECTOR, INSPECT_STATEMENT}
   make_specialized

feature {ANY}
   extra_bracket_flag: BOOLEAN False

   precedence: INTEGER
      do
         Result := dot_precedence
      end

   short (type: TYPE)
      local
         target_type: TYPE; fs: FEATURE_STAMP
      do
         target.short_target(type)
         target_type := target.resolve_in(type)
         if feature_stamp = Void then
            fs := type.search(feature_name)
         else
            fs := feature_stamp.resolve_static_binding_for(target.declaration_type, target_type)
         end
         if fs = Void then
            error_handler.add_position(start_position)
            error_handler.append(once "Feature ")
            error_handler.append(feature_name.to_string)
            error_handler.append(once " not found in type ")
            error_handler.append(target_type.canonical_type_mark.written_mark)
            error_handler.print_as_warning
         else
            target_type.get_feature_name(fs).short(type)
         end
      end

   short_target (type: TYPE)
      do
         short(type)
         short_printer.put_dot
      end

   bracketed_pretty, pretty (indent_level: INTEGER)
      do
         target.pretty_target(indent_level)
         pretty_printer.put_string(feature_name.to_string)
      end

feature {ANY}
   accept (visitor: FUNCTION_CALL_0_VISITOR)
      do
         visitor.visit_function_call_0(Current)
      end

feature {}
   make (t: like target; fn: like feature_name)
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

   make_specialized (t: like target; type: TYPE; fn: like feature_name)
      do
         make(t, fn)
         feature_stamp := type.search(fn)
      end

end -- class FUNCTION_CALL_0
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
