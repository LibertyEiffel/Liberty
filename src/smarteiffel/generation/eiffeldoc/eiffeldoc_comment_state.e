-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EIFFELDOC_COMMENT_STATE
   --
   -- The ''State'' Design Pattern in action. See EIFFELDOC_COMMENT_WRITER which uses those states.
   --

inherit
   IN_OUT_VISITOR

insert
   EIFFELDOC_GLOBALS

feature {EIFFELDOC_COMMENT_WRITER, EIFFELDOC_COMMENT_STATE}
   can_handle (comment: STRING; offset: INTEGER): BOOLEAN
         -- True if this state can handle the characters starting at the offset point
      deferred
      end

   handle (comment: STRING; offset: INTEGER; for_feature: ANONYMOUS_FEATURE; states: STACK[EIFFELDOC_COMMENT_STATE]): INTEGER
         -- Handle the comment; returns the next offset where a new state can be considered. Can also remove
         -- an element of the stack or add itself.
      require
         can_handle(comment, offset)
         offset > comment.count implies states.top = Current
         not_done_to_report_errors: error_handler.is_empty
      deferred
      ensure
         Result >= offset
         offset > comment.count implies Result = offset and then states.count < old states.count
         states.count <= old states.count + 1
         states.count > old states.count implies states.top = Current
         not_done_to_report_errors: error_handler.is_empty
      end

   abort (states: STACK[EIFFELDOC_COMMENT_STATE])
      require
         states /= Void
         not states.is_empty
         states.top = Current
      deferred
      ensure
         states.count = old states.count - 1
      end

   handle_first: BOOLEAN
         -- True if use the EIFFELDOC_COMMENT_WRITER optimisation that makes this object be handled first if
         -- it is at the top of the states stack
      deferred
      end

feature {}
   context: EIFFELDOC_CONTEXT

   html: EIFFELDOC_OUTPUT_STREAM
      do
         Result := context.html
      end

   type: TYPE
      do
         Result := context.type
      end

   class_type: TYPE
      do
         Result := context.class_type
      end

   class_text: CLASS_TEXT
      do
         Result := context.class_text
      end

invariant
   context /= Void

end -- class EIFFELDOC_COMMENT_STATE
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
