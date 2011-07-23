-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_PLUG_IN
   --
   -- For the external "plug_in" definition.
   --

inherit
   NATIVE
      redefine is_equal
      end
   HASHABLE

creation {ANY}
   make

feature {SMART_EIFFEL}
   customize_runtime is
      do
         plugin.include(start_position)
      end

feature {NATIVE_PLUG_IN}
   feature_name: STRING
   plugin: PLUGIN

feature {ANY}
   use_current (er: EXTERNAL_ROUTINE): BOOLEAN is
      do
         -- No. Only arguments are used.
      end

   hash_code: INTEGER

   is_equal (other: like Current): BOOLEAN is
      do
         check -- Must be collected.
            plugin /= Void
         end
         Result := plugin.is_equal(other.plugin) and then feature_name.same_as(other.feature_name)
      end

   do_needs_c_wrapper (type_of_current: TYPE; name: STRING): BOOLEAN is
      do
         -- *** VERIFIER ***
      end
   c_define_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
         -- This is obviously defined outside.
      end

   c_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
         c_mapping(rf8.arguments)
      end

   c_define_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
         -- This is obviously defined outside.
      end

   c_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
         c_mapping(rf7.arguments)
         cpp.pending_c_function_body.append(once ";%N")
      end

   jvm_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
         --jvm.drop_target
         --|*** jvm.runtime_invokestatic(location, module_name, feature_name, rf8)
         jvm.plugin_invokestatic(plugin.name, feature_name, rf8)
      end

   jvm_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
         --jvm.drop_target
         --|*** jvm.runtime_invokestatic(location, module_name, feature_name, rf7)
         jvm.plugin_invokestatic(plugin.name, feature_name, rf7)
      end

   jvm_define_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
         -- This is obviously defined outside.
      end

   jvm_define_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
         -- This is obviously defined outside.
      end

   jvm_add_method_for_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
      end

   jvm_add_method_for_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
      end

   accept (visitor: NATIVE_PLUG_IN_VISITOR) is
      do
         visitor.visit_native_plug_in(Current)
      end

feature {EXTERNAL_ROUTINE}
   collect (type: TYPE; external_routine: EXTERNAL_ROUTINE) is
      do
         if plugin = Void then
            parse_alias_string(external_routine.alias_string)
            feature_name := required_key(once "feature_name")
            check_unused_keys
            hash_code := plugin.hash_code.bit_xor(feature_name.hash_code)
         end
         do_collect
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE) is
      local
         type_name, default_value: STRING
      do
         check
            plugin = Void
         end
         parse_alias_string(alias_string)
         type_name := required_key(once "type_name")
         feature_name := type_name -- Needed by is_equal
         default_value := required_key(once "default_value")
         check_unused_keys
         target.set(type_name, default_value)
         smart_eiffel.register_plug_in(Current)
      end

   do_collect is
      do
         hash_code := plugin.hash_code.bit_xor(feature_name.hash_code)
         smart_eiffel.register_plug_in(Current)
      end

feature {}
   alias_data: DICTIONARY[STRING, STRING]

   parse_alias_string (alias_string: MANIFEST_STRING) is
      local
         location, module_name, key, value: STRING
      do
         if alias_string = Void then
            error_handler.add_position(external_tag.start_position)
            error_handler.append("An external %"plug_in%" must be described with an alias clause. %
            %(Have a look in our standard library or in our tutorial for examples.)")
            error_handler.print_as_fatal_error
         end
         -- Now parsing the collected plug_in:
         mini_buffer.start_with(alias_string)
         from
            create {HASHED_DICTIONARY[STRING, STRING]} alias_data.make
            key := mini_buffer.an_identifier
         until
            key = Void or else mini_buffer.is_off
         loop
            if not mini_buffer.a_keyword(once ":") then
               key := Void
               mini_buffer.show_position_with_fatal_error("%":%" expected")
            else
               value := mini_buffer.a_name
               if alias_data.has(key) then
                  mini_buffer.show_position_with_fatal_error("Double definition found for key " + key)
               elseif value = Void then
                  mini_buffer.show_position_with_fatal_error("Value expected")
               else
                  alias_data.add(value, key)
                  key := mini_buffer.an_identifier
               end
            end
         end

         if not mini_buffer.is_off then
            mini_buffer.show_position_with_fatal_error("Unexpected trailing character")
         end
         
         location := required_key(once "location")
         module_name := required_key(once "module_name")

         plugin := system_tools.plugin(location, module_name, start_position)
      ensure
         plugin /= Void
         feature_name /= Void
      end

   required_key (key: STRING): STRING is
      do
         Result := alias_data.reference_at(key)
         if Result = Void then
            error_handler.add_position(start_position)
            error_handler.append("Required key %""+key+":%" not found")
            error_handler.print_as_fatal_error
         end
         alias_data.remove(key)
      end

   check_unused_keys is
      local
         i: INTEGER
      do
         if not alias_data.is_empty then
            error_handler.add_position(start_position)
            error_handler.append("Unexpected keys found%N")
            from
               i := alias_data.upper
            until
               i < alias_data.lower
            loop
               error_handler.append(alias_data.key(i))
               error_handler.append(once " :")
               error_handler.append(alias_data.item(i))
               error_handler.extend('%N')
               i := i - 1
            end
            error_handler.print_as_fatal_error
         end
      end

   c_mapping (arguments: FORMAL_ARG_LIST) is
      local
         cbd: BOOLEAN
      do
         cbd := cpp.target_cannot_be_dropped
         if cbd then
            cpp.pending_c_function_body.extend(',')
         end
         cpp.pending_c_function_body.append(feature_name)
         if arguments /= Void then
            cpp.pending_c_function_body.extend('(')
            cpp.put_arguments(arguments.count)
            cpp.pending_c_function_body.extend(')')
         end
         if cbd then
            cpp.pending_c_function_body.extend(')')
         end
      end

end -- class NATIVE_PLUG_IN
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
