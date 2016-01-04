class C_FIELD

inherit
   IDENTIFIED_NODE
   CONTEXTED_NODE
   FILED_NODE
   TYPED_NODE
   STORABLE_NODE
   WRAPPER_FEATURE

create {ANY}
   make

feature {ANY}
   store
      do
         check
            container_exists: composed_types.has(context)
         end
         -- Add Current to its container
         composed_types.at(context).fields.add_last(Current)
      end

   is_fundamental: BOOLEAN
      do
         Result := types.at(dequalify(type)).is_fundamental
      end

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN
      do
         Result := types.at(dequalify(type)).has_wrapper
      end

   wrapper_type: STRING
      do
         Result := types.at(dequalify(type)).wrapper_type
      end

   container: COMPOSED_NODE
         -- The node representing the C entity that contains Current field
      do
         if stored_parent = Void then
            stored_parent := composed_types.at(context)
         end
         Result := stored_parent
      ensure
         Result /= Void
      end

   is_to_be_emitted: BOOLEAN True
         -- all fields of a composed node will be emitted (if possible)

   wrap_on (a_stream: OUTPUT_STREAM)
      do
         not_yet_implemented
      end

   append_getter_and_setter (a_structure_name: STRING)
      require
         a_structure_name /= Void
      local
         setter, getter, eiffel_field, getter_description, setter_description: STRING
      do
         if is_public and then has_wrapper then
            eiffel_field := adapt(c_string_name, once "_field")
            setter := a_structure_name + once "_set_" + eiffel_field
            getter := a_structure_name + once "_get_" + eiffel_field
            setter.to_lower
            getter.to_lower
            -- TODO: descriptions := feature_descriptions.reference_at(a_structure_name)
            getter_description := "-- TODO: getter description%N"
            setter_description := "-- TODO: setter description%N"
            -- if descriptions /= Void then
            --    setter_description:=formatted_description(descriptions.reference_at(eiffel_field))
            --    getter_description:=formatted_description(descriptions.reference_at(eiffel_field))
            -- else setter_description:=once ""; getter_description:=once ""
            -- end
            -- log(once "Field @(1).@(2) (%"@(3)%", %"@(4)%" ",
            -- <<a_structure_name, c_field, setter_description,getter_description>>)

            queries.put_message(once "   @(1) (a_structure: POINTER): @(2) %N%
            %         -- Query for @(3) field of @(4) structure.%N%
            %         @(5)%N%
            %      external %"plug_in%"%N%
            %      alias %"{%N%
            %         location: %".%"%N%
            %         module_name: %"plugin%"%N%
            %         feature_name: %"@(1)%"%N%
            %      }%"%N%
            %      end%N%N",
            <<getter, wrapper_type, c_string_name, a_structure_name, getter_description>>)

            setters.put_message(once "   @(1) (a_structure: POINTER; a_value: @(2)) %N%
            %         -- Setter for @(3) field of @(4) structure.%N%
            %         @(5)%N%
            %      external %"plug_in%"%N%
            %      alias %"{%N%
            %         location: %".%"%N%
            %         module_name: %"plugin%"%N%
            %         feature_name: %"@(1)%"%N%
            %      }%"%N%
            %      end%N%N",
            <<setter, wrapper_type, c_string_name, a_structure_name, setter_description>>)
            -- log_string(once "command, ")
            -- -- Note: Type safety is assured by Eiffel and GCC-XML so we can
            -- -- be less type-strict-paranoid here and use some type-casts.
            -- TODO: the next print_on commands cause compiler crash if
            -- they operate on a ROPE, made using the "|" operator instead
            -- of +.

            ("#define " + getter + "(a_structure) (((" + container.c_type + " " + container.c_string_name + "*) (a_structure))->" + c_string_name + ")%N%N").print_on(include)
            ("#define " + setter + "(a_structure,a_value) do {(((" + container.c_type + " " + container.c_string_name + "*)(a_structure)))->" + c_string_name + " = (a_value);}while(0)%N%N").print_on(include)
         else
            log(once "Field @(1) in structure @(2)  not wrappable.",
            <<c_string_name, a_structure_name>>)
            queries.put_message(once "%T-- Unwrappable field @(1).%N",
            <<c_string_name>>)
         end
      end

feature {} -- Implementation
   stored_parent: COMPOSED_NODE

end -- class C_FIELD
-- Copyright (C) 2008-2016: ,2009,2010 Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
