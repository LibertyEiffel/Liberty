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
class LIBERTY_FEATURE_DEFINITION

inherit
	LIBERTY_ENTITY
		redefine copy, out_in_tagged_out_memory
		end

insert
	LIBERTY_REACHABLE
		redefine
			copy, out_in_tagged_out_memory
		end

creation {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	feature_name: LIBERTY_FEATURE_NAME
	creation_clients: TRAVERSABLE[LIBERTY_TYPE]
	clients: TRAVERSABLE[LIBERTY_TYPE]
	is_frozen: BOOLEAN
	the_feature: LIBERTY_FEATURE

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "feature definition: ")
			feature_name.out_in_tagged_out_memory
		end

	name: FIXED_STRING is
		do
			Result := feature_name.name
		end

	is_regular: BOOLEAN is
		do
			Result := feature_name.is_regular
		end

	is_prefix: BOOLEAN is
		do
			Result := feature_name.is_prefix
		end

	is_infix: BOOLEAN is
		do
			Result := feature_name.is_infix
		end

	is_creation: BOOLEAN is
		do
			Result := creation_clients /= Void
		end

	result_type: LIBERTY_TYPE is
		do
			if the_feature /= Void then
				Result := the_feature.result_type
			else
				-- should not happen??
				not_yet_implemented
			end
		end

	copy (other: like Current) is
		do
			feature_name := other.feature_name
			clients := other.clients.twin
			is_frozen := other.is_frozen
			the_feature := other.the_feature
		end

feature {LIBERTY_UNIVERSE}
	set_reachable (mark: like reachable_mark) is
		do
			if not is_reachable then
				debug
					std_output.put_string(once "Marked reachable the feature definition: ")
					std_output.put_line(feature_name.name)
				end
				torch.burn
			end

			if reachable_mark < mark then
				reachable_mark := mark
				if the_feature /= Void then
					the_feature.mark_reachable_code(mark)
				end
			end
		end

feature {LIBERTY_REACHABLE_MARKER, LIBERTY_REACHABLE_MARKER_AGENT}
	mark_reachable_code (mark: INTEGER) is
		do
			set_reachable(mark)
		end

feature {ANY}
	debug_display (o: OUTPUT_STREAM) is
		do
			o.put_string(once "   feature ")
			debug_clients(o, clients)
			if is_creation then
				o.put_string(once " create ")
				debug_clients(o, creation_clients)
			end
			if is_frozen then
				o.put_string(once " frozen")
			end
			if is_prefix then
				o.put_string(once " prefix ")
			elseif is_infix then
				o.put_string(once " infix ")
			else
				o.put_character(' ')
			end
			o.put_string(name.out)
			if the_feature = Void then
				o.put_line(once " is not yet attached")
			else
				o.put_line(once " is")
				the_feature.debug_display(o, 2)
				o.put_line(once "      end")
			end
		end

feature {}
	debug_clients (o: OUTPUT_STREAM; c: like clients) is
		local
			i: INTEGER
		do
			o.put_character('{')
			from
				i := c.lower
			until
				i > c.upper
			loop
				o.put_string(c.item(i).full_name.out)
				if i < c.upper then
					o.put_string(once ", ")
				end
				i := i + 1
			end
			o.put_character('}')
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	set_name (a_name: like feature_name) is
		require
			a_name /= Void
		do
			feature_name := a_name
		ensure
			feature_name = a_name
		end

	set_clients (a_clients: like clients) is
		require
			a_clients /= Void
		do
			clients := a_clients
		ensure
			clients = a_clients
		end

	set_the_feature (a_feature: like the_feature) is
		require
			a_feature /= Void
		do
			the_feature := a_feature
		ensure
			the_feature = a_feature
		end

	set_creation_clients (a_creation_clients: like creation_clients) is
		require
			a_creation_clients /= Void
		do
			creation_clients := a_creation_clients
		ensure
			is_creation
			creation_clients = a_creation_clients
		end

	join (fd: like Current; a_type: LIBERTY_ACTUAL_TYPE) is
		require
			fd /= Void
			fd.has_precursor(a_type)
		do
			if not same_clients(fd.clients) then
				--| *** TODO: warning: the inherited features don't have the same export clauses (the second set
				--| is ignored)
			end
			if fd.the_feature /= Void then
				if the_feature = Void then
					the_feature := fd.the_feature
				elseif the_feature /= fd.the_feature then
					the_feature := the_feature.join(fd.the_feature, Current, fd)
				end
			end
			if not has_precursor(a_type) then
				add_precursor(fd.precursor_feature(a_type), a_type)
			else
				check
					precursor_feature(a_type) = fd.precursor_feature(a_type)
				end
			end
		end

