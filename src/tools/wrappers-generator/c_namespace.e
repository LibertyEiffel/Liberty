class C_NAMESPACE
   -- A node of an XML file made by castxml representing a C++ namespace.
   -- A C++ name-space is modelled in Liberty as a cluster, a directory
   -- containing classes, subclusters and how they shall be compiled and
   -- linked.

inherit
   CASTXML_NODE
   CONTEXTED_NODE
   NAMED_NODE
      redefine compute_eiffel_name
      end
   IDENTIFIED_NODE
   STORABLE_NODE

create {CASTXML_TREE}
   make

feature {ANY}
   store
      do
         namespaces.put(Current, id)
         if not is_main then
            symbols.put(Current, c_string_name)
         end
      end

   is_main: BOOLEAN
         -- Is Current name space the "main" default namespace? The default namespace is named "::"
      do
         Result := c_string_name.is_equal(once "::")
      end

   path: PATH_NAME
         -- Path of the directory representing Current namespace
      do
         if cached_path = Void then
            if is_main then
               create {POSIX_PATH_NAME} cached_path.make_current
            else
               -- Recursively build the path
               cached_path := namespace.path / c_string_name
            end
         end
         Result := cached_path
      end

   are_members_wrapped: BOOLEAN
      -- Shall the members of th namespace be wrapped?

   compute_eiffel_name
         -- Compute cluster name as basename of path (its last part).
      do
         cached_eiffel_name := path.last
      end

   emit_wrapper
         -- The wrapper of a namespace actually is not any Liberty code but only
         -- a directory that will be the cluster representing that namespace.
      do
         -- local cwd: STRING; bd: BASIC_DIRECTORY;
         -- Create a directory named like Current namespace that will contain everything defined in that namespace.
         -- Try to create the directory and forget about the result
         log.info.put_line("Faking creation of «" + path.to_string + "»directory%N")
         --      outcome :=  bd.create_new_directory(path.to_string);
         --      if path.is_directory then
         --              are_members_wrapped:=True
         --              -- Each castxml node will query its containing namespace to see if it shall be wrapped.
         --      else -- directory still doesn't exists, we cannot wrap its content.
         --              log.info.put_line("Namespace `#(1)' would be wrapped into `#(2)', but it is not a directory or could not be created: its contents shall not be wrapped.%N"
         --              # c_string_name # path.to_string)
         --      end
      end

feature {STORABLE_NODE} -- Contained nodes


feature {} -- Implementation
   cached_path: PATH_NAME

end -- class C_NAMESPACE

-- Copyright (C) 2008-2025: Paolo Redaelli
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
