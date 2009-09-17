class LOOP_STACK
	-- Manage `LOOP_ITEM'. When new loop is pushed, all jobs in current
	-- running loop suspend until the new loop end (all jobs end or break).
	--

creation {ANY}
	make

feature {}
	loop_stack: FAST_ARRAY[LOOP_ITEM]

	make is
		do
			create loop_stack.make(0)
			loop_stack.add_last(create {LOOP_ITEM}.make)
		ensure
			current_loop /= Void
		end

feature {ANY}
	stop: BOOLEAN

	new_loop is
			-- create new empty loop (ie without job) and push it on the stack
		local
			loop_item: LOOP_ITEM
		do
			if not loop_stack.is_empty then
				current_loop.pause_loop
			end
			create loop_item.make
			loop_stack.add_last(loop_item)
		end

	push_loop (l: like current_loop) is
			-- `l' is restarted and pushed on the stack
		require
			l /= Void
		do
			if not loop_stack.is_empty then
				current_loop.pause_loop
			end
			l.restart
			loop_stack.add_last(l)
		ensure
			current_loop = l
		end

	run is
			-- run `current_loop' (ie execute it's jobs)
		require
			current_loop /= Void
		do
			from
				stop := False
			until
				stop or else loop_stack.is_empty
			loop
				current_loop.run
				if current_loop /= Void then
					--may be Void after `break'
					if not current_loop.pause then
						loop_stack.remove_last
					end
				end
			end
		ensure
			loop_stack.is_empty or stop
		end

	add_job (j: JOB) is
			-- Add some job to the current loop
		require
			j /= Void
		do
			current_loop.add_job(j)
		end

	break is
			-- Exit current loop
		require
			current_loop /= Void
		do
			current_loop.break_loop
			loop_stack.remove_last
		ensure
			current_loop /= old current_loop
		end

	exit_all is
			--TODO: Really needed feature ?
		require
			stop = False
		do
			stop := True
			current_loop.pause_loop
		ensure
			stop = True
		end

	current_loop: LOOP_ITEM is
			--TODO: change this function into an attribute to be more efficient
		do
			if not loop_stack.is_empty then
				Result := loop_stack.last
			end
		end

end -- class LOOP_STACK
