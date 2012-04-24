-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLUSTER_POOL_DATA
   --
   -- This class is a CLUSTER_CLASS factory (one such object per used class in the system; more than one class
   -- may have the same name, but in different clusters)
   --

insert
   GLOBALS

creation {CLUSTER}
   make

feature {CLUSTER}
   class_count: INTEGER is
      do
         Result := classes.count
      end

   cluster_class (a_class_name: HASHED_STRING): CLUSTER_CLASS is
      do
         if a_class_name.is_tuple_related then
            Result := classes.fast_reference_at(hash_tuple)
         else
            Result := classes.fast_reference_at(a_class_name)
         end
      end

   has (a_class_name: HASHED_STRING): BOOLEAN is
      do
         if a_class_name.is_tuple_related then
            Result := classes.fast_has(hash_tuple)
         else
            Result := classes.fast_has(a_class_name)
         end
      end

   add_cluster_class (a_class_name: HASHED_STRING; a_path: STRING) is
      require
         cluster_class(a_class_name) = Void
      local
         c: CLUSTER_CLASS
      do
         if a_class_name.is_tuple_related then
            if not classes.fast_has(hash_tuple) then
               create c.make(hash_tuple, cluster, a_path)
               classes.add(c, hash_tuple)
            end
         else
            create c.make(a_class_name, cluster, a_path)
            classes.add(c, a_class_name)
         end
      end

feature {}
   hash_tuple: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_tuple)
      end

   classes: HASHED_DICTIONARY[CLUSTER_CLASS, HASHED_STRING]

   cluster: CLUSTER

   make (a_cluster: CLUSTER) is
      do
         cluster := a_cluster
         create classes.make
      end

end -- class CLUSTER_POOL_DATA
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
