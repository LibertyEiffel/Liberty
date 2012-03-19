deferred class ERRNO
	-- Access to C errno variable
insert ANY undefine copy, is_equal end
feature {} 
	errno: INTEGER_32 is
		-- number of last error
				external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "errno"
		}"
		end


	enomem: INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "ENOMEM"
		}"
		end

	eagain: INTEGER_32 is
		external "plug_in"
		alias "{
			location: "externals"
			module_name: "plugin"
			feature_name: "EAGAIN"
		}"
		end


end -- class ERRNO

