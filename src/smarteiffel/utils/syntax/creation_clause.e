-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CREATION_CLAUSE
   --
   -- The store the contents of one creation clause.
   --   example 1
   --                creation {ANY} make
   --   example 2
   --                creation make, foo
   --   example 3
   --                creation {FOO, ANY} make, foo
   --   example 4
   --                creation
   --
   -- Note : The original text of the source file can be stored
   --        for pretty pretty_printing to be fine.
   --

inherit
   VISITABLE
insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   start_position: POSITION
         -- Of the "creation" keyword.

   clients: CLIENT_LIST

   comment: COMMENT

feature {}
   make (sp: like start_position; c: like clients; cm: like comment; pl: like procedure_list)
      require
         not sp.is_unknown
         c /= Void
         pl /= Void
      do
         start_position := sp
         clients := c
         comment := cm
         procedure_list := pl
      ensure
         clients = c
         comment = cm
         procedure_list = pl
      end

feature {ANY}
   pretty
      do
         if not pretty_printer.zen_mode then
            pretty_printer.skip_one_line
         end
         pretty_printer.set_indent_level(0)
         pretty_printer.keyword(once "create")
         if clients /= Void then
            clients.pretty(1)
         end
         if comment /= Void then
            comment.pretty(1)
         end
         pretty_printer.set_indent_level(1)
         procedure_list.pretty(1)
      end

   short (heading_done: BOOLEAN; client: TYPE_MARK; target_type: TYPE): BOOLEAN
         -- True when at least one creation list is printed.
      require
         not_done_to_report_errors: error_handler.is_empty -- required by gives_permission_to
      local
         i: INTEGER; fn: FEATURE_NAME; mgs: MANIFEST_GENERIC_SAMPLE_PRINTER
      do
         if client = Void or else clients.gives_permission_to(client, target_type) then
            if not heading_done then
               short_printer.hook_or("hook100", "creation%N")
            end
            from
               i := 1
            until
               i > procedure_list.count
            loop
               fn := procedure_list.item(i)
               if fn.to_string /= as_manifest_creation then
                  short_printer.put_feature_1(fn)
               else
                  create mgs
                  mgs.display_manifest_generic_for(start_position.class_text.declaration_type_of_like_current)
               end
               i := i + 1
            end
            short_printer.hook_or("hook101", "")
            Result := True
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   has (fn: FEATURE_NAME): BOOLEAN
      require
         fn /= Void
      do
         Result := procedure_list.has(fn)
      end

feature {CREATION_CLAUSE_LIST, CREATION_CLAUSE_VISITOR}
   procedure_list: FEATURE_NAME_LIST

feature {ANY}
   accept (visitor: CREATION_CLAUSE_VISITOR)
      do
         visitor.visit_creation_clause(Current)
      end

