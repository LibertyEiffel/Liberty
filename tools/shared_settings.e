deferred class SHARED_SETTINGS
	-- Access to the `settings' singleton and commodity features like "proxy"
	-- setters, queries and logging facilities.

feature {ANY}
	settings: SETTINGS is
			-- The singleton to access all the shared settings
		once
			create Result
		end 
		
feature -- Syntactic sugar

	verbose: BOOLEAN is
		do
			Result := settings.verbose
		end

	global: BOOLEAN is
		do
			Result := settings.global
		end

	directory: STRING is
		do
			Result := settings.directory
		end

	comment_file: TEXT_FILE_READ is
		do
			Result:=settings.comment_file
		end
	use_naturals is
		do
			settings.use_naturals
		end

	use_integers is
		do
			settings.use_integers
		end

	are_naturals_used: BOOLEAN is
		do
			Result := settings.are_naturals_used
		end

feature {} -- Logging
	logger: STRING_PRINTER is
		-- The formatter used to log messages
	once
		create Result.make(std_error)
	ensure Result/=Void
	end

	log_string (a_string: STRING) is
		-- If verbose print `a_string' to logger's output
	require a_string/=Void
	do
		if verbose then
			std_error.put_string(a_string)
		end
	end

	log_word (a_word: STRING) is
		-- If verboe print 'a_word' and a whitespace to logger's output 
	require a_word/=Void
	do
		if verbose then
			std_error.put_string(a_word)
			std_error.put_character(' ')
		end
	end

	log (a_message: TRAVERSABLE[CHARACTER]; some_arguments: TRAVERSABLE[ANY]) is
			-- Utility feature to replace "if verbose then logger.put_message(foo,bar) end" with "log(foo,bar)"
		require
			a_message /= Void
			some_arguments /= Void
		do
			if verbose then
				logger.put_message(a_message, some_arguments)
			end
		end

	log2 (a_tuple: TUPLE[STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
		end
	end

	log3 (a_tuple: TUPLE[STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
		end
	end


	log4 (a_tuple: TUPLE[STRING,STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
			std_error.put_string(a_tuple.item_4)
		end
	end

	log5 (a_tuple: TUPLE[STRING,STRING,STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
			std_error.put_string(a_tuple.item_4)
			std_error.put_string(a_tuple.item_5)
		end
	end

	log6 (a_tuple: TUPLE[STRING,STRING,STRING,STRING,STRING,STRING]) is
		-- If verbose log the strings contained in `a_tuple' to std_error.
	require a_tuple/=Void
	do
		if verbose then
			std_error.put_string(a_tuple.item_1)
			std_error.put_string(a_tuple.item_2)
			std_error.put_string(a_tuple.item_3)
			std_error.put_string(a_tuple.item_4)
			std_error.put_string(a_tuple.item_5)
			std_error.put_string(a_tuple.item_6)
		end
	end

	log_tuple (a_tuple: TUPLE) is
		-- Log the strings contained in `a_tuple' to std_error up to 5 fields.
	obsolete "Use log2, log3 ... instead"
	require a_tuple/=Void
	local
		t1: TUPLE[STRING]
		t2: TUPLE[STRING,STRING]
		t3: TUPLE[STRING,STRING,STRING]
		t4: TUPLE[STRING,STRING,STRING,STRING]
		t5: TUPLE[STRING,STRING,STRING,STRING,STRING]
	do
		inspect a_tuple.count
		when 1 then
			t1::=a_tuple
			std_error.put_string(t1.item_1)
		when 2 then
			t2::=a_tuple
			std_error.put_string(t2.item_1) std_error.put_string(t2.item_2)
		when 3 then
			t3::=a_tuple
			std_error.put_string(t3.item_1) std_error.put_string(t3.item_2) std_error.put_string(t3.item_3)
		when 4 then
			t4::=a_tuple
			std_error.put_string(t4.item_1) std_error.put_string(t4.item_2) std_error.put_string(t4.item_3) std_error.put_string(t4.item_4)
		when 5 then
			t5::=a_tuple
			std_error.put_string(t5.item_1) std_error.put_string(t5.item_2) std_error.put_string(t5.item_3) std_error.put_string(t5.item_4) std_error.put_string(t5.item_5)
		else std_error.put_string(once "log unsupported tuple") -- nothing
		end
	end
end -- class SHARED_SETTINGS

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.

