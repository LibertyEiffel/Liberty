deferred class ZMQ_MSG_T_EXTERNALS
inherit
	ANY
	undefine
		copy,
		default_create,
		is_equal
	end
feature {}
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_zmq_msg"
		}"
		end
end

