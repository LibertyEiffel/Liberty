deferred class COMPOSED_NODE
   -- GCCXML node representing a type andhaving "members" attribute.
   
   -- The "members" attribute contains the
   -- ids of the fields that compose the actual object referred by Current
   -- node that can be a struct, a union or a C++ class.

   -- Note that Namespace nodes also have a "members" attribute that
   -- conceptually different since they are modelled as Liberty clusters and
   -- do not belong to a single file.

inherit
   WRAPPER_CLASS 
        -- so also a NAMED_NODE as all effective heirs (Class,
        -- Struct, Namespace, Union) are also named
        redefine set_name end

   STORABLE_NODE
      -- inherited to add the non-void fields postcondition to the store command
        redefine set_name end

   C_TYPE
        redefine set_name end

feature {ANY}
    set_name (a_name: STRING) 
    do
        -- better to rewrite the one-liner instead of having "Precursor{WRAPPER_CLASS}(a_name)"
        assigned_name := a_name.twin
        -- set_attribute(once U"name",create {UNICODE_STRING}.from_utf8(a_name)) 
        -- TODO: when STRING will convert to UNICODE_STRING the line above could be 
        -- set_attribute(once U"name",a_name) 
        -- cached_eiffel_name := Void
    end
        
feature {ANY}
   store
      deferred
      ensure
         fields /= Void
      end

   c_type: STRING
         -- The actual type - i.e struct, union - to be put into low level getter and setters code
      deferred
      end

   fields: COLLECTION[C_FIELD]

   members: UNICODE_STRING
      do
         Result := attribute_at(once U"members")
      end

   is_to_be_emitted: BOOLEAN
      do
         Result := (is_named and then (not avoided_symbols.has(c_string_name)) 
            or has_assigned_name) and then 
            (is_public or has_assigned_name) and then 
            (global or else headers.has(c_file.c_string_name)) 

      end

   emit_wrapper
         -- Emit a reference wrapper for Current C composed type.
         -- A reference wrapper handles the structure as a memory area referred by a pointer.
         -- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types"
      local
         path: POSIX_PATH_NAME; filename: STRING
      do
         if is_to_be_emitted then
            create path.make_from_string(directory)
            path.add_last(eiffel_name.as_lower + once ".e")
            filename := path.to_string
            log(once "wrapping #(1) #(2) as #(3) in #(4)%N" #
			 c_type # c_string_name # eiffel_name # filename)

            create {TEXT_FILE_WRITE} output.connect_to(filename)
            emit_header
            emit_members
            emit_size
            emit_footer
            output.flush
            output.disconnect
         else
            if is_anonymous then
               log(once "Skipping anonymous #(1) at line #(2).%N" # c_type # line.out)
            else
               log(once "Skipping #(1) #(2)%N" # c_type # c_string_name)
            end
         end
         emitted := True
      end

   emit_header
         -- Append the header of Current structure to `buffer'.
      do
         buffer.append(automatically_generated_header)
         buffer.append(deferred_class)
         buffer.append(eiffel_name)
         buffer.append(once "[
            
                -- Wrapper of #(1) #(2) defined in file #(3)
            ]" # c_type # c_string_name # c_file.c_string_name)
         -- TODO: emit_description(class_descriptions.reference_at(eiffel_name))
         buffer.append(insert_tense)
         buffer.append(once "%T#(1)%N" # settings.typedefs)
         buffer.print_on(output)
      end

   emit_members
         -- local
         --      members: UNICODE_STRING; members_iter: ITERATOR[UNICODE_STRING]; field: XML_COMPOSITE_NODE
      do
         if fields /= Void and then not fields.is_empty then
            setters.reset
            queries.reset
            setters.append(setters_header)
            queries.append(queries_header)
            fields.for_each(agent {C_FIELD}.append_getter_and_setter(eiffel_name))
            setters.print_on(output)
            queries.print_on(output)
         else
            (once "%T-- Fieldless #(1)%N" # c_type).print_on(output)
			log(once "#(1) #(2) have no fields%N" # c_type # c_string_name)
         end
      end

   emit_size
         -- Append to `output' the `struct_size' query for Current.
     local a_name: STRING
     do
         sedb_breakpoint;
         if has_assigned_name then 
             a_name := assigned_name
             ("#define sizeof_#(1) (sizeof(#(1)))%N" # a_name).print_on(include) 
         elseif not is_anonymous then
             a_name := c_string_name 
             ("#define sizeof_#(1) (sizeof(#(2) #(1)))%N" # c_string_name # c_type).print_on(include)
         else
             raise("Trying to emit size query of an anonymous, not typedeffed composed elementt (either a struct, union or perhaps class): I don't know hot to call the query")
         end

         buffer.append(once "feature {WRAPPER, WRAPPER_HANDLER} -- Structure size%N%
                %       struct_size: like size_t %N%
                %               external %"plug_in%"%N%
                %               alias %"{%N%
                %                       location: %".%"%N%
                %                       module_name: %"plugin%"%N%
                %                       feature_name: %"sizeof_#(1)%"%N%
                %               }%"%N%
                %               end%N%N" # a_name)

         buffer.print_on(output)
      
      end

   emit_footer
      do
         buffer.append(once "end -- class ")
         buffer.append(eiffel_name)
         buffer.append_new_line
         buffer.append(automatically_generated_header)
         buffer.print_on(output)
      end

   is_artificial: BOOLEAN
      do
         Result := attributes.has(once U"artificial") and then attributes.at(once U"artificial").is_equal(once U"1")
      end


 insert_tense: STRING "%N%Ninsert STANDARD_C_LIBRARY_TYPES%N%N"
         -- TODO: the above reference to
         -- STANDARD_C_LIBRARY_TYPES creates requires to wrap
         -- standard C library using a file called
         -- "standard-c-library.gcc-xml"; shall another name
         -- be allowerd for such a fundamental library?


end -- class COMPOSED_NODE

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
