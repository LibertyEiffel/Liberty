note
   description:
      "A wrapper that is a collection of other wrappers."
   copyright:
      "[
               Copyright (C) 2008-2022: Paolo Redaelli

               This library is free software; you can redistribute it and/or
               modify it under the terms of the GNU Lesser General Public License
               as published by the Free Software Foundation; either version 2.1 of
               the License, or (at your option) any later version.

               This library is distributed in the hope that it will be useful, but
               WITHOUT ANY WARRANTY; without even the implied warranty of
               MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               Lesser General Public License for more details.

               You should have received a copy of the GNU Lesser General Public
               License along with this library; if not, write to the Free Software
               Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
               02110-1301 USA
         ]"
deferred class WRAPPER_COLLECTION[ITEM_ -> WRAPPER]
   -- A collection of wrappers.

inherit
   COLLECTION[ITEM_]
      -- fast_first_index_of,
      -- first_index_of,
      -- reverse,
      undefine append_collection, clear_all, has, fast_has, swap
      end
   WRAPPER_FACTORY[ITEM_]

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
   wrapper (a_pointer: POINTER): ITEM_
         -- The wrapper for `a_pointer'. It could be newly created or
         -- retrieved from a cache, a dictionary, from the underlying
         -- object, depending on the implementation.
      deferred
      end

   as_c_array: NATIVE_ARRAY[POINTER]
         -- Current collection as a C array meant to be passed to C functions
         -- expectiong an array of wrapped items. Result - at C level - will be
         -- a Item**, i.e. a pointer to pointers to Item structures or - in
         -- other words - an array of pointers to Items.
      deferred
      end

end -- class WRAPPER_COLLECTION
