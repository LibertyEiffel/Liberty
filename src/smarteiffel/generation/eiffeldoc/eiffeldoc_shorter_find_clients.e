-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_SHORTER_FIND_CLIENTS
   --
   -- Find all the clients of a given class (using export clauses)
   --

inherit
   IN_OUT_VISITOR
      redefine enter_feature_clause, enter_parent_edge, enter_class_text
      end

insert
   EIFFELDOC_GLOBALS

creation {EIFFELDOC_SHORTER, EIFFELDOC_SHORTER_CLASSDOC}
   make

feature {EIFFELDOC_SHORTER, EIFFELDOC_SHORTER_CLASSDOC}
   clients_of (ct: CLASS_TEXT): CLASS_NAME_LIST is
      do
         clients := Void
         enter_class_latch := True
         ct.accept(Current)
         -- Be sure to have at least ANY
         if clients = Void then
            Result := any_client_list
         else
            create Result.merge(clients, any_client_list)
         end
      end

feature {}
   make is
      do
      end

feature {}
   enter_class_latch: BOOLEAN

   clients: CLASS_NAME_LIST

   any_client_list: CLASS_NAME_LIST is
      local
         any: CLASS_NAME
      once
         create any.unknown_position(string_aliaser.hashed_string(as_any))
         create Result.make_1(any)
      end

feature {}
   enter_class_text (visited: CLASS_TEXT): BOOLEAN is
      do
         Result := enter_class_latch
         enter_class_latch := False
      end

   enter_parent_edge (visited: PARENT_EDGE): BOOLEAN is
      do
         enter_class_latch := True
         Result := True
      end

   enter_feature_clause (visited: FEATURE_CLAUSE): BOOLEAN is
      local
         client_list: CLIENT_LIST; class_name_list: CLASS_NAME_LIST; i: INTEGER
         client_class_name: CLASS_NAME; client_class_text: CLASS_TEXT
      do
         client_list := visited.clients
         if client_list /= Void then
            class_name_list := client_list.class_name_list
            if class_name_list /= Void then
               from
                  i := 1
               until
                  i > class_name_list.count
               loop
                  client_class_name := class_name_list.item(i)
                  client_class_text := smart_eiffel.class_text(client_class_name, False)
                  if client_class_text = Void then
                     error_handler.add_position(client_class_name.start_position)
                     error_handler.append(once "Unable to find class ")
                     error_handler.append(client_class_name.to_string)
                     error_handler.append(once ". Ignored client.")
                     error_handler.print_as_warning
                  else
                     if clients = Void then
                        create clients.make_1(client_class_name)
                     else
                        if clients.index_of(client_class_name) = 0 then
                           clients.add_last(client_class_name)
                        end
                     end
                  end
                  i := i + 1
               end
            end
         end
         -- Always return False: no need to go below the feature clause level.
      end

end -- class EIFFELDOC_SHORTER_FIND_CLIENTS
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
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
