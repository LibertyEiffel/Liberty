-- See the Copyright notice at the end of this file.
--
class DESCRIPTION

create {ANY}
   make

feature {ANY}
   group: GROUP

   group_array: FAST_ARRAY[like group]

   group_dictionary: AVL_DICTIONARY[like group, STRING]

   constraints: CONSTRAINT_SET

   make
      do
         create group_array.with_capacity(10)
         create group_dictionary.make
         create constraints.make
      end

   add_group_atomic (name: STRING)
      do
         create group.make_atomic(name, 1 + group_array.upper)
         add_group
      end

   add_group_numeric (name: STRING)
      do
         create group.make_numeric(name, 1 + group_array.upper)
         add_group
      end

   add_group_ordered (name: STRING)
      do
         create group.make_ordered(name, 1 + group_array.upper)
         add_group
      end

   get_item (group_name, item_name: STRING): ITEM_ITEM
      do
         goto_name(group_name)
         group.goto_name(item_name)
         Result := group.item
      end

   get_group (group_name: STRING): GROUP
      do
         goto_name(group_name)
         Result := group
      end

   goto_name (group_name: STRING)
      do
         group := group_dictionary.at(group_name)
      end

   goto_index (group_index: INTEGER)
      do
         group := group_array.item(group_index)
      end

   group_count: INTEGER
      do
         Result := group_array.count
      end

   is_valid: BOOLEAN
      local
         i: INTEGER
      do
         if not group_array.is_empty then
            from
               Result := True
               i := group_array.lower + 1
            until
               i > group_array.upper
            loop
               Result := group_array.first.item_count = group_array.item(i).item_count
               i := i + 1
            end
         end
      end

   dimension: INTEGER
      require
         is_valid
      do
         Result := group_array.first.item_count
      end

   get_var (group_name, var_name: STRING): ITEM_VAR
      do
         goto_name(group_name)
         group.get_var(var_name)
         Result := group.var
      end

   get_anonymous_var (group_name: STRING): ITEM_VAR
      do
         goto_name(group_name)
         group.get_anonymous_var
         Result := group.var
      end

feature {}
   add_group
      do
         group_array.add_last(group)
         group_dictionary.add(group, group.name)
      end

end -- class DESCRIPTION
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
