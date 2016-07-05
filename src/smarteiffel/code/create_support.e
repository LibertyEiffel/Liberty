-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class CREATE_SUPPORT
   --
   -- Common root for OLD_CREATION, CREATE_INSTRUCTION and CREATE_EXPRESSION
   --

insert
   GLOBALS

feature {ANY}
   start_position: POSITION

   explicit_type: TYPE_MARK
         -- Explicit created one (optional for the CREATE_INSTRUCTION and mandatory for the CREATE_EXPRESSION).

   writable: EXPRESSION
         -- The target of the creation call (mandatory for the CREATE_INSTRUCTION and forbidden for the
         -- CREATE_EXPRESSION).

   call: PROCEDURE_CALL
         -- Optional initialisation call if any. (The target of `call' is the `writable' entity.)

   default_create_call: BOOLEAN

   frozen side_effect_free (type: TYPE): BOOLEAN
      do
         -- Memory allocation.
      end

   frozen safety_check (type: TYPE)
      local
         args: like arguments
      do
         if call /= Void then
            args := arguments
            if args /= Void then
               args.safety_check(type)
            end
         end
      end

   created_type (type: TYPE): TYPE
      require
         type /= Void
      deferred
      ensure
         Result /= Void
      end

feature {ONCE_ROUTINE_POOL, PRECOMPUTABLE_ROUTINE_DETECTOR, HIDDEN_EXPRESSION_DETECTOR}
   creation_procedure (type_to_create: TYPE): E_ROUTINE
      require
         type_to_create /= Void
         default_create_is_inherited: call /= Void
      local
         feature_stamp: FEATURE_STAMP
      do
         -- (At this step, we are sure to have a non Void call, because `default_create' is made
         -- as the default.)
         feature_stamp := call.feature_stamp
         Result ::= feature_stamp.anonymous_feature(type_to_create)
      ensure
         Result /= Void
         ({E_PROCEDURE} ?:= Result) or ({EXTERNAL_PROCEDURE} ?:= Result)
      end

feature {CREATE_SUPPORT}
   specialize_checks (type: TYPE)
         -- Check the validity of the CREATION_INSTRUCTION / CREATION_EXPRESSION where `type' is the
         -- `specialize_and_check' argument. (Note because of possible redefinition checks are not wrapped inside a
         -- `is_the_validity_check_site_of' call.)
      require
         type /= Void
         call /= Void
         may_report_an_error: error_handler.is_empty
      local
         created_type_memory, writable_type: TYPE; fn: FEATURE_NAME; class_to_create: CLASS_TEXT
         feature_stamp: FEATURE_STAMP; creation_clause_list: CREATION_CLAUSE_LIST
         fgtm: FORMAL_GENERIC_TYPE_MARK; creation_constraint: CREATION_CLAUSE
         anonymous_feature: ANONYMOUS_FEATURE; default_expression: EXPRESSION
      do
         if explicit_type = Void then
            debug ("savannah#43631")
               if {LIKE_CURRENT_TYPE_MARK} ?:= writable.written_declaration_type_mark then
                  error_handler.add_position(writable.start_position)
                  error_handler.add_position(writable.written_declaration_type_mark.start_position)
                  error_handler.append(once "create like Current!!")
                  error_handler.print_as_warning
               end
            end

            if writable.written_declaration_type_mark.is_formal_generic then
               fgtm ::= writable.written_declaration_type_mark
               creation_constraint := fgtm.formal_generic_creation
               debug
                  echo.w_put_string(once "**** Implicit creation type in ")
                  echo.w_put_string(type.canonical_type_mark.written_mark)
                  echo.w_put_string(once ": [")
                  echo.w_put_string(writable.written_declaration_type_mark.written_mark)
                  echo.w_put_string(once "] => ")
                  -- created_type_memory is only written below...
               end
            end
            created_type_memory := writable.resolve_in(type)
            debug
               if writable.written_declaration_type_mark.is_formal_generic then
                  echo.w_put_line(created_type_memory.canonical_type_mark.written_mark)
               end
            end
         else
            debug ("savannah#43631")
               if {LIKE_CURRENT_TYPE_MARK} ?:= explicit_type then
                  error_handler.add_position(explicit_type.start_position)
                  error_handler.append(once "create like Current!!")
                  error_handler.print_as_warning
               end
            end

            if explicit_type.is_formal_generic then
               fgtm ::= writable.written_declaration_type_mark
               creation_constraint := fgtm.formal_generic_creation
               if creation_constraint = Void then
                  -- Because `explicit_type' may be inherited:
                  if start_position.class_text = explicit_type.start_position.class_text then
                     error_handler.add_position(start_position)
                     error_handler.append(once "Creation call on formal generic type (")
                     error_handler.append(explicit_type.written_mark)
                     error_handler.append(once "). No create constraint specified.")
                     error_handler.print_as_fatal_error
                  end
               end
               created_type_memory := fgtm.resolve_in(type)
            else
               created_type_memory := explicit_type.resolve_in(type)
            end
            if writable /= Void then
               writable_type := writable.resolve_in(type)
               if not created_type_memory.can_be_assigned_to(writable_type) then
                  error_handler.add_position(explicit_type.start_position)
                  error_handler.add_position(writable.start_position)
                  error_handler.append(once "Cannot assign newly created object of type ")
                  error_handler.append(created_type_memory.name.to_string)
                  error_handler.append(once " into ")
                  error_handler.add_expression(writable)
                  error_handler.append(once " which is of type ")
                  error_handler.append(writable_type.name.to_string)
                  error_handler.append(once ".")
                  error_handler.print_as_fatal_error
               end
            end
         end
         class_to_create := created_type_memory.class_text
         if class_to_create.is_deferred then
            error_handler.append(once "Type ")
            error_handler.append(created_type_memory.name.to_string)
            error_handler.append(once " is deferred. (Cannot create object.)")
            error_handler.add_position(start_position)
            if creation_constraint /= Void then
               error_handler.cancel
            else
               error_handler.print_as_fatal_error
            end
         else
            creation_clause_list := class_to_create.creation_clause_list
            feature_stamp := call.feature_stamp
            anonymous_feature := feature_stamp.anonymous_feature(created_type_memory)
            if anonymous_feature.result_type /= Void then
               error_handler.add_position(anonymous_feature.start_position)
               error_handler.add_position(call.start_position)
               error_handler.append(once "Feature found is not a procedure.")
               error_handler.print_as_fatal_error
            end
            if creation_clause_list = Void then
               if not default_create_call then
                  error_handler.append(once "Type ")
                  error_handler.append(created_type_memory.name.to_string)
                  error_handler.append(once " has no creation list. You must use the default creation method %
                   %(named `default_create' in class ANY, or just omit the method name).")
                  error_handler.add_position(call.start_position)
                  error_handler.add_position(start_position)
                  error_handler.print_as_fatal_error
               end
            else
               fn := created_type_memory.get_feature_name(feature_stamp)
               if not class_to_create.has_creation_check(fn, start_position, type, created_type_memory) then
                  if default_create_call then
                     error_handler.append(once "Creation clause exists for type ")
                     error_handler.append(created_type_memory.name.to_string)
                     error_handler.append(once " and the default creation procedure (see `default_create' in class ANY) %
                      %is not allowed. You must use one of the available creation procedure here.")
                     error_handler.add_position(start_position)
                     creation_clause_list.all_positions_in_error_handler
                     error_handler.print_as_fatal_error
                  else
                     error_handler.add_position(call.feature_name.start_position)
                     error_handler.add_position(fn.start_position)
                     error_handler.append(fn.to_string)
                     error_handler.append(once " is not in the creation list of type ")
                     error_handler.append(created_type_memory.name.to_string)
                     error_handler.append(once ".")
                     error_handler.add_position(creation_clause_list.start_position)
                     error_handler.print_as_fatal_error
                  end
               end
               if fn.to_string = as_manifest_creation then
                  error_handler.add_position(call.feature_name.start_position)
                  error_handler.add_position(fn.start_position)
                  error_handler.append(once "`manifest_create' is not an ordinary creation procedure. Please use the {")
                  error_handler.append(created_type_memory.name.to_string)
                  error_handler.append(once " ... << ... >> } manifest creation notation.")
                  error_handler.print_as_error
               end
            end
            if created_type_memory.is_kernel_expanded then
               error_handler.add_position(start_position)
               error_handler.append(once "Cannot use such a strange create expression for type ")
               error_handler.append(created_type_memory.name.to_string)
               error_handler.append(once " which is a simple and predefined expanded type.")
               if not created_type_memory.is_pointer then
                  error_handler.append(once " Actually, just replace this create expression with ")
                  default_expression := created_type_memory.canonical_type_mark.default_expression(start_position)
                  error_handler.add_expression(default_expression)
                  error_handler.append(once " and you are done.")
               end
               error_handler.print_as_fatal_error
            end
         end
      ensure
         may_report_an_error: error_handler.is_empty
      end

feature {CREATE_SUPPORT}
   set_call (c: like call)
      require
         c /= Void
      do
         call := c
      ensure
         call = c
      end

feature {MANIFEST_TUPLE, CREATE_INSTRUCTION_VISITOR, CREATE_EXPRESSION_VISITOR}
   arguments: EFFECTIVE_ARG_LIST
      require
         call /= Void
      do
         Result := call.arguments
      end

invariant
   not start_position.is_unknown

end -- class CREATE_SUPPORT
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
