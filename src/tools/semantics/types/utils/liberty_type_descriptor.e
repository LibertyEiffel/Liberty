-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_TYPE_DESCRIPTOR

inherit
	LIBERTY_TYPE_LISTENER
		redefine
			copy, is_equal
		end

insert
	HASHABLE
		redefine
			copy
		end

create {ANY}
	make

feature {ANY}
	file: FIXED_STRING
	parameters: TRAVERSABLE[LIBERTY_TYPE]

	cluster: LIBERTY_CLUSTER is
		do
			Result := class_descriptor.cluster
		end

	name: FIXED_STRING is
		do
			Result := class_descriptor.name
		end

	position: LIBERTY_POSITION is
		do
			Result := class_descriptor.position
		end

feature {ANY}
	hash_code: INTEGER

	is_equal (other: like Current): BOOLEAN is
		do
			if hash_code = other.hash_code then
				Result := same_as(other)
			end
		end

	same_as (other: like Current): BOOLEAN is
		local
			i, o: INTEGER
		do
			Result := class_descriptor.is_equal(other.class_descriptor) and then other.parameters.count = parameters.count
			from
				i := parameters.lower
			until
				not Result or else i > parameters.upper
			loop
				o := i - parameters.lower + other.parameters.lower
				Result := parameters.item(i) = other.parameters.item(o)
				i := i + 1
			end
		end

	copy (other: like Current) is
		do
			class_descriptor := other.class_descriptor.twin
			parameters := other.parameters
		end

feature {LIBERTY_TYPE_DESCRIPTOR_CHANGE_LISTENER}
	add_change_listener (a_listener: LIBERTY_TYPE_DESCRIPTOR_CHANGE_LISTENER) is
		require
			a_listener /= Void
			not has_change_listener(a_listener)
		do
			change_listeners.add_last(a_listener)
		ensure
			has_change_listener(a_listener)
		end

	remove_change_listener (a_listener: LIBERTY_TYPE_DESCRIPTOR_CHANGE_LISTENER) is
		require
			a_listener /= Void
			has_change_listener(a_listener)
		do
			change_listeners.remove(change_listeners.fast_first_index_of(a_listener))
		ensure
			not has_change_listener(a_listener)
		end

	has_change_listener (a_listener: LIBERTY_TYPE_DESCRIPTOR_CHANGE_LISTENER): BOOLEAN is
		require
			a_listener /= Void
		do
			Result := change_listeners.fast_has(a_listener)
		end

feature {}
	make (a_class_descriptor: like class_descriptor; a_parameters: like parameters) is
		require
			a_class_descriptor /= Void
			a_parameters /= Void
		do
			class_descriptor := a_class_descriptor
			parameters := a_parameters
			file := a_class_descriptor.file
			create {FAST_ARRAY[LIBERTY_TYPE_DESCRIPTOR_CHANGE_LISTENER]} change_listeners.with_capacity(2)
			compute_hash_code
			listen_to_parameters
		ensure
			class_descriptor = a_class_descriptor
			parameters = a_parameters
		end

	change_listeners: COLLECTION[LIBERTY_TYPE_DESCRIPTOR_CHANGE_LISTENER]

feature {}
	compute_hash_code is
		local
			i, h: INTEGER
		do
			h := class_descriptor.hash_code
			from
				i := parameters.lower
			until
				i > parameters.upper
			loop
				h := h #*31 #+ parameters.item(i).hash_code
				i := i + 1
			end
			if h > 0 then
				hash_code := h
			else
				hash_code := ~h
			end
		end

	listen_to_parameters is
		local
			i: INTEGER
		do
			from
				i := parameters.lower
			until
				i > parameters.upper
			loop
				if not parameters.item(i).is_actual_type_set then
					parameters.item(i).add_listener(Current)
				end
				i := i + 1
			end
		end

	fire_type_descriptor_changed is
		local
			i: INTEGER
		do
			from
				i := change_listeners.lower
			until
				i > change_listeners.upper
			loop
				change_listeners.item(i).on_type_descriptor_changed(Current)
				i := i + 1
			end
		end

feature {LIBERTY_TYPE}
	on_actual_type_set (t: LIBERTY_TYPE) is
		do
			fire_type_descriptor_changed
		end

feature {LIBERTY_TYPE_DESCRIPTOR}
	class_descriptor: LIBERTY_CLASS_DESCRIPTOR

invariant
	file /= Void
	parameters /= Void
	change_listeners /= Void

end
