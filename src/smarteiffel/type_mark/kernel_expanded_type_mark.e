-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class KERNEL_EXPANDED_TYPE_MARK
   --
   -- Root of BOOLEAN_TYPE_MARK, CHARACTER_TYPE_MARK, INTEGER_TYPE_MARK, TYPE_REAL,
   -- TYPE_DOUBLE and POINTER_TYPE_MARK.
   --

inherit
   STATIC_TYPE_MARK

insert
   NON_GENERIC_TYPE_MARK

feature {ANY}
   is_expanded: BOOLEAN is True

   is_reference, is_empty_expanded, is_user_expanded: BOOLEAN is False

   class_text_name: CLASS_NAME

   jvm_method_flags: INTEGER is 9

   frozen jvm_target_descriptor_in (str: STRING) is
      do
         jvm_descriptor_in(str)
      end

   frozen jvm_check_class_invariant is
      do
      end

   frozen jvm_standard_is_equal is
      local
         ca: like code_attribute; point1, point2: INTEGER
      do
         ca := code_attribute
         point1 := jvm_if_x_eq
         ca.opcode_iconst_0
         point2 := ca.opcode_goto
         ca.resolve_u2_branch(point1)
         ca.opcode_iconst_1
         ca.resolve_u2_branch(point2)
      end

   frozen start_position: POSITION is
      do
         Result := class_text_name.start_position
      end

   frozen run_type: TYPE_MARK is
      do
         Result := Current
      end

feature {LIVE_TYPE}
   structure_mark: CHARACTER is
         -- 's' short
         -- 'i' int
         -- 'I' long
         -- 'f' float
         -- 'd' double
         -- 'D' long double
         -- 'c' char
         -- 'p' pointer
      deferred
      ensure "siIfdDcp".has(Result)
      end

feature {LIVE_TYPE, TYPE_MARK}
   frozen just_before_gc_mark_in (str: STRING) is
      do
      end

feature {TYPE_MARK}
   frozen short_ (shorted_type: TYPE) is
      do
         short_printer.put_class_name(class_text_name)
      end

   set_start_position (sp: like start_position) is
      do
         if start_position /= sp then
            class_text_name := class_text_name.twin
            class_text_name.set_accurate_position(sp)
         end
      end

end -- class KERNEL_EXPANDED_TYPE_MARK
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
