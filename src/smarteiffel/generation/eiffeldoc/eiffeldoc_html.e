-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_HTML

inherit
   HTML_ELEMENT

insert
   HTML_HANDLER

create {EIFFELDOC}
   make

feature {HTML_ELEMENT}
   really_append_in (buffer: STRING; stop_at_dot, stopped: BOOLEAN): BOOLEAN
      local
         i: INTEGER
      do
         check
            node /= Void
         end
         Result := stopped
         if not Result then
            from
               i := 1
            until
               i > node.attributes_count
            loop
               buffer.extend(' ')
               node.html_attribute(i).append_in(buffer)
               i := i + 1
            end
            from
               i := 1
            until
               Result or else i > node.children_count
            loop
               Result := node.child(i).really_append_in(buffer, stop_at_dot, Result)
               i := i + 1
            end
         end
      end

   really_to_html_stream (html: HTML_OUTPUT_STREAM; stop_at_dot, stopped: BOOLEAN): BOOLEAN
      local
         i: INTEGER
      do
         check
            node /= Void
         end
         Result := stopped
         if not Result then
            from
               i := 1
            until
               i > node.attributes_count
            loop
               node.html_attribute(i).to_html_stream(html)
               i := i + 1
            end
            from
               i := 1
            until
               Result or else i > node.children_count
            loop
               Result := node.child(i).really_to_html_stream(html, stop_at_dot, Result)
               i := i + 1
            end
         end
      end

feature {EIFFELDOC}
   set (a_node: like node)
      require
         a_node /= Void
      do
         node := a_node
      ensure
         node = a_node
      end

feature {}
   make
      do
      end

   node: HTML_NODE

end -- class EIFFELDOC_HTML
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
