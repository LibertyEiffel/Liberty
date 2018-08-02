-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MOCK_FEATURES_COLLECTOR
   --
   -- Deferred features collector
   --

inherit
   CLASS_TEXT_VISITOR
   FEATURE_CLAUSE_LIST_VISITOR
   FEATURE_CLAUSE_VISITOR
   FEATURE_TEXT_VISITOR
   FEATURE_NAME_LIST_VISITOR
   FEATURE_NAME_VISITOR

create {MOCK}
   make

feature {MOCK}
   collect (a_parent: like parent; a_type: like type)
      require
         a_parent /= Void
         a_type /= Void
         not collecting
      do
         parent := a_parent
         type := a_type
         parent.class_text.accept(Current)
         type := Void
         parent := Void
      end

   collecting: BOOLEAN then type /= Void end
   features: LINKED_HASHED_DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]

feature {CLASS_TEXT}
   visit_class_text (visited: CLASS_TEXT)
      local
         fcl: FEATURE_CLAUSE_LIST
      do
         fcl := visited.feature_clause_list
         if fcl /= Void then
            fcl.accept(Current)
         end
      end

feature {FEATURE_CLAUSE_LIST}
   visit_feature_clause_list (visited: FEATURE_CLAUSE_LIST)
      local
         i: INTEGER
      do
         from
            i := visited.list.lower
         until
            i > visited.list.upper
         loop
            visited.list.item(i).accept(Current)
            i := i + 1
         end
      end

feature {FEATURE_CLAUSE}
   visit_feature_clause (visited: FEATURE_CLAUSE)
      local
         i: INTEGER
      do
         if visited.list /= Void then
            from
               i := visited.list.lower
            until
               i > visited.list.upper
            loop
               visited.list.item(i).accept(Current)
               i := i + 1
            end
         end
      end

feature {FEATURE_TEXT}
   visit_feature_text (visited: FEATURE_TEXT)
      do
         visited.names.accept(Current)
      end

feature {FEATURE_NAME_LIST}
   visit_feature_name_list (visited: FEATURE_NAME_LIST)
      local
         i: INTEGER; fn, ffn: FEATURE_NAME; fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
      do
         from
            i := 1
         until
            i > visited.count
         loop
            fn := visited.item(i)
            fs := parent.lookup(fn)
            fs := fs.resolve_static_binding_for(parent, type)
            af := fs.anonymous_feature(type)
            if af.is_deferred then
               anonymous_feature := af
               ffn := type.get_feature_name(fs)
               ffn.accept(Current)
               anonymous_feature := Void
            end
            i := i + 1
         end
      end

feature {FEATURE_NAME}
   visit_feature_name (visited: FEATURE_NAME)
      do
         check
            anonymous_feature.is_deferred
         end
         features.put(anonymous_feature, visited)
      end

feature {}
   make
      do
         create features.make
      end

   anonymous_feature: ANONYMOUS_FEATURE

   parent, type: TYPE

invariant
   anonymous_feature /= Void implies anonymous_feature.is_deferred
   features.for_all(agent (af: ANONYMOUS_FEATURE): BOOLEAN then af.is_deferred end (?))

end -- class MOCK_FEATURES_COLLECTOR
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
-- Copyright (C) 2011-2018: Cyril ADRIAN
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
