-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AGENT_ARGS
   --
   --|*** A better name: AGENT_LAUNCHER_SIGNATURE ? ***
   --| Is it useful ?
   --|*** (Dom. june 22th 2004) ***
   --

inherit
   VISITABLE
      redefine is_equal
      end
   HASHABLE

insert
   GLOBALS
      redefine is_equal
      end

creation {AGENT_POOL}
   make

feature {ANY}
   signature: STRING
         -- To identify the launcher by its arguments and its result type.
         -- Also used for the name of the C function to be called.

   agent_type: TYPE

   hash_code: INTEGER is
      do
         Result := signature.hash_code
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := signature.is_equal(other.signature)
      end

   accept (visitor: AGENT_ARGS_VISITOR) is
      do
         visitor.visit_agent_args(Current)
      end

feature {AGENT_POOL}
   jvm_define (actual: BOOLEAN) is
         -- Define both the deferred wrapper or the `actual' definition.
      local
         flags, i: INTEGER; descripteur: STRING; ca: CODE_ATTRIBUTE; cp: CONSTANT_POOL; open: ARRAY[TYPE]
      do
         ca := code_attribute
         cp := constant_pool
         flags := 9
         descripteur := once "...................."
         descripteur.clear_count
         descripteur.extend('(')
         open := agent_type.open_arguments
         if open /= Void then
            from
               i := open.lower
            until
               i > open.upper
            loop
               open.item(i).canonical_type_mark.jvm_descriptor_in(descripteur)
               i := i + 1
            end
         end
         descripteur.append(once ")V")
         method_info.start(flags, signature, descripteur)
         if actual then
            ca.opcode_return
         else
            ca.opcode_return
         end
         method_info.finish
      end

feature {ANY}
   agent_result: TYPE is
      do
         Result := agent_type.agent_result
      end

feature {}
   make (s: like signature; at: like agent_type) is
      require
         s /= Void
         at.canonical_type_mark.is_agent
      do
         signature := s
         agent_type := at
      ensure
         signature = s
         agent_type = at
      end

invariant
   agent_type.canonical_type_mark.is_agent

   not signature.is_empty

end -- class AGENT_ARGS
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
