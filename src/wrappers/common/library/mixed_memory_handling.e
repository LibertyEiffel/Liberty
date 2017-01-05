note
   description:
      "Wrapper for a generic C structure, that is shared with external code, handle will not be freed on dispose of the Eiffel wrapper object, if is_shared is true"
   copyright:
      "[
Copyright (C) 2008-2017: Raphael Mack <mail@raphael-mack.de>, Paolo Redaelli <paolo.redaelli@poste.it>

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
   author:
      "Raphael Mack <mail@raphael-mack.de>, Paolo Redaelli <paolo.redaelli@poste.it>"
deferred class MIXED_MEMORY_HANDLING
   -- Wrapper for a generic C structure, whose memory can either by
   -- handled by the Eiffel library or by the underlying C code. Who
   -- handles memory is decided on a per-object based on the value of
   -- the flag `is_shared': handle will not be freed on dispose of the
   -- Eiffel wrapper object, when `is_shared' is true.

insert
   WRAPPER
      undefine from_external_pointer
      end
   STDLIB_EXTERNALS

feature {ANY}
   dispose
         -- Action to be executed just before garbage collection
         -- reclaims an object; if not shared frees the memory pointed
         -- by `handle'
      do
         if handle.is_not_null then
            if is_shared then
               debug
                  print(once "Disposing a shared ")
                  print(generating_type)
                  print(once "; handle not freed%N")
               end
            else
               debug
                  print("Disposing an unshared ")
                  print(generating_type)
                  print(" and freeing its handle.%N")
               end
               free(handle)
            end
            handle := default_pointer
         end
      end

feature {WRAPPER, WRAPPER_HANDLER}
   is_shared: BOOLEAN
      -- Does anybody else (Eiffel or non-Eiffel) have a reference
      -- to `handle'? If False, then the C-object will be
      -- destroyed when the the Eiffel object will be collected
      -- (via destroy object). If True the C-object will not be destroyed.

   set_shared
      do
         is_shared := True
      end

   unset_shared, set_unshared
      do
         is_shared := False
      end

end -- class MIXED_MEMORY_HANDLING