feature {LIBERTY_FEATURE, LIBERTY_FEATURE_DEFINITION}
	fatal_join_error_redefined_concrete (with: LIBERTY_FEATURE_DEFINITION) is
		do
			debug
				std_output.put_string(once "Cannot join redefined feature ")
				std_output.put_string(feature_name.name)
				std_output.put_string(once " with concrete feature ")
				std_output.put_line(with.feature_name.name)
				sedb_breakpoint
			end
			not_yet_implemented
		ensure
			errors.has_error
		end

	fatal_join_error_concrete_redefined (with: LIBERTY_FEATURE_DEFINITION) is
		do
			with.fatal_join_error_redefined_concrete(Current)
		ensure
			errors.has_error
		end

	fatal_join_error_concrete_concrete (with: LIBERTY_FEATURE_DEFINITION) is
		do
			debug
				std_output.put_string(once "Cannot join concrete feature ")
				std_output.put_string(feature_name.name)
				std_output.put_string(once " with concrete feature ")
				std_output.put_line(with.feature_name.name)
				sedb_breakpoint
			end
			not_yet_implemented
		ensure
			errors.has_error
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_FEATURE_DEFINITION}
	add_precursor (a_precursor_feature: LIBERTY_FEATURE; a_precursor_type: LIBERTY_ACTUAL_TYPE) is
		require
			not has_precursor(a_precursor_type)
		do
			if precursors = Void then
				create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]} precursors.make
			end
			precursors.add(a_precursor_feature, a_precursor_type)
			torch.burn
		ensure
			precursor_feature(a_precursor_type) = a_precursor_feature
		end

	has_precursor (a_precursor_type: LIBERTY_ACTUAL_TYPE): BOOLEAN is
		do
			if precursors /= Void then
				if a_precursor_type /= Void then
					Result := precursors.has(a_precursor_type)
				else
					Result := precursors.count = 1
				end
			end
		end

	precursor_feature (a_precursor_type: LIBERTY_ACTUAL_TYPE): LIBERTY_FEATURE is
		require
			has_precursor(a_precursor_type)
		do
			if a_precursor_type /= Void then
				Result := precursors.at(a_precursor_type)
			else
				Result := precursors.first
			end
		end

feature {}
	same_clients (a_clients: like clients): BOOLEAN is
		do
			Result := clients.count = a_clients.count
				and then include(clients, a_clients)
				and then include(a_clients, clients)
		end

	include (set, subset: like clients): BOOLEAN is
		local
			i, j: INTEGER
		do
			from
				Result := set.count >= subset.count
				i := subset.lower
			until
				not Result or else i > subset.upper
			loop
				from
					Result := False
					j := set.lower
				until
					Result or else j > set.upper
				loop
					Result := set.item(j) = subset.item(i)
					j := j + 1
				end
				i := i + 1
			end
		end

feature {}
	make (a_name: like feature_name; a_clients: like clients; a_frozen: like is_frozen; a_position: like position) is
		require
			a_name /= Void
			a_clients /= Void
			a_position /= Void
		do
			feature_name := a_name
			clients := a_clients
			is_frozen := a_frozen
			position := a_position
		ensure
			feature_name = a_name
			clients = a_clients
			is_frozen = a_frozen
			position = a_position
		end

	precursors: DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]

	torch: LIBERTY_ENLIGHTENING_THE_WORLD

	errors: LIBERTY_ERRORS

invariant
	feature_name /= Void
	clients /= Void

end
