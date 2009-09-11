-- See the Copyright notice at the end of this file.
--
class EVENTS_SET
	--
	-- A set of events to be waited upon. Expected events are set via the `expect' feature when the EVENTS_SET
	-- is not `queryable'. After having been waited upon (see `wait'), the EVENTS_SET becomes `queryable' and
	-- events may be checked by using the `event_occurred' feature. To reuse the EVENTS_SET (make it not
	-- `queryable' again) one may call `reset'.
	--
	--    -----------------------------                  ------------------------
	--   |                             | <-- `wait' --- |                        |
	--   | State: `queryable'          |                | State: not `queryable' |
	--   | (may call `event_occurred') |                | (may call `expect')    |
	--   |                             | -- `reset' --> |                        |
	--    -----------------------------                  ------------------------
	--
	-- May be useful for:
	-- * time/date waiting (see TIME_EVENTS and PERIODIC_JOB).
	-- * checking if data are available in files without locking (see INPUT_STREAM.event_can_read
	-- and OUTPUT_STREAM.event_can_write).
	--
	-- See also JOB
	--

insert
	ANY
	PLATFORM

creation {ANY}
	make

feature {}
	make is
		require
			create_events
		do
			read_set := sequencer_create_set
			write_set := sequencer_create_set
			exception_set := sequencer_create_set
			reset
		ensure
			queryable = False
		end

feature {ANY}
	queryable: BOOLEAN
			-- At creation this object is not `queryable'. You have to configure the conditions you want to wait
			-- for (data on file, timeout...) using `expect'. When the configuration is done, you start waiting
			-- using `wait'. Then this object is `queryable', that means that you can query the state of the
			-- events, using `event_occurred'.

	reset is
			-- Reset the event descriptors.
			--
			-- See also:
			-- * `expect'
			-- * `wait'
			-- * `exception'
		require
			reset_events
		do
			timeout := Maximum_integer
			expiration_valid := False
			current_time_valid := False
			sequencer_reset(read_set)
			sequencer_reset(write_set)
			sequencer_reset(exception_set)
			highest := -1
			read_size := 0
			write_size := 0
			exception_size := 0
			queryable := False
		ensure
			queryable = False
		end

	wait is
			-- Blocks until requested condition (max time and/or data).
			--
			-- See also:
			-- * `expect'
			-- * `event_occurred'
			-- * `reset'
		require
			not queryable
		local
			now: MICROSECOND_TIME; s, us: INTEGER; remaining: REAL
		do
			if expiration_valid then
				now.update
				if now < expiration then
					remaining := now.elapsed_seconds(expiration)
				end
				if timeout / 1000 < remaining then
					remaining := timeout / 1000
				end
			else
				remaining := timeout / 1000
			end
			from
				s := remaining.floor.force_to_integer_32
				us := ((remaining - s) * 1000000).floor.force_to_integer_32
			until
				sequencer_wait(highest + 1, read_set, read_size, write_set, write_size, exception_set, exception_size, s, us) /= -1
			loop
			end
			queryable := True
			current_time_valid := False
		ensure
			queryable
		end

	expect (event: EVENT_DESCRIPTOR) is
			-- `wait' will return if that `event' happens.
		require
			not event_expected(event)
			not queryable
			action: mark_event_as_expected(event)
		do
			event.expect(Current)
		ensure
			event_expected(event)
		end

	event_occurred (event: EVENT_DESCRIPTOR): BOOLEAN is
			-- True if `wait' returned because that `event' happened.
		require
			event_expected(event)
			queryable
		do
			Result := event.occurred(Current)
		end

feature {EVENTS_SET_HANDLER} -- low level features
	expect_readable (descriptor: INTEGER) is
		do
			sequencer_watch(read_set, descriptor)
			read_size := read_size + 1
			highest := highest.max(descriptor)
		end

	can_read (descriptor: INTEGER): BOOLEAN is
		do
			Result := sequencer_is_ready(read_set, descriptor)
		end

	expect_writeable (descriptor: INTEGER) is
		do
			sequencer_watch(write_set, descriptor)
			write_size := write_size + 1
			highest := highest.max(descriptor)
		end

	can_write (descriptor: INTEGER): BOOLEAN is
		do
			Result := sequencer_is_ready(write_set, descriptor)
		end

	expect_exception (descriptor: INTEGER) is
		do
 			sequencer_watch(exception_set, descriptor)
 			exception_size := exception_size + 1
 			highest := highest.max(descriptor)
		end

	has_exception (descriptor: INTEGER): BOOLEAN is
		do
			Result := sequencer_is_ready(exception_set, descriptor)
		end

	set_read_size (rs: like read_size) is
		require
			rs > read_size
		do
			read_size := rs
		end

	set_write_size (ws: like write_size) is
		require
			ws > write_size
		do
			write_size := ws
		end

	set_exception_size (es: like exception_size) is
		require
			es > exception_size
		do
			exception_size := es
		end

	set_highest (h: like highest) is
		require
			h > highest
		do
			highest := h
		end

feature {EVENT_DESCRIPTOR}
	after (timeout_ms: INTEGER) is
			-- `timeout_ms' is the max time in milliseconds to wait when
			-- wait begin.
		require
			timeout_ms >= 0
			not queryable
		do
			timeout := timeout.min(timeout_ms)
		end

	at (date: MICROSECOND_TIME) is
			-- `date' is the last moment `wait' can wait.
		require
			not queryable
		do
			if expiration_valid then
				expiration := date.min(expiration)
			else
				expiration := date
				expiration_valid := True
			end
		end

	when_data (file: INPUT_STREAM) is
		require
			file /= Void
			file.is_connected
			file.has_descriptor
			not queryable
		do
			expect_readable(file.descriptor)
		end

	is_data (file: INPUT_STREAM): BOOLEAN is
		require
			file /= Void
			file.is_connected
			file.has_descriptor
			queryable
		do
			Result := can_read(file.descriptor)
		end

	when_connection (server: SOCKET_SERVER) is
		require
			server /= Void
			not queryable
		do
			expect_readable(server.fd)
		end

	is_connection (server: SOCKET_SERVER): BOOLEAN is
		require
			server /= Void
			queryable
		do
			Result := can_read(server.fd)
		end

	when_free (file: OUTPUT_STREAM) is
		require
			file /= Void
			file.is_connected
			file.has_descriptor
			not queryable
		do
			expect_writeable(file.descriptor)
		end

	is_free (file: OUTPUT_STREAM): BOOLEAN is
		require
			file /= Void
			file.is_connected
			file.has_descriptor
			queryable
		do
			Result := can_write(file.descriptor)
		end

 	when_exception (file: STREAM) is
 		require
 			file /= Void
 			file.is_connected
 			file.has_descriptor
 			not queryable
 		do
			expect_exception(file.descriptor)
 		end

 	is_exception (file: STREAM): BOOLEAN is
 		require
 			file /= Void
 			file.is_connected
 			file.has_descriptor
 			queryable
 		do
 			Result := has_exception(file.descriptor)
 		end

feature {JOB, TIME_EVENT}
	current_time: MICROSECOND_TIME is
		do
			if not current_time_valid then
				current_time_valid := True
				current_time_memory.update
			end
			Result := current_time_memory
		end

feature {ANY} -- Expected events
	event_expected (a_event: EVENT_DESCRIPTOR): BOOLEAN is
			-- True in check modes if the event is expected. Always False in boost mode. Exported to {ANY} only
			-- because the language requires it.
			--
			-- CAVEAT: '''Use only in require/ensure clauses.''' It's very important. In boost mode, it will
			-- always be False. It's meant to catch programming mistakes, not as a guard. If you feel the need to
			-- call that feature, please check your algorithm. Twice. And don't use it.
			--
			-- Tip: only call `event_occurred' on events that passed to `expect' (I mean, the ''same'' object,
			-- ''not'' a twin!)
		do
			Result := events /= Void and then events.fast_has(a_event)
		ensure
			definition: Result = events.fast_has(a_event)
			equivalence: Result = a_event.expected(Current)
		end

