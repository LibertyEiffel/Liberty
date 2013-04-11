deferred class G_POOLED_ROUTINE
	obsolete "G_POOLED_ROUTINE is currently unusable because standard library is NOT thread safe. At all"
	
	-- Some work to be processed by a thread pool.
feature {ANY}
	invoke (a_pool: G_THREAD_POOL[G_POOLED_ROUTINE]) is
		-- The
	deferred
	end
feature {G_THREAD_POOL} -- Implementation 
	invoke_address: POINTER is
		do
			Result := $invoke
		end
end -- class G_POOLED_ROUTINE
