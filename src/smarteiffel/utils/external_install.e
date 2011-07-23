-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EXTERNAL_INSTALL
   --
   -- A simple framework to install external tools. Useful for projects such as ESE and USE.
   --

inherit
   INSTALL
      redefine
         make
      end

feature {}
   make is
      local
         i: INTEGER; s: SYSTEM; c, d, v: STRING; bd: BASIC_DIRECTORY; ft: FILE_TOOLS
      do
         init
         std_output.put_string(once "Installing ")
         std_output.put_string(package_name)
         std_output.put_new_line
         -- check if the configuration file is a directory; if not, make it so. Try to be smart too :-)
         -- CAVEAT: currently works only on UNIX
         c := s.get_environment_variable(fz_smarteiffel)
         if c = Void then
            c := once ""
            c.copy(s.get_environment_variable(once "HOME"))
            c.append(once "/.serc")
         end
         if c = Void then
            std_error.put_line("Could not compute the configuartion directory.")
            die_with_code(1)
         elseif not ft.file_exists(c) then
            c.copy(once "/etc/serc")
            if not ft.file_exists(c) then
               std_error.put_line("The configuration directory does not exist. Please install SmartEiffel first.")
               die_with_code(1)
            end
         end
         bd.connect_with(c)
         if bd.is_connected then
            if c.is_equal(bd.last_entry) then
               -- hooray, it is already a directory
               v := once ""
               bd.disconnect
            else
               bd.disconnect
               d := once ""
               d.copy(c)
               from
               until
                  not ft.file_exists(d)
               loop
                  d.extend('~')
               end
               ft.rename_to(c, d)
               if not bd.create_new_directory(c) then
                  std_error.put_line(once "Could not create configuration directory.")
                  die_with_code(1)
               end
               v := once ""
               v.copy(c)
               v.append(once "/vanilla.se")
               ft.rename_to(d, v)
            end
            v.copy(c)
            v.extend('/')
            v.append(package_name.as_lower)
            v.append(once ".se")
            tfw.connect_to(v)

            if not environment.is_empty then
               tfw.put_string(once "[Environment]%N")
               from
                  i := environment.lower
               until
                  i > environment.upper
               loop
                  tfw.put_string(environment.key(i))
                  tfw.put_string(once ": ")
                  tfw.put_string(environment.item(i))
                  tfw.put_new_line
                  i := i + 1
               end
            end

            if not loadpath.is_empty then
               tfw.put_string(once "%N[Loadpath]%N")
               from
                  i := loadpath.lower
               until
                  i > loadpath.upper
               loop
                  tfw.put_string(loadpath.key(i))
                  tfw.put_string(once ": ")
                  tfw.put_string(loadpath.item(i))
                  tfw.put_new_line
                  i := i + 1
               end
            end

            if not tools.is_empty then
               tfw.put_string(once "%N[Tools]%N")
               from
                  i := tools.lower
               until
                  i > tools.upper
               loop
                  tfw.put_string(tools.key(i))
                  tfw.put_string(once ": ")
                  tfw.put_string(tools.item(i))
                  tfw.put_new_line
                  i := i + 1
               end
            end

            tfw.disconnect

            compile_tools
         end
      end

   compile_tools is
      local
         i: INTEGER
      do
         if tools /= Void then
            from
               i := tools.lower
            until
               i > tools.upper
            loop
               compile(tools.item(i))
               i := i + 1
            end
         end
      end

   compile (a_tool: STRING) is
      local
         s: SYSTEM; cmd: STRING
      do
         cmd := once ""
         cmd.copy(once "se c -boost -clean -o ")
         cmd.append(bin_directory)
         cmd.append(a_tool)
         cmd.extend(' ')
         cmd.append(a_tool)
         std_output.put_string(cmd)
         std_output.put_new_line
         s.execute_command_line(cmd)
      end

   tools: DICTIONARY[STRING, STRING] is
         -- The se names of the tools to compile, associated to the name of their main class.
         -- The se name is the key, the main class is the item.
         -- Note that the executable will be named as the main class.
      deferred
      end

   environment: DICTIONARY[STRING, STRING] is
         -- The extra environment variables to define
      deferred
      end

   loadpath: DICTIONARY[STRING, STRING] is
         -- The extra loadpath variables to define
      deferred
      end

   package_name: STRING is
         -- The name of the tools bundle (e.g. ESE, USE...) used to define the name of the configuration file
      deferred
      end

end -- EXTERNAL_INSTALL
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
