class LLVM_TYPE_ARRAY
	-- A C_ARRAY of LLVM_TYPEs.

inherit  C_ARRAY[LLVM_TYPE] 
insert   LLVM_TYPE_FACTORY undefine out_in_tagged_out_memory end
creation manifest_creation, from_external_array
end -- class LLVM_TYPE_ARRAY
-- This file is part of LLVM wrappers for Liberty Eiffel.
--
-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--

