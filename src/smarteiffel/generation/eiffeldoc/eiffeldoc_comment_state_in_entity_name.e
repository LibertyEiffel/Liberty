-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_IN_ENTITY_NAME
   --
   -- Handle entity names (between a back-quote and a quote)
   --

inherit
   EIFFELDOC_COMMENT_STATE

create {EIFFELDOC_CONTEXT}
   make

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      local
         i: INTEGER
      do
         if offset <= comment.count and then comment.item(offset) = '`' then
            i := comment.index_of('%'', offset)
            if i > offset then
               feature_name.copy(comment)
               feature_name.shrink(offset + 1, i - 1)
               next_offset := i + 1
               Result := True
            end
         end
      end

   feature_name: STRING ""

   next_offset: INTEGER

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      local
         with_anchor: BOOLEAN; n: STRING; fs: FEATURE_STAMP; fn: FEATURE_NAME; af: ANONYMOUS_FEATURE
         feature_name_buffer: FEATURE_NAME
      do
         inspect
            feature_name
         when "Current", "Result" then
            with_anchor := False
         else
            if for_feature = Void then
               with_anchor := True
            else
               if for_feature.arguments /= Void then
                  with_anchor := for_feature.arguments.rank_of(feature_name) = 0
               else
                  with_anchor := True
               end
            end
            if with_anchor then
               -- verify if the feature is reachable
               create feature_name_buffer.unknown_position(string_aliaser.string(feature_name)) --|*** memory leak!
               if not type.valid_feature_name(feature_name_buffer) then
                  with_anchor := False
               else
                  fs := type.lookup(type.registered_name(feature_name_buffer))
                  debug
                     n := once ""
                     n.copy(type.name.to_string)
                     n.extend('.')
                     n.append(feature_name)
                     n.append(once " for some client")
                  end
                  if fs = Void then
                     echo.put_string(once "*** cannot find ")
                     echo.put_string(feature_name)
                     echo.put_string(once " in class ")
                     echo.put_string(type.name.to_string)
                     echo.put_new_line
                  else
                     debug
                        fs.anonymous_feature(type).permissions.append_in(n)
                     end
                     with_anchor := False
                     fs := fs.resolve_static_binding_for(type, class_type)
                     if fs /= Void then
                        af := fs.anonymous_feature(class_type)
                        with_anchor := True
                     end
                     if with_anchor then
                        fn := class_type.get_feature_name(fs)
                        feature_name.copy(fn.to_string)
                     end
                  end
                  debug
                     if with_anchor then
                        n.append(once ": anchored%N")
                     else
                        n.append(once ": NOT anchored%N")
                     end
                     echo.put_string(n)
                  end
               end
            end
         end
         if with_anchor then
            n := once ""
            n.clear_count
            n.extend('#')
            fn.complete_name_in(n)
            html.with_attribute(once "class", once "feature_link")
            html.with_attribute(once "href", filtered_attribute(n))
            html.open_anchor
         else
            html.with_attribute(once "class", once "wiki_entity")
            html.open_underlined
         end
         html.put_string(feature_name)
         if with_anchor then
            html.close_anchor
         else
            html.close_underlined
         end
         Result := next_offset
      ensure then
         states.count = old states.count
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      do
         check
            False
         end
      end

   handle_first: BOOLEAN True

feature {}
   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
      end

end -- class EIFFELDOC_COMMENT_STATE_IN_ENTITY_NAME
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
