class C_FIELD

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	CONTEXTED_NODE
	FILED_NODE
	TYPED_NODE
	STORABLE_NODE

creation make

feature 
	store is
		local a_container: COMPOSED_NODE
		do
			a_container := composed_types.reference_at(context)
			if a_container/=Void then
				a_container.fields.add_last(Current)
			end
		end
	
	is_fundamental: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).is_fundamental
		end

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is
		do
			Result:=types.at(dequalify(type)).has_wrapper
		end

	wrapper_type: STRING is
		do
			Result:=types.at(dequalify(type)).wrapper_type
		end

	container: COMPOSED_NODE is
		-- The node representing the C entity that contains Current field
	do
		if stored_parent=Void then
			stored_parent := composed_types.at(context)
		end
		Result:=stored_parent
	ensure Result/=Void
	end
	
	append_getter_and_setter (a_structure_name: STRING) is
		require a_structure_name/=Void
		local setter, getter, eiffel_field, getter_description, setter_description: STRING
		do
			if has_wrapper then
				eiffel_field := adapt(c_string_name)
				setter := a_structure_name + once "_set_" + eiffel_field
				getter := a_structure_name + once "_get_" + eiffel_field
				setter.to_lower
				getter.to_lower
				-- TODO: descriptions := feature_descriptions.reference_at(a_structure_name)	
				getter_description:="-- TODO: getter description%N"
				setter_description:="-- TODO: setter description%N"
				-- if descriptions /= Void then
				-- 	setter_description:=formatted_description(descriptions.reference_at(eiffel_field))
				-- 	getter_description:=formatted_description(descriptions.reference_at(eiffel_field))
				-- else setter_description:=once ""; getter_description:=once ""
				-- end
				-- log(once "Field @(1).@(2) (%"@(3)%", %"@(4)%" ",
				-- <<a_structure_name, c_field, setter_description,getter_description>>)
				queries.put_message(once "	@(1) (a_structure: POINTER): @(2) is%N%
				%			-- Query for @(3) field of @(4) structure.%N%
				%			@(5)%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %".%"%N%
				%			module_name: %"plugin%"%N%
				%			feature_name: %"@(1)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<getter, wrapper_type, 
				c_string_name, a_structure_name,
				getter_description>>)
				setters.put_message(once "	@(1) (a_structure: POINTER; a_value: @(2)) is%N%
				%			-- Setter for @(3) field of @(4) structure.%N%
				%			@(5)%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %".%"%N%
				%			module_name: %"plugin%"%N%
				%			feature_name: %"@(1)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<setter, wrapper_type,
				c_string_name, a_structure_name,
				setter_description>>)
				-- log_string(once "command, ")
				-- -- Note: Type safety is assured by Eiffel and GCC-XML so we can
				-- -- be less type-strict-paranoid here and use some type-casts.

				-- TODO: the next print_on commands cause compiler crash if
				-- they operate on a ROPE, made using the "|" operator instead
				-- of +.
				("#define "+getter+"(a_structure) ((("+container.c_type+" "+container.c_string_name+"*) (a_structure))->"+c_string_name+")%N%N").print_on(include)
				("#define "+setter+"(a_structure,a_value) ((("+container.c_type+" "+container.c_string_name+"*)(a_structur)e)))->"+c_string_name+" = a_value;%N%N").print_on(include)
			else
				log(once "Field @(1) in structure @(2) is not wrappable.", <<c_string_name, a_structure_name>>)
				queries.put_message(once "%T-- Unwrappable field @(1).%N", <<c_string_name>>)
			end
		end

feature {} -- Implementation
	stored_parent: COMPOSED_NODE 
end -- class C_FIELD

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
