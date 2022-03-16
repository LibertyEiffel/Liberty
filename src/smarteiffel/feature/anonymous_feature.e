-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ANONYMOUS_FEATURE
   --
   -- For all possible Features : procedure, function, attribute,
   -- constants, once procedure, once function, ...
   --

inherit
   VISITABLE
   INDEXINGABLE

insert
   GLOBALS

feature {ANY}
   feature_text: FEATURE_TEXT
         -- Back-link to the corresponding written one.

   class_text: CLASS_TEXT
         -- The class where the feature is really written.
      do
         Result := feature_text.class_text
      ensure
         Result /= Void
      end

   clients: CLIENT_LIST
         -- Authorized clients list of the corresponding feature clause in the base definition class. This
         -- list is purely syntactic. Also see `permissions'.
      do
         Result := feature_text.clients
      end

   names: FEATURE_NAME_LIST
         -- All the names of the feature.
      do
         Result := feature_text.names
      ensure
         Result /= Void
      end

   arguments: FORMAL_ARG_LIST
         -- Arguments if any.
      deferred
      end

   result_type: TYPE_MARK
         -- Result type if any.
      deferred
      end

   header_comment: COMMENT
         -- Header comment for a routine or following comment for an attribute.

   obsolete_mark: MANIFEST_STRING
         -- The `obsolete' mark if any.
      deferred
      end

   require_assertion: REQUIRE_ASSERTION
         -- Not Void if any.

   rescue_compound: INSTRUCTION
         -- Not Void if any.
      deferred
      end

   ensure_assertion: ENSURE_ASSERTION
         -- Not Void if any.

   is_deferred: BOOLEAN
         -- Is it a deferred feature ?
      deferred
      end

   is_attribute: BOOLEAN
      deferred
      end

   frozen sedb_trace_before_exit: POSITION
      do
         Result := feature_text.sedb_trace_before_exit
      end

   frozen class_text_name: CLASS_NAME
         -- Name of the class where the feature is really written.
      do
         Result := class_text.name
      end

   frozen first_name: FEATURE_NAME
      do
         Result := names.first
      ensure
         Result /= Void
      end

   frozen start_position: POSITION
      do
         Result := first_name.start_position
      end

   assigner: FEATURE_NAME
         -- If this feature can be assigned to, the assigner feature name.

   frozen obsolete_warning_check (type: TYPE; caller: POSITION)
      do
         if obsolete_mark /= Void and then not obsolete_warning_check_memory.has(caller) then
            obsolete_warning_check_memory.add(caller)
            error_handler.add_position(caller)
            error_handler.append(once "While checking this call in ")
            error_handler.append(type.name.to_string)
            error_handler.append(once " context, it appears to be a call to an obsolete feature:%N")
            error_handler.append(obsolete_mark.to_string)
            error_handler.add_position(obsolete_mark.start_position)
            error_handler.print_as_warning
         end
      end

   frozen set_header_comment (hc: like header_comment)
      do
         header_comment := hc
      ensure
         header_comment = hc
      end

   pretty (indent_level: INTEGER; is_inline_agent: BOOLEAN)
      deferred
      end

   has_been_specialized: BOOLEAN
      deferred
      ensure
         Result
      end

   frozen is_once_function: BOOLEAN
         -- (Just to be able to write assertions.)
      local
         once_function: ONCE_FUNCTION
      do
         Result := once_function ?:= Current
      end

   side_effect_free (target_type: TYPE): BOOLEAN
         -- Assuming that it is a final call (See comment in code.)
      require
         target_type.direct_non_void_call_flag
      deferred
      end

   frozen empty_body_side_effect_free_effective_routine (type: TYPE): BOOLEAN
         -- Assuming that it is a final call (See comment in code.)
      local
         effective_routine: EFFECTIVE_ROUTINE
      do
         if {EFFECTIVE_ROUTINE} ?:= Current then
            effective_routine ::= Current
            if effective_routine.routine_body = Void and then effective_routine.routine_then = Void then
               Result := effective_routine.no_rescue_no_local_expanded_in(type)
               if Result and then type.class_text.require_check and then effective_routine.require_assertion /= Void then
                  Result := require_assertion.is_always_true(type) and then require_assertion.side_effect_free(type)
               end
               if Result and then type.class_text.ensure_check and then effective_routine.ensure_assertion /= Void then
                  Result := ensure_assertion.is_always_true(type) and then ensure_assertion.side_effect_free(type)
               end
            end
         end
      end

