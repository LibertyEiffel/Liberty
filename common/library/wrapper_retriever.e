indexing
	description: "Wrapper retriever, an expanded wrapper factory, useful as a local feature in classes that generates many kind of wrapper objects."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

expanded class WRAPPER_RETRIEVER [ITEM_->WRAPPER]
insert
	WRAPPER_FACTORY[ITEM_]
		export {WRAPPER, WRAPPER_HANDLER}
			all -- new_item, item_from
		end
	ANY -- to get is_equal and copy

end -- class WRAPPER_RETRIEVER
