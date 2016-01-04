class C_STRUCT_NODE
   -- A "Struct" node of an XML file made by gccxml.

inherit
   COMPOSED_NODE
      -- hence also STORABLE_NODE  and a NAMED_NODE
      -- using the definition made in WRAPPER_CLASS
      undefine compute_eiffel_name
      end
   CONTEXTED_NODE
   FILED_NODE
   IDENTIFIED_NODE
   TYPED_NODE
   WRAPPER_CLASS

insert
   NAME_CONVERTER

create {ANY}
   make

feature {ANY}
   store
      do
         create {LINKED_LIST[C_FIELD]} fields.make
         types.put(Current, id)
         if is_named then
            symbols.put(Current, c_string_name)
         end

         composed_types.put(Current, id)
      end

   is_fundamental: BOOLEAN False

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN False

   c_type: STRING
      do
         if is_artificial then
            Result := once "struct"
         else
            Result := once ""
         end
      end

   wrapper_type: STRING
      do
         debug
            print(once "C_STRUCT_NODE.wrapper_type requires creation%
                                % of external/expanded types; currently returning an empty string")
         end
         not_yet_implemented -- Result := eiffel_name
      end

   is_to_be_emitted: BOOLEAN
      do
         Result := is_named and then (is_public or has_assigned_name) and then (global or else headers.has(c_file.c_string_name))
      end

   emit_wrapper
         -- Emit a reference wrapper for Current C structure.
         -- A reference wrapper handles the structure as a memory area referred by a pointer.
         -- An expanded wrapper is an expanded Eiffel type that is the actual C structure. This require the usage  of "external types"
      local
         path: POSIX_PATH_NAME; filename: STRING
      do
         if is_to_be_emitted then
            create path.make_from_string(directory)
            path.add_last(eiffel_name.as_lower + once ".e")
            filename := path.to_string
            log(once "Struct @(1) to @(2) in @(3)%N",
            <<c_string_name, eiffel_name, filename>>)

            create {TEXT_FILE_WRITE} output.connect_to(filename)
            emit_header
            emit_members
            emit_size
            emit_footer
            output.flush
            output.disconnect
         else
            if is_anonymous then
               log_string(once "Skipping anonymous structure at line " + line.out + ".%N")
            else
               log(once "Struct @(1) skipped%N",
               <<c_string_name>>)
            end
         end
      end

   emit_header
         -- Append the header of Current structure to `buffer'.
      do
         buffer.append(automatically_generated_header)
         buffer.append(deferred_class)
         buffer.append(eiffel_name)
         -- TODO: emit_description(class_descriptions.reference_at(eiffel_name))
         buffer.append(struct_inherits)
         buffer.put_message(once "%T@(1)%N",
         <<settings.typedefs>>)
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
            output.put_string(once "%T-- Fieldless structure%N")
            log(once "Struct @(1) have no fields%N",
            <<c_string_name>>)
         end
      end

   emit_size
         -- Append to `output' the `struct_size' query for Current.
      do
         -- buffer.reset
         buffer.put_message(once "feature {WRAPPER, WRAPPER_HANDLER} -- Structure size%N%
                %       struct_size: like size_t %N%
                %               external %"plug_in%"%N%
                %               alias %"{%N%
                %                       location: %".%"%N%
                %                       module_name: %"plugin%"%N%
                %                       feature_name: %"sizeof_@(1)%"%N%
                %               }%"%N%
                %               end%N%N",
         <<c_string_name>>)

         buffer.print_on(output)
         sedb_breakpoint
         ;("#define sizeof_" | c_string_name | " (sizeof(" | c_type | " " | c_string_name | "))%N").print_on(include)
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

   suffix: STRING "_STRUCT"

   struct_inherits: STRING "%N%Ninsert STANDARD_C_LIBRARY_TYPES%N%N"
         -- TODO: the above reference to STANDARD_C_LIBRARY_TYPES creates requires
         -- to wrap standard C library using a file called
         -- "standard-c-library.gcc-xml"; allow the user to specify its name,

end -- class C_STRUCT_NODE
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
