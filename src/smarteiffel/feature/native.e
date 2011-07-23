-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class NATIVE
   --
   -- An external feature definition (external "plug_in", external "built_in",
   -- external "C ...", external "C++ ...", ...
   --

inherit
   VISITABLE

insert
   GLOBALS

feature {ANY}
   external_tag: MANIFEST_STRING
         -- The external language call description.

   start_position: POSITION is
         -- Of the `external_tag'.
      do
         Result := external_tag.start_position
      end

   frozen pretty (indent_level: INTEGER; is_inline_agent: BOOLEAN) is
      do
         check
            indent_level = 1
            not is_inline_agent
         end
         external_tag.pretty(3)
      end

   use_current (er: EXTERNAL_ROUTINE): BOOLEAN is
         -- Is `Current' used by such a call?
      require
         er /= Void
      deferred
      end

   do_needs_c_wrapper (type_of_current: TYPE; name: STRING): BOOLEAN is
         -- Do we need some extra C wrapping function to perform this native action?
      deferred
      end
   
   c_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
         -- Produce C code to perform the corresponding `rf7' action.
      require
         rf7.base_feature.first_name.to_string = name
         rf7.base_feature.class_text.name.to_string = bcn
      deferred
      end

   c_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
         -- Produce C code to perform the corresponding `rf8' action.
      require
         rf8.base_feature.first_name.to_string = name
         rf8.base_feature.class_text.name.to_string = bcn
      deferred
      end

   jvm_add_method_for_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      require
         rf8.base_feature.first_name.to_string = name
         rf8.base_feature.class_text.name.to_string = bcn
      deferred
      end

   jvm_define_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
         -- Produce Java byte code to define `rf8'.
      require
         rf8.base_feature.first_name.to_string = name
         rf8.base_feature.class_text.name.to_string = bcn
      deferred
      end

   jvm_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
         -- Produce Java byte code to use `rf8'.
      require
         rf8.base_feature.first_name.to_string = name
         rf8.base_feature.class_text.name.to_string = bcn
      deferred
      end

   jvm_add_method_for_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      require
         rf7.base_feature.first_name.to_string = name
         rf7.base_feature.class_text.name.to_string = bcn
      deferred
      end

   jvm_define_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
         -- Produce Java byte code to define `rf7'.
      require
         rf7.base_feature.first_name.to_string = name
         rf7.base_feature.class_text.name.to_string = bcn
      deferred
      end

   jvm_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
         -- Produce Java byte code to use `rf7'.
      require
         rf7.base_feature.first_name.to_string = name
         rf7.base_feature.class_text.name.to_string = bcn
      deferred
      end

feature {EXTERNAL_FUNCTION}
   side_effect_free (target_type: TYPE; feature_text: FEATURE_TEXT): BOOLEAN is
      do
         -- The default is False.
      end
   
feature {EXTERNAL_ROUTINE}
   collect (type: TYPE; external_routine: EXTERNAL_ROUTINE) is
         -- Note1 : as an example the `collect' call is used to collect actually used NATIVE_PLUG_IN.
         -- Note 2: also used to notify to the `assignment_handler' of possible weird assignments which may be 
         -- done outside of the Eiffel code.
      require
         type /= Void
         external_routine /= Void
      deferred
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE) is
      deferred
      end

feature {}
   frozen notify_external_assignments (type: TYPE; external_routine: EXTERNAL_ROUTINE) is
         -- Must be call during `collect' by native which are not trusted.
      do
         assignment_handler.from_external(type, external_routine.arguments, external_routine.result_type)
      end

   fe_c2jvm (rf: RUN_FEATURE) is
      do
         error_handler.add_position(jvm.target_position)
         error_handler.add_position(rf.start_position)
         error_handler.append("Command 'compile_to_jvm' cannot compile this code.")
         error_handler.print_as_fatal_error
      end

   fe_c2c (rf: RUN_FEATURE) is
      do
         error_handler.add_position(rf.start_position)
         error_handler.append("Command 'compile_to_c' cannot compile this code.")
         error_handler.print_as_fatal_error
      end

   make (et: like external_tag) is
      require
         et /= Void
      do
         external_tag := et
      ensure
         external_tag = et
      end

   extra_c_prototype_in_cpp_out_h_buffer (position: POSITION; context_type: TYPE; er: EXTERNAL_ROUTINE) is
      local
         arguments: FORMAL_ARG_LIST; i: INTEGER
      do
         cpp.out_h_buffer.copy(once "/* Extra external prototype for line ")
         position.line.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.append(once " of ")
         cpp.out_h_buffer.append(position.path)
         cpp.out_h_buffer.append(once ":*/%N")
         if er.result_type = Void then
            cpp.out_h_buffer.append(once "void")
         else
            er.result_type.to_static(context_type).c_type_for_external_in(cpp.out_h_buffer)
         end
         cpp.out_h_buffer.extend(' ')
         cpp.out_h_buffer.append(er.external_name)
         cpp.out_h_buffer.extend('(')
         arguments := er.arguments
         if arguments = Void then
            cpp.out_h_buffer.append(once "void")
         else
            from
               i := 1
            until
               i > arguments.count
            loop
               arguments.type_mark(i).to_static(context_type).c_type_for_external_in(cpp.out_h_buffer)
               cpp.out_h_buffer.append(once " a")
               i.append_in(cpp.out_h_buffer)
               if i < arguments.count then
                  cpp.out_h_buffer.extend(',')
               end
               i := i + 1
            end
         end
         cpp.out_h_buffer.extend(')')
      end

   extra_c_prototype (position: POSITION; context_type: TYPE; er: EXTERNAL_ROUTINE) is
      do
         extra_c_prototype_in_cpp_out_h_buffer(position, context_type, er)
         cpp.out_h_buffer.append(once ";%N")
         cpp.out_c_buffer.copy(cpp.out_h_buffer)
         cpp.write_out_h_buffer
         cpp.write_out_c_buffer
      end
   
invariant
   external_tag /= Void implies not external_tag.once_flag

end -- class NATIVE
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
