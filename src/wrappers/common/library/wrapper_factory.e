note
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
deferred class WRAPPER_FACTORY[ITEM_ -> WRAPPER]
   -- A wrapper factory returns the "fittest" wrapper object given a
   -- pointer to a wrapped "thing".
   -- A wrapper factory would implement the typing policy described in the
   -- wrapper library documentation.  In fact some libraries implement their
   -- own type system like GObject, while other having smaller scopes will
   -- describe the types of each returned pointer, sometime being polymorphic.
   -- If the developer needs to create wrappers of several different types and
   -- those types are pre-defined, known during the development of the
   -- wrapper, for example when the actual returned type is explained in the
   -- documentation of the library it is sometimes better to use (as a client)
   -- one of its expanded variant, i.e.  G_OBJECT_EXPANDED_FACTORY.

inherit
   WRAPPER_HANDLER

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
   wrapper (a_pointer: POINTER): ITEM_
         -- The wrapper for `a_pointer'. It could be newly created or
         -- retrieved from a cache, a dictionary, from the underlying
         -- object, depending on the implementation.
         -- See also wrapper_or_void: when `a_pointer' is the
         -- default pointer (known as NULL in C) Result will be Void.
      require
         pointer_not_null: a_pointer.is_not_null
      deferred
      ensure
         non_void: Result /= Void
         correct: Result.handle = a_pointer
      end

   wrapper_or_void (a_pointer: POINTER): ITEM_
         -- A wrapper for `a_pointer' or Void if `a_pointer'
         -- default_pointer (NULL in C). A commodity feature to
         -- replace the following code snippet:
         -- my_gobject: A_WRAPPER
         -- local p: POINTER
         -- do
         --   p := get_foo(handle)
         --   if p.is_not_null then
         --     Result := factory.wrapper(p)
         --   end
         -- end
         -- with
         -- my_gobject: A_G_OBJECT_HEIR
         --   do
         --     Result := factory.wrapper_or_void(get_foo(handle))
         --   end
      do
         if a_pointer.is_not_null then
            Result := wrapper(a_pointer)
         end
      ensure
         null_pointer_returns_void: a_pointer.is_null implies Result = Void
         correct: a_pointer.is_not_null implies Result /= Void and then Result.handle = a_pointer
      end

end -- class WRAPPER_FACTORY
