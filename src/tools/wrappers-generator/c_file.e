class C_FILE
   -- An header file that will be wrapped as a wrapper class containing all the functions and variables defined in that file.

inherit
   IDENTIFIED_NODE
   STORABLE_NODE
   WRAPPER_CLASS
      redefine compute_eiffel_name
      end

insert
   NAME_CONVERTER
   FILE_TOOLS
   COLLECTION_SORTER[WRAPPER_FEATURE]

create {GCCXML_TREE}
   make

feature {ANY}
   store
      do
         files.put(Current, id)
         check
            is_named
         end
         symbols.put(Current, c_string_name)
         files_by_name.put(Current, c_string_name)
         create features
      end

   is_to_be_emitted: BOOLEAN
      do
         Result := file_exists(c_string_name) and (global or else headers.has(c_string_name))
      end

   emit_wrapper
         -- Emits into a deferred class named like the file itself the wrappers
         -- for all the function and the variable contained into Current file.
      local
         path: POSIX_PATH_NAME
      do
         if is_to_be_emitted then
            create path.make_from_string(directory)
            path.add_last(eiffel_name.as_lower + once ".e")
            -- if path.is_file then
            --      log(once "Copying existing file #(1) onto #(1).orig.%N" # path.to_string)
            --      copy_to(path.to_string, path.to_string+once ".orig")
            -- end

            log(once "Outputting wrapper for functions found in file #(1) on #(2).%N" # c_name.as_utf8 # path.to_string)

            create {TEXT_FILE_WRITE} output.connect_to(path.to_string)
            -- end
            emit_header_on(output)
            log(once "Sorting file features%N")
            if features.count > 1 then
               sort(features)
            end

            features.for_each(agent {WRAPPER_FEATURE}.wrap_on(output))
            emit_footer_on(output)
            output.disconnect
         else
            log(once "Skipping file '#(1)'.%N"#c_string_name)
         end
         emitted := True
      end

   emit_header_on (a_stream: OUTPUT_STREAM)
         -- Put on `output' the header on an "external" class named 'eiffel_name'
         -- from the beginning until the "feature {} -- External calls" label
         -- included
      require
         a_stream /= Void
      do
         a_stream.put_string(automatically_generated_header)
         a_stream.put_string(deferred_class)
         a_stream.put_line(eiffel_name)
         -- emit_description_on(class_descriptions.reference_at(eiffel_name),a_stream)
         a_stream.put_string(inherits_string)
         a_stream.put_line("%T%T" | settings.standard_typedefs_class)
         a_stream.put_string(externals_header) --line
      end

   emit_footer_on (a_stream: OUTPUT_STREAM)
      require
         a_stream /= Void
      do
         a_stream.put_string(once "%Nend -- class ")
         a_stream.put_line(eiffel_name)
      end

   suffix: STRING "_EXTERNALS"

   compute_eiffel_name
      local
         path: POSIX_PATH_NAME
      do
         -- The Eiffel class name for `c_name'; extension is removed,
         -- CamelCase is converted into CAMEL_CASE, dashes are converted to
         -- underscores, `suffix' is added at the endi, eventual; i.e.:
         -- class_name_from_header("/usr/include/foo/bar/maman.h").is_equal("MAMAN_EXTERNALS")
         create path.make_from_string(c_string_name.string)
         -- TODO: change PATH_NAME.make_from_string to accept ABSTRACT_STRING instead of plain STRINGs
         create cached_eiffel_name.copy(path.last)
         cached_eiffel_name.remove_tail(path.extension.count)
         -- camelcase_translator.substitute_all_in(cached_eiffel_name) -- insert_underscores(cached_eiffel_name)
         -- Remove trailing underscores

         from
         until
            cached_eiffel_name.first /= '_'
         loop
            cached_eiffel_name.remove_first
         end
         -- Remove spurious underscores at the end
         from
         until
            cached_eiffel_name.last /= '_'
         loop
            cached_eiffel_name.remove_last
         end

         cached_eiffel_name.replace_all('-', '_')
         cached_eiffel_name.to_upper
         cached_eiffel_name.append(suffix)
      ensure then
         cached_eiffel_name.occurrences('.') = 0
      end

feature {ANY} -- Content
   features: FAST_ARRAY[WRAPPER_FEATURE]

end -- class C_FILE
-- Copyright (C) 2008-2018: ,2009,2010 Paolo Redaelli
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
