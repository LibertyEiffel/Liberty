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
class LIBERTY_DELAYED_TYPE_DEFINITION

inherit
	LIBERTY_DELAYED_RESOLVER

insert
	EIFFEL_NODE_HANDLER
		redefine out_in_tagged_out_memory, is_equal
		end

creation {LIBERTY_TYPE_RESOLVER, LIBERTY_DELAYED_TYPE_DEFINITION}
	make

feature {ANY}
	out_in_tagged_out_memory is
		do
			if can_resolve then
				resolved.out_in_tagged_out_memory
			else
				tagged_out_memory.extend('"')
				full_name_memory.out_in_tagged_out_memory
				tagged_out_memory.append(once "%" using ")
				resolver.out_in_tagged_out_memory
			end
		end

	hash_code: INTEGER is
		do
			Result := full_name_memory.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other = Current
		end

feature {LIBERTY_DELAYED_TYPE}
	can_resolve: BOOLEAN is
		do
			if type_memory /= Void then
				Result := True
			else
				type_memory ::= resolver.undelayed_type(type_definition)
				Result := type_memory /= Void
				debug
					if Result then
						log.trace.put_string(once " >>> Resolved ")
						log.trace.put_string(full_name_memory)
						log.trace.put_string(once " => ")
						log.trace.put_line(type_memory.out)
					end
				end
			end
		ensure
			Result implies type_memory /= Void
		end

	resolved: LIBERTY_KNOWN_TYPE is
		local
			ok: BOOLEAN
		do
			ok := can_resolve
			check
				ok
				type_memory /= Void
			end
			Result := type_memory
		end

	full_name: FIXED_STRING is
		do
			Result := full_name_memory
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			r: like resolver
		do
			r := resolver.specialized_in(a_type)
			if r = resolver then
				Result := Current
			else
				--|*** TODO: ??? Not sure about that. Maybe we should keep track of the original type to find the
				--| good entity (esp. in case of renamings).
				--| Then again, maybe the resolver should do that.
				create Result.make(type_definition, r)
			end
		end

feature {}
	make (a_type_definition: like type_definition; a_resolver: like resolver) is
		require
			a_type_definition /= Void
			a_resolver /= Void
		do
			type_definition := a_type_definition
			resolver := a_resolver
			create_full_name_memory
		ensure
			type_definition = a_type_definition
			resolver = a_resolver
		end

	type_definition: LIBERTY_AST_TYPE_DEFINITION
	resolver: LIBERTY_TYPE_RESOLVER
	type_memory: LIBERTY_ACTUAL_TYPE

	create_full_name_memory is
		do
			buffer_stream.clear
			type_definition.generate(buffer_stream)
			full_name_memory := buffer_stream.to_string.intern
		ensure
			full_name_memory /= Void
		end

	buffer_stream: STRING_OUTPUT_STREAM is
		once
			create Result.make
		end

	full_name_memory: FIXED_STRING

end -- class LIBERTY_DELAYED_TYPE_DEFINITION