feature {CALL_0}
   inline_expression_0 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
                        target_type: TYPE; target: EXPRESSION; return_type: TYPE): INLINE_MEMO
         -- (See `inline_instruction_n'.)
      require
         ace.boost
         type /= Void
         Current = feature_stamp.anonymous_feature(target_type)
         target /= Void
         return_type = result_type.resolve_in(target_type)
      do
      ensure
         (Result /= Void) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
         Result /= Void implies Result.is_expression_holder
      end

feature {CALL_1}
   inline_expression_1 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
      target_type: TYPE; target, arg: EXPRESSION; return_type: TYPE): INLINE_MEMO
         -- (See `inline_instruction_n'.)
      require
         ace.boost
         type /= Void
         Current = feature_stamp.anonymous_feature(target_type)
         target /= Void
         arg /= Void
         return_type = result_type.resolve_in(target_type)
      do
      ensure
         (Result /= Void) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
         Result /= Void implies Result.is_expression_holder
      end

feature {FUNCTION_CALL_N}
   inline_expression_n (type: TYPE; feature_stamp: FEATURE_STAMP; target_type: TYPE; target: EXPRESSION
                        args: EFFECTIVE_ARG_LIST; return_type: TYPE): INLINE_MEMO
         -- (See `inline_instruction_n'.)
      require
         ace.boost
         type /= Void
         Current = feature_stamp.anonymous_feature(target_type)
         target /= Void
         args.count >= 2
         return_type = result_type.resolve_in(target_type)
      do
      ensure
         (Result /= Void) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
         Result /= Void implies Result.is_expression_holder
      end

feature {PROCEDURE_CALL_0}
   inline_instruction_0 (type: TYPE; target_type: TYPE; target: EXPRESSION): INLINE_MEMO
         -- (See `inline_instruction_n'.)
      require
         ace.boost
         type /= Void
         target /= Void
         target_type /= Void
      do
      ensure
         (Result /= Void) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
         Result /= Void implies Result.is_instruction_holder
      end

feature {PROCEDURE_CALL_1}
   inline_instruction_1 (type: TYPE; target_type: TYPE; target, arg: EXPRESSION): INLINE_MEMO
         -- (See `inline_instruction_n'.)
      require
         ace.boost
         type /= Void
         target /= Void
         target_type /= Void
         arg /= Void
      do
      ensure
         (Result /= Void) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
         Result /= Void implies Result.is_instruction_holder
      end

feature {PROCEDURE_CALL_N}
   inline_instruction_n (type: TYPE; target_type: TYPE; target: EXPRESSION; args: EFFECTIVE_ARG_LIST): INLINE_MEMO
         -- Attempt to inline the corresponding procedure call (see exportation). If it is possible to
         -- inline, the `Result' is not Void and the `Result' holds the corresponding CODE . (In order to
         -- recycle INLINE_MEMO objects, see also `get_inline_memo' and `dispose_inline_memo' of
         -- `smart_eiffel'.)
      require
         ace.boost
         type /= Void
         target /= Void
         args.count >= 2
         target_type /= Void
      do
      ensure
         (Result /= Void) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
         Result /= Void implies Result.is_instruction_holder
      end

feature {ANY}
   use_current (type: TYPE): BOOLEAN
      require
         smart_eiffel.status.collecting_done
         type /= Void
      deferred
      end

feature {LIVE_TYPE, PRECURSOR_CALL}
   frozen inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
         -- This should not be done twice. Assume the `twin' is made by the caller.
      require
         inline_dynamic_dispatch_must_be_done_once
         code_accumulator /= Void
         type /= Void
      local
         resc: CODE
      do
         if require_assertion /= Void then
            if type.class_text.require_check then
               require_assertion ::= require_assertion.inline_dynamic_dispatch(code_accumulator, type)
            else
               require_assertion := Void
            end
         end
         inline_dynamic_dispatch_(code_accumulator, type)
         if rescue_compound /= Void then
            resc := rescue_compound.inline_dynamic_dispatch(code_accumulator, type)
            if resc = Void then
               set_rescue_compound(Void)
            else
               set_rescue_compound(resc.to_instruction)
            end
         end
         if ensure_assertion /= Void then
            if type.class_text.ensure_check then
               ensure_assertion ::= ensure_assertion.inline_dynamic_dispatch(code_accumulator, type)
            else
               ensure_assertion := Void
            end
         end
      end

feature {}
   inline_dynamic_dispatch_flag: BOOLEAN

   frozen inline_dynamic_dispatch_must_be_done_once: BOOLEAN
      do
         if inline_dynamic_dispatch_flag then
            error_handler.add_position(start_position)
            error_handler.append(once "Internal compiler warning (ANONYMOUS_FEATURE.inline_dynamic_dispatch called twice).")
            error_handler.print_as_warning
         else
            inline_dynamic_dispatch_flag := True
            Result := True
         end
      end

   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      deferred
      end

feature {FEATURE_STAMP, LIVE_TYPE, PRECURSOR_CALL}
   simplify (type: TYPE): ANONYMOUS_FEATURE
         -- May return `Current' or a simplified version of `Current'.
      require
         type /= Void
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
         smart_eiffel.status.collecting_done
         ace.boost1 or ace.boost2
      deferred
      ensure
         Result /= Void
         (Result /= Current) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
      end

   contextual_simplify (type: TYPE): ANONYMOUS_FEATURE
         -- May return `Current' or a simplified version of `Current'.
         --|*** Future optimization mode. To be implemented
      require
         type /= Void
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
         smart_eiffel.status.collecting_done
         ace.boost3
      do
         Result := simplify(type)
      ensure
         Result /= Void
         (Result /= Current) = (smart_eiffel.magic_count > old smart_eiffel.magic_count)
      end

feature {FEATURE_STAMP, LIVE_TYPE}
   frozen brand_new_run_feature_for (t: TYPE; fn: FEATURE_NAME; is_precursor: BOOLEAN): RUN_FEATURE
   -- TODO: translate comment
         --|*** Supprimer cette fonction intermediaire et transmettre is_precursor, ca devrait servir.
      require
         t /= Void
      do
         Result := new_run_feature_for(t, fn)
      ensure
         not is_precursor implies name_check(Result.name, t.name_of(Current))
         is_precursor implies t.name_of(Current) = Void
      end

feature {}
   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE
      require
         t /= Void
      deferred
      end

   name_check (n1, n2: FEATURE_NAME): BOOLEAN
      do
         Result := n1 = n2
         if not Result then
            sedb_breakpoint
         end
      end

feature {ANONYMOUS_FEATURE, ANONYMOUS_FEATURE_MIXER, ANONYMOUS_FEATURE_VISITOR,
   FEATURE_CALL, FEATURE_NAME_LIST, HIDDEN_EXPRESSION_DETECTOR, RUN_FEATURE}

   permissions: CLIENT_LIST
         -- Authorized clients list computed from the corresponding feature clause in the base definition
         -- class and export items in inherit clauses . This list is semantic.  Also see `clients'.

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_permissions_in (new_type: TYPE): like Current
      require
         new_type /= Void
      do
         if permissions /= Void then
            permissions.specialize_in(new_type)
         end
         Result := Current
      end

   specialize_signature_in (new_type: TYPE): like Current
      require
         new_type /= Void
      deferred
      ensure
         Result /= Void
      end

   specialize_permissions_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      require
         parent_type /= Void
         parent_edge /= Void
         new_type /= Void
      local
         perm: like permissions
      do
         Result := Current
         if permissions /= Void then
            perm := permissions.specialize_thru(parent_type, parent_edge, new_type)
            if perm /= permissions then
               Result := twin
               Result.set_permissions(perm)
            end
         end
      ensure
         Result /= Void
      end

   specialize_signature_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      require
         parent_type /= Void
         parent_edge /= Void
         new_type /= Void
      deferred
      ensure
         Result /= Void
      end

feature {ANONYMOUS_FEATURE_MIXER}
   frozen merge_signature_thru (other: ANONYMOUS_FEATURE; parent_type: TYPE; parent_edge: PARENT_EDGE
                                new_type: TYPE; can_twin: BOOLEAN): ANONYMOUS_FEATURE
         -- Merge the `Current' signature using the given insert/inherit path. Signature has to be identical with
         -- the one given in `other' and the result has signature from `Current' or `other' based on
         -- inserted path.
      require
         other /= Void
         parent_type /= Void
         parent_edge /= Void
         new_type /= Void
         error_handler.is_empty
      local
         af: ANONYMOUS_FEATURE
      do
         if other = Current then
            Result := other
         else
            --|*** memory leak
            af := specialize_signature_thru(parent_type, parent_edge, new_type)
            if not af.same_signature(other, new_type) then
               error_handler.add_position(start_position)
               error_handler.add_position(parent_edge.start_position)
               error_handler.add_position(other.start_position)
               --|*** how to add position for other.inherit?
               error_handler.append(once " These two inherited features have the same name in type `")
               error_handler.append(new_type.name.to_string)
               error_handler.append(once "' but different signatures. According to the join rule, %
                %the signatures have to be identical in the final class.")
               error_handler.print_as_fatal_error
            end
            Result := other
            --|*** As the Result is always other, we could turn this
            --|into a procedure ?? (feb 2nd 2006)
         end
      end

   specialize_body_in (new_type: TYPE; can_twin: BOOLEAN): like Current
      require
         new_type /= Void
      deferred
      ensure
         not can_twin implies Result = Current
         Result.has_been_specialized
      end

feature {ANONYMOUS_FEATURE_MIXER}
   frozen valid_redefinition (other: ANONYMOUS_FEATURE; parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): BOOLEAN
         -- Test if `Current' is a valid redefinition of other through the specified inherit way.
      require
         other /= Void
         parent_type /= Void
         new_type /= Void
         Current /= other
         error_handler.is_empty
      local
         i: INTEGER; t1, t2: TYPE; tm1, tm2: TYPE_MARK
         writable_attribute: WRITABLE_ATTRIBUTE
      do
         Result := True
         if writable_attribute ?:= other then
            if not (writable_attribute ?:= Current) then --| **** TODO: BERK
               error_handler.add_position(start_position)
               error_handler.add_position(other.start_position)
               error_handler.append(once "Bad redefinition. An attribute must be redefined as an %
                                         %attribute only (VDRD.6).")
               error_handler.print_as_fatal_error
            end
         end
         if Result and then arguments /= other.arguments then
            if arguments = Void or else other.arguments = Void then
               error_handler.add_position(other.start_position)
               error_handler.add_position(start_position)
               error_handler.append(em_ohabnto)
               Result := False
            elseif arguments.count /= other.arguments.count then
               error_handler.add_position(other.start_position)
               error_handler.add_position(start_position)
               error_handler.append(em_ina)
               Result := False
            end
         end
         if Result then
            if result_type = Void then
               if other.result_type /= Void then
                  error_handler.add_position(other.start_position)
                  error_handler.add_position(start_position)
                  error_handler.append(em_ohrbnto)
                  Result := False
               end
            else
               --|*** warn assignment_handler? Only for alive functions in live-type
               if other.result_type = Void then
                  error_handler.add_position(other.start_position)
                  error_handler.add_position(start_position)
                  error_handler.append(em_ohrbnto)
                  Result := False
               else
                  t1 := result_type.resolve_in(new_type)
                  t2 := other.result_type.resolve_in(parent_type)
                  if t1 = t2 then
                     -- No modification, i.e. novariance is always allowed.
                  else
                     inspect
                        t1.insert_inherit_test(t2)
                     when inherits_code then
                        -- Both valid for an insert or inherit link.
                     when inserts_code then
                        if parent_edge.is_inherit_member then
                           valid_redefinition_error(other.result_type, parent_type, result_type, new_type)
                           Result := False
                        end
                     when unrelated_code then
                        valid_redefinition_error(other.result_type, parent_type, result_type, new_type)
                        Result := False
                     end
                  end
               end
            end
         end
         if Result then
            if arguments /= Void then
               from
                  i := 1
               until
                  i > arguments.count
               loop
                  tm1 := arguments.type_mark(i)
                  t1 := tm1.resolve_in(new_type)
                  tm2 := other.arguments.type_mark(i)
                  t2 := tm2.resolve_in(parent_type)
                  if t1 = t2 then
                     -- No modification, i.e. novariance is always allowed.
                  else
                     inspect
                        t1.insert_inherit_test(t2)
                     when inherits_code then
                        -- Both valid for an insert or inherit link.
                     when inserts_code then
                        if parent_edge.is_inherit_member then
                           valid_redefinition_error(tm2, parent_type, tm1, new_type)
                           Result := False
                        end
                     when unrelated_code then
                        valid_redefinition_error(tm2, parent_type, tm1, new_type)
                        Result := False
                     end
                  end
                  i := i + 1
               end
            end
         end
      end

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_body_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE; can_twin: BOOLEAN): like Current
      require
         parent_type /= Void
         parent_edge /= Void
         new_type /= Void
         has_been_specialized
      deferred
      ensure
         not can_twin implies Result = Current
         has_been_specialized
         Result.has_been_specialized
      end

feature {FEATURE_STAMP, PRECURSOR_CALL}
   specialize_and_check (type: TYPE): like Current
      require
         has_been_specialized
         not smart_eiffel.status.is_specializing
      deferred
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

feature {ANONYMOUS_FEATURE}
   frozen same_signature (other: ANONYMOUS_FEATURE; into: TYPE): BOOLEAN
         -- True when `Current' and `other' have the same signature when both are interpreted in type `into'.
         -- This property is required by the join rule.
      require
         Current /= other
         error_handler.is_empty
      local
         i: INTEGER; arg1, arg2: FORMAL_ARG_LIST
      do
         Result := (result_type = Void) = (other.result_type = Void)
         if not Result then
            error_handler.append(em_ohrbnto)
         else
            if result_type /= Void then
               Result := result_type.same_signature_type(other.result_type, into)
               if not Result then
                  error_handler.append(once "Different result types.")
               end
            end
            if Result and then arguments /= other.arguments then
               Result := arguments = Void = (other.arguments = Void)
               if not Result then
                  error_handler.append(em_ohabnto)
               elseif arguments = Void then
                  Result := True
               elseif arguments.count /= other.arguments.count then
                  Result := False
                  error_handler.append(em_ina)
               else
                  --|*** Memory leak
                  --|        create arg1.with(Current.arguments, into.type_mark)
                  --|        create arg2.with(other.arguments, into.type_mark)
                  from
                     arg1 := Current.arguments
                     arg2 := other.arguments
                     i := 1
                  until
                     i > arg1.count
                  loop
                     Result := Result and then arg1.type_mark(i).same_signature_type(arg2.type_mark(i), into)
                     i := i + 1
                  end
                  if not Result then
                     error_handler.append(once "Different arguments types.")
                  end
               end
            end
         end
      ensure
         Result = error_handler.is_empty
      end

feature {FEATURE_ACCUMULATOR}
   same_body_as (other: ANONYMOUS_FEATURE): BOOLEAN
      do
         Result := feature_text = other.feature_text
      end

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_require_in (type: TYPE): like Current
      local
         ra: like require_assertion
      do
         if require_assertion = Void then
            Result := Current
         else
            ra := require_assertion.specialize_in(type)
            if ra = require_assertion then
               Result := Current
            else
               Result := twin
               Result.set_require_assertion(ra)
            end
         end
      ensure
         require_assertion /= Void implies Result.require_assertion.has_been_specialized
      end

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_require_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      require
         require_assertion /= Void implies require_assertion.has_been_specialized
      local
         ra: like require_assertion
      do
         if require_assertion = Void then
            Result := Current
         else
            ra := require_assertion.specialize_thru(parent_type, parent_edge, new_type)
            if ra = require_assertion then
               Result := Current
            else
               Result := twin
               Result.set_require_assertion(ra)
            end
         end
      ensure
         require_assertion /= Void implies Result.require_assertion.has_been_specialized
      end

feature {ANONYMOUS_FEATURE_MIXER}
   frozen change_require (req: REQUIRE_ASSERTION; can_twin: BOOLEAN): like Current
      require
         req /= Void
      do
         Result := Current
         if req /= require_assertion then
            if can_twin then
               Result := twin
               Result.set_require_assertion(req)
            else
               require_assertion := req
            end
         end
      ensure
         not can_twin implies Result = Current
      end

   specialized_require_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): REQUIRE_ASSERTION
      do
         if require_assertion /= Void then
            Result := require_assertion.specialize_thru(parent_type, parent_edge, new_type)
         end
      ensure
         Result /= Void implies Result.has_been_specialized
      end

   specialize_ensure_in (type: TYPE; can_twin: BOOLEAN): like Current
      local
         ea: like ensure_assertion
      do
         if ensure_assertion = Void then
            Result := Current
         else
            ea := ensure_assertion.specialize_in(type)
            if ea = ensure_assertion then
               Result := Current
            else
               if can_twin then
                  Result := twin
               else
                  Result := Current
               end
               Result.set_ensure_assertion(ea)
            end
         end
      ensure
         ensure_assertion /= Void implies Result.ensure_assertion.has_been_specialized
      end

   specialize_ensure_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; type: TYPE; can_twin: BOOLEAN): like Current
      require
         ensure_assertion /= Void implies ensure_assertion.has_been_specialized
      local
         ea: like ensure_assertion
      do
         if ensure_assertion = Void then
            Result := Current
         else
            ea := ensure_assertion.specialize_thru(parent_type, parent_edge, type)
            if ea = ensure_assertion then
               Result := Current
            else
               if can_twin then
                  Result := twin
               else
                  Result := Current
               end
               Result.set_ensure_assertion(ea)
            end
         end
      ensure
         not can_twin implies Result = Current
         ensure_assertion /= Void implies Result.ensure_assertion.has_been_specialized
      end

   frozen change_ensure (ens: ENSURE_ASSERTION; can_twin: BOOLEAN): like Current
      require
         ens /= Void
      do
         Result := Current
         if ens /= ensure_assertion then
            if can_twin then
               Result := twin
               Result.set_ensure_assertion(ens)
            else
               ensure_assertion := ens
            end
         end
      ensure
         not can_twin implies Result = Current
      end

   specialized_ensure_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; type: TYPE): ENSURE_ASSERTION
      do
         if ensure_assertion /= Void then
            Result := ensure_assertion.specialize_thru(parent_type, parent_edge, type)
         end
      ensure
         Result /= Void implies Result.has_been_specialized
      end

   specialize_permissions (export_clause: CLIENT_LIST; can_twin: BOOLEAN): like Current
      require
         export_clause /= Void
      do
         Result := Current
         if export_clause /= permissions then
            if permissions = Void then
               permissions := export_clause
            elseif can_twin then
               Result := twin
               Result.set_permissions(export_clause)
            else
               permissions := export_clause
            end
         end
      ensure
         Result /= Void
         not can_twin implies Result = Current
      end

feature {ANONYMOUS_FEATURE}
   set_permissions (perm: like permissions)
      do
         permissions := perm
      end

feature {LIVE_TYPE, TYPE, PRECURSOR_CALL}
   collect (t: TYPE)
      require
         has_been_specialized
         t.feature_collection_done
         smart_eiffel.status.is_collecting
         not smart_eiffel.status.is_specializing
      local
         t2, dummy: TYPE
      do
         smart_eiffel.push_context(Current)
         if t.class_text.require_check and then require_assertion /= Void then
            dummy := require_assertion.collect(t)
         end
         if result_type /= Void then
            t2 := result_type.resolve_in(t)
            if t2.is_expanded then
               smart_eiffel.collect_local_expanded(t2)
            end
         end
         collect_body(t)
         if t.class_text.ensure_check and then ensure_assertion /= Void then
            dummy := ensure_assertion.collect(t)
         end
         hook_collect(t)
         smart_eiffel.pop_context(Current)
      end

feature {}
   frozen valid_redefinition_error (parent_type_mark: TYPE_MARK; parent_type: TYPE
                                    redefinition_type_mark: TYPE_MARK; new_type: TYPE)
         -- Trying to explain the error the best as we can.
      require
         error_handler.is_empty
      local
         parent_resolved, redefinition_resolved: TYPE
      do
         parent_resolved := parent_type_mark.resolve_in(parent_type)
         redefinition_resolved := redefinition_type_mark.resolve_in(new_type)
         error_handler.add_position(parent_type_mark.start_position)
         error_handler.add_position(redefinition_type_mark.start_position)
         error_handler.append(once "Type ")
         error_handler.append(redefinition_resolved.name.to_string)
         error_handler.append(once " is not a valid redefinition for ")
         error_handler.append(parent_resolved.name.to_string)
         error_handler.append(once ". Signature of the redefined feature is not valid.")
         if (not parent_type_mark.is_static) or (not redefinition_type_mark.is_static) then
            error_handler.append(once " (More explaination below.)")
         end
         error_handler.print_as_error
         if not parent_type_mark.is_static then
            error_handler.add_position(parent_type_mark.start_position)
            error_handler.append(once "In the parent context (i.e in ")
            error_handler.append(parent_type.name.to_string)
            error_handler.append(once ") this type mark is resolved as ")
            error_handler.append(parent_resolved.name.to_string)
            error_handler.append(once ".")
            error_handler.print_as_error
         end
         if not redefinition_type_mark.is_static then
            error_handler.append(once "In the redefinition context (i.e in ")
            error_handler.append(new_type.name.to_string)
            error_handler.append(once ") this type mark is resolved as ")
            error_handler.append(redefinition_resolved.name.to_string)
            error_handler.append(once ".")
            error_handler.print_as_error
         end
      ensure
         error_handler.is_empty
      end

   collect_body (t: TYPE)
      require
         t /= Void
      deferred
      end

feature {ANONYMOUS_FEATURE, FEATURE_TEXT}
   set_require_assertion (ra: REQUIRE_ASSERTION)
      do
         require_assertion := ra
      end

   set_ensure_assertion (ea: like ensure_assertion)
      do
         ensure_assertion := ea
      end

feature {FEATURE_ACCUMULATOR}
   frozen try_to_undefine (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE
         -- Compute the corresponding deferred feature for `Current'.
         -- This occurs for example when `bc' has an undefine clause for `fn' which refer to `Current'.
         -- The Result is never Void because `fatal_error' may be called.
         --|*** remove this function?
      require
         fn /= Void
         bc.name.get_export_permission_of(class_text_name)
      do
         --
         Result := try_to_undefine_aux(fn, bc)
         if Result /= Void then
            check
            --|*** clients = Result.clients
            --| Removed, because this code will actually disappear.
            --| Dominique 9/7/2003
               permissions = Result.permissions
            end
         else
            bc.fatal_undefine(fn)
         end
      ensure
         Result /= Void
      end

   set_assigner (a_assigner: like assigner)
      do
         assigner := a_assigner
      ensure
         assigner = a_assigner
      end

feature {FEATURE_TEXT}
   frozen add_into (ft: like feature_text; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
      require
         ft /= Void
      do
         feature_text := ft -- The remainder of the jobs depends on the actual one:
         add_into_(ft, fd)
      ensure
         feature_text = ft
      end

   set_rescue_compound (instruction: like rescue_compound)
      require
         not eiffel_parser.no_rescue
      deferred
      ensure
         rescue_compound = instruction
      end

feature {ANY}
   closure_arguments: FAST_ARRAY[FORMAL_ARG_LIST]
         -- Arguments of enclosing features

   closure_local_vars: FAST_ARRAY[LOCAL_VAR_LIST]
         -- Local vars of enclosing features

feature {FEATURE_TEXT}
   set_closure (ca: like closure_arguments; clv: like closure_local_vars)
      do
         closure_arguments := ca
         closure_local_vars := clv
      ensure
         closure_arguments = ca
         closure_local_vars = clv
      end

feature {}
   specialize_closure_arguments_lists_in (new_type: TYPE): like closure_arguments
      local
         i: INTEGER; fa1, fa2: FORMAL_ARG_LIST
      do
         if closure_arguments /= Void then
            from
               Result := closure_arguments
               i := Result.lower
            until
               fa1 /= fa2 or else i > Result.upper
            loop
               fa1 := Result.item(i)
               if fa1 = Void then
                  fa2 := Void
               else
                  fa2 := fa1.specialize_in(new_type)
               end
               i := i + 1
            end
            if fa1 /= fa2 then
               Result := Result.twin
               from
                  Result.put(fa2, i - 1)
               until
                  i > Result.upper
               loop
                  fa1 := Result.item(i)
                  if fa1 /= Void then
                     fa2 := fa1.specialize_in(new_type)
                     Result.put(fa2, i)
                  end
                  i := i + 1
               end
            end
         end
      end

   specialize_closure_arguments_lists_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like closure_arguments
      local
         i: INTEGER; fa1, fa2: FORMAL_ARG_LIST
      do
         if closure_arguments /= Void then
            from
               Result := closure_arguments
               i := Result.lower
            until
               fa1 /= fa2 or else i > Result.upper
            loop
               fa1 := Result.item(i)
               if fa1 = Void then
                  fa2 := Void
               else
                  fa2 := fa1.specialize_thru(parent_type, parent_edge, new_type)
               end
               i := i + 1
            end
            if fa1 /= fa2 then
               Result := Result.twin
               from
                  Result.put(fa2, i - 1)
               until
                  i > Result.upper
               loop
                  fa1 := Result.item(i)
                  if fa1 /= Void then
                     fa2 := fa1.specialize_thru(parent_type, parent_edge, new_type)
                     Result.put(fa2, i)
                  end
                  i := i + 1
               end
            end
         end
      end

   specialize_closure_local_var_lists_in (new_type: TYPE): like closure_local_vars
      local
         i: INTEGER; lv1, lv2: LOCAL_VAR_LIST
      do
         if closure_local_vars /= Void then
            from
               Result := closure_local_vars
               i := Result.lower
            until
               lv1 /= lv2 or else i > Result.upper
            loop
               lv1 := Result.item(i)
               if lv1 /= Void then
                  lv2 := lv1.specialize_in(new_type)
               end
               i := i + 1
            end
            if lv1 /= lv2 then
               Result := Result.twin
               from
                  Result.put(lv2, i - 1)
               until
                  i > Result.upper
               loop
                  lv1 := Result.item(i)
                  if lv1 /= Void then
                     lv2 := lv1.specialize_in(new_type)
                     Result.put(lv2, i)
                  end
                  i := i + 1
               end
            end
         end
      end

   specialize_closure_local_var_lists_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like closure_local_vars
      local
         i: INTEGER; lv1, lv2: LOCAL_VAR_LIST
      do
         if closure_local_vars /= Void then
            from
               Result := closure_local_vars
               i := Result.lower
            until
               lv1 /= lv2 or else i > Result.upper
            loop
               lv1 := Result.item(i)
               if lv1 /= Void then
                  lv2 := lv1.specialize_thru(parent_type, parent_edge, new_type)
               end
               i := i + 1
            end
            if lv1 /= lv2 then
               Result := Result.twin
               from
                  Result.put(lv2, i - 1)
               until
                  i > Result.upper
               loop
                  lv1 := Result.item(i)
                  if lv1 /= Void then
                     lv2 := lv1.specialize_thru(parent_type, parent_edge, new_type)
                     Result.put(lv2, i)
                  end
                  i := i + 1
               end
            end
         end
      end

feature {RUN_FEATURE}
   hook_for (lt: LIVE_TYPE)
         -- A hook called at adapt time by RUN_FEATURE
         --|*** adapt_for_hook would be a better name *** (Dom june 13th 2004) ***
      do
      end

feature {EIFFEL_PARSER}
   set_end_comment (ec: COMMENT)
      require
         False
      do
      end

feature {}
   hook_collect (t: TYPE)
         -- A hook called at collect time
      require
         t /= Void
      do
      end

feature {}
   frozen pretty_print_names
         -- Print only the names of the feature.
      local
         i: INTEGER; fn: FEATURE_NAME
      do
         from
            i := 1
            fn := names.item(i)
            fn.declaration_pretty_print
            i := i + 1
         until
            i > names.count
         loop
            pretty_printer.put_character(',')
            if not pretty_printer.zen_mode then
               pretty_printer.put_character(' ')
            end
            fn := names.item(i)
            fn.declaration_pretty_print
            i := i + 1
         end
      end

   try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE
      require
         fn /= Void
         bc /= Void
      deferred
      end

   em_chtfi: STRING "Cannot inherit these features in "

   em_ohrbnto: STRING "Incompatible signatures. (One has a result type and not the other.)"

   em_ohabnto: STRING "Incompatible signatures. (One has argument(s) but not the other.)"

   em_ina: STRING "Incompatible number of arguments."

   add_into_ (ft: like feature_text; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
         -- Note: the `add_into_shared' is the most common behavior.
      require
         feature_text = ft
      deferred
      end

   add_into_shared (ft: like feature_text; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
         --|*** PH: WARNING !!!!!!!!! It's not shared anymore.
         --|*** I don't know how to do yet. The problem: when synonyms are used
         --|*** many fn points to fs who points to the same af. This af may have
         --|*** multiple names but points to only one rf who has one name only.
         --|*** This may be better to implement `add_into' in the way suggested in ETL,
         --|*** this means synonyms are just equivalent to code duplication except for
         --|*** uniques.
         --|*** See TYPE.name_of too.
      require
         feature_text = ft
      local
         n: like names; fn: FEATURE_NAME; i: INTEGER
      do
         from
            n := ft.names
            i := 1
         until
            i > n.count
         loop
            fn := n.item(i)
            check
               not fd.has(fn)
            end
            if i = 1 then
               fd.add(Current, fn)
            else
               fd.add(twin, fn)
            end
            i := i + 1
         end
      ensure
         fd.count = old fd.count + ft.names.count
      end

feature {}
   obsolete_warning_check_memory: AVL_SET[POSITION]
         -- To avoid same warning repetition.
      once
         create Result.make
      end

   export_to_any: CLIENT_LIST
      once
         create Result.omitted
      end

end -- class ANONYMOUS_FEATURE
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
