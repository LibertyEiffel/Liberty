-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FEATURE_ACCUMULATOR
   -- This accumulator is a singleton which works on one type at a time only. Then, all aspects of some
   -- feature have to be collected before collecting informations on another feature.
   --
   -- When all features are collected for the type, then the last step is to update the type (adding all
   -- anonymous_features for each feature_stamp).
   --
   -- Only one FEATURE_ACCUMULATOR object is created in the system.
   --
   -- How does it work?
   -- Insert are analyzed before inherit.
   --|*** Looking at TYPE.collect_one_feature, one gets the impression that inherited parents are analysed
   --|*** first <FM-22/02/2006>
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {ANY}
   make

feature {}
   make
      do
         create feature_stamps_memory.with_capacity(6000)
         create features.with_capacity(1024)
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE_MIXER, FEATURE_NAME]} features_dictionary.with_capacity(1024)
         create free.with_capacity(1024)
         create pending_list.with_capacity(128)
         create specialize_and_check_list.with_capacity(128)
         create {HASHED_SET[ABSOLUTE_FEATURE_NAME]} seeds_of_current_feature.make
         create {HASHED_DICTIONARY[FEATURE_STAMP, ABSOLUTE_FEATURE_NAME]} seeds.make
         create {HASHED_SET[ABSOLUTE_FEATURE_NAME]} insert_seeds_of_current_feature.make
         create {HASHED_DICTIONARY[FEATURE_STAMP, ABSOLUTE_FEATURE_NAME]} insert_seeds.make
         create {HASHED_DICTIONARY[FEATURE_STAMP, ABSOLUTE_FEATURE_NAME]} insert_problem_seeds.make
      ensure
         context_type = Void
         current_fn = Void
      end

   feature_count: INTEGER

feature {ANY}
   feature_stamp_of (feature_name: FEATURE_NAME): FEATURE_STAMP
      require
         feature_name /= Void
      do
         Result := feature_stamps_memory.reference_at(feature_name)
         if Result = Void then
            create Result.make(feature_name)
            feature_stamps_memory.add(Result, feature_name)
         end
      ensure
         Result /= Void
      end

feature {SMART_EIFFEL}
   echo_information
      local
         i, rename_count: INTEGER
      do
         from
            i := feature_stamps_memory.lower
         until
            i > feature_stamps_memory.upper
         loop
            if not feature_stamps_memory.item(i).no_rename then
               rename_count := rename_count + 1
            end
            i := i + 1
         end
         echo.put_string(once "FEATURE_STAMPs total number = ")
         echo.put_integer(feature_stamps_memory.count)
         echo.put_string(once "%NFEATURE_STAMPs with rename  = ")
         echo.put_integer(rename_count)
         echo.put_string(once "%N")
      end

feature {TYPE, LIKE_FEATURE_TYPE_MARK, FUNCTION_CALL, SMART_EIFFEL}
   context_type: TYPE -- Type where features are being accumulated.

