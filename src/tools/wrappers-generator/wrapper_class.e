deferred class WRAPPER_CLASS
   -- A node of an Gcc-Xml file reprenting an entity wrappable by a
   -- Liberty class also containing the wrapper features of child
   -- and/or related nodes.

inherit
   WRAPPABLE_NODE
      -- To make sure that it is a correct class name
      redefine compute_eiffel_name
      end

feature {ANY}
   emit_wrapper
      deferred
      end

   compute_eiffel_name
      do
         cached_eiffel_name := eiffel_class_name(c_string_name, suffix)
      end

   suffix: STRING
      deferred
      end

feature {} -- Implementation
   output: TERMINAL_OUTPUT_STREAM

end -- class WRAPPER_CLASS
-- Copyright (C) 2008-2016: ,2009,2010 Paolo Redaelli
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
