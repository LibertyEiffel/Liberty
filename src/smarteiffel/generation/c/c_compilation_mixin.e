-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_COMPILATION_MIXIN

insert
   GLOBALS

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
   native_array_type_in (na: NATIVE_ARRAY_TYPE_MARK; str: STRING) is
      local
         et: TYPE_MARK
      do
         et := na.generic_list.first
         if et.is_reference then
            str.append(once "T0**")
         else
            str.extend('T')
            et.type.live_type.id.append_in(str)
            str.extend('*')
         end
      end

   rank_name_in (rank: INTEGER; tag, buffer: STRING) is
      do
         buffer.append(tag)
         if rank = -1 then
            buffer.extend('C')
         else
            buffer.extend('a')
            rank.append_in(buffer)
         end
      end

   closed_operand_name_in (co: CLOSED_OPERAND; buffer: STRING) is
      do
         rank_name_in(co.rank, once "closed_", buffer)
      end

   open_operand_name_in (oo: OPEN_OPERAND; buffer: STRING) is
      do
         rank_name_in(oo.rank, once "open_", buffer)
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
