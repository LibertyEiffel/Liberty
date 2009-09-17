-- See the Copyright notice at the end of this file.
--
deferred class REPOSITORY[O_ -> STORABLE]
	--
	-- A REPOSITORY for objects of type O_ can be viewed as a DICTIONARY[O_, STRING] (i.e. objects of type
	-- O_ are stored using key names which are actually ordinary STRINGs).
	-- Also note that stored objects of type O_ are always non-Void objects.
	--
	-- A repository is meant to be stored on a physical store (say, a stream, a file, a database and so on).
	--
	-- The only one subclass of REPOSITORY is at time being the class XML_REPOSITORY.
	--

feature {ANY} -- Getting and setting objects in the repository:
	frozen has (object_name: STRING): BOOLEAN is
			-- Is `object_name' the name of some stored object.
		require
			not object_name.is_empty
		do
			Result := repository.has(object_name)
		end

	frozen at (object_name: STRING): O_ is
			-- Return the object currently associated to `object_name'.
		require
			has(object_name)
		do
			Result := repository.at(object_name)
		ensure
			Result /= Void
		end

	frozen add (object: O_; object_name: STRING) is
			-- Update or add a new `object' in the `Current' repository.
		require
			object /= Void
			new_reference: not has(object_name)
		do
			repository.add(object, object_name)
		ensure
			reference_stored: object = at(object_name)
		end

	frozen put (object: O_; object_name: STRING) is
			-- Update or add a new `object' in the `Current' repository.
		require
			object /= Void
		do
			repository.put(object, object_name)
		ensure
			reference_stored: object = at(object_name)
		end

	remove (object_name: STRING) is
			-- Remove entry `object_name' from the `Current' repository.
		require
			has(object_name)
		do
			repository.remove(object_name)
		ensure
			not has(object_name)
		end

feature {ANY} -- Counting:
	count: INTEGER is
			-- Actual `count' of stored elements.
		do
			Result := repository.count
		end

	is_empty: BOOLEAN is
			-- Is it empty ?
		do
			Result := count = 0
		ensure
			Result = (count = 0)
		end

feature {ANY} -- Iterating facilities:
	lower: INTEGER is 1

	upper: INTEGER is
		do
			Result := count
		ensure
			Result = count
		end

	valid_index (index: INTEGER): BOOLEAN is
		do
			Result := 1 <= index and then index <= count
		ensure
			Result = index.in_range(lower, upper)
		end

	item (index: INTEGER): O_ is
		require
			valid_index(index)
		do
			Result := repository.item(index)
		ensure
			Result = at(key(index))
		end

	key (index: INTEGER): STRING is
		require
			valid_index(index)
		do
			Result := repository.key(index)
		ensure
			at(Result) = item(index)
		end

	new_iterator_on_items: ITERATOR[O_] is
		do
			Result := repository.new_iterator_on_items
		ensure
			Result /= Void
		end

	new_iterator_on_keys: ITERATOR[STRING] is
		do
			Result := repository.new_iterator_on_keys
		ensure
			Result /= Void
		end

	key_map_in (buffer: COLLECTION[STRING]) is
			-- Append in `buffer', all available keys (this may be useful to
			-- speed up the traversal).
		require
			buffer /= Void
		do
			repository.key_map_in(buffer)
		ensure
			buffer.count = count + old buffer.count
		end

	item_map_in (buffer: COLLECTION[O_]) is
			-- Append in `buffer', all available items (this may be useful to
			-- speed up the traversal).
		require
			buffer /= Void
		do
			repository.item_map_in(buffer)
		ensure
			buffer.count = count + old buffer.count
		end

feature {ANY} -- Really storing data:
	update is
			-- Update the repository objects. Get all objects from the physical store.
		require
			is_updateable
		deferred
		end

	commit is
			-- Commit all the repository objects to the physical store.
		require
			is_commitable
		deferred
		end

	is_connected: BOOLEAN is
			-- True if the repository is connected to a physical store.
		deferred
		end

	is_updateable: BOOLEAN is
			-- True if the repository can be updated from data in the physical store.
		deferred
		ensure
			Result implies is_connected
		end

	is_commitable: BOOLEAN is
			-- True if the repository can be committed to the underlying physical store.
		deferred
		ensure
			Result implies is_connected
		end

feature {} -- Implementation
	repository: DICTIONARY[O_, STRING]

	objects_are_expanded: BOOLEAN is
		local
			o: O_
		do
			Result := o /= Void
		end

invariant
	repository /= Void
	reference_storables: not objects_are_expanded

end -- class REPOSITORY
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