feature {} -- Expected events
	--| Clever use of assertions to be sure not to create arrays in boost mode

	events: FAST_ARRAY[EVENT_DESCRIPTOR]
			-- This array is created only if the assertion level is at least require_check. That's why all the
			-- functions below are used only in contracts.

	mark_event_as_expected (a_event: EVENT_DESCRIPTOR): BOOLEAN is
			-- Mark the event as expected and return True. Use only in require clauses.
		do
			events.add_last(a_event)
			Result := True
		ensure
			Result
		end

	create_events: BOOLEAN is
			-- Create the events array. Use only in require clauses.
		do
			if events = Void then
				create events.make(0)
				Result := True
			end
		end

	reset_events: BOOLEAN is
			-- Empties the events array. Use only in require clauses.
		local
			i: INTEGER
		do
			from
				i := events.lower
			until
				i > events.upper
			loop
				events.item(i).reset(Current)
				i := i + 1
			end
			events.clear_count
			Result := True
		end

feature {}
	timeout: INTEGER

	expiration: MICROSECOND_TIME

	expiration_valid: BOOLEAN

	current_time_memory: MICROSECOND_TIME

	current_time_valid: BOOLEAN

	read_set: POINTER

	read_size: INTEGER

	write_set: POINTER

	write_size: INTEGER

	exception_set: POINTER

	exception_size: INTEGER

	highest: INTEGER

	sequencer_create_set: POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "sequencer"
			feature_name: "sequencer_create_set"
			}"
		end

	sequencer_reset (set: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "sequencer"
			feature_name: "sequencer_reset"
			}"
		end

	sequencer_watch (set: POINTER; file: INTEGER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "sequencer"
			feature_name: "sequencer_watch"
			}"
		end

	sequencer_is_ready (set: POINTER; file: INTEGER): BOOLEAN is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "sequencer"
			feature_name: "sequencer_is_ready"
			}"
		end

	sequencer_wait (n: INTEGER; rset: POINTER; rsize: INTEGER; wset: POINTER; wsize: INTEGER; eset:POINTER; esize: INTEGER; s, us: INTEGER): INTEGER is
			--return -1 if signal interupt occured
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "sequencer"
			feature_name: "sequencer_wait"
			}"
		end

end -- class EVENTS_SET
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
