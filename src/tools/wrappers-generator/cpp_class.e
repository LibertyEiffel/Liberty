class CPP_CLASS
   -- A "Class" node of an XML file made by gccxml representing a C++ class.
   -- Be aware that class names includes templates, so they may be like
   -- "QFlags<Qt::MouseButton>" escaped as "QFlags%lt;Qt::MouseButton&gt;".
   -- C++ and therefore also GccXml does not have the concept of template
   -- classes at parsed code level, only within source code.


inherit
   CONTEXTED_NODE 
    undefine set_name end
   IDENTIFIED_NODE
    undefine set_name end
   COMPOSED_NODE -- hence NAMED, WRAPPER_CLASS
    redefine
        emit_wrapper, is_to_be_emitted
    end
   -- This node also has those fields: demangled, size, align, bases

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
            Result := once "class"
         else
            Result := once ""
         end
      end

   wrapper_type: STRING
      do
         debug
            print(once "CPP_CLASS.wrapper_type requires creation%
                                % of external/expanded types.")
         end
         not_yet_implemented -- Result := class_name
      end

   is_to_be_emitted: BOOLEAN
      do
         Result := is_named and then (is_public or has_assigned_name) and then (global or else headers.has(c_file.c_string_name))
      end

   emit_wrapper
      local
         path: POSIX_PATH_NAME
      do
         if is_to_be_emitted then
            create path.make_from_string(directory)
            path.add_last(eiffel_name.as_lower + once ".e")
            log(once "Class #(1) to #(2) in #(3)%N" #
			c_string_name # eiffel_name # path.to_string)

            create {TEXT_FILE_WRITE} output.connect_to(path.to_string)
            -- emit_header
            -- emit_members
            -- emit_size
            -- emit_footer

            output.flush
            output.disconnect
         else
            if is_anonymous then
               log(once "Skipping anonymous structure at line #(1).%N" # line.out)
            else
               log(once "Struct #(1) skipped%N" # c_string_name )
            end
         end
         emitted := True
      end

   suffix: STRING "_CLASS"

   class_inherits: STRING "%N%Ninsert STANDARD_C_LIBRARY_TYPES%N%N"
         -- TODO: the above reference to STANDARD_C_LIBRARY_TYPES creates requires
         -- to wrap standard C library using a file called
         -- "standard-c-library.gcc-xml"; allow the user to specify its name,

end -- class CPP_CLASS
-- Copyright (C) 2010-2017: , 2014 Paolo Redaelli
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
