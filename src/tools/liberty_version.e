-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of the file.
--
deferred class LIBERTY_VERSION

insert
   ARGUMENTS

feature {ANY}
   liberty_release: STRING "2016.dev (preparing Glenn Curtiss)"

   copyright: ABSTRACT_STRING
      once
         Result := "[

                    Liberty Eiffel The GNU Eiffel Compiler, Eiffel tools and libraries
                        release #(1)

                    Copyright (C), #(2) - #(3)
                        http://www.liberty-eiffel.org

                    ]" # liberty_release # liberty_dates # liberty_authors
      end

   short_copyright: ABSTRACT_STRING
      once
         Result := "(C) #(1) - #(2)" # liberty_dates # liberty_authors
      end

   print_version
      local
         sys: SYSTEM; bd: BASIC_DIRECTORY
      do
         -- SmartEiffel tools compatibility -- mostly used by the "se" command multiplexer
         if sys.get_environment_variable("SMART_EIFFEL_SHORT_VERSION") /= Void then
            std_output.put_line(short_copyright)
         else
            bd.ensure_system_notation
            bd.compute_short_name_of(command_name)
            std_output.put_line("Version of command %"#(1)%" is:" # bd.last_entry)
            std_output.put_line(copyright)
         end
      end

   liberty_dates: ABSTRACT_STRING
      deferred
      end

   liberty_authors: ABSTRACT_STRING
      deferred
      end

end -- class LIBERTY_VERSION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as publhed by the Free Software Foundation; either version 2, or (at your option) any later version.
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
