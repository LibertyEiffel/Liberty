class C_VARIABLE
inherit 
	CONTEXTED_NODE
	IDENTIFIED_NODE
	MOVABLE_NODE
	STORABLE_NODE
	TYPED_NODE
	WRAPPER_FEATURE

creation make
feature 
	store is
		do
			symbols.put(Current,c_string_name)
			variables.add_first(Current)
		end

	is_to_be_emitted: BOOLEAN is
		do
			Result:= (is_public or has_assigned_name) and then namespace.is_main and then 
			(global or else headers.has(c_file.c_string_name))
		end

	wrap_on (a_stream: OUTPUT_STREAM) is 
        do
			if not has_wrapper then
				log("Variable `@(1)' does not have a wrapper type (address of query emitted anyway)%N", <<c_string_name>>) 
				buffer.reset
				buffer.put_message(once "	-- Variable @(1) (at line @(2) in file @(3) does not have a wrapper type%N",
				<<c_string_name, line_row.to_utf8, c_file.c_string_name>>)
				-- TODO: provide the reason; using developer_exception_name
				-- triggers some recursion bug AFAIK. Paolo 2009-10-02
				buffer.put_message(once "%Taddress_of_@(1): POINTER is%N%
				% 		-- Address of @(1) (node at line @(2))%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %".%"%N%
				%			module_name: %"plugin%"%N%
				%			feature_name: %"&@(3)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<eiffel_feature(c_string_name), line_row.to_utf8, c_string_name>>)

			elseif not is_public then
				log(once "Skipping 'hidden' variable `@(1)'%N", <<c_string_name>>)
				buffer.put_message(once "%T-- `hidden' variable @(1) skipped.%N",<<c_string_name>>)
			elseif not namespace.is_main then
				log(once "Skipping variable `@(1)' belonging to namespace @(2)%N",
				<<c_string_name, namespace.c_string_name>>)
				buffer.put_message(once "%T-- variable @(1) in namespace @(2) skipped.%N",
				<<c_string_name, namespace.c_string_name>>)
			else
				log(once "Variable @(1)%N",<<c_string_name>>)
				buffer.put_message(once "%T@(1): @(2) is%N%
				% 		-- @(1) (node at line @(3))%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %".%"%N%
				%			module_name: %"plugin%"%N%
				%			feature_name: %"@(4)%"%N%
				%		}%"%N%
				%		end%N%
				%%N%
				%	address_of_@(1): POINTER is%N%
				% 		-- Address of @(1) (node at line @(3))%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %".%"%N%
				%			module_name: %"plugin%"%N%
				%			feature_name: %"&@(4)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<eiffel_feature(c_string_name), wrapper_type, 
				line_row.to_utf8, c_string_name>>)
				-- TODO append description 
			end
			buffer.print_on(a_stream)
		end

	is_void: BOOLEAN is False
	
 	wrapper_type: STRING is
		do
			Result:=types.at(dequalify(type)).wrapper_type
		end


	has_wrapper: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).has_wrapper
		end

	is_fundamental: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).is_fundamental
		end
end -- class C_VARIABLE

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
