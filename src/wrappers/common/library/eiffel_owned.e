note
   description:
      "A wrapper for a C object whose memory is handled by the Eiffel library "
   copyright:
      "[
               Copyright (C) 2008-2017: Paolo Redaelli

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
deferred class EIFFEL_OWNED
   -- A wrapper for a C object whose memory is handled by the Eiffel library

inherit
   WRAPPER
      undefine from_external_pointer
      end

insert
   STDLIB_EXTERNALS

feature {} -- Disposing
   dispose
      do
         debug
            print(once "Disposing an Eiffel owned ")
            print(generating_type)
            print(once " and freeing handle.%N")
         end
         free(handle) -- Note: free(NULL) is a NOP and has no side-effects
         handle := default_pointer -- make sure the C object is not used anymore
      end

end -- class EIFFEL_OWNED
