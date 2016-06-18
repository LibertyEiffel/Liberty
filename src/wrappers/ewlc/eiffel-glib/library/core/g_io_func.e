class G_IO_FUNC

inherit
	C_STRUCT
	EIFFEL_OWNED
	
insert
	G_IO_CONDITIONS

create {ANY}
	make

feature {} -- Creation

	make (ch: G_IO_CHANNEL; a: like action)
		do
			channel := ch
			action := a
			allocate
			g_io_func_closure_init (handle, to_pointer, $call)
		end

feature {ANY} -- Access

	function: POINTER
		external "C macro use <glib-callbacks.h>"
		alias "g_io_func_closure_invoke"
		end

	data: POINTER
		do
			Result := handle
		end

feature {} -- Internal

	channel: G_IO_CHANNEL

	action: FUNCTION [TUPLE [G_IO_CHANNEL, INTEGER], BOOLEAN]

	call (ch: POINTER; condition: INTEGER): BOOLEAN
		do
			-- We ignore the passed channel, it should be `channel'
				check channel.handle = ch end
			Result := action.item ([channel, condition])
		end

feature {} -- Externals

	struct_size: INTEGER
		external "C macro use <glib-callbacks.h>"
		alias "(sizeof (struct GIOFuncClosure))"
		end

	g_io_func_closure_init (h, self, func: POINTER)
		external "C use <glib-callbacks.h>"
		end

end -- class G_IO_FUNC
