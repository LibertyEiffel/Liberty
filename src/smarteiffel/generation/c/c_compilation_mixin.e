-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_COMPILATION_MIXIN

insert
   GLOBALS

feature {ANY}
   is_compiled (live_type: LIVE_TYPE): BOOLEAN is
      require
         live_type /= Void
      do
         Result := compiled.fast_has(live_type)
      end

feature {}
   compile_live_type (live_type: LIVE_TYPE) is
      require
         live_type /= Void
      do
         if live_type.at_run_time and then not is_compiled(live_type) then
            set_compiled(live_type)
            do_compile(live_type)
         end
      end

   do_compile (live_type: LIVE_TYPE) is
      require
         live_type /= Void
         live_type.at_run_time
      deferred
      end

feature {} -- cpp access helpers for a bit of prettiness
   out_h: STRING is
      do
         Result := cpp.out_h_buffer
      end

   flush_out_h is
      do
         cpp.write_out_h_buffer
         cpp.out_h_buffer.clear_count
      end

   out_c: STRING is
      do
         Result := cpp.out_c_buffer
      end

   function_signature: STRING is
      do
         Result := cpp.pending_c_function_signature
      end

   function_body: STRING is
      do
         Result := cpp.pending_c_function_body
      end

feature {}
   set_compiled (live_type: LIVE_TYPE) is
      require
         live_type /= Void
         not is_compiled(live_type)
      do
         compiled.fast_add(live_type)
      ensure
         is_compiled(live_type)
      end

   compiled: HASHED_SET[LIVE_TYPE]

   make is
      do
         create compiled.make
      end

end -- class C_COMPILATION_MIXIN
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
