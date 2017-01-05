-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SERC
   --
   -- Contains all the informations in a single configuration file
   --

inherit
   SE_CONFIG

create {SERC_FACTORY}
   make

feature {ANY}
   bin: STRING

   sys: STRING

   short: STRING

   os: STRING

   flavor: STRING

   jobs: INTEGER

   environment (var: STRING): STRING
      do
         Result := my_environment.reference_at(var)
      end

   loadpaths_in (loadpaths: DICTIONARY[STRING, STRING])
      do
         add_all(loadpaths, my_loadpaths, once "Loadpath")
      end

   tools_in (tools: DICTIONARY[STRING, STRING])
      do
         add_all(tools, my_tools, once "Tools")
      end

   environment_in (env: DICTIONARY[STRING, STRING])
      do
         add_all(env, my_environment, once "Environment")
      end

   c_mode (a_c_mode: STRING): SE_C_MODE
      do
         Result := my_c_modes.reference_at(a_c_mode)
      end

   c_modes_in (c_modes: DICTIONARY[SE_C_MODE, STRING])
      local
         i: INTEGER; k: STRING
      do
         from
            i := my_c_modes.lower
         until
            i > my_c_modes.upper
         loop
            k := my_c_modes.key(i)
            if not c_modes.has(k) then
               c_modes.add(my_c_modes.item(i), k)
            else
               echo.w_put_string(once "Redundant definitions found for C mode %"")
               echo.w_put_string(k)
               echo.w_put_string(once "%", discarding it from ")
               echo.w_put_string(my_path)
               echo.w_put_string(once ".%N")
            end
            i := i + 1
         end
      end

feature {}
   add_all (target, source: DICTIONARY[STRING, STRING]; section_name: STRING)
      local
         i: INTEGER; k, v: STRING
      do
         from
            i := source.lower
         until
            i > source.upper
         loop
            k := source.key(i)
            v := target.reference_at(k)
            if v = Void then
               target.add(source.item(i), k)
            elseif not source.item(i).is_equal(v) then
               echo.w_put_string(once "Redundant key definition found in section [")
               echo.w_put_string(section_name)
               echo.w_put_string(once "] in ")
               echo.w_put_string(my_path)
               echo.w_put_string(once "].%NOriginal definition ")
               echo.w_put_string(k)
               echo.w_put_character(':')
               echo.w_put_string(target.at(k))
               echo.w_put_string(once " (kept)%NRedundant definition ")
               echo.w_put_string(k)
               echo.w_put_character(':')
               echo.w_put_string(source.at(k))
               echo.w_put_string(" (discarded)%N")
            end
            i := i + 1
         end
      end

feature {}
   make
      local
         i: ITERATOR[STRING]; cmode: SE_C_MODE; m, cc, ccp, clp, csp, cco, clo, pc, pcp, plp, psp, pco, plo, so, tmp: STRING
      do
         my_path := parser_buffer.path.twin
         ini_parser.a_inifile
         create my_environment.make
         create my_loadpaths.make
         create my_tools.make
         create my_c_modes.make
         if ini_parser.section_has(fz_conf_general, fz_conf_bin) then
            bin := ini_parser.section_item(fz_conf_general, fz_conf_bin)
         end
         if ini_parser.section_has(fz_conf_general, fz_conf_sys) then
            sys := ini_parser.section_item(fz_conf_general, fz_conf_sys)
         end
         if ini_parser.section_has(fz_conf_general, fz_conf_short) then
            short := ini_parser.section_item(fz_conf_general, fz_conf_short)
         end
         if ini_parser.section_has(fz_conf_general, fz_conf_os) then
            os := ini_parser.section_item(fz_conf_general, fz_conf_os)
         end
         if ini_parser.section_has(fz_conf_general, fz_conf_flavor) then
            flavor := ini_parser.section_item(fz_conf_general, fz_conf_flavor)
         end
         if ini_parser.section_has(fz_conf_general, fz_conf_jobs) then
            tmp := ini_parser.section_item(fz_conf_general, fz_conf_jobs)
            if not tmp.is_integer then
               echo.w_put_string(once "The '")
               echo.w_put_string(fz_conf_jobs)
               echo.w_put_string(once "' key in the ini file must be an integer.%N")
               die_with_code(1)
            end
            jobs := tmp.to_integer
         end
         i := ini_parser.section_key_iterator(fz_conf_environment)
         if i /= Void then
            from
            until
               i.is_off
            loop
               my_environment.put(ini_parser.section_item(fz_conf_environment, i.item), i.item)
               i.next
            end
         end
         i := ini_parser.section_key_iterator(fz_conf_loadpath)
         if i /= Void then
            from
            until
               i.is_off
            loop
               my_loadpaths.put(ini_parser.section_item(fz_conf_loadpath, i.item), i.item)
               i.next
            end
         end
         i := ini_parser.section_key_iterator(fz_conf_se_tools)
         if i /= Void then
            from
            until
               i.is_off
            loop
               my_tools.put(ini_parser.section_item(fz_conf_se_tools, i.item), i.item)
               i.next
            end
         end
         i := ini_parser.sections_iterator
         if i /= Void then
            from
            until
               i.is_off
            loop
               cc := Void
               ccp := Void
               clp := Void
               csp := Void
               cco := Void
               clo := Void
               pc := Void
               pcp := Void
               plp := Void
               psp := Void
               pco := Void
               plo := Void
               so := Void
               m := i.item
               if ini_parser.section_has(m, fz_conf_compiler_type) then
                  cc := ini_parser.section_item(m, fz_conf_compiler_type)
                  if ini_parser.section_has(m, fz_conf_compiler_path) then
                     ccp := ini_parser.section_item(m, fz_conf_compiler_path)
                  end
                  if ini_parser.section_has(m, fz_conf_linker_path) then
                     clp := ini_parser.section_item(m, fz_conf_linker_path)
                  end
                  if ini_parser.section_has(m, fz_conf_strip_path) then
                     csp := ini_parser.section_item(m, fz_conf_strip_path)
                  end
                  if ini_parser.section_has(m, fz_conf_compiler_options) then
                     cco := ini_parser.section_item(m, fz_conf_compiler_options)
                  end
                  if ini_parser.section_has(m, fz_conf_linker_options) then
                     clo := ini_parser.section_item(m, fz_conf_linker_options)
                  end
                  if ini_parser.section_has(m, fz_conf_cpp_compiler_type) then
                     pc := ini_parser.section_item(m, fz_conf_cpp_compiler_type)
                     if ini_parser.section_has(m, fz_conf_cpp_compiler_path) then
                        pcp := ini_parser.section_item(m, fz_conf_cpp_compiler_path)
                     end
                     if ini_parser.section_has(m, fz_conf_cpp_linker_path) then
                        plp := ini_parser.section_item(m, fz_conf_cpp_linker_path)
                     end
                     if ini_parser.section_has(m, fz_conf_cpp_strip_path) then
                        psp := ini_parser.section_item(m, fz_conf_cpp_strip_path)
                     end
                     if ini_parser.section_has(m, fz_conf_cpp_compiler_options) then
                        pco := ini_parser.section_item(m, fz_conf_cpp_compiler_options)
                     end
                     if ini_parser.section_has(m, fz_conf_cpp_linker_options) then
                        plo := ini_parser.section_item(m, fz_conf_cpp_linker_options)
                     end
                  end
                  if ini_parser.section_has(m, fz_conf_smarteiffel_options) then
                     so := ini_parser.section_item(m, fz_conf_smarteiffel_options)
                  end
                  create cmode.make(cc, ccp, clp, csp, cco, clo, pc, pcp, plp, psp, pco, plo, so)
                  my_c_modes.put(cmode, m)
               end
               i.next
            end
         end
      end

   my_environment: HASHED_DICTIONARY[STRING, STRING]

   my_loadpaths: HASHED_DICTIONARY[STRING, STRING]

   my_tools: HASHED_DICTIONARY[STRING, STRING]

   my_c_modes: HASHED_DICTIONARY[SE_C_MODE, STRING]

   my_path: STRING

end -- class SERC
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
