deferred class WRAPPER_FEATURE
   -- A node of an XML file produced by castxml that will be wrapped by a Liberty feature, part of wider wrapper class.

inherit
   WRAPPABLE_NODE
   FILED_NODE

feature {ANY}
   wrap_on (a_stream: OUTPUT_STREAM)
         -- Put the wrapper on `a_stream'
      require
         a_stream /= Void
      deferred
      ensure
         buffer.is_empty
      end

end -- class WRAPPER_FEATURE
-- Copyright (C) 2008-2025: ,2009,2010 Paolo Redaelli
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
