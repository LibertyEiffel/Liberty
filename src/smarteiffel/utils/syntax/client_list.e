-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLIENT_LIST
   --
   -- To store a list of clients class like : {FOO, BAR}
   --

inherit
   VISITABLE
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end

create {ANY}
   make, merge, omitted

feature {ANY}
   start_position: POSITION
         -- Of the opening bracket when list is really written.

   is_omitted: BOOLEAN
      do
         Result := start_position.is_unknown
      end

   pretty (indent_level: INTEGER)
      do
         if is_omitted then
            pretty_printer.put_string(once "{ANY}")
         elseif type_mark_list = Void then
            pretty_printer.put_string(once "{}")
         else
            pretty_printer.put_character('{')
            type_mark_list.pretty(indent_level)
            pretty_printer.put_character('}')
         end
      end

   gives_permission_to (tm: TYPE_MARK; target_type: TYPE): BOOLEAN
         -- Check whether `tm' is a member (or a subclass as well) of the `Current' client
         -- list. (No error report done here in `error_handler').
      require
         tm /= Void
         not_done_to_report_errors: error_handler.is_empty -- required by TYPE_MARK_LIST.gives_permission_to
      do
         if is_omitted then
            -- It is equivalent to {ANY}
            Result := True
         elseif (not tm.is_anchored) and then (tm.class_text.name.to_string = as_typed_internals or else tm.class_text.name.to_string = as_native_array_internals) then
            -- Specific internal classes that implement introspection
            Result := True
         elseif type_mark_list = Void then
            -- feature {}
            check
               not start_position.is_unknown
               not Result
            end
         else
            Result := type_mark_list.gives_permission_to(tm, target_type)
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   gives_permission_to_any: BOOLEAN
         -- Check whether the `Current' client list gives permission to all
         -- classes. (No error report done here in `error_handler').
      do
         if is_omitted then
            Result := True -- Because it is as : {ANY}.
         elseif type_mark_list = Void then
            -- feature {}
            check
               not start_position.is_unknown
               not Result
            end
         else
            Result := type_mark_list.gives_permission_to_any
         end
      ensure
         (old (error_handler.is_empty)) implies error_handler.is_empty
      end

   gives_no_permission: BOOLEAN
         -- Check whether the `Current' client list gives no permission at all
         -- (No error report done here in `error_handler').
      do
         if is_omitted then
            -- equivalent to feature {ANY}
            check
               not Result
            end
         else
            Result := type_mark_list = Void
         end
      ensure
         (old (error_handler.is_empty)) implies error_handler.is_empty
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := (other = Current or else
                    other.type_mark_list = type_mark_list or else
                    type_mark_list /= Void and then
                    other.type_mark_list /= Void and then
                    type_mark_list.is_equal(other.type_mark_list))
      ensure then
         Result = (wider_than(other) and other.wider_than(Current))
      end

   accept (visitor: CLIENT_LIST_VISITOR)
      do
         visitor.visit_client_list(Current)
      end

feature {ANONYMOUS_FEATURE, ANONYMOUS_FEATURE_MIXER}
   specialize_in (new_type: TYPE)
      require
         new_type /= Void
      do
         if type_mark_list /= Void then
            type_mark_list.specialize_in(new_type)
         end
      ensure
         has_been_specialized
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      require
         has_been_specialized
         parent_type /= Void
         parent_edge /= Void
         new_type /= Void
      local
         tml: like type_mark_list
      do
         if type_mark_list /= Void then
            tml := type_mark_list.specialize_thru(parent_type, parent_edge, new_type)
         end
         if tml = type_mark_list then
            Result := Current
         else
            create Result.make(start_position, tml)
         end
      ensure
         Result.has_been_specialized
      end

feature {ANONYMOUS_FEATURE, ANONYMOUS_FEATURE_MIXER, CLIENT_LIST}
   has_been_specialized: BOOLEAN
      do
         if type_mark_list = Void then
            Result := True
         else
            Result := type_mark_list.has_been_specialized
         end
      ensure
         assertion_only: Result
      end

feature {ANONYMOUS_FEATURE_MIXER, CLIENT_LIST_VISITOR}
   append_in (b: STRING)
      do
         if is_omitted then
            b.append(once "{ANY}")
         else
            if type_mark_list = Void then
               b.append(once "{}")
            else
               b.extend('{')
               type_mark_list.append_in(b)
               b.extend('}')
               b.extend(' ')
            end
         end
      end

feature {ANY}
   eiffel_view: STRING
         -- The Eiffel view of the allowed classe(s) list. (Because of clients list merging, the
         -- `Current' clients list may be located on many Eiffel source files. This function is also
         -- useful to remind default abbreviated notation as omitted list or empty list.)
      local
         i: INTEGER
      do
         if eiffel_view_memory = Void then
            if is_omitted then
               eiffel_view_memory := once "{ANY}"
            elseif type_mark_list = Void then
               eiffel_view_memory := once "{}"
            else
               create eiffel_view_memory.make(64)
               eiffel_view_memory.extend('{')
               from
                  i := 1
               until
                  i > type_mark_list.count
               loop
                  eiffel_view_memory.append(type_mark_list.item(i).written_mark)
                  i := i + 1
                  if i <= type_mark_list.count then
                     eiffel_view_memory.extend(',')
                     eiffel_view_memory.extend(' ')
                  end
               end
               eiffel_view_memory.extend('}')
            end
         end
         Result := eiffel_view_memory
      ensure
         Result /= Void
      end

feature {CLASS_TEXT, CLIENT_LIST, FEATURE_CALL}
   locate_in_error_handler
         -- Add one or more related positions in the `error_handler'.
      do
         if type_mark_list = Void then
            error_handler.add_position(start_position)
         else
            type_mark_list.locate_in_error_handler
         end
      end

feature {CLIENT_LIST, ANONYMOUS_FEATURE_MIXER}
   wider_than (other: like Current): BOOLEAN
      do
         if Current = other then
            Result := True
         elseif gives_permission_to_any then
            Result := True
         elseif other = Void or else other.gives_permission_to_any then
            check
               not Result
            end
         elseif other.gives_no_permission then
            Result := True
         elseif gives_no_permission then
            check
               not Result
            end
         else
            Result := type_mark_list.wider_than(other.type_mark_list)
         end
      end

feature {EXPORT_LIST, ANONYMOUS_FEATURE_MIXER}
   merge_with (other: like Current): like Current
         -- Is actually the union of `Current' and `other'.
      require
         other /= Void
      local
         sp: POSITION
      do
         if Current = other then
            Result := Current
         elseif gives_permission_to_any then
            Result := Current
         elseif other.gives_permission_to_any then
            Result := other
         elseif gives_no_permission then
            Result := other
         elseif other.gives_no_permission then
            Result := Current
         else
            -- We really have to create a new one:
            sp := start_position
            if sp.is_unknown then
               sp := other.start_position
            end
            create Result.merge(sp, type_mark_list, other.type_mark_list)
         end
      end

feature {CLIENT_LIST, CLIENT_LIST_VISITOR}
   type_mark_list: TYPE_MARK_LIST

feature {}
   make (sp: like start_position; tml: like type_mark_list)
         -- When the client list is really written.
      require
         not sp.is_unknown
      do
         start_position := sp
         type_mark_list := tml
         debug
            if eiffel_view /= Void then
            end
         end
      ensure
         start_position = sp
         type_mark_list = tml
      end

   omitted
         -- When the client list is omitted. (Remind that when the client list is omitted, it is like
         -- {ANY}.)
      do
      end

   merge (sp: like start_position; tml1, tml2: like type_mark_list)
      require
         not sp.is_unknown
      do
         start_position := sp
         create type_mark_list.merge(tml1, tml2)
         debug
            eiffel_view_memory := Void
            if eiffel_view /= Void then
            end
         end
      end

   eiffel_view_memory: STRING
         -- To cache the Result of `eiffel_view'.

invariant
   type_mark_list /= Void implies type_mark_list.count > 0

end -- class CLIENT_LIST
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
