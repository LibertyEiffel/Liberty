class LLVM_LABEL_TYPE

inherit LLVM_TYPE

create {ANY} make, in_context
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature {ANY} -- Creation
   make
      do
         handle:=llvmlabel_type
      end

   in_context (a_context: LLVM_CONTEXT)
      require a_context/=Void
      do
         handle:=llvmlabel_type_in_context(a_context.handle)
      end

invariant type_kind.is_label_type_kind
end -- class LLVM_LABEL_TYPE

-- Copyright (C) 2009-2018: Paolo Redaelli

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
