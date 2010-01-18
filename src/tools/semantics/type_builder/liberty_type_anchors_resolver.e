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
class LIBERTY_TYPE_ANCHORS_RESOLVER
--
-- Loads the type's parents, but also initializes general type information such as obsolete, deferred and so
-- on
--

insert
	LIBERTY_TYPE_BUILDER_TOOLS

creation {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_builder: like builder; a_type: like type; a_universe: like universe;
		a_effective_generic_parameters: like effective_generic_parameters;
		a_anchored_types: like anchored_types) is
		require
			a_builder /= Void
			a_type /= Void
			a_universe /= Void
			a_anchored_types /= Void
		do
			builder := a_builder
			type := a_type
			universe := a_universe
			effective_generic_parameters := a_effective_generic_parameters
			anchored_types := a_anchored_types
		ensure
			builder = a_builder
			type = a_type
			universe = a_universe
			effective_generic_parameters = a_effective_generic_parameters
			anchored_types = a_anchored_types
		end

feature {LIBERTY_TYPE_BUILDER}
	resolve_anchors: BOOLEAN is
		local
			i: INTEGER; anchored_type: LIBERTY_ANCHORED_TYPE
		do
			from
				Result := True
				i := anchored_types.lower
			until
				i > anchored_types.upper
			loop
				anchored_type := anchored_types.item(i)
				if anchored_type.type /= Void then
					heart_beat.beat
					anchored_types.remove(i)
				else
					Result := False
				end
				i := i + 1
			end
		end

feature {}
	anchored_types: COLLECTION[LIBERTY_ANCHORED_TYPE]

invariant
	anchored_types /= Void

end -- class LIBERTY_TYPE_ANCHORS_RESOLVER
