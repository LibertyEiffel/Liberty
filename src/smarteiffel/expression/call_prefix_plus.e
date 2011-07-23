-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_PREFIX_PLUS
   --
   --   Prefix operator : "+".
   --

inherit
   CALL_PREFIX
      redefine static_simplify
      end

creation {ANY}
   make, with

feature {ANY}
   precedence: INTEGER is 11

   operator: STRING is
      do
         Result := as_plus
      end
   
   static_simplify: EXPRESSION is
      local
         ic: INTEGER_CONSTANT; v: INTEGER_64
      do
         target := target.static_simplify
         ic ?= target
         if ic = Void then
            Result := Current
         else
            v := ic.value_memory
            create {INTEGER_CONSTANT} Result.make(v, feature_name.start_position)
         end
      end
   
   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
      do
         Result := jvm_standard_branch_if_false(type)
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
      do
         Result := jvm_standard_branch_if_true(type)
      end

feature {ANY}
   accept (visitor: CALL_PREFIX_PLUS_VISITOR) is
      do
         visitor.visit_call_prefix_plus(Current)
      end

feature {}
   make (operator_position: POSITION; rp: like target) is
      require
         not operator_position.is_unknown
         rp /= Void
      do
         create feature_name.prefix_name(eiffel_parser.plus_name, operator_position)
         target := rp
      ensure
         start_position = operator_position
         target = rp
      end

end -- class CALL_PREFIX_PLUS
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
