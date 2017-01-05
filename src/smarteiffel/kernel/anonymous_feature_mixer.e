-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ANONYMOUS_FEATURE_MIXER
   -- Object used to store all informations for a single feature inheritance, because FEATURE_ACCUMULATOR is not able to
   -- specialize ANONYMOUS_FEATUREs (because not all FEATURE_STAMPs are ready).
   --
   -- The first step is to collect all informations for each anonymous feature of one type. Then the signatures may be resolved
   -- and the possible incompatibilities detected. The last step is to specialize assertions and body.
   --
   -- Those objects are recycled for the next type.
   --

insert
   GLOBALS

create {FEATURE_ACCUMULATOR}
   make

feature {FEATURE_ACCUMULATOR}
   make (a_fn: FEATURE_NAME)
      require
         a_fn /= Void
      do
         feature_name := a_fn
         if parents_af = Void then
            create parents_af.make(0)
            create parents_type.make(0)
            create parents_edges.make(0)
         else
            parents_af.clear_count
            parents_type.clear_count
            parents_edges.clear_count
         end
         build_definition := Void
         body_feature := Void
         body_type := Void
         body_inherit := Void
         signature_ready := False
         local_definition := False
      ensure
         not is_ready
      end

   add_inherited_definition (t: TYPE; parent_edge: PARENT_EDGE; an_af: ANONYMOUS_FEATURE)
      require
         t /= Void
         an_af /= Void
         an_af.permissions /= Void
      do
         parents_af.add_last(an_af)
         parents_type.add_last(t)
         if parent_edge /= Void then
            parents_edges.add_last(parent_edge)
         else
            parents_edges.add_last(implicit_any)
         end
      ensure
         is_ready
      end

   set_body (an_af: ANONYMOUS_FEATURE; parent_type: TYPE; parent_edge: PARENT_EDGE)
      require
         parent_type /= Void
         --|*** parent_edge /= Void implies parent_type.feature_accumulator.context_type.direct_thru_step(parent_type, parent_edge)
         an_af.has_been_specialized
      do
         body_feature := an_af
         body_type := parent_type
         if parent_edge /= Void then
            body_inherit := parent_edge
         else
            body_inherit := implicit_any
         end
      ensure
         is_ready
      end

   remove_body
      do
         body_feature := Void
         body_type := Void
         body_inherit := Void
      end

   add_local_definition (an_af: ANONYMOUS_FEATURE)
      require
         an_af /= Void
         body_feature = Void
      do
         body_feature := an_af
         local_definition := True
      ensure
         is_ready
      end

   specialize_signature (context_type: TYPE)
         -- At this stage, all the `feature_stamp's for `context_type' are created and linked with it. The `anonymous_feature's
         -- are not yet connected to the `feature_stamp's.
         --
         -- This feature prepares a specialized version of the anonymous feature signature for the `context_type'.
         --
         -- If there is no local definition, we must have a look at *all* the inherited signatures (which must have been
         -- themselves specialized for `context_type') and verify that they are all the same. This common signature becomes the
         -- one for the feature.
         --
         -- If there is a local definition, its signature must be interpreted for `context_type'. We must verify that this
         -- signature is a valid (covariant) redefinition of all the inherited signatures, for the `context_type'.
         --
         -- There are two major pitfalls:
         --
         -- 1. `context_type' *is* being built. Hence there is no associated `anonymous_feature' per se (yet). We have to ask the
         -- `feature_accumlator' a TYPE_MARK (the result of a feature of `context_type'). On the other hand, the "like
         -- featurename" types can be easily adapted since they exist.
         --
         -- 2. The feature_accumulator, to be able to answer, does not have to ask another `anonymous_feature_mixer' to
         -- `specialize_feature' (because the specialization uses feature_stamps).
         --
         --|*** CAD: "does not have to" or "must not"?
         --|*** And what is the implication of the above sentence?
         --
         -- Remark: we always have to begin with the result type resolution.  The arguments come afterwards, because they can be
         -- anchored to `Result'; we must be able to resolve that without it being a recursivity case.
      require
         is_ready
      local
         i: INTEGER; original, an_af: ANONYMOUS_FEATURE
      do
         if body_inherit = Void and then body_feature = Void then
            -- Inherited definition (all deferred without local)
            check
               not local_definition
            end
            from
               -- for deferred methods
               original := parents_af.first
               build_definition := parents_af.last
                  .specialize_permissions_thru(parents_type.last, parents_edges.last, context_type)
                  .specialize_signature_thru(parents_type.last, parents_edges.last, context_type)
               i := parents_af.lower + 1
            until
               i > parents_af.upper
            loop
               build_definition := parents_af.item(i)
                  .specialize_permissions_thru(parents_type.last, parents_edges.last, context_type)
                  .merge_signature_thru(build_definition, parents_type.item(i), parents_edges.item(i), context_type, original = build_definition)
               i := i + 1
            end
         elseif body_inherit /= Void then
            -- Inherited definition (concrete)
            check
               not local_definition
            end
            build_definition := body_feature
               .specialize_permissions_thru(body_type, body_inherit, context_type)
               .specialize_signature_thru(body_type, body_inherit, context_type)
            from
               i := parents_af.lower
            until
               i > parents_af.upper
            loop
               an_af := parents_af.item(i)
               if an_af /= build_definition and then
                  not build_definition.valid_redefinition(an_af, parents_type.item(i), parents_edges.item(i), context_type)
                then
                  error_handler.print_as_error
                  error_handler.add_position(parents_af.item(i).start_position)
                  error_handler.add_position(parents_edges.item(i).start_position)
                  error_handler.add_position(build_definition.start_position)
                  error_handler.append(once "Signature (adapted in the type ")
                  error_handler.append(context_type.name.to_string)
                  error_handler.append(once ") of the concrete feature (inherited from type ")
                  error_handler.append(body_type.name.to_string)
                  error_handler.append(once ") is not compatible with the deferred one comming from parent type ")
                  error_handler.append(parents_type.item(i).name.to_string)
                  error_handler.append(once ".")
                  error_handler.print_as_fatal_error
               end
               i := i + 1
            end
         else
            -- Local definition
            check
               local_definition
            end
            if not signature_ready then
               build_definition := body_feature
                  .specialize_permissions_in(context_type)
                  .specialize_signature_in(context_type)
               from
                  i := parents_af.lower
               until
                  i > parents_af.upper
               loop
                  if not build_definition.valid_redefinition(parents_af.item(i), parents_type.item(i), parents_edges.item(i), context_type) then
                     error_handler.print_as_error
                     error_handler.add_position(parents_af.item(i).start_position)
                     error_handler.add_position(parents_edges.item(i).start_position)
                     error_handler.add_position(build_definition.start_position)
                     error_handler.append(once "Signature of the redefined feature is not valid.")
                     error_handler.print_as_fatal_error
                  end
                  i := i + 1
               end
            end
         end
         signature_ready := True --|*** save "can_twin" in order to save memory while require specialization
      ensure
         signature_ready
         build_definition /= Void --|*** result_type(context_type) = Void or else result_type(context_type).is_static
      end

   specialize_feature (context_type: TYPE)
         -- Prepare a specialized version of the feature: collect and specialize assertions, then specialize the body too.
         --
         -- Specializing means modifying the CALLs and PROC_CALLs having "Current" as target (be it explicit or not). Those calls
         -- are known by their feature_name; we must connect the feature_stamp to the new type.
         --
         -- Finding the good feature_stamp is important to be able afterwards to ignore all previous renamings.
         --
         -- Principle: if the feature is a local feature_name (meaning source code locally written), the `context_type' allows to
         -- find the associated feature_stamp.
         --
         -- If it's an inherited feature_name (meaning written in a parent class), it is already connected to a feature_stamp; we
         -- use `get_feature_name' in the original type, then we apply the renamings (in *this* inheritance branch) to access the
         -- local feature_name, and then find the good feature_stamp (back to the first case).
      require
         signature_ready
      local
         i: INTEGER; can_twin: BOOLEAN; original, paf: ANONYMOUS_FEATURE
         local_require, inherited_require, parent_require: REQUIRE_ASSERTION;
         new_ensure, parent_ensure: ENSURE_ASSERTION
         export_clause: CLIENT_LIST; pt: TYPE; parent_edge: PARENT_EDGE
      do
         original := build_definition
         -- Assertions may be inherited in a class who has to check them so we have to collect assertions even if this class
         -- does not run them:
         if not ace.boost then
            -- Collect assertion clauses:
            if local_definition then
               check
                  body_inherit = Void
                  original = build_definition
               end
               build_definition := build_definition.specialize_require_in(context_type)
               can_twin := build_definition = original
               build_definition := build_definition.specialize_ensure_in(context_type, can_twin)
               local_require := build_definition.require_assertion
               new_ensure := build_definition.ensure_assertion
            elseif body_inherit /= Void then
               build_definition := build_definition.specialize_require_thru(body_type, body_inherit, context_type)
               can_twin := build_definition = original
               build_definition := build_definition.specialize_ensure_thru(body_type, body_inherit, context_type, can_twin)
               inherited_require := build_definition.require_assertion
               new_ensure := build_definition.ensure_assertion
            end
            from
               i := parents_af.lower
            until
               i > parents_af.upper
            loop
               if parents_edges.item(i) /= body_inherit then
                  --|*** WHY?
                  paf := parents_af.item(i)
                  pt := parents_type.item(i)
                  parent_edge := parents_edges.item(i) -- Preparing require:
                  parent_require := paf.specialized_require_thru(pt, parent_edge, context_type)
                  check
                     specialize_in_already_done: local_require /= Void implies local_require.has_been_specialized
                     not_two_definitions: local_require = Void or else inherited_require = Void
                  end
                  if parent_require /= Void then
                     if local_require /= Void then
                        local_require.add_parent_require(parent_require)
                     elseif inherited_require = Void then
                        inherited_require := parent_require
                     else
                        create local_require.from_parents(inherited_require, parent_require)
                        inherited_require := Void
                     end
                  end
                  -- Preparing `new_ensure':
                  parent_ensure := paf.specialized_ensure_thru(pt, parent_edge, context_type)
                  check
                  -- specialize_in already done:
                     new_ensure /= Void implies new_ensure.has_been_specialized
                  end
                  if new_ensure = Void then
                     new_ensure := parent_ensure
                  elseif parent_ensure /= Void then
                     new_ensure := new_ensure.add_items_from(parent_ensure)
                  end
               end
               i := i + 1
            end
            if local_require = Void then
               local_require := inherited_require
            end
            if local_require /= Void then
               if local_definition then
                  if local_require.direct_parents_require /= Void and then
                     build_definition.require_assertion /= Void and then
                     not build_definition.require_assertion.is_require_else
                   then
                     error_handler.append(once "Keyword %"require%" replaced with %"require else%" because there is an inherited require assertion.")
                     error_handler.add_position(build_definition.require_assertion.start_position)
                     error_handler.print_as_warning
                  elseif local_require.direct_parents_require = Void and then
                     local_require.is_require_else
                   then
                     error_handler.append(once "Keyword %"require else%" replaced with %"require%" (There is no inherited require assertion here).")
                     error_handler.add_position(build_definition.require_assertion.start_position)
                     error_handler.print_as_warning
                  end
               end
               can_twin := build_definition = original
               build_definition := build_definition.change_require(local_require, can_twin)
            end
            if new_ensure /= Void then
               if local_definition then
                  if new_ensure /= build_definition.ensure_assertion and then
                     build_definition.ensure_assertion /= Void and then
                     not build_definition.ensure_assertion.is_ensure_then
                   then
                     error_handler.append(once "Keyword %"ensure%" replaced with %"ensure then%" because there is an inherited ensure assertion.")
                     error_handler.add_position(build_definition.ensure_assertion.start_position)
                     error_handler.print_as_warning
                  elseif new_ensure = build_definition.ensure_assertion and then new_ensure.is_ensure_then then
                     error_handler.append(once "Keyword %"ensure then%" replaced with %"ensure%" (There is no inherited ensure assertion here).")
                     error_handler.add_position(build_definition.ensure_assertion.start_position)
                     error_handler.print_as_warning
                  end
               end
               can_twin := build_definition = original
               build_definition := build_definition.change_ensure(new_ensure, can_twin)
            end
         end
         -- Computing the header comment:
         if smart_eiffel.short_or_class_check_flag then
            from
               i := parents_af.lower
            until
               build_definition.header_comment /= Void or else i > parents_af.upper
            loop
               paf := parents_af.item(i)
               if paf.header_comment /= Void then
                  if build_definition = original then
                     build_definition := build_definition.twin
                  end
                  build_definition.set_header_comment(paf.header_comment)
               end
               i := i + 1
            end
         end
         -- Specialize body
         can_twin := build_definition = original
         if body_inherit = Void then
            build_definition := build_definition.specialize_body_in(context_type, can_twin)
         else
            build_definition := build_definition.specialize_body_thru(body_type, body_inherit, context_type, can_twin)
         end
         if ace.relax then
            -- The deferred feature warning will be made later if the feature is actually in the live code.
         elseif not context_type.is_deferred and then build_definition.is_deferred then
            error_handler.append(once "Feature ")
            error_handler.add_feature_name(feature_name)
            error_handler.append(once " is deferred in type ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once ". This type should be marked as deferred.")
            error_handler.print_as_warning
         end
         -- Reckon the authorized clients list
         export_clause := export_status_for(original, context_type)
         can_twin := build_definition = original
         build_definition := build_definition.specialize_permissions(export_clause, can_twin)
      end

feature {}
   export_status_for (original: ANONYMOUS_FEATURE; context_type: TYPE): CLIENT_LIST
      local
         conforming_parent_clients, tmp_clients, parent_clients: CLIENT_LIST;
         parent_edge: PARENT_EDGE; i: INTEGER; redefined_name: FEATURE_NAME
      do
         -- Compute the exportation status from the export clauses in `export_clause', from the inherited parents in
         -- `conforming_parent_clients' and from the inserted parents in `non_conforming_parent_clients'.
         if local_definition then
            Result := original.clients
            from
               i := parents_af.lower
            until
               i > parents_af.upper
            loop
               parent_edge := parents_edges.item(i)
               tmp_clients := parent_edge.exports_for(feature_name)
               if tmp_clients /= Void then
                  -- There are both an export clause and a local definition.
                  -- Ignore the export clause and display a warning
                  redefined_name := parent_edge.get_redefine(feature_name)
                  if redefined_name /= Void then
                     error_handler.add_position(redefined_name.start_position)
                  end
                  error_handler.add_position(tmp_clients.start_position)
                  error_handler.add_position(Result.start_position)
                  error_handler.add_position(original.start_position)
                  error_handler.append(once "The export clause is ignored, the redefinition %"feature%" client list will be used instead.")
                  error_handler.print_as_warning
               end
               if not parent_edge.is_insert_member then
                  tmp_clients := parents_af.item(i).permissions
                  check
                     tmp_clients /= Void
                  end
                  if conforming_parent_clients = Void then
                     conforming_parent_clients := tmp_clients
                  else
                     conforming_parent_clients := conforming_parent_clients.merge_with(tmp_clients)
                  end
               end
               i := i + 1
            end
         else
            from
               i := parents_af.lower
            until
               i > parents_af.upper
            loop
               parent_edge := parents_edges.item(i)
               parent_clients := parents_af.item(i).permissions
               tmp_clients := parent_edge.exports_for(feature_name)
               if tmp_clients = Void then
                  tmp_clients := parent_edge.exports_for_all
               end
               if tmp_clients = Void then
                  tmp_clients := parent_clients
               else
                  tmp_clients.specialize_in(parent_edge.type_mark.resolve_in(context_type))
               end
               if Result = Void then
                  Result := tmp_clients
               else
                  Result := Result.merge_with(tmp_clients)
               end
               if not parent_edge.is_insert_member then
                  check
                     parent_clients /= Void
                  end
                  if conforming_parent_clients = Void then
                     conforming_parent_clients := parent_clients
                  else
                     conforming_parent_clients := conforming_parent_clients.merge_with(parent_clients)
                  end
               end
               i := i + 1
            end
            from
               i := parents_af.lower
            until
               i > parents_af.upper
            loop
               parent_edge := parents_edges.item(i)
               tmp_clients := parent_edge.exports_for(feature_name)
               if tmp_clients /= Void then
                  if not tmp_clients.wider_than(Result) then
                     error_handler.add_position(tmp_clients.start_position)
                     error_handler.append(once "The final client list for ")
                     error_handler.append(feature_name.to_string)
                     error_handler.append(once " is different from the one explicitly listed here.")
                     error_handler_show_resulting_client_list(Result)
                  end
               end
               i := i + 1
            end
         end
         check
            Result /= Void
         end
         -- Check for possible catcall sources.
         if conforming_parent_clients = Void or else Result.wider_than(conforming_parent_clients) then
            -- No conforming parent or local export as wide as or wider than parent export.
         elseif conforming_parent_clients.wider_than(Result) then
            -- Parent export wider than local export.
            if Result.start_position.class_text = context_type.class_text then
               error_handler_add_export_positions(Result)
            end
            if feature_name.start_position.class_text = context_type.class_text then
               error_handler.add_position(feature_name.start_position)
            end
            if local_definition then
               error_handler.add_position(Result.start_position)
               error_handler.append(once "The %"feature%" clause declares a narrower client list than")
            else
               error_handler.append(once "The client list computed from the %"export%" clauses is narrower than %
                                    %the one from")
            end
            error_handler.append(once " the conforming parent(s) for ")
            error_handler.add_type(context_type)
            error_handler.extend('.')
            error_handler.add_feature_name(feature_name)
            error_handler.append(once ". This can lead to catcalls!")
            error_handler_show_resulting_client_list(Result)
         else
            -- Unrelated parent export and local export.
            if Result.start_position.class_text = context_type.class_text then
               error_handler_add_export_positions(Result)
            end
            if feature_name.start_position.class_text = context_type.class_text then
               error_handler.add_position(feature_name.start_position)
            end
            if local_definition then
               error_handler.add_position(Result.start_position)
               error_handler.append(once "The %"feature%" clause declares a client list that")
            else
               error_handler.append(once "The client list computed from the %"export%" clauses")
            end
            error_handler.append(once " misses some clients of the conforming parent(s) for ")
            error_handler.add_type(context_type)
            error_handler.extend('.')
            error_handler.add_feature_name(feature_name)
            error_handler.append(once ". This can lead to catcalls!")
            error_handler_show_resulting_client_list(Result)
         end
      ensure
         Result /= Void
         Result.has_been_specialized
      end

feature {PRECURSOR_CALL}
   build_precursor (pc: PRECURSOR_CALL; new_type: TYPE): ANONYMOUS_FEATURE
      require
         pc /= Void
         new_type /= Void
      local
         i, j: INTEGER; specialized_parent: CLASS_TEXT; old_af: ANONYMOUS_FEATURE; can_twin: BOOLEAN
      do
         if parents_af.is_empty then
            error_handler.append(once "Precursor call is allowed only when the enclosing routine is redefined.")
            error_handler.add_position(pc.start_position)
            error_handler.print_as_fatal_error
         end
         --|*** Is there a better way?
         if pc.parent /= Void then
            from
               i := parents_type.lower
            variant
               parents_type.upper - i + 1
            until
                i > parents_type.upper or else parents_type.item(i).class_text = pc.parent.class_text
            loop
               i := i + 1
            end
            if i > parents_type.upper then
               error_handler.append(once "The type ")
               error_handler.append(pc.parent.written_name.to_string)
               error_handler.append(once " is not a valid ancestor for this method.")
               error_handler.add_position(pc.parent.start_position)
               error_handler.print_as_fatal_error
            end
            from
               j := i + 1
            variant
               parents_type.upper - j + 1
            until
               j > parents_type.upper or else parents_type.item(j).class_text = pc.parent.class_text
            loop
               j := j + 1
            end
            if j <= parents_type.upper then
               error_handler.append(once "This Precursor call is ambiguous because the type ")
               error_handler.append(pc.parent.written_name.to_string)
               error_handler.append(once " is inherited more than once.")
               error_handler.add_position(pc.parent.start_position)
               error_handler.add_position(parents_edges.item(i).start_position)
               error_handler.add_position(parents_edges.item(j).start_position)
               error_handler.print_as_error
               error_handler.add_position(pc.parent.start_position)
               error_handler.append(once "To fix this ambiguous Precursor call you have to remove direct repeated inheritance. %
                %You may thus consider to add a new class which inherit ")
               error_handler.append(pc.parent.written_name.to_string)
               error_handler.append(once " in order to use it as a unique parent qualifier.")
               error_handler.print_as_fatal_error
            end
            specialized_parent := parents_type.item(i).class_text
         else
            from
               i := parents_af.lower
            variant
               parents_type.upper - i + 1
            until
               i > parents_af.upper or else not parents_af.item(i).is_deferred
            loop
               i := i + 1
            end
            if i > parents_af.upper then
               error_handler.append(once "All ancestors are deferred, hence making this Precursor call not valid.")
               error_handler.add_position(pc.start_position)
               error_handler.print_as_fatal_error
            end
            from
               j := i + 1
            variant
               parents_type.upper - j + 1
            until
               j > parents_af.upper or else not parents_af.item(j).is_deferred
            loop
               j := j + 1
            end
            if j <= parents_af.upper then
               error_handler.append(once "Multiple Precursor found (must use Precursor {...} ancestor selection).")
               error_handler.add_position(pc.start_position)
               error_handler.add_position(parents_edges.item(i).start_position)
               error_handler.add_position(parents_edges.item(j).start_position)
               error_handler.print_as_fatal_error
            end
            specialized_parent := parents_af.item(i).class_text
         end
         pc.set_specialized_parent(specialized_parent)
         check
            parents_af.valid_index(i)
            --|*** Probably true, but the case when a feature_name has multiple old names needs to be carefully checked
            --|*** parents_af.item(i) = parents_type.item(i).lookup(parents_edges.item(i).reverse_rename(feature_name)).anonymous_feature(parents_type.item(i))
            --| lookup with the old name should find the same anonymous feature
         end
         -- save build_definition
         old_af := build_definition
         build_definition := parents_af.item(i)

         -- specialize_thru of the parent feature
         if build_definition.is_deferred then
            error_handler.append(once "The Precursor routine is a deferred routine.")
            error_handler.add_position(Result.start_position)
            error_handler.add_position(parents_edges.item(i).start_position)
            error_handler.add_position(pc.start_position)
            error_handler.print_as_fatal_error
         end
         build_definition := build_definition
            .specialize_permissions_thru(parents_type.item(i), parents_edges.item(i), new_type)
            .specialize_signature_thru(parents_type.item(i), parents_edges.item(i), new_type)
         if not ace.boost then
            build_definition := build_definition.specialize_require_thru(parents_type.item(i), parents_edges.item(i), new_type)
            --|*** add can twin
            can_twin := build_definition = parents_af.item(i)
            build_definition := build_definition.specialize_ensure_thru(parents_type.item(i), parents_edges.item(i), new_type, can_twin)
         end
         can_twin := build_definition = parents_af.item(i)
         Result := build_definition.specialize_body_thru(parents_type.item(i), parents_edges.item(i), new_type, can_twin)

         -- restore build_definition
         build_definition := old_af
      end

   specialize_precursor (af: ANONYMOUS_FEATURE; parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): ANONYMOUS_FEATURE
      require
         af.has_been_specialized
         af.start_position.class_text /= new_type.class_text
         new_type.direct_thru_step(parent_type, parent_edge)
      local
         old_af: ANONYMOUS_FEATURE; can_twin: BOOLEAN
      do
         -- save build_definition
         old_af := build_definition
         build_definition := af

         -- specialize_thru of af
         build_definition := build_definition
            .specialize_permissions_thru(parent_type, parent_edge, new_type)
            .specialize_signature_thru(parent_type, parent_edge, new_type)
         if not ace.boost then
            build_definition := build_definition.specialize_require_thru(parent_type, parent_edge, new_type) --|*** add can twin
            can_twin := build_definition = af
            build_definition := build_definition.specialize_ensure_thru(parent_type, parent_edge, new_type, can_twin)
         end
         can_twin := build_definition = af
         Result := build_definition.specialize_body_thru(parent_type, parent_edge, new_type, can_twin)

         -- restore build_definition
         build_definition := old_af
      end

feature {}
   error_handler_add_export_positions (client_list: CLIENT_LIST)
      local
         i: INTEGER; export_clause: CLIENT_LIST
      do
         error_handler.add_position(client_list.start_position)
         from
            i := parents_af.lower
         until
            i > parents_af.upper
         loop
            export_clause := parents_af.item(i).permissions
            if not client_list.wider_than(export_clause) then
               error_handler.add_position(export_clause.start_position)
            end
            i := i + 1
         end
      end

   error_handler_show_resulting_client_list (client_list: CLIENT_LIST)
         -- Show the computed client list, and emit a warning
      local
         b: STRING
      do
         if client_list /= Void then
            b := once ""
            b.clear_count
            client_list.append_in(b)
         else
            b := once "{ANY}"
         end
         error_handler.append(once " The final export list is ")
         error_handler.append(b)
         error_handler.extend('.')
         error_handler.print_as_warning
      end

feature {FEATURE_ACCUMULATOR, RESULT, ARGUMENT_NAME_REF, LOCAL_NAME_REF} --|*** should be F_A only
   is_ready: BOOLEAN
      do
         Result := not parents_af.is_empty or else body_feature /= Void
      end

feature {ARGUMENT_NAME_REF}
   formal_arg_list: FORMAL_ARG_LIST
      require
         is_ready
      do
         check
            signature_ready
         end
         Result := build_definition.arguments
      end

   closure_formal_arg_list (closure_rank: INTEGER): FORMAL_ARG_LIST
      require
         is_ready
         closure_rank > 0
      do
         check
            signature_ready
            build_definition.closure_arguments /= Void
         end
         Result := build_definition.closure_arguments.item(closure_rank + build_definition.closure_arguments.lower - 1)
      end

feature {FEATURE_ACCUMULATOR, RESULT}
   result_type (context_type: TYPE): TYPE_MARK
      require
         is_ready
      do
         computing_result_type := computing_result_type + 1
         inspect
            computing_result_type
         when 1 then
            if not signature_ready then
               specialize_signature(context_type)
            end
            computing_result_type := computing_result_type - 1
            Result := build_definition.result_type
         when 2 then
            check
               not signature_ready
            end
            specialize_signature(context_type)
         when 3 then
            error_handler.print_as_fatal_error
         end
      end

feature {FEATURE_ACCUMULATOR}
   computing_result_type: INTEGER_8
         -- Cycle detection status.
         -- 0 = ready.
         -- 1 = computing.
         -- 2 = cycle detected -> message printing.
         -- 3 = error message ready.

feature {FEATURE_ACCUMULATOR, PRECURSOR_CALL} --|*** should be F_A only?
   feature_name: FEATURE_NAME -- The final name in the unique type in the unique accumulator.

   parents_af: FAST_ARRAY[ANONYMOUS_FEATURE] -- Actually related to `Current' (one element or zero with single inheritance).

   parents_type: FAST_ARRAY[TYPE] -- Corresponding to `parents_af' at the same index.

   parents_edges: FAST_ARRAY[PARENT_EDGE] -- Corresponding to `parents_af' at the same index.

   build_definition: ANONYMOUS_FEATURE -- The one we are currently building.

   body_feature: ANONYMOUS_FEATURE -- The one which gives the body.

   body_type: TYPE -- When `body_feature' is inherited, the corresponding one of `body_feature'.

   body_inherit: PARENT_EDGE -- When `body_type' is not Void.

   signature_ready: BOOLEAN -- The `build_definition' signature is ready.

   local_definition: BOOLEAN --|*** remove it? *** Is there a proper definition in the context type.

feature {}
   implicit_any: PARENT_EDGE
      once
         create Result.make(False, smart_eiffel.type_any.canonical_type_mark)
      ensure
         Result /= Void
      end

invariant
   parents_af.count = parents_type.count

   parents_af.count = parents_edges.count

   signature_ready implies build_definition /= Void

end -- class ANONYMOUS_FEATURE_MIXER
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
