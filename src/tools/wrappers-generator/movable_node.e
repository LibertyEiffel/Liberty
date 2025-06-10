deferred class MOVABLE_NODE
   -- A node of a GCC-XML file that represent a symbol that may be wrapped in a
   -- class different by those assigned with default rules.  For example
   -- function "memcpy" that the standard require to be defined into <string.h>
   -- may be actually defined into another implementation-dependent file.
   -- castxml cannot distinguish those cases.

inherit
   NAMED_NODE
   FILED_NODE

end -- class MOVABLE_NODE

-- Copyright (C) 2014-2025: Paolo Redaelli
--
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
