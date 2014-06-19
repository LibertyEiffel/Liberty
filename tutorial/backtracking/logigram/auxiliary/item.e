-- See the Copyright notice at the end of this file.
--
deferred class ITEM

inherit
   HASHABLE
   ANY

feature {ANY}
   group: GROUP

   name: STRING

   index: INTEGER
      require
         not is_off
      deferred
      end

   is_like_integer: BOOLEAN
      do
         Result := group.is_like_integer
      end

   to_integer: INTEGER
      require
         is_like_integer
         not is_off
      deferred
      end

   is_off: BOOLEAN
      deferred
      end

   hash_code: INTEGER
      do
         Result := to_pointer.hash_code
      end

end -- class ITEM
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is free software, which comes along with SmartEiffel. This software is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- You can modify it as you want, provided this footer is kept unaltered, and a notification of the changes is added.
-- You are allowed to redistribute it and sell it, alone or as a part of another product.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
