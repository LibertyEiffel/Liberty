-- See the Copyright notice at the end of this file.
--
class GROUP

create {ANY}
   make_atomic, make_numeric, make_ordered

feature {ANY}
   item: ITEM_ITEM

   item_array: FAST_ARRAY[like item]

   item_dictionary: AVL_DICTIONARY[like item, STRING]

   var: ITEM_VAR

   var_dictionary: AVL_DICTIONARY[like var, STRING]

   width: INTEGER

   is_atomic: BOOLEAN

   is_numeric: BOOLEAN

   is_ordered: BOOLEAN

   is_like_integer: BOOLEAN
      do
         Result := not is_atomic
      end

   name: STRING

   index: INTEGER

   make (the_name: STRING; the_index: INTEGER)
      do
         name := the_name
         index := the_index
         create item_array.with_capacity(10)
         create item_dictionary.make
         create var_dictionary.make
         is_numeric := False
         is_ordered := False
         is_atomic := False
         width := name.count
      end

   make_atomic (the_name: STRING; the_index: INTEGER)
      do
         make(the_name, the_index)
         is_atomic := True
      end

   make_numeric (the_name: STRING; the_index: INTEGER)
      do
         make(the_name, the_index)
         is_numeric := True
      end

   make_ordered (the_name: STRING; the_index: INTEGER)
      do
         make(the_name, the_index)
         is_ordered := True
      end

   add_item (item_name: STRING)
      require
         is_numeric implies item_name.is_integer
      do
         create item.make(Current, item_name, 1 + item_array.upper)
         item_array.add_last(item)
         item_dictionary.add(item, item.name)
         width := width.max(item.name.count)
      end

   goto_name (item_name: STRING)
      do
         item := item_dictionary.at(item_name)
      end

   goto_index (item_index: INTEGER)
      do
         item := item_array.item(item_index)
      end

   item_count: INTEGER
      do
         Result := item_array.count
      end

   get_var (var_name: STRING)
      do
         var := var_dictionary.reference_at(var_name)
         if var = Void then
            create var.make(Current, var_name)
            var_dictionary.add(var, var.name)
         end
      end

   get_anonymous_var
      local
         nam: STRING; n: INTEGER
      do
         from
            nam := "_var_"
            n := var_dictionary.count
            n.append_in(nam)
            var := var_dictionary.reference_at(name)
         until
            var = Void
         loop
            nam.resize(5)
            n := n + 1
            n.append_in(nam)
            var := var_dictionary.reference_at(name)
         end
         create var.make(Current, nam)
         var_dictionary.add(var, var.name)
      end

invariant
   is_numeric or is_ordered or is_atomic

end -- class GROUP
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
