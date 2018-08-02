-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PARENT_EDGE
   --
   -- To represent either an "inherit" or an "insert" parent edge.
   --

inherit
   VISITABLE
      undefine is_equal
      end
   HASHABLE

insert
   GLOBALS
      undefine is_equal
      end

create {ANY}
   make

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := other = Current
      end

   hash_code: INTEGER
      do
         Result := to_pointer.hash_code
      end

   type_mark: TYPE_MARK
         -- Declaration `type_mark' of the parent.

   start_position: POSITION
      do
         Result := type_mark.start_position
      end

   class_text: CLASS_TEXT
         -- An alias for `type_mark.class_text'.

   class_text_name: STRING
         -- An alias for `class_text.name.to_string'.

   parent_lists: PARENT_LISTS
         -- The corresponding one

   is_insert_member: BOOLEAN
         -- This parent is inserted (then current type does not
         -- conform to this parent via this inherit text item)

   is_inherit_member: BOOLEAN
      do
         Result := not is_insert_member
      end

   accept (visitor: PARENT_EDGE_VISITOR)
      do
         visitor.visit_parent_edge(Current)
      end

feature {PARENT_LISTS, EXPORT_LIST}
   is_target_of_rename (fn: FEATURE_NAME): BOOLEAN
      do
         if rename_list /= Void then
            Result := rename_list.is_target_of_rename(fn)
         end
      end

feature {PARENT_LISTS}
   is_source_of_rename (fn: FEATURE_NAME): BOOLEAN
      do
         if rename_list /= Void then
            Result := rename_list.is_source_of_rename(fn)
         end
      end

   set_insert_member
      require
         is_inherit_member
      do
         is_insert_member := True
      ensure
         is_insert_member
      end

feature {FEATURE_ACCUMULATOR, ANONYMOUS_FEATURE_MIXER, PARENT_LISTS}
   get_undefine (a_final_fn: FEATURE_NAME): FEATURE_NAME
         -- If the undefine list exists and if `a_final_fn' is member of the undefine list, this
         -- function returns the actual feature name which is in the list. (This can be useful to print
         -- error messages with accurate POSITIONs and to know if `a_final_fn' is undefined.)
      require
         a_final_fn /= Void
      do
         if undefine_list /= Void then
            Result := undefine_list.internal_name(a_final_fn)
         end
      end

   get_redefine (a_final_fn: FEATURE_NAME): FEATURE_NAME
      require
         a_final_fn /= Void
      do
         if redefine_list /= Void then
            Result := redefine_list.internal_name(a_final_fn)
         end
      end

feature {TYPE, CLASS_TEXT}
   rename_count: INTEGER
      do
         if rename_list /= Void then
            Result := rename_list.count
         end
      end

feature {TYPE}
   rename_item (i: INTEGER): RENAME_PAIR
      require
         i.in_range(1, rename_count)
      do
         Result := rename_list.item(i)
      end

feature {PARENT_EDGE, VISITOR} -- Optional list in syntactical order:
   rename_list: RENAME_LIST

   export_list: EXPORT_LIST

   undefine_list: FEATURE_NAME_LIST

   redefine_list: FEATURE_NAME_LIST

feature {PARENT_LISTS, TYPE, FEATURE_STAMP, FEATURE_ACCUMULATOR}
   do_rename (fn: FEATURE_NAME): like fn
         -- If some rename exists for `fn', return the new name, otherwise, give back `fn'.
         -- Use FEATURE_STAMP.resolve_dynamic_binding_for or FEATURE_STAMP.fs_for_building_type.
      require
         fn /= Void
      do
         if rename_list = Void then
            Result := fn
         else
            Result := rename_list.name_in_child(fn)
            if Result = Void then
               Result := fn
            end
         end
      ensure
         Result /= Void
      end

feature {ANONYMOUS_FEATURE_MIXER, PARENT_LISTS, TYPE}
   runnable_type (ct: TYPE_MARK): TYPE_MARK
      require
         ct.is_static
      do
         if type_mark.is_generic then
            Result := type_mark.to_static(ct.type, False)
         else
            Result := type_mark
         end
      ensure
         Result.is_static
      end

   exports_for (fn: FEATURE_NAME): CLIENT_LIST
         -- Only looks for a possible explicit export clause for a given feature name. Contrarily to
         -- `clients_for', does not compute the export list. Hence, the result may be Void.
      require
         fn /= Void
      do
         if export_list /= Void then
            Result := export_list.clients_for(fn)
         end
      end

   exports_for_all: CLIENT_LIST
      do
         if export_list /= Void then
            Result := export_list.for_all
         end
      end

feature {PARENT_LISTS}
   id_extra_information (tfw: TEXT_FILE_WRITE)
      do
         tfw.put_integer(class_text.id)
      end

   pretty
      local
         end_needed: BOOLEAN
      do
         pretty_printer.set_indent_level(1)
         pretty_printer.put_type_mark(type_mark)
         pretty_printer.set_indent_level(2)
         if comment /= Void then
            comment.pretty(2)
         end
         pretty_printer.set_indent_level(2)
         if rename_list /= Void then
            end_needed := True
            rename_list.pretty
         end
         pretty_printer.set_indent_level(2)
         if export_list /= Void then
            end_needed := True
            export_list.pretty
         end
         pretty_printer.set_indent_level(2)
         if undefine_list /= Void then
            end_needed := True
            pretty_printer.keyword(once "undefine")
            undefine_list.pretty(3)
         end
         pretty_printer.set_indent_level(2)
         if redefine_list /= Void then
            end_needed := True
            pretty_printer.keyword(once "redefine")
            redefine_list.pretty(3)
         end
         pretty_printer.set_indent_level(2)
         if end_needed then
            pretty_printer.keyword(once "end")
         end
         pretty_printer.set_indent_level(0)
      end

   initialize_and_check_level_1 (pl: like parent_lists)
         -- First step of initialization (see also `check_level_2').
      require
         pl /= Void
      local
         i: INTEGER; written_site: CLASS_TEXT; fn, new_fn: FEATURE_NAME
         written_site_name: STRING
      do
         parent_lists := pl
         class_text := type_mark.class_text
         class_text_name := class_text.name.to_string
         written_site := parent_lists.class_text
         if forbidden_parent_list.fast_has(class_text_name) then
            written_site_name := written_site.name.to_string
            if written_site_name = as_integer_32 then
               -- INTEGER_32 allowed to inherit INTEGER.
               check
                  class_text_name = as_integer
               end
            elseif written_site_name = as_real_64 then
               -- REAL_64 allowed to inherit REAL.
               check
                  class_text_name = as_real
               end
            elseif written_site_name = as_natural_32 then
               -- NATURAL_32 allowed to inherit NATURAL.
               check
                  class_text_name = as_natural
               end
            else
               error_handler.add_position(start_position)
               error_handler.append(once "You cannot inherit %"")
               error_handler.append(class_text_name)
               error_handler.append(once "%" (forbidden or not yet implemented).")
               error_handler.print_as_fatal_error
            end
         end
         if type_mark.is_generic and then class_text.formal_generic_list = Void then
            error_handler.add_position(class_text.name.start_position)
            error_handler.add_position(start_position)
            error_handler.append(once "Class ")
            error_handler.append(class_text.name.to_string)
            error_handler.append(once " is not generic.")
            error_handler.print_as_fatal_error
         end
         if rename_list /= Void then
            rename_list.initialize_and_check_level_1
         end
         if redefine_list /= Void then
            from
               i := 1
            until
               i > redefine_list.count
            loop
               fn := redefine_list.item(i)
               if not written_site.proper_has(fn) then
                  error_handler.add_position(fn.start_position)
                  error_handler.append(once "Redefinition of ")
                  error_handler.add_feature_name(fn)
                  error_handler.append(once " not found in this class.")
                  error_handler.print_as_fatal_error
               end
               new_fn := get_name_in_child(fn)
               if new_fn /= Void then
                  error_handler.add_position(fn.start_position)
                  error_handler.add_position(rename_list.name_in_parent(new_fn).start_position)
                  error_handler.append(once "Cannot redefine ")
                  error_handler.add_feature_name(fn)
                  error_handler.append(once " which is actually already renamed as ")
                  error_handler.add_feature_name(new_fn)
                  error_handler.print_as_fatal_error
               end
               i := i + 1
            end
         end
      ensure
         parent_lists = pl
         class_text /= Void
         class_text_name /= Void
      end

   check_level_2 (type: TYPE)
         -- Second and last step (see also `initialize_and_check_level_1').
      require
         type.class_text = parent_lists.class_text
      local
         parent_type: TYPE; i: INTEGER; fn: FEATURE_NAME
      do
         if undefine_list /= Void then
            parent_type := type_mark.resolve_in(type)
            from
               i := 1
            until
               i > undefine_list.count
            loop
               fn := undefine_list.item(i)
               if (not is_target_of_rename(fn)) and then not parent_type.valid_feature_name(fn) then
                  error_handler.add_position(fn.start_position)
                  error_handler.append(once "Cannot undefine ")
                  error_handler.add_feature_name(fn)
                  error_handler.append(once " because type ")
                  error_handler.append(parent_type.name.to_string)
                  error_handler.append(once " does not have ")
                  error_handler.add_feature_name(fn)
                  error_handler.append(once ".")
                  error_handler.print_as_fatal_error
               end
               i := i + 1
            end
         end
         if redefine_list /= Void then
            if parent_type = Void then
               parent_type := type_mark.resolve_in(type)
            end
            from
               i := 1
            until
               i > redefine_list.count
            loop
               fn := redefine_list.item(i)
               if (not is_target_of_rename(fn)) and then not parent_type.valid_feature_name(fn) then
                  error_handler.add_position(fn.start_position)
                  error_handler.append(once "Cannot redefine ")
                  error_handler.add_feature_name(fn)
                  error_handler.append(once " because type ")
                  error_handler.append(parent_type.name.to_string)
                  error_handler.append(once " does not have ")
                  error_handler.add_feature_name(fn)
                  error_handler.append(once ".")
                  error_handler.print_as_fatal_error
               end
               i := i + 1
            end
         end
         if export_list /= Void then
            if parent_type = Void then
               parent_type := type_mark.resolve_in(type)
            end
            export_list.check_level_2(Current, parent_type)
         end
         if rename_list /= Void then
            if parent_type = Void then
               parent_type := type_mark.resolve_in(type)
            end
            rename_list.check_level_2(parent_type)
         end
      end

feature {EIFFEL_PARSER}
   set_comment (c: like comment)
      do
         comment := c
      end

   add_rename (rp: RENAME_PAIR)
      require
         rp /= Void
      do
         if rename_list = Void then
            create rename_list.make(rp)
         else
            rename_list.add_last(rp)
         end
      end

   set_export (el: EXPORT_LIST)
      require
         el /= Void
      do
         export_list := el
      ensure
         export_list = el
      end

   set_undefine (ul: FEATURE_NAME_LIST)
      do
         undefine_list := ul
      ensure
         undefine_list = ul
      end

   set_redefine (rl: FEATURE_NAME_LIST)
      do
         redefine_list := rl
      ensure
         redefine_list = rl
      end

feature {}
   comment: COMMENT
         -- Associated heading comment.

   make (insert_flag: BOOLEAN; tm: like type_mark)
      require
         not tm.is_anchored
      do
         is_insert_member := insert_flag
         type_mark := tm
      ensure
         is_insert_member = insert_flag
         type_mark = tm
      end

   forbidden_parent_list: HASHED_SET[STRING]
         -- It is not allowed to inherit a class of this list (except exceptions !).
      once
         Result := {HASHED_SET[STRING] << as_boolean,
                                          as_character,
                                          as_integer_8,
                                          as_integer_16,
                                       --   as_integer_32,
                                       --   as_integer,
                                          as_integer_64,
                                          as_native_array,
                                          as_pointer,
                                       --   as_real_32,
                                       --   as_real_64,
                                       --   as_real,
                                          as_real_80,
                                          as_weak_reference
                                          >> }
      end

   get_name_in_child (fn: FEATURE_NAME): like fn
      do
         if rename_list /= Void then
            Result := rename_list.name_in_child(fn)
            if Result = fn then
               Result := Void
            end
         end
      end

invariant
   not type_mark.is_anchored

end -- class PARENT_EDGE
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
