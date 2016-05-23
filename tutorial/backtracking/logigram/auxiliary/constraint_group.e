-- See the Copyright notice at the end of this file.
--
class CONSTRAINT_GROUP
   --
   -- manages a group of constraints
   -- group of constraints shares the same variables
   --

create {ANY}
   make

feature {ANY}
   var_set: HASHED_SET[ITEM_VAR]
      -- the variables of the group

   logic: LINKED_LIST[CONSTRAINT_LOGICAL]
      -- the logic constraints (equal, not equal, greater, lesser)

   couple: LINKED_LIST[CONSTRAINT_COUPLE]
      -- the couple constraints (yes, no)

   make
         -- creation
      do
         create var_set.make
         create logic.make
         create couple.make
      end

   add (constraint: CONSTRAINT; set: HASHED_SET[ITEM_VAR])
         -- record the constraint and the set of variables
      local
         clog: CONSTRAINT_LOGICAL; cpl: CONSTRAINT_COUPLE
      do
         var_set.union(set)
         clog ?= constraint
         if clog /= Void then
            logic.add_last(clog)
         else
            cpl ?= constraint
            check
               cpl /= Void
            end
            couple.add_last(cpl)
         end
      end

   union (other: like Current)
         -- add the data of other to current
      do
         var_set.union(other.var_set)
         logic.append_traversable(other.logic)
         couple.append_traversable(other.couple)
      end

   build_nodes (builder: MASK_BUILDER): BACKTRACKING_NODE
         -- deduce backtracking graph from the current constraints
      do
         Result := get_node(builder, var_set.lower)
      end

feature {}
   get_node (builder: MASK_BUILDER; ivar: INTEGER): BACKTRACKING_NODE
         -- deduce backtracking graph from the current constraints
         -- ivar is the number of the var that will be evaluated
      do
         if ivar > var_set.upper then
            -- not a variable then check if configuration is allowed
            Result := get_node_if_true(builder)
         else
            -- loop on variable value
            Result := get_node_of_var(builder, ivar)
         end
      end

   get_node_of_var (builder: MASK_BUILDER; ivar: INTEGER): BACKTRACKING_NODE_OR_LIST
         -- generate the alternative values of the variable ivar
      local
         v: ITEM_VAR; n: BACKTRACKING_NODE
      do
         v := var_set.item(ivar)
         from
            v.start
         until
            v.is_off
         loop
            n := get_node(builder, ivar + 1)
            if n /= Void then
               Result := create {BACKTRACKING_NODE_OR_LIST}.make(n, Result)
            end

            v.next
         end
      end

   get_node_if_true (builder: MASK_BUILDER): BACKTRACKING_NODE
      local
         i: INTEGER
      do
         -- check if logic constraints are OK
         from
            i := logic.lower
         until
            i > logic.upper or else not logic.item(i).to_boolean
         loop
            i := i + 1
         end

         if i > logic.upper then
            -- logics constraints are OK
            -- then build the mask corresponding to the couple constraints
            builder.clear
            from
               i := couple.lower
            until
               i > couple.upper or else not builder.is_ok
            loop
               couple.item(i).build_masks(builder)
               i := i + 1
            end

            if builder.is_ok then
               -- possible solution
               Result := builder.get_node
            end
         end
      end

end -- class CONSTRAINT_GROUP
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
