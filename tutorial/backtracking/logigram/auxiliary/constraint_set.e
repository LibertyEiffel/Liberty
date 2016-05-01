-- See the Copyright notice at the end of this file.
--
class CONSTRAINT_SET
   --
   -- the set of constraints
   --

create {ANY}
   make

feature {ANY}
   groups: LINKED_LIST[CONSTRAINT_GROUP]
      -- the constraints that contains variable items
      -- where constraints are grouped around coupled variables

   unbound: CONSTRAINT_GROUP
      -- the constraints that are not bound to any variable

   make
         -- creation
      do
         create groups.make
         create unbound.make
         create collector.make
      end

   add (constraint: CONSTRAINT)
         -- add a constraint, taking care of where it must go:
         -- either in the unbound group or in one of the groups
         -- bound to variables
      local
         i: INTEGER; grp: CONSTRAINT_GROUP; added: BOOLEAN
      do
         -- Collects the items
         collector.clear
         constraint.get_items(collector)
         if collector.has_var then
            -- There is a variable.
            from
               i := groups.lower
            until
               i > groups.upper
            loop
               grp := groups.item(i)
               if not grp.var_set.is_disjoint_from(collector.var_set) then
                  -- grp is the first group that contains one of the
                  -- variables of the constraint.
                  -- Add the constraint to the group
                  grp.add(constraint, collector.var_set)
                  added := True
                  i := i + 1
                  -- Checks is further groups intersect the new one.

                  from
                  until
                     i > groups.upper
                  loop
                     if grp.var_set.is_disjoint_from(groups.item(i).var_set) then
                        i := i + 1
                     else
                        -- Merge of the two intersecting groups
                        grp.union(groups.item(i))
                        groups.remove(i)
                     end
                  end

                  check
                     i > groups.upper -- obvious, the main loop stops
                  end
               else
                  i := i + 1
               end
            end

            if not added then
               -- When not added, the constraint begins a new group.
               create grp.make
               grp.add(constraint, collector.var_set)
               groups.add_last(grp)
            end
         else
            -- No variables, adds to the unbound group of constraints.
            unbound.add(constraint, collector.var_set)
         end
      end

   build_nodes (builder: MASK_BUILDER): BACKTRACKING_NODE_AND_LIST
         -- Creates the backtracking tree corresponding to the constraints.
      local
         i: INTEGER; n: BACKTRACKING_NODE
      do
         -- The creation begins with variable groups.
         from
            i := groups.lower
         until
            i > groups.upper
         loop
            n := groups.item(i).build_nodes(builder)
            if n /= Void then
               Result := create {BACKTRACKING_NODE_AND_LIST}.make(n, Result)
            end

            i := i + 1
         end
         -- Creation of the not variable group.
         -- Note: made after to go before in the list.

         n := unbound.build_nodes(builder)
         if n /= Void then
            Result := create {BACKTRACKING_NODE_AND_LIST}.make(n, Result)
         end
      end

   collector: ITEM_COLLECTOR
      -- common collector of items

end -- class CONSTRAINT_SET
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
