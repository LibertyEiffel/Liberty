-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_CORE
   --
   -- Main eiffeldoc handling. Prepares all the files for all the classes. Also finds the "known children".
   -- At last, handles "depending classes" if those are to be generated.
   --

inherit
   CLUSTER_VISITOR
   PARENT_LISTS_VISITOR

insert
   EIFFELDOC_GLOBALS

create {EIFFELDOC}
   make

feature {EIFFELDOC}
   add (ct: CLASS_TEXT)
      local
         c: CLUSTER; ac: FAST_ARRAY[CLASS_TEXT]; pl: PARENT_LISTS
      do
         c := ct.cluster
         class_text := ct
         if not clusters.fast_has(c) then
            clusters.add_last(c)
         end
         ac := classes.reference_at(c.name)
         if ac = Void then
            create ac.make(0)
            classes.add(ac, c.name)
         end
         check
            not ac.fast_has(ct)
         end
         ac.add_last(ct)
         pl := ct.parent_lists
         if pl /= Void then
            pl.accept(Current)
         end
      end

   do_doc
      local
         i: INTEGER; c: CLUSTER; ct: CLASS_TEXT; class_name_todo: CLASS_NAME
      do
         from
            i := clusters.lower
         until
            i > clusters.upper
         loop
            c := clusters.item(i)
            echo.put_string(once "Documenting cluster %"")
            echo.put_string(c.name)
            echo.put_string(once "%"%N")
            c.accept(Current)
            i := i + 1
         end
         if options.depends then
            echo.put_string(once "Include dependant classes%N")
            from
               i := class_todo.lower
            until
               i > class_todo.upper
            loop
               class_name_todo := class_todo.item(i)
               if not class_done.has(class_name_todo) then
                  ct := smart_eiffel.class_text(class_name_todo)
                  if ct /= Void then
                     if remote_cluster(ct.cluster) = Void then
                        shorter.short_for(ct, inherit_children.reference_at(ct.name), insert_children.reference_at(ct.name))
                     end
                  elseif class_name_todo.looks_like_a_formal_generic_name then
                     -- It is normal not to find a real class.
                  else
                     error_handler.add_position(class_name_todo.start_position)
                     error_handler.append(once "Unable to load class %"")
                     error_handler.append(class_todo.item(i).to_string)
                     error_handler.append(once "%".")
                     error_handler.print_as_warning
                  end
               end
               i := i + 1
            end
         end
      end

feature {PARENT_LISTS}
   visit_parent_lists (visited: PARENT_LISTS)
      do
         check
            visited.class_text = class_text
         end
         add_children(visited.inherit_list, inherit_children)
         add_children(visited.insert_list, insert_children)
      end

feature {}
   add_children (parents: FAST_ARRAY[PARENT_EDGE]
      children: HASHED_DICTIONARY[FAST_ARRAY[CLASS_TEXT], CLASS_NAME])
      local
         i: INTEGER; ac: FAST_ARRAY[CLASS_TEXT]; ct: CLASS_TEXT
      do
         if parents /= Void then
            from
               i := parents.lower
            until
               i > parents.upper
            loop
               ct := parents.item(i).class_text
               ac := children.reference_at(ct.name)
               if ac = Void then
                  create ac.make(0)
                  children.add(ac, ct.name)
               end
               if not ac.fast_has(class_text) then
                  ac.add_last(class_text)
               end
               i := i + 1
            end
         end
      end

feature {CLUSTER}
   visit_cluster (visited: CLUSTER)
      local
         i: INTEGER; ac: FAST_ARRAY[CLASS_TEXT]; ct: CLASS_TEXT
      do
         ac := classes.reference_at(visited.name)
         check
            ac /= Void
         end
         from
            i := ac.lower
         until
            i > ac.upper
         loop
            ct := ac.item(i)
            shorter.short_for(ct, inherit_children.reference_at(ct.name), insert_children.reference_at(ct.name))
            if options.depends then
               class_todo.union(shorter.depends)
               class_done.add(ct.name)
            end
            i := i + 1
         end
      end

feature {}
   make (a_context: EIFFELDOC_CONTEXT)
      require
         a_context /= Void
      do
         options := a_context.options
         create shorter.make(a_context)
         create clusters.make(0)
         create classes.make
         create inherit_children.make
         create insert_children.make
         if options.depends then
            create class_todo.make
            create class_done.make
         end
      end

   class_text: CLASS_TEXT

   options: EIFFELDOC_OPTIONS

   shorter: EIFFELDOC_SHORTER

   clusters: FAST_ARRAY[CLUSTER]

   classes: HASHED_DICTIONARY[FAST_ARRAY[CLASS_TEXT], STRING]

   inherit_children: HASHED_DICTIONARY[FAST_ARRAY[CLASS_TEXT], CLASS_NAME]

   insert_children: HASHED_DICTIONARY[FAST_ARRAY[CLASS_TEXT], CLASS_NAME]

   class_todo: HASHED_SET[CLASS_NAME]

   class_done: HASHED_SET[CLASS_NAME]

invariant
   options /= Void

   shorter /= Void

   clusters /= Void

   classes /= Void

   inherit_children /= Void

   insert_children /= Void

   options.depends implies class_todo /= Void

   options.depends implies class_done /= Void

end -- class EIFFELDOC_CORE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- https://www.liberty-eiffel.org
-- ------------------------------------------------------------------------------------------------------------------------------
