class C_ENUM_VALUE

inherit
   GCCXML_NODE
   NAMED_NODE
      redefine eiffel_name
      end

insert
   SHARED_COLLECTIONS
   NAME_CONVERTER

create {GCCXML_TREE}
   make

feature {ANY}
   value: STRING
         -- The numeric value of Current
      do
         Result := attribute_at(once U"init").to_utf8
      end

   eiffel_name: STRING
         -- The eiffel name of the value. Clash with reserved words and with feature name of class ANY are avoided adding the suffix "_value" when Result will be used to form getter feature names (i.e. "_....")
      local
         enum: C_ENUM; get: STRING
      do
         if stored_eiffel_name = Void then
            --print("Enum value: ")
            stored_eiffel_name := c_name.to_utf8
            -- print(stored_eiffel_name)

            enum ?= parent
            if enum /= Void then
               if enum.longest_prefix > 0 then
                  -- this further test may be buggy and enum.prefix_length < c_string_name.count then
                  stored_eiffel_name.remove_head(enum.longest_prefix)
               else
                   log("#(1) enumeration values: value '#(2)' (at line #(3)) is the longest prefix: keeping name to avoid problems%N"
	                  # enum.values.count.to_string # c_string_name # line.out)
               end
            else log("The parent of C_ENUM_VALUE at line #(1) not a C_ENUM!%N" # line.out)
            end

            stored_eiffel_name := eiffel_feature(stored_eiffel_name)

            get := once "_" + stored_eiffel_name
            if any_features.has(get) then
               -- The getter formed with Current will clash with a feature of class ANY; let's escape it
               stored_eiffel_name := stored_eiffel_name + once "_value"
            end
         end
         Result := stored_eiffel_name
      end

feature {ANY} -- Plain enumeration
   append_to_buffers
         -- Append in `setters' the text of a command to set the enumeration
         -- currently being emitted to the value of Current C_ENUM_VALUE for an
         -- enumeration value with `a_name' with a low level value `a_value'.
         -- Append in `queries' the text of a query for an enumeration value
         -- with `a_name' with a low level value `a_value'.
      do
         log(once "enum item #(1) wrapped as #(2)%N" # c_string_name # eiffel_name)
         -- Append to `validity_query' the part of the comparon dealing with
         -- Current value, i.e. "(a_value = FooBarOne)"....

         validity_query.append (once "(a_value = #(1)_low_level) " # eiffel_name)
         -- append_enum setter
         setters.append(once "%Tset_#(1)%N%
                %               do%N%
                %                       value := #(1)_low_level%N%
                %               end%N%N" # eiffel_name)
         -- TODO: formatted_description(feature_description(class_name,setter_name))
         -- Append enum query

         queries.append(once "       is_#(1): BOOLEAN%N%
                %               do%N%
                %                       Result := (value=#(1)_low_level)%N%
                %               end%N%N" # eiffel_name)
         -- TODO: add formatted_description(feature_description(class_name,getter_name)),
         -- Append in `low_level_values' a declaration labelled
         -- `an_eiffel_value' to access `a_low_level_value' found in
         -- `a_file_name'

         low_level_values.append(once "     #(1)_low_level: INTEGER%N%
                %               external %"plug_in%"%N%
                %               alias %"{%N%
                %                       location: %".%"%N%
                %                       module_name: %"plugin%"%N%
                %                       feature_name: %"#(2)%"%N%
                %                       }%"%N%
                %               end%N%N" # eiffel_name # c_string_name)
      end

feature {ANY} -- "Flag" enumeration
   append_as_flag_to_buffers
         -- Append in `setters' the text of setter and unsetter commands for the Current value of the enumeration currently being emitted.
         -- Append in `queries' the text of a query to see if Current value is set
         --and a low level value
         -- `a_value'.
      do
         log(once "flag item #(1) wrapped as #(2)%N" # 
		 	c_string_name # eiffel_name)
         -- Append to `validity_query' the part of the comparon dealing with
         -- Current value, i.e. "(a_value = FooBarOne)"....

         validity_query.append(once "#(1)_low_level" # eiffel_name)
         -- append_enum setter
         setters.append(once "%Tset_#(1)%N%
                %               do%N%
                %                       value := value.bit_or(#(1)_low_level)%N%
                %               end%N%
                %%N%
                %%Tunset_#(1)%N%
                %               do%N%
                %                       value := value.bit_xor(#(1)_low_level)%N%
                %               end%N%
                %%N" # eiffel_name)
         -- formatted_description(feature_description(class_name,setter_name))
         -- TODO: put descriptions into setter and unsetter
         -- Append enum query

         queries.append(once "       is_#(1): BOOLEAN%N%
                %               do%N%
                %                       Result := (value=#(1)_low_level)%N%
                %               end%N%N" # eiffel_name)
         -- TODO: add formatted_description(feature_description(class_name,getter_name)),
         -- Append in `low_level_values' a declaration labelled
         -- `an_eiffel_value' to access `a_low_level_value' found in
         -- `a_file_name'

         low_level_values.append(once "     #(1)_low_level: INTEGER%N%
                %               external %"plug_in%"%N%
                %               alias %"{%N%
                %                       location: %".%"%N%
                %                       module_name: %"plugin%"%N%
                %                       feature_name: %"#(2)%"%N%
                %                       }%"%N%
                %               end%N%N" # eiffel_name # c_string_name)
         -- TODO: add description
      end

feature {} -- Implementation
   stored_eiffel_name: STRING

end -- class C_ENUM_VALUE

-- Copyright (C) 2008-2016: Paolo Redaelli

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
