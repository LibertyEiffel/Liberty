note
   description:
      "."
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
deferred class EXPANDED_WRAPPER
   -- A wrapper for an object on the stack

inherit
   C_STRUCT
      redefine allocate
      end
   C_OWNED
   INTERNALS_HANDLER
      undefine copy, is_equal
      end

feature {} --
   allocate
      do
         handle := alloca(struct_size)
      end

   alloca (a_size: INTEGER): POINTER
         -- The alloca() function allocates size bytes of space in the
         -- stack frame of the caller.  This temporary space
         -- automatically freed when the function that called alloca()
         -- returns to its caller.
         -- The alloca() function returns a pointer to the beginning of
         -- the allocated space.  If the allocation causes stack
         -- overflow, program behavior is undefined.
         -- The alloca() function is machine- and compiler-dependent.
         -- For certain applications, its use can improve efficiency
         -- compared to the use of malloc(3) plus free(3).  In certain
         -- cases, it can also simplify memory deallocation in
         -- applications that use longjmp(3) or siglongjmp(3).
         -- Otherwise, its use is discouraged.
         -- Because the space allocated by alloca() is allocated
         -- within the stack frame, that space is automatically freed
         -- if the function return is jumped over by a call to
         -- longjmp(3) or siglongjmp(3).
      require
         positive: a_size > 0
      external "C use <alloca.h>"
      end

invariant
   used_in_expanded_types: to_internals.type_is_expanded
   -- When using previous versions of the compiler (<2.3)
   -- this invariant would become `is_expanded_type'

end -- class EXPANDED_WRAPPER
