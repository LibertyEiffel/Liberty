class C_TYPEDEF

inherit 
	CONTEXTED_NODE
	FILED_NODE
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	STORABLE_NODE
	TYPED_NODE
	WRAPPABLE_NODE

creation make

feature 
	store is
		do
			typedefs.fast_put(Current,id)
			types.fast_put(Current,id)
		end

	wrapper_type: STRING is
		do
			if referree.has_wrapper 
				then Result := referree.wrapper_type
			else not_yet_implemented
			end
		end

	is_fundamental: BOOLEAN is
		do
			Result := types.at(type).is_fundamental
		end

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is
		do
			Result := types.at(type).has_wrapper
		end

	wrap_on (a_stream: OUTPUT_STREAM) is
		-- If Current ultimately refers to a fundamental type then put an empty query on `a_stream', otherwise nothing is done.
	local query_name: STRING
	do
		if is_public and then is_in_main_namespace then
			-- Note: here I used "and then" with progressively more complicated
			-- queries; `is_public' is fast, `is_in_main_namespace' quite fast
			-- and `is_fundamental' quite slow; using "and then" allows the
			-- program not to compute the costly `is_fundamental' is either one
			-- of the first two are False.
			if is_fundamental then
				if has_wrapper then
					query_name := eiffel_feature(c_string_name)
					log(once "Anchored query @(2) for typedef @(1)%N",<<c_string_name,query_name>>)
					buffer.put_message (once 
					"	@(1): @(2) is%N%
					%		-- typedef @(3)%N%
					%		-- Empty by design, used for anchored declarations.%N%
					%	do%N%
					%	ensure Result.is_default%N%
					%	end%N%
					%%N", <<query_name, wrapper_type, c_string_name>>)
				else 
					buffer.put_message (once "%T-- @(1) unwrappable: no wrapper type.%N", <<c_string_name>>)
					-- TODO: add the case of typedef to void
				end
				buffer.print_on(a_stream)
			else
				-- It refers to something else; let's assign it a name
				referree.set_name(eiffel_feature(c_string_name))
			end
		end
	end

-- invariant name.is_equal(once U"Typedef")
end -- class C_TYPEDEF

-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
