-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CECIL_FILE
   --
   -- Handle the content of one -cecil file.
   --

inherit
   VISITABLE

insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   path: STRING
         -- The `path' given after the -cecil flag.

   path_h: STRING
         -- The name of the include file to be generated (ie. the first information inside file `path)'.

   accept (visitor: CECIL_FILE_VISITOR)
      do
         visitor.visit_cecil_file(Current)
      end

feature {ANY}
   has_entries: BOOLEAN
      do
         Result := entries /= Void
      end

   for_each (action: PROCEDURE[TUPLE[CECIL_ENTRY]])
      require
         has_entries
         action /= Void
      do
         entries.for_each(action)
      end

feature {CECIL_POOL}
   parse
         -- Parse the corresponding `path' file.
      require
         may_report_an_error: error_handler.is_empty
      local
         c_name: STRING; type_mark: TYPE_MARK; fn: FEATURE_NAME; i: INTEGER; cecil_entry: CECIL_ENTRY
      do
         echo.put_string(once "Parsing Cecil file: ")
         echo.put_string(path)
         echo.put_new_line
         create entries.with_capacity(4)
         path_h := eiffel_parser.connect_to_cecil(path)
         from
         until
            eiffel_parser.end_of_input
         loop
            c_name := eiffel_parser.parse_c_name
            type_mark := eiffel_parser.parse_type_mark
            if not type_mark.is_static then
               error_handler.append(once "All type marks used in a cecil file have to be static (no anchors).")
               error_handler.add_position(type_mark.start_position)
               error_handler.print_as_fatal_error
            end
            if type_mark.is_agent or else type_mark.is_tuple then
               error_handler.append(once "Cannot use agents type marks or TUPLE type marks inside cecil %
                                    %files (Liberty Eiffel limitation, sorry). To work around, just use %
                %an extra Eiffel routine/object to perform agent or TUPLE %
                %manipulation in pure Eiffel.")
               error_handler.add_position(type_mark.start_position)
               error_handler.print_as_fatal_error
            end
            fn := eiffel_parser.parse_feature_name
            create cecil_entry.make(c_name, type_mark, fn, eiffel_parser.parse_cecil_is_creation)
            entries.add_last(cecil_entry)
         end
         eiffel_parser.disconnect
         --
         echo.put_string(once "Loading cecil entries:%N")
         from
            i := entries.lower
         until
            i > entries.upper
         loop
            cecil_entry := entries.item(i)
            cecil_entry.get_started(Current)
            i := i + 1
         end
      ensure
         may_report_an_error: error_handler.is_empty
      end

   collect (type: TYPE)
      local
         i: INTEGER; dummy: TYPE
      do
         if entries /= Void then
            from
               i := entries.lower
            until
               i > entries.upper
            loop
               dummy := entries.item(i).collect(type)
               i := i + 1
            end
         end
      end

   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         i: INTEGER
      do
         if entries /= Void then
            from
               i := entries.lower
            until
               i > entries.upper
            loop
               entries.item(i).inline_dynamic_dispatch(code_accumulator, type)
               i := i + 1
            end
         end
      end

   adapt_for (type: TYPE)
      local
         i: INTEGER; entry: CECIL_ENTRY
      do
         if entries /= Void then
            from
               i := entries.lower
            until
               i > entries.upper
            loop
               entry := entries.item(i).adapt_for(type)
               check
                  entry = entries.item(i)
               end
               i := i + 1
            end
         end
      end

feature {}
   entries: FAST_ARRAY[CECIL_ENTRY]
         -- List of `entries' parsed from the `path' file.

   make (p: like path)
      require
         p /= Void
         not string_aliaser.registered_one(p)
      do
         path := p
      ensure
         path = p
      end

end -- class CECIL_FILE
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
