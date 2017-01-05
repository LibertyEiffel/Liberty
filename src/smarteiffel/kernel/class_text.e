-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASS_TEXT
   --
   -- Syntactical representation of one class text: there is exactly one
   -- instance of this class for each used Eiffel class file.
   --

inherit
   HASHABLE
   VISITABLE
      redefine is_equal
      end
   TAGGED
      redefine is_equal
      end
   INDEXINGABLE
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end
   ASSERTION_LEVEL_NUMBERING
      redefine is_equal
      end

create {EIFFEL_PARSER, CLASS_TEXT, CLASS_TEXT_VISITOR}
   make

feature {ANY}
   id: INTEGER_16
         -- To mangle the class (used to produce compact C code).

   path: STRING
         -- Access to the corresponding file (full file path).

   cluster: CLUSTER
         -- The `cluster' used to load the class (also gives access to the directory path).

   heading_comment1: COMMENT
         -- Comment before keyword `class'.

   is_deferred: BOOLEAN
         -- True if class itself is deferred or if at least one feature is deferred

   is_expanded: BOOLEAN
         -- True if class itself is expanded.

   name: CLASS_NAME
         -- The short name of the class (no `cluster' name included).

   formal_generic_list: FORMAL_GENERIC_LIST
         -- Formal generic args if any.

   heading_comment2: COMMENT
         -- Comment after class name.

   obsolete_mark: MANIFEST_STRING
         -- To warn user if any.

   parent_lists: PARENT_LISTS
         -- The contents of the inherit/insert lists if any.

   creation_clause_list: CREATION_CLAUSE_LIST
         -- Constructor list.

   feature_clause_list: FEATURE_CLAUSE_LIST
         -- Features.

   class_invariant: CLASS_INVARIANT
         -- If any, the class invariant.

   end_comment: COMMENT
         -- Comment after end of class.

   sedb_trace: BOOLEAN
         -- Is the -sedb run-time trace mechanism activated for the
         -- `Current' class?

   no_check: BOOLEAN
         -- Is `Current' in -no_check mode ?
      do
         Result := assertion_level >= level_no
      end

   require_check: BOOLEAN
         -- Is `Current' in -require_check mode ?
      do
         Result := assertion_level >= level_require
      end

   ensure_check: BOOLEAN
         -- Is `Current' in -ensure_check mode ?
      do
         Result := assertion_level >= level_ensure
      end

   invariant_check: BOOLEAN
         -- Is `Current' in -invariant_check mode ?
      do
         Result := assertion_level >= level_invariant
      end

   loop_check: BOOLEAN
         -- Is `Current' in -loop_check mode ?
      do
         Result := assertion_level >= level_loop
      end

   all_check: BOOLEAN
         -- Is `Current' in -all_check mode ?
      do
         Result := assertion_level >= level_all
      end

   has_creation_clause: BOOLEAN
      do
         Result := creation_clause_list /= Void
      end

   is_generic: BOOLEAN
         -- When class is defined with generic arguments.
      do
         Result := formal_generic_list /= Void
      end

   proper_has (fn: FEATURE_NAME): BOOLEAN
         -- True when `fn' is really written in current class.
      do
         Result := feature_dictionary.has(fn)
      end

   proper_get (fn: FEATURE_NAME): ANONYMOUS_FEATURE
         -- Returns the feature really written in current class if it exists.
      do
         Result := feature_dictionary.reference_at(fn)
      end

   proper_name_get (fn: FEATURE_NAME): FEATURE_NAME
         -- Returns the feature name really written in current class.
         -- Useful for frozen test and to have the declaration position.
      require
         proper_has(fn)
      do
         Result := feature_dictionary.internal_key(fn)
         check
            Result = proper_get(fn).names.internal_name(fn)
         end
      ensure
         Result.is_equal(fn)
         Result.start_position.class_text = Current
      end

   get_export_permission_of (other: CLASS_TEXT): BOOLEAN
         -- Do `Current' get permission of `other' to use some feature?
         -- Here, `other' is the name of some class in some exportation list and we are trying to
         -- know if `Current' is allowed or not.
         --
         -- Note 1: we consider both "inherit" links and "insert" links as equivalent for exportations.
         --
         -- Note 2: we do not rely on the TYPE graph for exportation, first because the CLASS_TEXT
         -- inherit/insert graph is smaller and because it is much more easy for generic classes.
      require
         any_gives_permission_to_all: other.name.to_string /= as_any
         avoid_obvious_questions: (name.to_string /= as_any) and other /= Current
         not_done_to_report_errors: error_handler.is_empty
      do
         Result := parent_lists.get_permission_of(other)
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   is_any: BOOLEAN
         -- Is it the ANY class ?
      do
         Result := name.to_string = as_any
      end

   hash_code: INTEGER
         -- Actually, in order to speed up the compiler, this is a cache
         -- for value `name.to_string.hash_code'.

   is_equal (other: like Current): BOOLEAN
      do
         Result := Current = other
      end

   pretty
      local
         dummy_comment_flag: BOOLEAN
      do
         pretty_index(0, once "top")
         if pretty_printer.replacement_header /= Void then
            pretty_printer.put_string(pretty_printer.replacement_header)
         elseif heading_comment1 /= Void then
            heading_comment1.pretty(0)
         end
         pretty_printer.set_indent_level(0)
         if is_deferred then
            pretty_printer.keyword(once "deferred")
         elseif is_expanded then
            pretty_printer.keyword(fz_expanded)
         end
         pretty_printer.keyword(once "class")
         name.pretty(1)
         if is_generic then
            formal_generic_list.pretty
         end
         pretty_printer.set_indent_level(0)
         if obsolete_mark /= Void then
            pretty_printer.keyword(once "obsolete")
            obsolete_mark.pretty(1)
         end
         pretty_printer.set_indent_level(0)
         if heading_comment2 /= Void then
            pretty_printer.set_indent_level(1)
            heading_comment2.pretty(1)
         end
         pretty_printer.set_indent_level(0)
         if parent_lists /= Void then
            parent_lists.pretty
         end
         pretty_printer.set_indent_level(0)
         if creation_clause_list /= Void then
            creation_clause_list.pretty
         end
         pretty_printer.set_indent_level(0)
         if feature_clause_list /= Void then
            feature_clause_list.pretty
         end
         pretty_printer.set_indent_level(0)
         if class_invariant /= Void then
            if not pretty_printer.zen_mode then
               pretty_printer.skip_one_line
            end
            class_invariant.pretty_print_with_tag(0, once "invariant")
         end
         pretty_printer.set_indent_level(0)
         pretty_index(0, once "bottom")
         if not pretty_printer.zen_mode then
            pretty_printer.skip_one_line
         end
         pretty_printer.keyword(once "end")
         if pretty_printer.replacement_footer /= Void then
            pretty_printer.put_string(once " -- class ")
            pretty_printer.put_string(name.to_string)
            pretty_printer.put_string(pretty_printer.replacement_footer)
         else
            if end_comment = Void then
               dummy_comment_flag := True
            else
               dummy_comment_flag := end_comment.is_dummy_class_text_end(Current)
            end
            if not dummy_comment_flag or else not pretty_printer.zen_mode then
               pretty_printer.put_string(once " -- class ")
               pretty_printer.put_string(name.to_string)
               pretty_printer.put_character('%N')
            end
            if not dummy_comment_flag then
               end_comment.pretty(0)
            end
         end
      end

   accept (visitor: CLASS_TEXT_VISITOR)
      do
         visitor.visit_class_text(Current)
      end

   declaration_type_of_like_current: TYPE
         -- See also the comment of {TYPE_MARK}.declaration_type, because `declaration_type_of_like_current'
         -- is actually the implementation of `declaration_type' for the "like Current" type mark.
      local
         type_of_current: TYPE_MARK; sp: POSITION
      do
         if declaration_type_of_like_current_memory = Void then
            sp := name.start_position
            type_of_current := declaration_type_of_like_current_(sp)
            declaration_type_of_like_current_memory := type_of_current.type
         end
         Result := declaration_type_of_like_current_memory
      ensure
         Result /= Void
      end

   inherits_from (other: CLASS_TEXT): BOOLEAN
      require
         other /= Void
         avoid_obvious_questions: other /= Current
         not_done_to_report_errors: error_handler.is_empty
      do
         Result := insert_inherit_test(other) = inherits_code
      ensure
         definition: Result = (insert_inherit_test(other) = inherits_code)
         not_done_to_report_errors: error_handler.is_empty
      end

   inserts (other: CLASS_TEXT): BOOLEAN
      require
         other /= Void
         avoid_obvious_questions: other /= Current
         not_done_to_report_errors: error_handler.is_empty
      do
         Result := insert_inherit_test(other) = inserts_code
      ensure
         definition: Result = (insert_inherit_test(other) = inserts_code)
         not_done_to_report_errors: error_handler.is_empty
      end

   insert_inherit_test (other: CLASS_TEXT): INTEGER_8
         -- Simple predicate (i.e. does not fill the `error_handler').
         -- See also xxx yyy which are supposed to be able to explain the problem.
      require
         other /= Void
         avoid_obvious_questions: other /= Current
         not_done_to_report_errors: error_handler.is_empty
      local
         i: INTEGER; code: INTEGER_8; parent: CLASS_TEXT; a_parent_edge: PARENT_EDGE
      do
         check
            Result = unrelated_code
            unrelated_code < inserts_code
            inserts_code < inherits_code
         end
         if insert_inherit_test_memory_cache.fast_has(other) then
            Result := insert_inherit_test_memory_cache.fast_at(other)
         else
            if parent_lists /= Void then
               -- First, we look only at inherit links:
               from
                  i := 1
               until
                  Result = inherits_code or else i > parent_lists.inherit_count
               loop
                  a_parent_edge := parent_lists.inherit_edge(i)
                  parent := a_parent_edge.class_text
                  if other = parent then
                     Result := inherits_code
                  else
                     code := parent.insert_inherit_test(other)
                     if code /= unrelated_code then
                        Result := code
                     end
                  end
                  i := i + 1
               end
               -- Next, we try insert links:
               from
                  --i := 1
               until
                  Result /= unrelated_code or else i > parent_lists.insert_count
               loop
                  a_parent_edge := parent_lists.insert_edge(i)
                  parent := a_parent_edge.class_text
                  if other = parent then
                     Result := inserts_code
                  else
                     code := parent.insert_inherit_test(other)
                     if code /= unrelated_code then
                        Result := inserts_code
                     end
                  end
                  i := i + 1
               end
            end
            insert_inherit_test_memory_cache.add(Result, other)
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

feature {FEATURE_STAMP, CLASS_TEXT}
   obvious_resolve_static_binding (other: CLASS_TEXT; can_insert: BOOLEAN): BOOLEAN
         -- Very common case which can avoid complex computations.
      require
         Current.insert_inherit_test(other) /= unrelated_code
      local
         i, insert_inherit_code: INTEGER; a_parent_edge: PARENT_EDGE; parent: CLASS_TEXT
      do
         from
            i := 1
         until
            Result or else i > parent_lists.inherit_count
         loop
            a_parent_edge := parent_lists.inherit_edge(i)
            if a_parent_edge.rename_count = 0 then
               parent := a_parent_edge.class_text
               if other = parent then
                  Result := True
               else
                  insert_inherit_code := parent.insert_inherit_test(other)
                  if insert_inherit_code = inherits_code or else
                     (can_insert and then insert_inherit_code = inserts_code)
                  then
                     Result := parent.obvious_resolve_static_binding(other, can_insert)
                  end
               end
            end
            i := i + 1
         end
         if can_insert then
            from
               --i := 1
            until
               Result or else i > parent_lists.insert_count
            loop
               a_parent_edge := parent_lists.insert_edge(i)
               if a_parent_edge.rename_count = 0 then
                  parent := a_parent_edge.class_text
                  if other = parent then
                     Result := True
                  else
                     insert_inherit_code := parent.insert_inherit_test(other)
                     if insert_inherit_code /= unrelated_code then
                        Result := parent.obvious_resolve_static_binding(other, True)
                     end
                  end
               end
               i := i + 1
            end
         end
      end

feature {CREATE_SUPPORT, MANIFEST_GENERIC, CECIL_ENTRY}
   has_creation_check (procedure_name: FEATURE_NAME; call_site: POSITION; type, target_type: TYPE): BOOLEAN
         -- Check that the `procedure_name' is actually a creation procedure for `Current'. Then, also check that
         -- `procedure_name' is written in an allowed base class for creation from `type'.
      require
         creation_clause_list /= Void
         not procedure_name.start_position.is_unknown
         not call_site.is_unknown
         may_report_an_error: error_handler.is_empty
      local
         cc: CREATION_CLAUSE; cl: CLIENT_LIST
      do
         cc := creation_clause_list.get_clause(procedure_name)
         if cc = Void then
            if procedure_name.to_string /= as_manifest_creation then
               error_handler.add_position(call_site)
               error_handler.append(once "Procedure %"")
               error_handler.append(procedure_name.to_string)
               error_handler.append(once "%" does not belong to a creation clause of ")
               error_handler.append(name.to_string)
               error_handler.add_position(procedure_name.start_position)
               error_handler.append(once ". This creation call is thus not allowed.")
               error_handler.print_as_error
            end
         else
            if type = Void then
               -- It can be Void when called from CECIL_ENTRY
               Result := True
            else
               cl := cc.clients
               Result := cl.gives_permission_to(type.canonical_type_mark, target_type)
               if not Result then
                  error_handler.add_position(call_site)
                  error_handler.add_position(procedure_name.start_position)
                  error_handler.append(once "Forbidden creation call (i.e. exportation rules violated). %
                                            %Creation is only allowed from ")
                  error_handler.append(cl.eiffel_view)
                  cl.locate_in_error_handler
                  error_handler.extend('.')
                  error_handler.print_as_error
               end
            end
         end
      ensure
         may_report_an_error: error_handler.is_empty
      end

feature {CLASS_CHECKER, EIFFEL_PARSER}
   set_heading_comment2 (hc: like heading_comment2)
      do
         heading_comment2 := hc
      end

feature {TYPE}
   extra_expanded_check (type: TYPE)
         -- Performs extra check related to expanded `type' only. Other checks are performed somewhere else
         -- for all types (expanded as well as reference types).
      require
         type.is_user_expanded
         type.class_text = Current
      do
         if check_expanded_with_flag /= Void then
            -- This class is already checked (actually, even an expanded class can be generic and
            -- it is not necessary to check the same class twice).
            check
               -- To check that the same call is not done once:
               type /= check_expanded_with_flag
            end
         else
            check_expanded_with_flag := type
            if is_deferred then
               error_handler.add_type_mark(type.canonical_type_mark)
               error_handler.add_position(type.canonical_type_mark.start_position)
               error_handler.append(once " is invalid. A deferred class must not be expanded.")
               error_handler.print_as_fatal_error
            end
            if creation_clause_list /= Void then
               creation_clause_list.extra_expanded_check(type)
            end
         end
      end

   user_expanded_default_create_stamp (type: TYPE): FEATURE_STAMP
         -- Must be called after `extra_expanded_check'.
      require
         type.is_user_expanded
         type.class_text = Current
      do
         if creation_clause_list = Void then
            Result := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, type)
         else
            Result := creation_clause_list.user_expanded_default_create_stamp(type)
         end
      ensure
         Result /= Void
      end

   external_type: EXTERNAL_TYPE

feature {}
   check_expanded_with_flag: TYPE

feature {CLASS_TEXT}
   declaration_type_of_like_current_ (sp: POSITION): TYPE_MARK
         -- Create a valid `is_static' one.
      require
         not sp.is_unknown
      local
         bcn: STRING; fgl: FORMAL_GENERIC_LIST; gl: ARRAY[TYPE_MARK]
      do
         bcn := name.to_string
         fgl := formal_generic_list
         if as_any = bcn then
            create {ANY_TYPE_MARK} Result.make(sp)
         elseif as_integer_8 = bcn then
            create {INTEGER_TYPE_MARK} Result.integer_8(sp)
         elseif as_integer_16 = bcn then
            create {INTEGER_TYPE_MARK} Result.integer_16(sp)
         elseif as_integer_32 = bcn then
            create {INTEGER_TYPE_MARK} Result.integer_32(sp)
         elseif as_integer = bcn then
            create {INTEGER_TYPE_MARK} Result.integer(sp)
         elseif as_integer_64 = bcn then
            create {INTEGER_TYPE_MARK} Result.integer_64(sp)
         elseif as_natural_8 = bcn then
            create {NATURAL_TYPE_MARK} Result.natural_8(sp)
         elseif as_natural_16 = bcn then
            create {NATURAL_TYPE_MARK} Result.natural_16(sp)
         elseif as_natural_32 = bcn then
            create {NATURAL_TYPE_MARK} Result.natural_32(sp)
         elseif as_natural_64 = bcn then
            create {NATURAL_TYPE_MARK} Result.natural_64(sp)
         elseif as_real_32 = bcn then
            create {REAL_TYPE_MARK} Result.real_32(sp)
         elseif as_real_64 = bcn then
            create {REAL_TYPE_MARK} Result.real_64(sp)
         elseif as_real = bcn then
            create {REAL_TYPE_MARK} Result.real(sp)
         elseif as_real_80 = bcn then
            create {REAL_TYPE_MARK} Result.real_80(sp)
         elseif as_real_128 = bcn then
            create {REAL_TYPE_MARK} Result.real_128(sp)
         elseif as_real_extended = bcn then
            create {REAL_TYPE_MARK} Result.real_extended(sp)
         elseif as_character = bcn then
            create {CHARACTER_TYPE_MARK} Result.make(sp)
         elseif as_boolean = bcn then
            create {BOOLEAN_TYPE_MARK} Result.make(sp)
         elseif as_pointer = bcn then
            create {POINTER_TYPE_MARK} Result.make(sp)
         elseif as_string = bcn then
            create {STRING_TYPE_MARK} Result.make(sp)
         elseif as_tuple = bcn then
            create {EMPTY_TUPLE_TYPE_MARK} Result.make(sp)
         elseif fgl /= Void then
            gl := constraints_generic_list
            if name.is_tuple_related then
               create {NON_EMPTY_TUPLE_TYPE_MARK} Result.make(sp, gl)
            elseif bcn = as_routine then
               create {AGENT_TYPE_MARK} Result.routine(sp, gl.first)
            elseif bcn = as_function then
               create {AGENT_TYPE_MARK} Result.function(sp, gl.first, gl.last)
            elseif bcn = as_procedure then
               create {AGENT_TYPE_MARK} Result.procedure(sp, gl.first)
            elseif bcn = as_predicate then
               create {AGENT_TYPE_MARK} Result.predicate(sp, gl.first)
            elseif bcn = as_array then
               create {ARRAY_TYPE_MARK} Result.make(sp, gl.first)
            elseif bcn = as_native_array then
               create {NATIVE_ARRAY_TYPE_MARK} Result.make(sp, gl.first)
            else
               create {USER_GENERIC_TYPE_MARK} Result.make(name, gl)
            end
         else
            create {CLASS_TYPE_MARK} Result.make(name)
         end
      ensure
         Result.is_static
      end

feature {ANY}
   mapping_c_in (str: STRING)
      do
         str.extend('B')
         str.extend('C')
         id.append_in(str)
      end

feature {CLASS_TEXT_VISITOR}
   set_name (new_name: STRING)
      do
         name.set_string(new_name)
         hash_code := name.hash_code
      end

feature {EIFFEL_PARSER, CLASS_TEXT_VISITOR}
   finish_create
         -- Common part to finish all create procedure.
      do
         hash_code := name.hash_code
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]} feature_dictionary.make
      end

   add_creation_clause (cc: CREATION_CLAUSE)
      require
         cc /= Void
      do
         if creation_clause_list = Void then
            create creation_clause_list.make(cc)
         else
            creation_clause_list.add_last(cc)
         end
      end

   add_feature_clause (fc: FEATURE_CLAUSE)
      require
         fc /= Void
      do
         if feature_clause_list = Void then
            create feature_clause_list.make(fc)
         else
            feature_clause_list.add_last(fc)
         end
      end

   set_is_deferred
      do
         if is_expanded then
            error_vtec1
         end
         is_deferred := True
      end

   set_is_expanded
      do
         if is_deferred then
            error_vtec1
         end
         is_expanded := True
      end

   set_formal_generic_list (fgl: like formal_generic_list)
      do
         formal_generic_list := fgl
      end

   set_heading_comment1 (hc: like heading_comment1)
      do
         heading_comment1 := hc
      end

   set_end_comment (ec: like end_comment)
      do
         end_comment := ec
      end

   set_obsolete_mark (om: like obsolete_mark)
      require
         not om.start_position.is_unknown
      do
         obsolete_mark := om
      ensure
         obsolete_mark = om
      end

   set_invariant (sp: POSITION; hc: COMMENT; al: FAST_ARRAY[ASSERTION])
      do
         if hc /= Void or else al /= Void then
            create class_invariant.make(sp, hc, al)
         end
      end

feature {EIFFEL_PARSER}
   create_parent_lists_using (inherit_hc: COMMENT; inherit_list: FAST_ARRAY[PARENT_EDGE]
                              insert_hc: COMMENT; insert_list: FAST_ARRAY[PARENT_EDGE])
      do
         if name.to_string /= as_any then
            create parent_lists.make(Current, inherit_hc, inherit_list, insert_hc, insert_list)
         end
      end

   set_external_type (external_type_: like external_type)
      require
         external_type_ /= Void
      do
         external_type := external_type_
      ensure
         external_type = external_type_
      end

   next_tuple: like Current
      require
         name.is_tuple_related
      local
         buffer: STRING; hashed_string: HASHED_STRING; nb: INTEGER; next_id: INTEGER_16
      do
         buffer := once "TUPLE..."
         buffer.copy(as_tuple)
         buffer.extend(' ')
         if formal_generic_list /= Void then
            nb := formal_generic_list.count
         end
         nb := nb + 1
         nb.append_in(buffer)
         hashed_string := string_aliaser.hashed_string(buffer)
         next_id := id_provider.item(hashed_string, cluster)
         create Result.make(path, hashed_string.to_string, cluster, next_id)
      ensure
         Result.id /= id
      end

   initialize_and_check_level_1
         -- Called just after parsing to initialize and start checking.
      do
         assertion_level := ace.assertion_level_of(Current)
         if feature_clause_list /= Void then
            feature_clause_list.get_started(feature_dictionary)
         end
         if parent_lists /= Void then
            if not smart_eiffel.pretty_flag then
               parent_lists.initialize_and_check_level_1
            end
         end
         if end_comment /= Void then
            end_comment.good_end_warning_check(name)
         end
         if is_deferred and then creation_clause_list /= Void then
            error_handler.add_position(name.start_position)
            error_handler.add_position(creation_clause_list.start_position)
            error_handler.append(once "Deferred class should not have creation clause (VGCP.1).")
            error_handler.print_as_warning
         end
         sedb_trace := ace.trace_of(Current)
         if formal_generic_list /= Void then
            formal_generic_list.generic_formal_arguments_check
         end
      ensure
         assertion_level /= level_not_computed
      end

feature {TYPE}
   check_level_2 (type: TYPE)
      require
         type.class_text = Current
      do
         if parent_lists /= Void then
            parent_lists.check_level_2(type)
         end
      end

feature {ACE, CLASS_TEXT}
   assertion_level_not_yet_computed: BOOLEAN
      do
         Result := assertion_level = level_not_computed
      end

feature {ACE}
   default_root_procedure_name: STRING
         -- Return the default creation procedure name to be used as the root
         -- procedure (the execution entry point of the system).
      do
         fatal_error_when_no_creation_clause
         Result := creation_clause_list.default_root
      ensure
         Result /= Void
      end

feature {SMART_EIFFEL}
   root_creation_search (a_name: STRING): FEATURE_NAME
         -- Check that `a_name' is actually member of some creation clause.
      require
         not a_name.is_empty
      do
         fatal_error_when_no_creation_clause
         Result := creation_clause_list.root_creation_search(a_name)
         if Result = Void then
            error_handler.add_position(name.start_position)
            error_handler.append(once "Bad root procedure name (%"")
            error_handler.append(a_name)
            error_handler.append(once "%" is not a creation procedure of this class).")
            error_handler.print_as_fatal_error
         end
      ensure
         Result.is_simple_feature_name
      end

   id_extra_information (tfw: TEXT_FILE_WRITE)
      do
         tfw.put_string(once "class-name: ")
         tfw.put_string(name.to_string)
         tfw.put_string(once "%Nassertion-level: ")
         tfw.put_string(level_name(assertion_level))
         tfw.put_string(once "%Nparent-count: ")
         if parent_lists /= Void then
            parent_lists.id_extra_information(tfw)
         else
            tfw.put_character('0')
         end
         tfw.put_character('%N')
      end

feature {LIVE_TYPE, TYPE}
   obsolete_warning_check (live_usage_site: POSITION)
      do
         if obsolete_mark /= Void then
            if smart_eiffel.short_or_class_check_flag then
            elseif smart_eiffel.pretty_flag then
            else
               error_handler.add_position(live_usage_site)
               error_handler.append(once "Class ")
               error_handler.append(name.to_string)
               error_handler.append(once " is obsolete:%N")
               error_handler.append(obsolete_mark.to_string)
               error_handler.add_position(obsolete_mark.start_position)
               error_handler.print_as_warning
            end
         end
      end

feature {LOCAL_ARGUMENT, LIVE_TYPE}
   has_simple_feature_name (sfn: STRING): BOOLEAN
         -- Simple (and fast) look_up to see if one feature of name `n' exists here.
         --|*** PH: remove this feature!
      require
         string_aliaser.registered_one(sfn)
      do
         fn_buffer.unknown_position(sfn)
         not_yet_implemented
         --Result := has(fn_buffer)
      end

feature {ASSERTION_LIST, PARENT_LISTS}
   header_comment_for_class_invariant (ci: like class_invariant)
      require
         ci /= Void
      do
         if class_invariant /= Void and then class_invariant.header_comment /= Void then
            ci.set_header_comment(class_invariant.header_comment)
         elseif parent_lists /= Void then
            parent_lists.header_comment_for_class_invariant(ci)
         end
      end

feature {ANONYMOUS_FEATURE}
   non_written (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE): FEATURE_TEXT
         -- Add `fn' / `af' as if it was written in `Current' (useful
         -- to create automatically generated features).
      local
         fnl: FEATURE_NAME_LIST; fc: FEATURE_CLAUSE
      do
         create fnl.make_1(fn)
         create fc.make(Current, omitted_client_list, Void, Void)
         create Result.non_written_one(fc, fnl, af)
      ensure
         Result /= Void
      end

feature {FEATURE_NAME, ANONYMOUS_FEATURE}
   fatal_undefine (fn: FEATURE_NAME)
         --|*** PH(31/03/04) May be this should be removed
      do
         error_handler.append(once "Problem with undefine of %"")
         error_handler.append(fn.to_string)
         error_handler.append(once "%" in %"")
         error_handler.append(name.to_string)
         error_handler.append(once "%".")
         error_handler.add_position(parent_lists.undefine_position_of(fn))
         error_handler.print_as_fatal_error
      end

feature {TYPE, TYPE_MARK}
   constraints_generic_list: ARRAY[TYPE_MARK]
      local
         fgl: FORMAL_GENERIC_LIST; fga: FORMAL_GENERIC_ARG
         i: INTEGER; t: TYPE_MARK
      do
         fgl := formal_generic_list
         if fgl /= Void then
            from
               i := 1
               create Result.with_capacity(fgl.count, 1)
            until
               i > fgl.count
            loop
               fga := fgl.item(i)
               t := fga.constraint
               if t = Void then
                  create {ANY_TYPE_MARK} t.make(fga.start_position)
               else
                  t := t.declaration_type
               end
               Result.add_last(t)
               i := i + 1
            end
         end
      ensure
         formal_generic_list /= Void implies Result.count = formal_generic_list.count
      end

   formal_generic_list_count_check (usage_position: POSITION; actual_list: ARRAY[TYPE_MARK])
         -- To check that the number of elements in the `actual_list' is equal to the number of elements in the
         -- `formal_generic_list' (which may also be Void). In case of problem (i.e. when both lists do not have the same number
         -- of items), a fatal error message is triggered.
      do
         if formal_generic_list = Void then
            if actual_list /= Void then
               check
                  not actual_list.is_empty
               end
               error_handler.add_position(usage_position)
               error_handler.append(once "Class ")
               error_handler.append(name.to_string)
               error_handler.append(once " is not a generic class. (See file %"")
               error_handler.append(path)
               error_handler.append(once "%".)")
               error_handler.print_as_fatal_error
            end
         elseif actual_list = Void then
            error_handler.add_position(usage_position)
            error_handler.add_position(formal_generic_list.start_position)
            error_handler.append(once "Class ")
            error_handler.append(name.to_string)
            error_handler.append(once " is a generic class (missing actual generic")
            if formal_generic_list.count > 1 then
               error_handler.extend('s')
            end
            error_handler.append(once ").")
            error_handler.print_as_fatal_error
         elseif formal_generic_list.count /= actual_list.count then
            error_handler.add_position(usage_position)
            error_handler.add_position(formal_generic_list.start_position)
            error_handler.append(once "Wrong number of generic argument")
            if formal_generic_list.count > 1 then
               error_handler.extend('s')
            end
            error_handler.append(once " (compare usage and definition below).")
            error_handler.print_as_fatal_error
         end
      end

feature {TYPE, CLASS_TEXT_VISITOR}
   feature_dictionary: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]
         -- All features really defined in the current class. Thus, it
         -- the same features contained in `feature_clause_list' (this
         -- dictionary speed up feature look up).

   creation_list_check (type: TYPE)
      require
         type.class_text = Current
      do
         if not creation_list_check_done then
            -- So that we are sure that those checks are done only once even when the class is generic.
            creation_list_check_done := True
            if creation_clause_list /= Void then
               creation_clause_list.check_for(type)
            end
         end
      end

feature {ANY}
   any_copy_feature: ANONYMOUS_FEATURE
         -- To get the original definition of feature `copy' from class ANY.
      require
         name.to_string = as_any
      do
         fn_buffer.unknown_position(as_copy)
         Result := feature_dictionary.at(fn_buffer)
      ensure
         Result.names.first.to_string = as_copy
      end

   any_twin_feature: ANONYMOUS_FEATURE
         -- To get the original definition of feature `twin' from class ANY.
      require
         name.to_string = as_any
      do
         fn_buffer.unknown_position(as_twin)
         Result := feature_dictionary.at(fn_buffer)
      ensure
         Result.names.first.to_string = as_copy
      end

   any_is_equal_feature: ANONYMOUS_FEATURE
         -- To get the original definition of feature `is_equal' from class ANY.
      require
         name.to_string = as_any
      do
         fn_buffer.unknown_position(as_is_equal)
         Result := feature_dictionary.at(fn_buffer)
      ensure
         Result.names.first.to_string = as_is_equal
      end

   do_at_exit_feature: ANONYMOUS_FEATURE
         -- To get the original definition of feature `do_at_exit' from class ANY.
      require
         name.to_string = as_any
      do
         fn_buffer.unknown_position(as_do_at_exit)
         Result := feature_dictionary.at(fn_buffer)
      ensure
         Result.names.first.to_string = as_do_at_exit
      end

feature {}
   declaration_type_of_like_current_memory: TYPE
         -- To cache `declaration_type' value.

   assertion_level: INTEGER
         -- The one `Current' (mangled using ASSERTION_LEVEL_NUMBERING).

   family_member: TYPE

   creation_list_check_done: BOOLEAN
         -- See `creation_list_check'.

   fn_buffer: FEATURE_NAME
         -- Dummy once name to avoid memory leaks.
      once
         create Result.unknown_position(as_storage)
      end

   error_vtec1
      do
         error_handler.add_position(name.start_position)
         error_handler.append(once "A class cannot be expanded and deferred (VTEC.1).")
         error_handler.print_as_error
      end

   make (p: like path; my_name: STRING; c: like cluster; i: like id)
      require
         string_aliaser.registered_one(p)
         string_aliaser.registered_one(my_name)
         c /= Void
         i > 0
      do
         id := i
         path := p
         cluster := c
         create insert_inherit_test_memory_cache.with_capacity(1024)
         create name.unknown_position(string_aliaser.hashed_string(my_name), False)
         c.register_class_text(Current)
      ensure
         path = p
         name.to_string = my_name
         cluster = c
         id = i
      end

   fatal_error_when_no_creation_clause
      do
         if creation_clause_list = Void then
            error_handler.add_position(name.start_position)
            error_handler.append(once "Bad root class (this class has no creation clause).")
            error_handler.print_as_fatal_error
         end
      end

feature {}
   insert_inherit_test_memory_cache: HASHED_DICTIONARY[INTEGER_8, CLASS_TEXT]

invariant
   name /= Void

   feature_dictionary /= Void implies hash_code = name.to_string.hash_code

end -- class CLASS_TEXT
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