feature {CREATION_CLAUSE_LIST}
   default_root: STRING
         -- Return the default creation procedure name to be used as the root procedure (the execution
         -- entry point of the system).
      do
         if procedure_list.has_make then
            Result := as_make
         else
            Result := procedure_list.first.to_string
         end
      end

   root_creation_search (a_name: STRING): FEATURE_NAME
      do
         Result := procedure_list.root_creation_search(a_name)
      end

   check_for (type: TYPE)
      require
         start_position.class_text = type.class_text
      local
         i: INTEGER; af: ANONYMOUS_FEATURE; fs: FEATURE_STAMP; fn: FEATURE_NAME
      do
         from
            i := 1
         until
            i > procedure_list.count
         loop
            fn := procedure_list.item(i)
            if fn.to_string = as_manifest_creation then
               if type.is_expanded and then not type.is_native_array then
                  error_handler.add_position(start_position)
                  error_handler.append(once "Manifest generic creation not yet implemented for expanded types (")
                  error_handler.append(type.name.to_string)
                  error_handler.append(once " is expanded).")
                  error_handler.print_as_fatal_error
               end
               check_manifest_make(type, fn)
               check_manifest_put(type, fn)
               check_manifest_semicolon_check(type, fn)
            else
               fs := type.lookup(fn)
               if fs = Void then
                  error_handler.add_position(fn.start_position)
                  error_handler.append(once "Creation procedure not found.")
                  error_handler.print_as_fatal_error
               end
               af := fs.anonymous_feature(type)
               if af.result_type /= Void then
                  error_handler.add_position(fn.start_position)
                  error_handler.add_position(af.start_position)
                  error_handler.append(once "Invalid creation procedure. A function is not allowed %
                                       %as a creation procedure.")
                  error_handler.print_as_error
               end
               if {ONCE_PROCEDURE} ?:= af then
                  error_handler.add_position(fn.start_position)
                  error_handler.add_position(af.start_position)
                  error_handler.append(once "Invalid creation procedure. A %"once%" procedure is not allowed %
                                       %as a creation procedure.")
                  error_handler.print_as_error
               end
            end
            i := i + 1
         end
      end

   extra_expanded_check (type: TYPE; default_creation_procedure: FEATURE_NAME): FEATURE_NAME
         -- If not Void, the `default_creation_procedure' comes from another CREATION_CLAUSE.
      require
         type.is_user_expanded
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; fn: FEATURE_NAME; i: INTEGER
      do
         from
            i := 1
         until
            i > procedure_list.count
         loop
            fn := procedure_list.item(i)
            -- Using `search' here because the existence of all creation procedures is done
            -- for all TYPEs (reference and expanded as well) somewhere else:
            fs := type.search(fn)
            if fs /= Void then
               af := fs.anonymous_feature(type)
               if af.arguments = Void then
                  -- It is a possible default creation procedure.
                  if default_creation_procedure = Void and then Result = Void then
                     Result := fn
                  else
                     error_handler.add_position(fn.start_position)
                     error_handler.add_position(af.start_position)
                     if default_creation_procedure /= Void then
                        error_handler.add_position(default_creation_procedure.start_position)
                     else
                        error_handler.add_position(Result.start_position)
                        fs := type.search(Result)
                        af := fs.anonymous_feature(type)
                        error_handler.add_position(af.start_position)
                     end
                     error_handler.append(once "Found two possible default creation procedures for expanded type ")
                     error_handler.append(type.name.to_string)
                     error_handler.append(once ". An expanded type must have one unique creation procedure with no %
                                          %argument: the creation procedure used for automatic initialization.")
                     error_handler.print_as_fatal_error
                  end
               end
            end
            i := i + 1
         end
      end

   user_expanded_default_create_stamp (type: TYPE): FEATURE_STAMP
         -- Must be called after `extra_expanded_check'.
      require
         type.is_user_expanded
      local
         i: INTEGER; fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
      do
         from
            i := 1
         until
            Result /= Void or else i > procedure_list.count
         loop
            fs := type.lookup(procedure_list.item(i))
            af := fs.anonymous_feature(type)
            check
               -- Already check that:
               af.result_type = Void
            end
            if af.arguments = Void then
               Result := fs
            end
            i := i + 1
         end
      end

feature {}
   check_manifest_make(t: TYPE; fn: FEATURE_NAME)
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; formal_arg_list: FORMAL_ARG_LIST
      do
         if t.has_simple_feature_name(manifest_make_name) then
            fs := t.feature_stamp_of(manifest_make_name)
            af := fs.anonymous_feature_if_exist(t)
         end
         if af = Void then
            error_handler.add_position(fn.start_position)
            error_handler.append(once "Class ")
            error_handler.append(t.class_text.name.to_string)
            error_handler.append(once " not correctly equiped for manifest generic creation (missing definition %
                                 %of feature `manifest_make').")
            error_handler.print_as_fatal_error
         end
         if af.result_type /= Void then
            error_handler.add_position(fn.start_position)
            error_handler.add_position(af.start_position)
            error_handler.append(once "Feature `manifest_make' must be a procedure.")
            error_handler.print_as_fatal_error
         end
         formal_arg_list := af.arguments
         if formal_arg_list = Void then
            error_handler.add_position(fn.start_position)
            error_handler.add_position(af.start_position)
            error_handler.append(once "Feature `manifest_make' must have at least one INTEGER argument.")
            error_handler.print_as_fatal_error
         end
         if not formal_arg_list.type_mark(1).resolve_in(t).is_integer then
            error_handler.add_position(fn.start_position)
            error_handler.add_position(af.start_position)
            error_handler.append(once "First argument of `manifest_make' must be an INTEGER.")
            error_handler.print_as_fatal_error
         end
      end

   check_manifest_put(t: TYPE; fn: FEATURE_NAME)
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; formal_arg_list: FORMAL_ARG_LIST
      do
         if t.has_simple_feature_name(manifest_put_name) then
            fs := t.feature_stamp_of(manifest_put_name)
            af := fs.anonymous_feature_if_exist(t)
         end
         if af = Void then
            error_handler.add_position(fn.start_position)
            error_handler.append(once "Class ")
            error_handler.append(t.class_text.name.to_string)
            error_handler.append(once " not correctly equiped for manifest generic creation (missing definition %
                                 %of feature `manifest_put').")
            error_handler.print_as_fatal_error
         end
         if af.result_type /= Void then
            error_handler.add_position(fn.start_position)
            error_handler.add_position(af.start_position)
            error_handler.append(once "Feature `manifest_put' must be a procedure.")
            error_handler.print_as_fatal_error
         end
         formal_arg_list := af.arguments
         if formal_arg_list = Void or else formal_arg_list.count < 2 then
            error_handler.add_position(fn.start_position)
            error_handler.add_position(af.start_position)
            error_handler.append(once "Feature `manifest_put' must have at least two argument and the first %
                                 %one must be an INTEGER argument.")
            error_handler.print_as_fatal_error
         end
         if not formal_arg_list.type_mark(1).resolve_in(t).is_integer then
            error_handler.add_position(fn.start_position)
            error_handler.add_position(af.start_position)
            error_handler.append(once "First argument of `manifest_put' must be an INTEGER.")
            error_handler.print_as_fatal_error
         end
      end

   check_manifest_semicolon_check(t: TYPE; fn: FEATURE_NAME)
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
         cst_att_integer: CST_ATT_INTEGER; integer_constant: INTEGER_CONSTANT
      do
         if t.has_simple_feature_name(manifest_semicolon_check_name) then
            fs := t.feature_stamp_of(manifest_semicolon_check_name)
            af := fs.anonymous_feature_if_exist(t)
         end
         if af = Void then
            error_handler.add_position(fn.start_position)
            error_handler.append(once "Class ")
            error_handler.append(t.class_text.name.to_string)
            error_handler.append(once " not correctly equiped for manifest generic creation (missing definition %
                                 %of feature `manifest_semicolon_check').")
            error_handler.print_as_fatal_error
         end
         if {CST_ATT_INTEGER} ?:= af then
            cst_att_integer ::= af
            integer_constant ::= cst_att_integer.value
            if integer_constant.value_memory <= 1 then
               error_handler.add_position(integer_constant.start_position)
               error_handler.append(once "Invalid manifest equipment (must be greater than 1).")
               error_handler.print_as_fatal_error
            end
         elseif not {CST_ATT_BOOLEAN} ?:= af then
            error_handler.add_position(start_position)
            error_handler.add_position(af.start_position)
            error_handler.append(once "Feature `manifest_semicolon_check' must be a constant (INTEGER or BOOLEAN).")
            error_handler.print_as_fatal_error
         end
      end

invariant
   clients /= Void

   procedure_list /= Void

end -- class CREATION_CLAUSE
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
