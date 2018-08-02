deferred class C_TYPE
   -- An XML node representing a type in the C language in the output of GccXml

inherit
   GCCXML_NODE

feature {ANY}
   is_fundamental: BOOLEAN
         -- Does current node refers to a fundamental C type?
      deferred
      end

   is_void: BOOLEAN
         -- Is Current node of type void?
      deferred
      end

   has_wrapper: BOOLEAN
         -- Does Current actually have a wrapper type in Liberty?
      deferred
      end

   wrapper_type: STRING
         -- The name of the class of Liberty that wraps Current fundamental type.
      require
         not is_void
         has_wrapper
      deferred
      end

end -- class C_TYPE

-- Copyright (C) 2014-2018: Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
