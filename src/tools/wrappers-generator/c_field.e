class C_FIELD

inherit
   IDENTIFIED_NODE
   CONTEXTED_NODE
   FILED_NODE
   TYPED_NODE
   STORABLE_NODE
   WRAPPER_FEATURE

create {GCCXML_TREE}
   make

feature {ANY}
   store
      local
         container_type: COMPOSED_NODE
      do
         container_type := composed_types.reference_at(context)
         if container_type /= Void then
            -- Add Current to its container
            container_type.fields.add_last(Current)
         else
            -- Fields may be part of a composed type that will be not be wrapped, for example PThread structures when wrapping GObject introspection facilities. Therefore its container will not be present in the composed types!
            log("Ignoring field #(1) of #(2) in %"#(3)%"%N" # c_string_name # context.to_utf8)
         end
      end

   is_fundamental: BOOLEAN
      do
         Result := types.at(dequalify(type)).is_fundamental
      end

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN
      local field_type: C_TYPE
      do
          -- You may want to write "Result := types.at(dequalify(type)).has_wrapper" but that's simplicistic
          field_type := types.reference_at(dequalify(type))
          if field_type/=Void then
              Result:=field_type.has_wrapper
          end
      rescue
          log("C_FIELD.has_wrapper failed%N")
          print_run_time_stack
          die_with_code (exit_failure_code)
          -- if type/=Void then
          --     field_type := types.at(dequalify(type))
          --     if field_type /= Void then
          --         Result := field_type.has_wrapper
          --     else
          --         log(once "Warning: C field #(1) in line  #(2) is of an unknown type!%N"
          --         # c_string_name # &line )
          --         Result := False
          --     end
          -- else
          --     log(once "Warning: C field #(1) in line #(2) is typeless!%N"
          --     # c_string_name # &line )
          --     Result := False
          -- end
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
         setter, getter, getter_description, setter_description: STRING; eiffel_field: ABSTRACT_STRING
      do
		  if is_anonymous then
			  log(once "Anonymous field in #(1) at line #(2): not wrappable." # a_structure_name # &line_row)
			  queries.append(once "%T-- Anonymous field at line #(1).%N" # &line_row)
		  elseif not is_public then
			  log(once "Private field #(1) in #(2) not wrapped." # c_string_name # a_structure_name)
			  queries.append(once "%T-- Unwrapped private field #(1).%N" # c_string_name)
		  elseif not has_wrapper then
			  log(once "Field #(1) in #(2) doesn't have a wrapper.%N" # c_string_name # a_structure_name)
			  queries.append(once "%T-- Unwrappable field #(1).%N"#c_string_name)
			  -- doesn't have a valid wrapper
		  else -- we can actually wrap it
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
            -- log(once "Field #(1).#(2) (%"#(3)%", %"#(4)%" " #
            -- a_structure_name # c_field # setter_description # getter_description)

            queries.append(once "   #(1) (a_structure: POINTER): #(2) %N%
            %         -- Query for #(3) field of #(4) structure.%N%
            %         #(5)%N%
            %      external %"plug_in%"%N%
            %      alias %"{%N%
            %         location: %".%"%N%
            %         module_name: %"plugin%"%N%
            %         feature_name: %"#(1)%"%N%
            %      }%"%N%
            %      end%N%N" # getter # wrapper_type #  c_string_name # a_structure_name
			# getter_description)

            setters.append(once "   #(1) (a_structure: POINTER; a_value: #(2)) %N%
            %         -- Setter for #(3) field of #(4) structure.%N%
            %         #(5)%N%
            %      external %"plug_in%"%N%
            %      alias %"{%N%
            %         location: %".%"%N%
            %         module_name: %"plugin%"%N%
            %         feature_name: %"#(1)%"%N%
            %      }%"%N%
            %      end%N%N" # setter # wrapper_type # c_string_name # a_structure_name # setter_description)
            -- log(once "command, ")
            -- -- Note: Type safety is assured by Eiffel and GCC-XML so we can
            -- -- be less type-strict-paranoid here and use some type-casts.
            -- TODO: the next print_on commands cause compiler crash if
            -- they operate on a ROPE, made using the "|" operator instead
            -- of +.

            ("#define #(1)(a_structure) (((#(2) #(3)*) (a_structure))->#(4))%N%N"
			# getter # container.c_type # container.c_string_name 
			# c_string_name).print_on(include)
            -- the above line previously was written, rather unreadably like this ("#define " + getter + "(a_structure) (((" + container.c_type + " " + container.c_string_name + "*) (a_structure))->" + c_string_name + ")%N%N").print_on(include)
            ("#define #(1)(a_structure,a_value) do {(((#(2) #(3)*)(a_structure)))->#(4) = (a_value);}while(0)%N%N"
			# setter # container.c_type # container.c_string_name
			# c_string_name).print_on(include)
            -- the above line previously was written, rather unreadably like this  ("#define " + setter + "(a_structure,a_value) do {(((" + container.c_type + " " + container.c_string_name + "*)(a_structure)))->" + c_string_name + " = (a_value);}while(0)%N%N").print_on(include)
		end
      end

feature {} -- Implementation
   stored_parent: COMPOSED_NODE

end -- class C_FIELD

-- Copyright (C) 2008-2022: Paolo Redaelli

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
