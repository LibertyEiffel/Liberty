note
	description: "First In First Out heaps."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTS team
					
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

class GTS_FIFO [ITEM -> SHARED_C_STRUCT]

inherit
	SHARED_C_STRUCT undefine print_on redefine dispose end
	STREAM_HANDLER undefine copy,is_equal,print_on end
	WRAPPER_FACTORY[ITEM] undefine print_on end
	
create {ANY}  make, from_external_pointer

feature {ANY} 
	make is
		do
			from_external_pointer(gts_fifo_new)
		end

	push (an_item: ITEM) is
			-- Push `an_item' into fifo.
		require item_not_void: an_item /=Void
		do
			gts_fifo_push(handle,an_item.handle)
		ensure pushed: count = old count + 1
		end

	pop: ITEM is
			-- removes the first element in fifo
		require not_empty: not is_empty
		do
			Result:=new_item
			Result.from_external_pointer(gts_fifo_pop(handle))
		end

	top: ITEM is
		-- the first element in fifo
		require not_empty: not is_empty
		do
			Result:=new_item
			Result.from_external_pointer(gts_fifo_top(handle))
		end

	is_empty: BOOLEAN is
			-- Is FIFO empty?
		do
			Result:=gts_fifo_is_empty(handle).to_boolean
		end

	count: INTEGER is
			-- the number of elements in fifo.

			-- TODO: should be NATURAL
		do
			Result:=gts_fifo_size(handle)
		end
	

	-- gts_fifo_foreach ()
	
	-- void gts_fifo_foreach (GtsFifo *fifo, GtsFunc func, gpointer data);

	-- Calls func in order for each item in fifo, passing data.

	-- fifo :  a GtsFifo.
	-- func :  a GtsFunc.
	-- data :  user data to be passed to func.


	reverse is
			--    Reverses the order of elements in fifo.
		do
			gts_fifo_reverse(handle)
		end

	print_on (a_file: OUTPUT_STREAM) is
			-- Writes the content of fifo on `a_file'.
		require file_not_void: a_file /= Void
		do
			gts_fifo_write (handle, a_file.stream_pointer)
		end

	dispose is
			-- Frees all the memory allocated for fifo.
		do
			gts_fifo_destroy(handle)
		end
	
feature {} -- External calls
-- #include <gts.h>

	gts_fifo_new: POINTER is
			-- GtsFifo* gts_fifo_new (void);
		external "C use <gts.h>"
		end

	gts_fifo_push (a_fifo, a_data: POINTER) is
			--  void gts_fifo_push (GtsFifo *fifo, gpointer data);
		external "C use <gts.h>"
		end

	gts_fifo_pop (a_fifo: POINTER): POINTER is
			--  gpointer gts_fifo_pop (GtsFifo *fifo);
		external "C use <gts.h>"
		end

	gts_fifo_top (a_fifo: POINTER): POINTER is
			--  gpointer gts_fifo_top (GtsFifo *fifo);
		external "C use <gts.h>"
		end
	
	gts_fifo_size (a_fifo: POINTER): INTEGER is
			--  guint gts_fifo_size (GtsFifo *fifo);

			-- TODO: should be NATURAL
		external "C use <gts.h>"
		end

	gts_fifo_foreach (a_fifo, a_func, a_data: POINTER) is
			--  void gts_fifo_foreach (GtsFifo *fifo, GtsFunc func, gpointer data);
		external "C use <gts.h>"
		end
	
	gts_fifo_is_empty (a_fifo: POINTER): INTEGER is
			--  gboolean gts_fifo_is_empty (GtsFifo *fifo);
		external "C use <gts.h>"
		end

	gts_fifo_reverse (a_fifo: POINTER) is
			--  void gts_fifo_reverse (GtsFifo *fifo);
		external "C use <gts.h>"
		end

	gts_fifo_write (a_fifo, a_fp: POINTER) is
			--  void gts_fifo_write (GtsFifo *fifo, FILE *fp);
		external "C use <gts.h>"
		end
	
	gts_fifo_destroy (a_fifo: POINTER) is
			--  void gts_fifo_destroy (GtsFifo *fifo);
		external "C use <gts.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
 external "C inline use <gts.h>"
 alias "sizeof(GtsFifo)"
 end
end -- GTS_FIFO
