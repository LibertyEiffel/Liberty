-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class NON_STATIC_TYPE_MARK
   --
   -- Some frozen definition shared by non static type marks (ANCHORED_TYPE_MARK and TYPE_FORMAL_GENERIC).
   --

inherit
   TYPE_MARK

feature {ANY}
   frozen is_static: BOOLEAN is False

   frozen type: TYPE is
      do
         check
            False
         end
      end

   frozen is_reference: BOOLEAN is
      do
         check
            False
         end
      end

   frozen is_expanded: BOOLEAN is
      do
         check
            False
         end
      end

   frozen is_generic: BOOLEAN is
      do
         check
            False
         end
      end

   frozen generic_list: ARRAY[TYPE_MARK] is
      do
         check
            False
         end
      end

   frozen id: INTEGER is
      do
         check
            False
         end
      end

   frozen class_text_name: CLASS_NAME is
      do
         check
            False
         end
      end

   frozen is_user_expanded: BOOLEAN is
      do
         check
            False
         end
      end

   frozen is_empty_expanded: BOOLEAN is
      do
         check
            False
         end
      end

   frozen c_header_pass1 is
      do
         check
            False
         end
      end

   frozen c_header_pass2 is
      do
         check
            False
         end
      end

   frozen c_header_pass3 is
      do
         check
            False
         end
      end

   frozen c_header_pass4 is
      do
         check
            False
         end
      end

   frozen c_type_for_argument_in (str: STRING) is
      do
         check
            False
         end
      end

   frozen c_type_for_target_in (str: STRING) is
      do
         check
            False
         end
      end

   frozen c_type_for_result_in (str: STRING) is
      do
         sedb_breakpoint
         check
            False
         end
      end

   frozen need_c_struct: BOOLEAN is
      do
         check
            False
         end
      end

   frozen c_initialize_in (buffer: STRING) is
      do
         check
            False
         end
      end

   frozen jvm_method_flags: INTEGER is
      do
         check
            False
         end
      end

   frozen jvm_descriptor_in (str: STRING) is
      do
         check
            False
         end
      end

   frozen jvm_target_descriptor_in (str: STRING) is
      do
         check
            False
         end
      end

   frozen jvm_return_code is
      do
         check
            False
         end
      end

   frozen jvm_push_local (offset: INTEGER) is
      do
         check
            False
         end
      end

   frozen jvm_check_class_invariant is
      do
         check
            False
         end
      end

   frozen jvm_push_default: INTEGER is
      do
         check
            False
         end
      end

   frozen jvm_write_local_creation (offset: INTEGER) is
      do
         check
            False
         end
      end

   frozen jvm_write_local (offset: INTEGER) is
      do
         check
            False
         end
      end

   frozen jvm_xnewarray is
      do
         check
            False
         end
      end

   frozen jvm_xastore is
      do
         check
            False
         end
      end

   frozen jvm_xaload is
      do
         check
            False
         end
      end

   frozen jvm_if_x_eq: INTEGER is
      do
         check
            False
         end
      end

   frozen jvm_if_x_ne: INTEGER is
      do
         check
            False
         end
      end

   frozen jvm_standard_is_equal is
      do
         check
            False
         end
      end

feature {TYPE}
   frozen need_gc_mark_function (current_type: TYPE): BOOLEAN is
      do
         check
            would_violate_the_require: False
         end
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   frozen long_name: HASHED_STRING is
      do
         check
            False
         end
      end

feature {LIVE_TYPE, TYPE_MARK}
   frozen just_before_gc_mark_in (str: STRING) is
      do
         check
            False
         end
      end

   frozen gc_info_in (str: STRING) is
      do
         check
            False
         end
      end

   frozen gc_define1 is
      do
         check
            False
         end
      end

   frozen gc_define2 is
      do
         check
            False
         end
      end

end -- class NON_STATIC_TYPE_MARK
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
