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
		redefine
			copy
		end

creation {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	feature_name: LIBERTY_FEATURE_NAME
	clients: TRAVERSABLE[LIBERTY_TYPE]
	is_frozen: BOOLEAN
	the_feature: LIBERTY_FEATURE

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

	result_type: LIBERTY_TYPE is
		do
			Result := the_feature.result_type
		end

	copy (other: like Current) is
		do
			feature_name := other.feature_name
			clients := other.clients.twin
			is_frozen := other.is_frozen
			the_feature := other.the_feature
		end

	is_result_type_set: BOOLEAN is
		do
			Result := the_feature /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
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
			is_result_type_set
		end

	join (fd: like Current; a_type: LIBERTY_TYPE) is
		require
			fd /= Void
			fd.has_precursor(a_type)
		local
			i: INTEGER
		do
			if not same_clients(fd.clients) then
				--| *** WARNING: the inherited features don't have the same export clauses (the second set is
				--| ignored)
			end
			if fd.the_feature /= Void then
				if the_feature = Void then
					the_feature := fd.the_feature
				else
					the_feature := the_feature.join(fd.the_feature)
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

feature {LIBERTY_TYPE_BUILDER, LIBERTY_FEATURE_DEFINITION}
	add_precursor (a_precursor_feature: LIBERTY_FEATURE; a_precursor_type: LIBERTY_TYPE) is
		require
			not has_precursor(a_precursor_type)
		do
			if precursors = Void then
				create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_TYPE]} precursors.make
			end
			precursors.add(a_precursor_feature, a_precursor_type)
		ensure
			precursor_feature(a_precursor_type) = a_precursor_feature
		end

	has_precursor (a_precursor_type: LIBERTY_TYPE): BOOLEAN is
		do
			if precursors /= Void then
				Result := precursors.has(a_precursor_type)
			end
		end

	precursor_feature (a_precursor_type: LIBERTY_TYPE): LIBERTY_FEATURE is
		require
			has_precursor(a_precursor_type)
		do
			Result := precursors.at(a_precursor_type)
		end

feature {}
	same_clients (a_clients: like clients): BOOLEAN is
		do
			Result := include(clients, a_clients) and then include(a_clients, clients)
		end

	include (set, subset: like clients): BOOLEAN is
		local
			i, j: INTEGER
		do
			from
				Result := True
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
	make (a_name: like feature_name; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			feature_name := a_name
			clients := a_clients
			is_frozen := a_frozen
		ensure
			feature_name = a_name
			clients = a_clients
			is_frozen = a_frozen
		end

	precursors: DICTIONARY[LIBERTY_FEATURE, LIBERTY_TYPE]

invariant
	feature_name /= Void
	clients /= Void

end
