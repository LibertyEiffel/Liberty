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
end -- class ERRNO

