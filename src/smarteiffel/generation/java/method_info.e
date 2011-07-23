-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class METHOD_INFO
   --
   -- Unique Global Object in charge of a method_info as
   -- describe in the JVM specification.
   -- Obviously, the same object is recycled.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {NATIVE_JAVA}
   is_synchronized: BOOLEAN

   set_synchronized is
      do
         is_synchronized := True
      end

feature {JVM}
   clear is
      do
         count := 0
         storage.clear_count
         is_synchronized := False
      end

   write_bytes is
      do
         echo.print_count("method", count)
         jvm.b_put_u2(count)
         jvm.b_put_byte_string(storage)
      end

feature {RUN_FEATURE, JVM, AGENT_ARGS, AGENT_POOL}
   start (flags: INTEGER; name_key, descriptor: STRING) is
      require
         not name_key.is_empty
         not descriptor.is_empty
      do
         code_attribute.clear
         count := count + 1
         access_flags := flags
         name_index := constant_pool.idx_utf8(name_key)
         descriptor_index := constant_pool.idx_utf8(descriptor)
      ensure
         access_flags = flags
      end

   finish is
      do
         -- access_flag :
         if is_synchronized then
            access_flags := access_flags + 32
            is_synchronized := False
         end
         append_u2(storage, access_flags)
         append_u2(storage, name_index)
         append_u2(storage, descriptor_index)
         -- attributes_count :
         append_u2(storage, 1)
         code_attribute.store_in(storage)
      end

   add_init (super: STRING) is
      local
         ca: like code_attribute; idx: INTEGER
      do
         start(1, once "<init>", once "()V")
         ca := code_attribute
         ca.opcode_aload_0
         idx := constant_pool.idx_methodref3(super, once "<init>", once "()V")
         ca.opcode_invokespecial(idx, -1)
         ca.opcode_return
         finish
      end

   is_static: BOOLEAN is
      local
         i: INTEGER
      do
         i := access_flags // 8
         Result := i.is_odd
      end

feature {}
   count: INTEGER
         -- Number of methods.

   storage: STRING is
         -- To store the final JVM `method_info'.
      once
         create Result.make(4096)
      end

   access_flags: INTEGER

   name_index: INTEGER
         -- Memorize the name_index in the `constant_pool'.

   descriptor_index: INTEGER
         -- Memorize the descriptor_index in the `constant_pool'.

end -- class METHOD_INFO
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
