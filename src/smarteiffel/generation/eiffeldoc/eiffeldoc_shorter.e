-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_SHORTER
   --
   -- Writes all the files concerning a given class
   --

insert
   EIFFELDOC_GLOBALS

create {EIFFELDOC_CORE}
   make

feature {EIFFELDOC_CORE}
   short_for (ct: CLASS_TEXT; inherit_children, insert_children: FAST_ARRAY[CLASS_TEXT])
      local
         fn: STRING
      do
         if remote_cluster(ct.cluster) = Void then
            -- It is a local class
            depends.clear_count
            echo.put_character('%T')
            echo.put_string(ct.name.to_string)
            echo.put_new_line
            -- Rmk, 2017-01-14: removed the need for a separate html 
            -- file per client
            
            fn := filename_of(ct)
            classdoc.generate(ct, fn, inherit_children, insert_children)
            depends.union(classdoc.depends)
         end
      end

   depends: HASHED_SET[CLASS_NAME]
      once
         create Result.make
      end

feature {}
   make (a_context: EIFFELDOC_CONTEXT)
      do
         options := a_context.options
         create find_clients.make
         create classdoc.make(a_context)
         create sourcedoc.make(options)
      end

   find_clients: EIFFELDOC_SHORTER_FIND_CLIENTS

   classdoc: EIFFELDOC_SHORTER_CLASSDOC

   sourcedoc: EIFFELDOC_SHORTER_SOURCEDOC

   options: EIFFELDOC_OPTIONS

feature {ANY}
   command_name: STRING ""

   command_line_help_summary: STRING ""

feature {}
   valid_argument_for_ace_mode: STRING ""

   parse_arguments
      do
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         -- Always False
      end

end -- class EIFFELDOC_SHORTER
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
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
