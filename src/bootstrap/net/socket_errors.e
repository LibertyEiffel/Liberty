expanded class SOCKET_ERRORS
	--
	-- Access to error messages. Usually set when some SOCKET could not be built.
	--

insert
	SOCKET_PLUG_IN
		export {ANY} last_error
		end

end -- class SOCKET_ERRORS
