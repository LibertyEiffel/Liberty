-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class SERC_FACTORY

insert
   GLOBALS
   DIRECTORY_NOTATION_HANDLER

feature {ANY}
   config: SE_CONFIG is
      local
         basic_directory: BASIC_DIRECTORY; chain: SERC_CHAIN; s: STRING; def: SERC_DEFAULTS
         file_tools: FILE_TOOLS
      once
         create chain.make
         create def.make
         basic_directory.ensure_system_notation

         if basic_directory.unix_notation or else basic_directory.cygwin_notation then
            if file_tools.is_readable(once "/sys/rc") then
               system_tools.set_system_name(system_tools.elate_system)
               def.set_os(system_tools.elate_system)
               add_to_chain(chain, once "/lang/eiffel/.serc")
            else
               def.set_os(system_tools.unix_system)
               if file_tools.is_readable(once "/etc/issue") then
                  def.set_flavor(once "Linux")
               end
            end
            add_to_chain(chain, once "/etc/serc")
            s := home_env
            if s /= Void then
               s.append(once "/.serc")
               add_to_chain(chain, s)
            end
         elseif basic_directory.windows_notation then
            s := userprofile_env
            if s /= Void then
               s.append(once "\SE.CFG")
               add_to_chain(chain, s)
            end
            add_to_chain(chain, once "C:\SE.CFG")
            def.set_os(system_tools.windows_system)
         elseif basic_directory.macintosh_notation then
            def.set_os(system_tools.macintosh_system)
         elseif basic_directory.amiga_notation then
            def.set_os(system_tools.amiga_system)
         elseif basic_directory.openvms_notation then
            def.set_os(system_tools.open_vms_system)
         end

         s := seconf_env
         if s /= Void then
            add_to_chain(chain, s)
         end

         chain.add(def)
         Result := chain
      end

feature {SYSTEM_TOOLS, INSTALL_GLOBALS}
   seconf_env: STRING is
         -- The value of the SmartEiffel environment variable, if defined.
      once
         Result := env(fz_seconf)
      end

   home_env: STRING is
         -- Unix variable: the home directory of the user
      once
         Result := env("HOME")
      end

   user_env: STRING is
         -- Unix variable: the user name
      once
         Result := env("USER")
      end

   userprofile_env: STRING is
         -- This variable is always set on Windows NT, 2000 and XP
      once
         Result := env("USERPROFILE")
      end

feature {}
   env (var: STRING): STRING is
      local
         s: SYSTEM
      do
         Result := s.get_environment_variable(var)
      end

feature {}
   add_to_chain (chain: SERC_CHAIN; rc: STRING) is
      local
         basic_directory: BASIC_DIRECTORY; serc: SERC; subchain: SERC_CHAIN; entries: FAST_ARRAY[STRING]
         sorter: COLLECTION_SORTER[STRING]; i: INTEGER; s: STRING
      do
         basic_directory.connect_to(rc)
         if basic_directory.is_connected then
            -- scan the directory and create all the entries with a ".se" suffix, alphabetically sorted
            from
               create entries.make(0)
               basic_directory.read_entry
            until
               basic_directory.end_of_input
            loop
               s := once ""
               s.copy(basic_directory.last_entry)
               s.to_lower
               if s.has_suffix(once ".se") and then s.first /= '.' then
                  s := rc.twin
                  s.extend('/')
                  s.append(basic_directory.last_entry)
                  sorter.add(entries, s)
               end
               basic_directory.read_entry
            end
            basic_directory.disconnect
            from
               create subchain.make
               i := entries.lower
            until
               i > entries.upper
            loop
               add_to_chain(subchain, entries.item(i))
               i := i + 1
            end
            if not subchain.is_empty then
               chain.add(subchain)
            end
         else
            s := once ""
            s.copy(rc)
            parser_buffer.load_file(s)
            if parser_buffer.is_ready then
               create serc.make
               chain.add(serc)
            end
         end
      end

end -- class SERC_FACTORY
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
