-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_COMMENT_STATE_IN_CLASS_NAME
   --
   -- Handle class names
   --

inherit
   EIFFELDOC_COMMENT_STATE

create {EIFFELDOC_CONTEXT}
   make

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
      local
         done: BOOLEAN
      do
         from
            next_offset := offset
            Result := offset <= comment.count and then comment.item(offset).is_upper
         until
            not Result or else done
         loop
            if next_offset > comment.count then
               done := True
            else
               inspect
                  comment.item(next_offset)
               when 'A' .. 'Z', '0' .. '9', '_' then
                  -- go on
               when 'a' .. 'z' then
                  Result := False
               else
                  done := True
               end
            end
            if not done then
               next_offset := next_offset + 1
            end
         end
         Result := Result and then (next_offset - offset >= 2)
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
      local
         buffer: STRING; ct: CLASS_TEXT
      do
         Result := next_offset
         buffer := once ""
         buffer.copy(comment)
         buffer.shrink(offset, Result - 1)
         class_name.set_string(buffer)
         ct := smart_eiffel.class_text_in_cluster(class_name, class_text.cluster)
         if ct = Void then
            -- not a class name
            html.put_string(buffer)
         else
            html.with_attribute(once "class", once "wiki_class_name")
            html.open_typeset
            put_class_name(ct)
            html.close_typeset
         end
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      do
         check
            False
         end
      end

   handle_first: BOOLEAN False

feature {}
   next_offset: INTEGER

   class_name: CLASS_NAME
      once
         create Result.unknown_position(string_aliaser.hashed_string("INTEGER"), True)
      end

   put_class_name (ct: CLASS_TEXT)
      local
         cn, address: STRING
      do
         cn := ct.name.to_string
         if is_generic_name(cn) then
            html.put_string(cn)
         else
            address := filename_of(ct)
            html.with_attribute(once "class", once "wiki_link")
            html.with_href(address)
            html.open_anchor
            html.put_string(cn)
            html.close_anchor
         end
      end

   is_generic_name (cn: STRING): BOOLEAN
      local
         i: INTEGER
      do
         if class_text.is_generic then
            from
               i := 1
            until
               Result or else i > class_text.formal_generic_list.count
            loop
               Result := class_text.formal_generic_list.item(i).name.to_string = cn
               i := i + 1
            end
         end
      end

   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
      end

end -- class EIFFELDOC_COMMENT_STATE_IN_CLASS_NAME
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
