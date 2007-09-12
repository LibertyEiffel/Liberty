indexing
	description: "Wrapper callback for GCompareDataFunc"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
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

class G_COMPARE_DATA_CALLBACK[ITEM->COMPARABLE_SHARED_C_STRUCT]

inherit GLIB_CALLBACK

creation dummy, make

feature {} -- Creation
	make (a_function: FUNCTION[ANY,TUPLE[ITEM,ITEM],INTEGER]) is
		require function_not_void: a_function/=Void
		do
			function:=a_function
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	function: FUNCTION[ANY,TUPLE[ITEM,ITEM],INTEGER]

	callback (a,b, a_current: POINTER): INTEGER is
		local
			item_a, item_b: ITEM
			factory: WRAPPER_RETRIEVER[ITEM]
		do
			-- Big fat warning: this feature MUST use ONLY local
			-- objects. No features from the class, only local features.
			-- In addition this class must compiled with boost and no
			-- debug, otherwise this feature won't be translated into a C
			-- function with the correct fingerprint, i.e.:

			-- gint (*GCompareFunc) (gconstpointer a, gconstpointer b);
			factory.print ("G_COMPARE_DATA_CALLBACK.callback("+a.out+","+b.out+")%N")
			item_a ::= factory.wrappers.reference_at(a)
			if item_a=Void then item_a ::= factory.item_from(a) end
			
			item_b ::= factory.wrappers.reference_at(b)
			if item_b=Void then item_b ::= factory.item_from(b) end
			
			factory.print("G_COMPARE_DATA_CALLBACK: comparing by address and not with the given function.%N")
			Result := item_a.compare(item_b) -- was: (function.item([item_a,item_b]))
		end

	callback_address: POINTER is
		do
			Result:=address_of_callback($callback)
		end
end -- class G_COMPARE_DATA_CALLBACK
