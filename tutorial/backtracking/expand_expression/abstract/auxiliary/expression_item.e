-- See the Copyright notice at the end of this file.
--
class EXPRESSION_ITEM
   -- very raw class to make the expression tree
   -- not any safety check is done, be careful
   -- no comment

inherit
   EXPRESSION_ITEM_GLOBALS
      redefine out
      end

create {ANY}
   make_or, make_and, make_value, make_failure, make_success, make_empty

feature {ANY}
   first, second: like Current

   type: INTEGER

   value: STRING

   make_failure
      do
         type := Failure_item
      end

   make_success
      do
         type := Success_item
      end

   make_empty
      do
         type := Empty_item
      end

   make_value (val: STRING)
      do
         type := Value_item
         value := val
      end

   make_or (f, s: like Current)
      do
         type := Or_item
         first := f
         second := s
      end

   make_and (f, s: like Current)
      do
         type := And_item
         first := f
         second := s
      end

   out: STRING
      do
         inspect
            type
         when Empty_item then
            Result := to_pointer.out + ": empty"
         when Failure_item then
            Result := to_pointer.out + ": failure"
         when Success_item then
            Result := to_pointer.out + ": success"
         when Value_item then
            Result := to_pointer.out + ": value=" + value
         when And_item then
            Result := to_pointer.out + ": " + first.to_pointer.out + " and " + second.to_pointer.out
         when Or_item then
            Result := to_pointer.out + ": " + first.to_pointer.out + " or " + second.to_pointer.out
         end
      end

end -- class EXPRESSION_ITEM
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