feature {TYPE}
   current_fn: FEATURE_NAME -- Final name of the current feature being merged in context_type

   start (a_context_type: TYPE)
      require
         context_type = Void -- no other type is being accumulating at this time
         a_context_type /= Void
         current_fn = Void
      do
         debug
            echo.put_string(a_context_type.name.to_string)
            echo.put_string(once " now in the feature_accumulator singleton...%N")
            feature_count := 0
         end
         context_type := a_context_type
         seeds.clear_count
         insert_seeds.clear_count
         insert_problem_seeds.clear_count
         smart_eiffel.status.start_specializing(a_context_type)
      ensure
         context_type = a_context_type
         current_fn = Void
         smart_eiffel.status.is_specializing
         smart_eiffel.status.specializing_type = a_context_type
      end

   new_feature (a_final_fn: FEATURE_NAME)
      require
         context_type /= Void
         a_final_fn /= Void
         not is_known(a_final_fn)
      do
         debug
            feature_count := feature_count + 1
         end
         to_feature(a_final_fn)
         state := initial_state
         if free.is_empty then
            create current_mixer.make(a_final_fn)
         else
            current_mixer := free.last
            free.remove_last
            current_mixer.make(a_final_fn)
         end
         features.add_last(current_mixer)
         features_dictionary.add(current_mixer, a_final_fn)
      ensure
         is_known(a_final_fn)
         current_fn = a_final_fn
         context_type = old context_type
      end

   add_parent_definition (parent_type: TYPE; parent_edge: PARENT_EDGE
                          parent_feature_stamp: FEATURE_STAMP; parent_feature_name: FEATURE_NAME)
      require
         current_fn /= Void
         parent_edge /= Void implies context_type.direct_thru_step(parent_type, parent_edge)
         parent_feature_stamp.has_anonymous_feature_for(parent_type)
         parent_edge = Void implies parent_feature_name.is_equal(current_fn)
         parent_edge /= Void implies current_fn.is_equal(parent_edge.do_rename(parent_feature_name))
         parent_type.lookup(parent_feature_name) = parent_feature_stamp
      local
         an_af: ANONYMOUS_FEATURE; i: INTEGER_8
      do
         if parent_edge.is_inherit_member then
            parent_type.add_seeds(parent_feature_stamp, seeds_of_current_feature, True)
         end
         parent_type.add_seeds(parent_feature_stamp, insert_seeds_of_current_feature, False)
         an_af := parent_feature_stamp.anonymous_feature(parent_type)
         i := transition_index(parent_feature_name, parent_edge, an_af)
         if state = initial_state then
            inspect
               i
            when 1 then
               state := deferred_state
            when 2 then
               state := redefine_state
            when 3 then
               state := concrete_state
               current_mixer.set_body(an_af, parent_type, parent_edge)
            end
            if not current_fn.is_equal(parent_feature_name) then
               feature_stamp.rename_notify(context_type, parent_type, parent_edge, parent_feature_stamp)
            end
         else
            state := next_state(state, i, parent_type, parent_edge, an_af)
            if parent_feature_stamp /= feature_stamp then
               feature_stamp.rename_notify(context_type, parent_type, parent_edge, parent_feature_stamp)
            end
         end
         if state = deferred_state and then not an_af.is_deferred then
            --|*** memory wasted by many deferred feature creations?
            current_mixer.add_inherited_definition(parent_type, parent_edge, an_af.try_to_undefine(current_fn, context_type.class_text))
         else
            current_mixer.add_inherited_definition(parent_type, parent_edge, an_af)
         end
      ensure
         context_type = old context_type
      end

   add_local_definition (an_af: ANONYMOUS_FEATURE)
      require
         context_type /= Void
         current_fn /= Void
         an_af /= Void
      do
         inspect state
         when concrete_state then
            error_handler.add_position(an_af.start_position)
            error_handler.add_position(current_mixer.body_feature.start_position)
            error_handler.append(once "The local definition in ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once " (given first) can't be accepted because a concrete feature is inherited. %
                                 %What's called a concrete feature here is a feature which is not deferred. %
                                 %You may consider to add a redefine or an undefine. May be.")
            error_handler.add_position(current_mixer.body_inherit.start_position)
            error_handler.print_as_fatal_error
         when initial_state then
            feature_stamp.add_root(context_type)
         when mismatch_state then
            error_handler.cancel
            error_handler.append(once "Add undefine or redefine to all inherited version of feature ")
            error_handler.append(current_mixer.feature_name.to_string)
            error_handler.append(once " in ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once " because there is a local definition in this class. Redefine %
                                 %has been automatically added. Please check.")
            error_handler.add_position(an_af.start_position)
            error_handler.add_position(current_mixer.body_feature.start_position)
            if current_mixer.body_inherit /= Void then
               error_handler.add_position(current_mixer.body_inherit.start_position)
            end
            error_handler.print_as_warning
            current_mixer.remove_body
            check
               feature_stamp /= Void
            end
            state := redefine_state
         when deferred_state, redefine_state then
         end
         current_mixer.add_local_definition(an_af)
      ensure
         context_type = old context_type
      end

   finalize
      require
         context_type /= Void
      local
         i: INTEGER; m: ANONYMOUS_FEATURE_MIXER; fs: FEATURE_STAMP
      do
         to_feature(Void)
         finish_insert_seeds
         from
            i := features.lower
         until
            i > features.upper
         loop
            m := features.item(i)
            debug
               echo.put_string(once "    Specializing signature of feature: ")
               echo.put_line(m.feature_name.to_string)
            end
            current_mixer := m
            m.specialize_signature(context_type)
            i := i + 1
         end
         from
            i := features.lower
         until
            i > features.upper
         loop
            m := features.item(i)
            debug
               echo.put_string(once "    Specializing feature: ")
               echo.put_line(m.feature_name.to_string)
            end
            current_mixer := m
            m.specialize_feature(context_type)
            fs := context_type.lookup(m.feature_name)
            check
               -- Eiffel property from insert rules (no seed duplication)
               not fs.has_anonymous_feature_for(context_type)
            end
            fs.add_anonymous_feature(m.build_definition, context_type)
            i := i + 1
         end
         from
            i := features.lower
         until
            i > features.upper
         loop
            m := features.item(i)
            current_mixer := m
            collect_assigner(m)
            free.add_last(m)
            i := i + 1
         end
         features.clear_count
         features_dictionary.clear_count
         debug
            echo.put_string(context_type.name.to_string)
            echo.put_string(once " is ready (")
            echo.put_integer(feature_count)
            echo.put_string(once " feature")
            if feature_count > 1 then
               echo.put_character('s')
            end
            echo.put_string(once ").%N")
         end
         smart_eiffel.status.end_specializing(context_type)
         specialize_and_check_list.add(context_type)
         current_mixer := Void
         context_type := Void
         waiting_type := waiting_type - 1
      ensure
         current_fn = Void
         context_type = Void
      end

   collect_assigner (mix_assigner: ANONYMOUS_FEATURE_MIXER)
         -- If the feature declares an assigner, find the corresponding assigned feature and links to it
      local
         assigned: FEATURE_NAME; fs_assigned: FEATURE_STAMP; af_assigned: ANONYMOUS_FEATURE; i: INTEGER
         fn: FEATURE_NAME; fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
      do
         assigned := mix_assigner.build_definition.feature_text.assigned
         if assigned /= Void then
            fs_assigned := context_type.lookup(assigned)
            if fs_assigned = Void or else not fs_assigned.has_anonymous_feature_for(context_type) then
               error_handler.add_position(assigned.start_position)
               error_handler.append(once "Assigned feature not found in type")
               error_handler.append(context_type.name.to_string)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            end
            af_assigned := fs_assigned.anonymous_feature(context_type)
            from
               i := 1
            until
               i > af_assigned.names.count
            loop
               fn := af_assigned.names.item(i)
               fs := context_type.lookup(fn)
               af := fs.anonymous_feature(context_type)
               collect_assigner_(mix_assigner, fn, fs, af)
               if fn.name_alias /= Void then
                  fn := fn.name_alias
                  fs := context_type.lookup(fn)
                  af := fs.anonymous_feature(context_type)
                  collect_assigner_(mix_assigner, fn, fs, af)
               end
               i := i + 1
            end
         end
      end

   collect_assigner_ (mix_assigner: ANONYMOUS_FEATURE_MIXER; assigned: FEATURE_NAME; fs_assigned: FEATURE_STAMP; af_assigned: ANONYMOUS_FEATURE)
      require
         af_assigned = fs_assigned.anonymous_feature(context_type)
      local
         fs_assigner: FEATURE_STAMP
         af_assigner: ANONYMOUS_FEATURE
         arg_assigned, arg_assigner: FORMAL_ARG_LIST
      do
         fs_assigner := context_type.lookup(mix_assigner.feature_name)
         check
            by_design: fs_assigner.has_anonymous_feature_for(context_type)
         end
         arg_assigned := af_assigned.arguments
         af_assigner := fs_assigner.anonymous_feature(context_type)
         arg_assigner := af_assigner.arguments
         if af_assigned.result_type = Void then
            error_handler.add_position(assigned.start_position)
            error_handler.append(once "Assigned feature is not a query in type")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once ".")
            error_handler.print_as_fatal_error
         elseif af_assigner.result_type /= Void then
            error_handler.add_position(assigned.start_position)
            error_handler.append(once "Assigner feature is not a command in type ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once ".")
            error_handler.print_as_fatal_error
         elseif (arg_assigner = Void)
            or else (arg_assigned = Void and then arg_assigner.count /= 1)
            or else (arg_assigned /= Void and then arg_assigned.count + 1 /= arg_assigner.count)
         then
            error_handler.add_position(assigned.start_position)
            error_handler.append(once "The feature ")
            error_handler.append(fs_assigner.name.to_string)
            error_handler.append(once " cannot be an assigner of the feature ")
            error_handler.append(fs_assigned.name.to_string)
            error_handler.append(once " in type ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once ". The assigner feature is expected to have exactly one more argument than the assigned feature.")
            error_handler.print_as_fatal_error
         --elseif af_assigned.result_type /= arg_assigner.name(1).result_type then
         --   error_handler.add_position(assigned.start_position)
         --   error_handler.append(once "The feature ")
         --   error_handler.append(fs_assigner.name.to_string)
         --   error_handler.append(once " cannot be an assigner of the feature ")
         --   error_handler.append(fs_assigned.name.to_string)
         --   error_handler.append(once " in type ")
         --   error_handler.append(context_type.name.to_string)
         --   error_handler.append(once ". The type of the first argument of the assigner feature is expected to be the same as the type of the assigned feature.")
         --   error_handler.print_as_fatal_error
         end

         debug
            echo.put_string(once "Linking assigner {")
            echo.put_string(context_type.name.to_string)
            echo.put_string(once "}.")
            echo.put_string(mix_assigner.feature_name.to_string)
            echo.put_string(once " to assigned {")
            echo.put_string(context_type.name.to_string)
            echo.put_string(once "}.")
            echo.put_line(assigned.to_string)
         end

         af_assigned.set_assigner(mix_assigner.feature_name)
      end

   is_known (fn: FEATURE_NAME): BOOLEAN
      do
         Result := features_dictionary.has(fn)
      end

   new_incomplete_type
      do
         waiting_type := waiting_type + 1
      end

   register (t: TYPE)
      do
         pending_list.add(t)
         if context_type = Void and then waiting_type = pending_list.count then
            do_pending_types
         end
      end

feature {}
   to_feature (a_final_fn: FEATURE_NAME)
      require
         a_final_fn /= Void implies not is_known(a_final_fn)
      local
         ct1, ct2: CLASS_TEXT
      do
         if state = mismatch_state then
            error_handler.print_as_fatal_error
         end
         if current_fn /= Void then
            check_and_merge_seeds
            if context_type.class_text.proper_has(current_fn) and current_fn.start_position.class_text /= context_type.class_text then
               ct1 := current_fn.start_position.class_text
               ct2 := context_type.class_text
               --| **** TODO why this sedb_breakpoint ??
            end
            context_type.add_feature(current_fn, feature_stamp)
         end
         current_fn := a_final_fn
         if current_fn /= Void then
            feature_stamp := feature_stamp_of(current_fn)
         else
            feature_stamp := Void
         end
      ensure
         current_fn = a_final_fn
         a_final_fn /= Void implies feature_stamp = feature_stamp_of(a_final_fn)
         a_final_fn = Void implies feature_stamp = Void
         error_handler.is_empty -- If it wasn't on entry, then the function dies with a fatal error
      end

   do_pending_types
      local
         type: TYPE
      do
         from
         until
            pending_list.is_empty
         loop
            type := pending_list.first
            pending_list.remove
            type.do_collect
         end
         if waiting_type = 0 and then not specialize_and_check_in_progress then
            from
               specialize_and_check_in_progress := True
            until
               specialize_and_check_list.is_empty
            loop
               type := specialize_and_check_list.first
               specialize_and_check_list.remove
               smart_eiffel.status.start_specializing_and_checking(type)
               type.specialize_and_check
               smart_eiffel.status.end_specializing_and_checking(type)
            end
            specialize_and_check_in_progress := False
         end
      end

feature {LIKE_FEATURE_TYPE_MARK, WRITABLE_ATTRIBUTE_NAME, FUNCTION_CALL}
   find_type_for (fs: FEATURE_STAMP): TYPE_MARK
      local
         fn: FEATURE_NAME; afm: ANONYMOUS_FEATURE_MIXER
      do
         fn := context_type.get_feature_name(fs)
         afm := features_dictionary.reference_at(fn)
         if afm.computing_result_type = 1 then
            if error_handler.is_empty then
               error_handler.append(once "Unable to solve cyclic anchored types.")
            end
            error_handler.add_position(fn.start_position)
         end
         Result := afm.result_type(context_type)
         check
            Result /= Void
         end
      end

feature {TYPE}
   anonymous_feature_for (fn: FEATURE_NAME): ANONYMOUS_FEATURE
      local
         afm: ANONYMOUS_FEATURE_MIXER
      do
         afm := features_dictionary.reference_at(fn)
         Result := afm.build_definition
      ensure
         Result /= Void
      end

feature {}
   pending_list, specialize_and_check_list: QUEUE[TYPE]

   specialize_and_check_in_progress: BOOLEAN

   initial_state: INTEGER_8 0

   deferred_state: INTEGER_8 1

   concrete_state: INTEGER_8 2

   redefine_state: INTEGER_8 3

   mismatch_state: INTEGER_8 4

   join_state: INTEGER_8 5

   transitions: ARRAY[ARRAY[INTEGER_8]]
      once
         Result := {ARRAY[ARRAY[INTEGER_8]] 1,
         <<   --  deferred,      concrete,       redefine,       mismatch

            {ARRAY[INTEGER_8] 1,
            <<deferred_state, concrete_state, redefine_state, mismatch_state>>}, -- <--received deferred feature
            {ARRAY[INTEGER_8] 1,
            <<redefine_state, mismatch_state, redefine_state, mismatch_state>>}, -- <--received redefine feature
            {ARRAY[INTEGER_8] 1,
            <<concrete_state, join_state, mismatch_state, mismatch_state>>},     -- <--received concrete feature
           >>}
      end

   next_state (current_state, transition: INTEGER_8; a_type: TYPE; parent_edge: PARENT_EDGE
      an_af: ANONYMOUS_FEATURE): INTEGER_8
         -- Try to merge fn and the already collected feature.
         -- Collected feature is updated.
      require
         a_type /= Void
         an_af /= Void
      do
         Result := transitions.item(transition).item(current_state)
         inspect
            Result
         when mismatch_state then
            if current_state /= mismatch_state then
               error_handler.add_position(an_af.start_position)
               if current_mixer.body_feature /= Void then
                  error_handler.add_position(current_mixer.body_feature.start_position)
               else
                  current_mixer.set_body(an_af, a_type, parent_edge)
                  error_handler.add_position(current_mixer.parents_af.first.start_position)
               end
               error_handler.add_position(parent_edge.start_position)
               error_handler.append(once "Can't join these two concrete features. What's called a concrete %
                                    %feature here is a feature which is not deferred. You may consider to %
                                    %undefine one feature or to add a redefine.")
            end
         when join_state then
            if an_af.same_body_as(current_mixer.body_feature) then
               Result := concrete_state
            else
               error_handler.add_position(an_af.start_position)
               error_handler.add_position(current_mixer.body_feature.start_position)
               error_handler.add_position(parent_edge.start_position)
               if an_af.is_attribute and then current_mixer.body_feature.is_attribute then
                  error_handler.append(once "Can't join these two attribute definitions. Because an attribute cannot %
                                       %be undefined (using an undefine clause), you may consider to modify parents %
                                       %themselves. May be.")
               else
                  error_handler.append(once "Can't join these two concrete features. What's called a concrete %
                                       %feature here is a feature which is not deferred. You may consider to %
                                       %undefine one feature. May be.")
               end
               Result := mismatch_state
            end
         when concrete_state then
            if transition = 3 then
               check
                  current_mixer.body_feature = Void
               end
               current_mixer.set_body(an_af, a_type, parent_edge)
            end
         when deferred_state, redefine_state then
            if current_state = concrete_state then
               current_mixer.remove_body
            end
         end
      end

   transition_index (parent_fn: FEATURE_NAME; parent_edge: PARENT_EDGE
      an_anonymous_feature: ANONYMOUS_FEATURE): INTEGER_8
         -- Result value: 1 = deferred
         --               2 = redefine
         --               3 = concrete
      require
         parent_fn /= Void
         an_anonymous_feature /= Void
      do
         if parent_edge = Void then
            if an_anonymous_feature.is_deferred then
               Result := 1
            else
               Result := 3
            end
         else
            if parent_edge.get_undefine(current_fn) /= Void then
               if parent_fn.is_frozen then
                  error_handler.add_position(parent_edge.get_undefine(current_fn).start_position)
                  error_handler.add_position(parent_fn.start_position)
                  error_handler.append(once "A frozen feature must not be undefined. What is frozen _is_ frozen.")
                  error_handler.print_as_fatal_error
               end
               if an_anonymous_feature.is_deferred then
                  error_handler.add_position(parent_edge.get_undefine(current_fn).start_position)
                  error_handler.append(once "It is useless to undefine this deferred method.")
                  error_handler.print_as_warning
               end
               if an_anonymous_feature.is_attribute then
                  error_handler.add_position(parent_edge.get_undefine(current_fn).start_position)
                  error_handler.add_position(parent_fn.start_position)
                  error_handler.append(once "An attribute cannot be undefined.")
                  error_handler.print_as_fatal_error
               end
               Result := 1
            elseif parent_edge.get_redefine(current_fn) /= Void then
               if parent_fn.is_frozen then
                  error_handler.add_position(parent_edge.get_redefine(current_fn).start_position)
                  error_handler.add_position(parent_fn.start_position)
                  error_handler.append(once "A frozen feature must not be redefined. What is frozen _is_ frozen.")
                  error_handler.print_as_fatal_error
               end
               if an_anonymous_feature.is_deferred then
                  error_handler.add_position(parent_edge.get_redefine(current_fn).start_position)
                  error_handler.append(once "It is useless to mark as %"redefine%" this deferred feature.")
                  error_handler.print_as_warning
               end
               Result := 2
            elseif an_anonymous_feature.is_deferred then
               Result := 1
            else
               Result := 3
            end
         end
         if parent_fn.is_frozen then
            if parent_fn.is_equal(current_fn) then
               current_fn := parent_fn
            elseif not current_fn.is_frozen then
               current_fn := current_fn.twin
               current_fn.set_is_frozen
            end
         end
      ensure
         Result.to_integer_32.in_range(transitions.lower, transitions.upper)
      end

   valid_features_dictionary: BOOLEAN
      local
         i: INTEGER
      do
         from
            Result := True
            i := 1
         until
            i > features_dictionary.count
         loop
            Result := Result and features_dictionary.item(i).feature_name = features_dictionary.key(i)
            i := i + 1
         end
      end

   check_and_merge_seeds
      local
         i: INTEGER
         afn: ABSOLUTE_FEATURE_NAME
         printed: BOOLEAN
         fs: FEATURE_STAMP
      do
         from
            i := seeds_of_current_feature.lower
         until
            i > seeds_of_current_feature.upper
         loop
            afn := seeds_of_current_feature.item(i)
            fs := seeds.reference_at(afn)
            if fs = Void then
               seeds.add(feature_stamp, afn)
               if insert_problem_seeds.has(afn) then
                  insert_problem_seeds.remove(afn)
               end
            else
               error_handler.append(once "In type ")
               error_handler.append(context_type.name.to_string)
               error_handler.append(once ", features %"")
               error_handler.append(current_fn.to_string)
               error_handler.append(once "%" and %"")
               error_handler.append(fs.name.to_string)
               error_handler.append(once "%" come from the same original feature via multiple %"inherit%" paths.%N%
                                    %Below, you get the feature evolution step by step. Note that in the end (type ")
               error_handler.append(context_type.name.to_string)
               error_handler.append(once ") there are two versions of the same initial feature with two different names. %
                                    %To fix this, either use an %"insert%" link in place of one of the %"inherit%" %
                                    %links or rename the feature to get the same name in ")
               error_handler.append(context_type.name.to_string)
               error_handler.append(once " type.%N%NFirst %"inherit%" path (from parent to child):%N   ")
               printed := context_type.print_feature_hierarchy(feature_stamp, afn, True)
               check printed end
               error_handler.append(once "%N%NSecond %"inherit%" path (from parent to child):%N   ")
               printed := context_type.print_feature_hierarchy(fs, afn, True)
               check printed end
               error_handler.print_as_fatal_error
            end
            i := i + 1
         end
         seeds_of_current_feature.clear_count

         from
            i := insert_seeds_of_current_feature.lower
         until
            i > insert_seeds_of_current_feature.upper
         loop
            afn := insert_seeds_of_current_feature.item(i)
            fs := insert_seeds.reference_at(afn)
            if fs = Void then
               insert_seeds.add(feature_stamp, afn)
            elseif not seeds.has(afn) then
               insert_problem_seeds.put(feature_stamp, afn)
            end
            i := i + 1
         end
         insert_seeds_of_current_feature.clear_count
      ensure
         seeds_of_current_feature.is_empty
         seeds.count = old seeds.count + old seeds_of_current_feature.count
      end

   finish_insert_seeds
      local
         i: INTEGER
         afn: ABSOLUTE_FEATURE_NAME
         printed: BOOLEAN
         fs1, fs2: FEATURE_STAMP
      do
         from
            i := insert_problem_seeds.lower
         until
            i > insert_problem_seeds.upper
         loop
            afn := insert_problem_seeds.key(i)
            fs1 := insert_problem_seeds.item(i)
            fs2 := insert_seeds.at(afn)
            error_handler.append(once "In type ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once ", features %"")
            error_handler.append(fs1.name.to_string)
            error_handler.append(once "%" and %"")
            error_handler.append(fs2.name.to_string)
            error_handler.append(once "%" come from the same original feature via multiple %"insert%" paths, but none comes via an %"inherit%" path.%N%
                                 %Below, you get the feature evolution step by step. Note that in the end (type ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once ") there are two versions of the same initial feature with two different names. %
                                 %To fix this, either use enough %"inherit%" links in place of %"insert%" links %
                                 %to have one %"inherit%" path or rename the feature to get the same name in ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once " type.%N%NFirst %"insert%" path (from parent to child):%N   ")
            printed := context_type.print_feature_hierarchy(fs1, afn, False)
            check printed end
            error_handler.append(once "%N%NSecond %"insert%" path (from parent to child):%N   ")
            printed := context_type.print_feature_hierarchy(fs2, afn, False)
            check printed end
            error_handler.print_as_error
            i := i + 1
         end
      end

feature {PRECURSOR_CALL, RESULT, ARGUMENT_NAME_REF}
   current_mixer: ANONYMOUS_FEATURE_MIXER

feature {}
   waiting_type: INTEGER

   state: INTEGER_8 -- automaton state

   feature_stamp: FEATURE_STAMP

   features, free: FAST_ARRAY[ANONYMOUS_FEATURE_MIXER] -- free is used for memory reuse.

   features_dictionary: DICTIONARY[ANONYMOUS_FEATURE_MIXER, FEATURE_NAME]

   feature_stamps_memory: HASHED_DICTIONARY[FEATURE_STAMP, FEATURE_NAME]
         -- To be sure to create exactly one FEATURE_STAMP for one feature name.

   seeds_of_current_feature, insert_seeds_of_current_feature: SET[ABSOLUTE_FEATURE_NAME]

   seeds, insert_seeds, insert_problem_seeds: DICTIONARY[FEATURE_STAMP, ABSOLUTE_FEATURE_NAME]

invariant
   waiting_type >= 0

   features.count = features_dictionary.count

   valid_features_dictionary

end -- class FEATURE_ACCUMULATOR
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
