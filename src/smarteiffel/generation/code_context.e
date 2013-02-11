-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CODE_CONTEXT

insert
   GLOBALS
   CODE_CONTEXT_CONSTANTS

feature {}
   type_memory: TYPE -- The context TYPE (where the code is written).

   anonymous_feature_memory: ANONYMOUS_FEATURE -- The one to be called if any.
   
   target_memory: EXPRESSION -- To perform the `anonymous_feature_memory' call.

   effective_arguments_memory: EFFECTIVE_ARG_LIST -- To perform the `anonymous_feature_memory' call.

   static_type_memory: TYPE -- Extra type used for example to `C_check_id'.

   internal_c_local_memory: INTERNAL_C_LOCAL -- Temporary used for example to store newly created uninitialized objects.
   
feature {CODE_PRINTER}
   valid: BOOLEAN

   code: INTEGER is
      deferred
      end

   reserve is
      require
         not_valid: validate
      do
         anonymous_feature_memory := Void
         type_memory := Void
         target_memory := Void
         effective_arguments_memory := Void
         static_type_memory := Void
         internal_c_local_memory := Void
      ensure
         valid
      end

   free is
      require
         valid: invalidate
      do
      ensure
         not valid
      end

   type: like type_memory is
      require
         valid
      do
         Result := type_memory
      end

   anonymous_feature: like anonymous_feature_memory is
      require
         valid
      do
         Result := anonymous_feature_memory
      end

   target: like target_memory is
      require
         valid and then valid_target
      do
         Result := target_memory
      end

   effective_arguments: like effective_arguments_memory is
      require
         valid and then valid_effective_arguments
      do
         Result := effective_arguments_memory
      end

   static_type: like static_type_memory is
      require
         valid and then valid_static_type
      do
         Result := static_type_memory
      end

   internal_c_local: like internal_c_local_memory is
      require
         valid and then valid_internal_c_local
      do
         Result := internal_c_local_memory
      end

feature {CODE_PRINTER} -- The good old "assertion-sets-its-own-flag" trick
   frozen validate: BOOLEAN is
      do
         Result := not valid
         valid := True
      end

   frozen invalidate: BOOLEAN is
      do
         Result := valid
         valid := False
      end

feature {CODE_PRINTER} -- Modification:
   set_type (a_type: like type) is
      require
         valid
         type = Void
      do
         type_memory := a_type
      ensure
         type = a_type
      end

   set_anonymous_feature (a_anonymous_feature: like anonymous_feature) is
      require
         valid and then valid_anonymous_feature
         anonymous_feature = Void
      do
         anonymous_feature_memory := a_anonymous_feature
      ensure
         anonymous_feature = a_anonymous_feature
      end

   set_target (a_target: like target) is
      require
         valid and then valid_target
         target = Void
      do
         target_memory := a_target
      ensure
         target = a_target
      end

   set_effective_arguments (a_effective_arguments: like effective_arguments) is
      require
         valid and then valid_effective_arguments
         effective_arguments = Void
      do
         effective_arguments_memory := a_effective_arguments
      ensure
         effective_arguments = a_effective_arguments
      end

   set_static_type (a_static_type: like static_type) is
      require
         valid and then valid_static_type
         static_type = Void
      do
         static_type_memory := a_static_type
      ensure
         static_type = a_static_type
      end

   set_internal_c_local (a_internal_c_local: like internal_c_local) is
      require
         valid and then valid_internal_c_local
         internal_c_local = Void
      do
         internal_c_local_memory := a_internal_c_local
      ensure
         internal_c_local = a_internal_c_local
      end

feature {CODE_PRINTER} -- Validation:
   valid_anonymous_feature: BOOLEAN is
      deferred
      end

   valid_target: BOOLEAN is
      deferred
      end

   valid_effective_arguments: BOOLEAN is
      deferred
      end

   valid_static_type: BOOLEAN is
      deferred
      end

   valid_internal_c_local: BOOLEAN is
      deferred
      end

invariant
   not valid_anonymous_feature implies anonymous_feature_memory = Void

   not valid_target implies target_memory = Void

   not valid_effective_arguments implies effective_arguments_memory = Void

   not valid_static_type implies static_type_memory = Void

   not valid_internal_c_local implies internal_c_local_memory = Void

end -- class CODE_CONTEXT
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
