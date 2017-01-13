-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_SHORTER_CLASSDOC
   --
   -- Document one class
   --

inherit
   IN_OUT_VISITOR
      redefine
         enter_parent_lists, enter_class_text, enter_creation_clause_list, enter_creation_clause,
         exit_creation_clause, visit_feature_name, enter_feature_clause_list, enter_feature_clause,
         exit_feature_clause, enter_feature_text, visit_formal_generic_type_mark, visit_like_feature_type_mark,
         visit_like_argument_type_mark, visit_like_current_type_mark,
         visit_generic_type_mark, visit_agent_type_mark,
         enter_class_invariant,
         visit_call_support, visit_written_current, visit_result, visit_e_old, visit_manifest_string,
         visit_effective_arg_list, visit_argument_name_ref, visit_built_in_eq_neq, visit_implicit_cast,
         visit_e_void, visit_e_true, visit_e_false, visit_character_constant, visit_integer_constant,
         visit_natural_constant, visit_real_constant, visit_create_expression
      end

insert
   GLOBALS
   ASSERTION_PRINT_TOOLS
   AGENT_TYPE_MARKS
   EIFFELDOC_GLOBALS
   INDEX_LIST_VISITOR
   INDEX_CLAUSE_VISITOR

create {EIFFELDOC_SHORTER}
   make

feature {}
   invariant_phase:        INTEGER 1
   summary_creation_phase: INTEGER 2
   summary_features_phase: INTEGER 3
   details_creation_phase: INTEGER 4
   details_features_phase: INTEGER 5

feature {EIFFELDOC_SHORTER}
   find_clients: EIFFELDOC_SHORTER_FIND_CLIENTS

   clients: TYPE_MARK_LIST
         -- list of all class names given in feature clauses

   generate (a_class_text: CLASS_TEXT; a_filename: STRING; inherit_children, insert_children: FAST_ARRAY[CLASS_TEXT])
      local
         obs: MANIFEST_STRING; comment: COMMENT
         idx_list: INDEX_LIST; idx_clause: INDEX_CLAUSE; i, n: INTEGER
         list: FAST_ARRAY[MANIFEST_STRING]
      do
         context.set_class_text(a_class_text)
         depends.clear_count
         clients := find_clients.clients_of(a_class_text)

         context.set_html(html_output_stream_for_file(a_filename))
         write_header(html, a_class_text.name.to_string, real_js, real_css)

         html.body
         open_root_block

         -- obsolete ?
         obs := a_class_text.obsolete_mark
         if obs /= Void then
            set_suffixed_attribute(once "class", css_obsolete, css_msg_suffix, html)
            html.open_span
            html.put_string(obsolete_class_str)
            html.close_span
            set_suffixed_attribute(once "class", css_obsolete, css_mark_suffix, html)
            html.open_span
            html.put_string(obs.to_string)
            html.close_span
         else
            -- summary
            open_block(html, css_summary, summary_title_str, summary_id)
            -- Rmk, 2017-01-08: I prefer the Summary block also to be expanded at page load
            open_expand_block(html, css_summary, summary_id, True)

            comment := a_class_text.heading_comment2
            if comment /= Void then
               open_comment_block(html, css_summary)
               context.write_comment(comment, 1, 0)
               close_comment_block(html)
            end

            -- now let's print the notes
            idx_list := a_class_text.index_list
            if idx_list /= Void then
               from
                  i := 1
               until
                  i > idx_list.list.upper
               loop
                  idx_clause := idx_list.list.item(i)
                  list := idx_clause.list
                  if list /= Void then
                     if idx_clause.tag /= Void then
                        -- this handling is strange...
                        set_suffixed_attribute(once "class", css_summary, css_note_suffix, html)
                        html.open_div
                        set_suffixed_attribute(once "class", css_summary, css_note_tag_suffix, html)
                        html.open_div
                        html.put_string(idx_clause.tag.to_string)
                        html.close_div
                     end
                     set_suffixed_attribute(once "class", css_summary, css_note_values_suffix, html)
                     html.open_div
                     from
                        n := list.lower
                     until
                        n > list.upper
                     loop
                        if n > list.lower then
                           html.put_string(once ",%N")
                        end
                        html.put_string(list.item(n).to_string)
                        n := n + 1
                     end
                     html.close_div
                     i := i + 1

                     if         (i <= idx_list.list.upper and then idx_list.list.item(i).tag /= Void)
                        or else (i > idx_list.list.upper)
                     then
                        html.close_div
                     end
                  end
               end
            end

            html.open_definition_list
            if a_class_text.parent_lists /= Void then
               set_suffixed_attribute(once "class", css_summary, css_keyword_suffix, html)
               html.open_definition_term
               html.put_string(direct_parents_str)
               html.close_definition_term
               if a_class_text.parent_lists.inherit_list /= Void then
                  html.open_definition_description
                  put_parent_classes(inherit_list_str, a_class_text.parent_lists.inherit_list)
                  html.close_definition_description
               end
               if a_class_text.parent_lists.insert_list /= Void then
                  html.open_definition_description
                  put_parent_classes(insert_list_str, a_class_text.parent_lists.insert_list)
                  html.close_definition_description
               end
            end
            if inherit_children /= Void or else insert_children /= Void then
               set_suffixed_attribute(once "class", css_summary, css_keyword_suffix, html)
               html.open_definition_term
               html.put_string(known_children_str)
               html.close_definition_term
               if inherit_children /= Void then
                  html.open_definition_description
                  put_children_classes(inherit_list_str, inherit_children)
                  html.close_definition_description
               end
               if insert_children /= Void then
                  html.open_definition_description
                  put_children_classes(insert_list_str, insert_children)
                  html.close_definition_description
               end
            end
            html.close_definition_list
            close_expand_block(html)
            close_block(html)

            -- class invariant
            put_class_invariant(a_class_text)

            -- features overview
            open_block(html, css_overview, overview_title_str, overview_id)
            open_expand_block(html, css_overview, overview_id, True)
            if a_class_text.creation_clause_list /= Void then
               set_suffixed_attribute(once "class", css_overview, css_keyword_suffix, html)
               html.open_div
               html.put_string(creation_features_str)
               phase := summary_creation_phase
               found_features.clear_count
               browse_class(a_class_text)
               html.close_div
            end
            if a_class_text.feature_clause_list /= Void then
               set_suffixed_attribute(once "class", css_overview, css_keyword_suffix, html)
               html.open_div
               html.put_string(features_str)
               phase := summary_features_phase
               found_features.clear_count
               browse_class(a_class_text)
               html.close_div
            end
            close_expand_block(html)
            close_block(html)

            -- features details
            phase := details_features_phase
            found_features.clear_count
            browse_class(a_class_text)
         end
         
         close_root_block
         html.close
         html.disconnect
      end

   depends: HASHED_SET[CLASS_NAME]
      once
         create Result.make
      end

feature {}
   open_root_block
      -- Write the `top' anchor.
      -- Write tabs.
      -- Open the `root' block and write the block title.
      -- Add the drop down menu
      require
         html /= Void and then html.in_a_body
      local
         i: INTEGER
         tm: TYPE_MARK
         sep: STRING
      do
         html.open_anchor_name(top_anchor_name)
         html.close_anchor

         -- make tabs
         options.open_tabs(html)
         options.add_menu_tabs(html)
         if options.menu.is_empty then
            sep := once ""
         else
            sep := options.ariadne_separator
         end
         options.add_tab(html, options.short_title, index_filename, sep)
         options.add_tab(html, context_class_text.name.to_string, Void, options.ariadne_separator)
         options.close_tabs(html)

         -- open general block
         set_suffixed_attribute(once "class", css_root, css_block_suffix, html)
         html.open_div
         set_suffixed_attribute(once "class", css_root, css_head_suffix, html)
         html.open_div

         -- Points of view menu
         options.open_menu(html, points_of_view_menu_name, all_feature_entry_name)
         from
            i := 1
         until
            i > clients.count
         loop
            tm := clients.item(i)
            -- TYPED_INTERNALS and INTERNALS_HANDLER are no 
            -- interesting POVs
            if tm.class_text.name.to_string /= as_typed_internals and
               tm.class_text.name.to_string /= as_internals_handler then
               options.add_menu_item(html, tm.written_mark, "javascript:set_pov('" + tm.written_mark + once "');")
            end
            i := i + 1
         end
         tm := Void
         options.add_menu_item(html, all_feature_entry_name, "javascript:set_pov(null);")
         options.close_menu(html)

         -- write name
         set_suffixed_attribute(once "class", css_root, css_name_suffix, html)
         html.open_span
         if context_class_text.is_deferred then
            html.put_string(deferred_str)
            html.put_character(' ')
         elseif context_class_text.is_expanded then
            html.put_string(expanded_str)
            html.put_character(' ')
         end
         html.put_string(class_str)
         put_class(context_class_text, True)
         html.close_span
         html.close_div
      ensure
         html.in_a_body
      end

   close_root_block
      require
         html /= Void and then html.in_a_body
      do
         html.close_div
      end

feature {} -- Sorting and displaying lists of classes:
   put_parent_classes (title: STRING; parents: FAST_ARRAY[PARENT_EDGE])
      local
         i: INTEGER
      do
         list_of_classes.with_capacity(parents.count)
         from
            i := parents.lower
         until
            i > parents.upper
         loop
            list_of_classes.add_last(parents.item(i).class_text)
            i := i + 1
         end
         put_list_of_classes(title)
      end

   put_children_classes (title: STRING; children: FAST_ARRAY[CLASS_TEXT])
      require
         title /= Void
         children /= list_of_classes
         not children.is_empty
      do
         list_of_classes.with_capacity(children.count)
         list_of_classes.append_traversable(children)
         put_list_of_classes(title)
      end

   put_list_of_classes (title: STRING)
      require
         title /= Void
         not list_of_classes.is_empty
      local
         i: INTEGER
      do
         sort_list_of_classes
         html.put_string(title)
         html.put_string(once ": ")
         from
            i := list_of_classes.lower
         until
            i > list_of_classes.upper
         loop
            if i > list_of_classes.lower then
               html.put_string(once ", ")
            end
            put_class(list_of_classes.item(i), False)
            i := i + 1
         end
      end

   sort_list_of_classes
      local
         c: COMPARATOR_COLLECTION_SORTER[CLASS_TEXT]
      do
         c.set_comparator(class_texts_comparator)
         c.sort(list_of_classes)
      end

   compare_class_texts (x, y: CLASS_TEXT): BOOLEAN
      do
         Result := x.name.to_string < y.name.to_string
      end

   class_texts_comparator: PREDICATE[TUPLE[CLASS_TEXT, CLASS_TEXT]]
      once
         Result := agent compare_class_texts(?, ?)
      end

   list_of_classes: FAST_ARRAY[CLASS_TEXT]
      once
         create Result.make(0)
      end

feature {}
   put_class_invariant (ct: CLASS_TEXT)
      local
         phase_memory: like phase
      do
         phase_memory := phase
         phase := invariant_phase
         class_text := ct
         context.set_type(ct.declaration_type_of_like_current)

         if context.type.class_invariant /= Void and then not assertion_list_is_empty(context.type.class_invariant) then
            open_block(html, css_invariant, class_invariant_str, class_invariant_id)
            print_assertion_list(context.type.class_invariant, Void)
            close_block(html)
         end
         phase := phase_memory
      end

   browse_class (ct: CLASS_TEXT)
      local
         pl: PARENT_LISTS
      do
         check
            phase /= invariant_phase
         end
         class_text := ct
         context.set_type(ct.declaration_type_of_like_current)
         entered := False
         ct.accept(Current)
         pl := ct.parent_lists
         if pl /= Void then
            browse_inherit_items(pl.inherit_list)
            browse_inherit_items(pl.insert_list)
         end
         if ct /= class_any then
            browse_class(class_any)
         end
      end

   browse_inherit_items (items: FAST_ARRAY[PARENT_EDGE])
      local
         i: INTEGER; ct: CLASS_TEXT
      do
         if items /= Void then
            from
               i := items.lower
            until
               i > items.upper
            loop
               ct := items.item(i).class_text
               if ct /= class_any then
                  browse_class(ct)
               end
               i := i + 1
            end
         end
      end

feature {}
   enter_class_invariant (visited: CLASS_INVARIANT): BOOLEAN
      do
         if phase = invariant_phase then
            print_assertion_list(visited, Void)
         end
      end

feature {}
   enter_parent_lists (visited: PARENT_LISTS): BOOLEAN
      do
      ensure
         not Result
      end

   enter_class_text (visited: CLASS_TEXT): BOOLEAN
      do
         Result := not entered
         entered := True
      end

   entered: BOOLEAN

   look_for_creation: FEATURE_NAME

   feature_clause_comment_to_print: COMMENT

   feature_clause_comment_printed: BOOLEAN

   print_client_list
         -- output the client list for the current object as class-links
      local
         i: INTEGER
         tm: TYPE_MARK
      do
         html.open_div
         html.put_string("{")
         if feature_clause_client_list /= Void then
            from
               i := 1
            until
               i > feature_clause_client_list.count
            loop
               tm := feature_clause_client_list.item(i)

               -- in case the resolved class name cannot be 
               -- loaded this ends up in a Void reference... check 
               -- for it before
               if not smart_eiffel.find_paths_for(tm.written_name).is_empty then

                  put_class_name(tm.resolve_in(context.type).class_text.name, True)
                  if i < feature_clause_client_list.count then
                     html.put_string(", ")
                  end
               end
               i := i + 1
            end
         end
         
         html.put_string("}")
         html.close_div
      end

   feature_clause_client_list: TYPE_MARK_LIST
         -- list of all class names given in feature clauses, those
         -- have access to the current feature(s)
   
   enter_creation_clause_list (visited: CREATION_CLAUSE_LIST): BOOLEAN
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase then
            Result := True
         when details_creation_phase then
            Result := True
         when summary_features_phase then
         when details_features_phase then
         end
      end

   enter_creation_clause (visited: CREATION_CLAUSE): BOOLEAN
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase then
            feature_clause_comment_to_print := visited.comment
            feature_clause_client_list := visited.clients.type_mark_list
            feature_clause_comment_printed := False
         when summary_features_phase then
         when details_creation_phase then
         when details_features_phase then
            feature_clause_client_list := visited.clients.type_mark_list
         end
         Result := True
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   exit_creation_clause (visited: CREATION_CLAUSE)
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase then
            if feature_clause_comment_printed then
               html.close_list
            end
         when summary_features_phase then
         when details_creation_phase then
         when details_features_phase then
         end
      end

   enter_feature_clause_list (visited: FEATURE_CLAUSE_LIST): BOOLEAN
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase then
            Result := look_for_creation /= Void
         when summary_features_phase then
            Result := True
         when details_creation_phase then
            Result := look_for_creation /= Void
         when details_features_phase then
            Result := True
         end
      end

   enter_feature_clause (visited: FEATURE_CLAUSE): BOOLEAN
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase then
            Result := True
            check
               look_for_creation /= Void
            end
         when summary_features_phase then
            Result := True
            feature_clause_comment_to_print := visited.comment
            feature_clause_client_list := visited.clients.type_mark_list
            feature_clause_comment_printed := False
         when details_creation_phase then
            Result := True
            check
               look_for_creation /= Void
            end
         when details_features_phase then
            feature_clause_client_list := visited.clients.type_mark_list
            Result := True
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   exit_feature_clause (visited: FEATURE_CLAUSE)
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase then
         when summary_features_phase then
            if feature_clause_comment_printed then
               html.close_list
            end
         when details_creation_phase then
         when details_features_phase then
         end
      end

   enter_feature_text (visited: FEATURE_TEXT): BOOLEAN
      local
         do_print: BOOLEAN; fs: FEATURE_STAMP; fn: FEATURE_NAME; af: ANONYMOUS_FEATURE; i: INTEGER
      do
         from
            i := 1
         until
            i > visited.names.count
         loop
            fn := visited.names.item(i)
            fs := context.type.lookup(fn)
            if fs = Void then
               echo.put_string(once "*** Unknown feature ")
               echo.put_string(fn.to_string)
               echo.put_string(once " for class ")
               echo.put_string(context_class_text.name.to_string)
               echo.put_new_line
            else
               --|*** Huh? Why look up the fs in context.type? That's where it's freaking coming from! <FM-18/03/2006>
               --fs := fs.resolve_dynamic_binding_for(context.type)
               fn := context.type.get_feature_name(fs)
               do_print := not found_features.has(fs) and then (fn.start_position.class_text /= class_any or else context_class_text = class_any)
               if do_print then
                  inspect
                     phase
                  when invariant_phase then
                     check False end
                  when summary_creation_phase then
                     do_print := visited.names.has(look_for_creation)
                  when summary_features_phase then
                     check
                        do_print
                     end
                  when details_creation_phase then
                     do_print := visited.names.has(look_for_creation)
                  when details_features_phase then
                     check
                        do_print
                     end
                  end
                  if do_print then
                     found_features.add_last(fs)
                     af := fs.anonymous_feature(context.type)
                     print_feature(fn, af)
                  end
               end
            end
            i := i + 1
         end
      ensure
         not Result
      end

   found_features: FAST_ARRAY[FEATURE_STAMP]
      once
         create Result.with_capacity(16)
      end

   print_feature (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE)
      require
         not_done_to_report_errors: error_handler.is_empty -- required by gives_permission_to
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase, summary_features_phase then
            if not feature_clause_comment_printed then
               if feature_clause_comment_to_print /= Void then
                  set_suffixed_attribute(once "class", css_overview, css_clause_comment_suffix, html)
                  html.open_div
                  context.write_comment(feature_clause_comment_to_print, 1, 0)
                  html.close_div
                  feature_clause_comment_to_print := Void
               end
               print_client_list
               
               feature_clause_comment_printed := True
               html.open_list
            end
            print_feature_summary(fn, af)
         when details_creation_phase, details_features_phase then
            print_feature_details(fn, af)
         end
      end

   print_feature_summary (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE)
      local
         ref: STRING; i: INTEGER
         name, assign_anchor: STRING
      do
         name := once ""
         name.clear_count
         fn.complete_name_in(name)
         set_suffixed_attribute(once "class", css_overview, css_feature_item_suffix, html)
         html.open_list_item
         ref := once ""
         ref.copy(once "#")
         ref.append(name)
         html.with_attribute(once "class", css_feature_link)
         html.with_attribute(once "href", filtered_attribute(ref))
         html.open_anchor
         html.put_string(name)
         html.close_anchor
         if af.arguments /= Void then
            html.put_entity(once "nbsp")
            html.put_character('(')
            from
               i := 1
            until
               i > af.arguments.count
            loop
               if i > 1 then
                  html.put_string(once ", ")
               end
               html.put_string(af.arguments.name(i).to_string)
               html.put_string(once ": ")
               put_type_mark(af.arguments.type_mark(i))
               i := i + 1
            end
            html.put_character(')')
         end
         if af.result_type /= Void then
            html.put_string(once ": ")
            put_type_mark(af.result_type)
         end
         if af.feature_text.assigned /= Void then
            html.put_string(once " assign ")
            assign_anchor := once ""
            assign_anchor.copy(once "#")
            af.feature_text.assigned.complete_name_in(assign_anchor)
            html.with_attribute(once "class", once "feature_link")
            html.with_attribute(once "href", filtered_attribute(assign_anchor))
            html.open_anchor
            assign_anchor.clear_count
            af.feature_text.assigned.complete_name_in(assign_anchor)
            html.put_string(assign_anchor)
            html.close_anchor
         end
         if af.header_comment /= Void then
            html.put_break
            set_suffixed_attribute(once "class", css_overview, css_comment_suffix, html)
            context.write_feature_comment(af.header_comment, af, 1, 2)
         end
         html.close_list_item
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   print_feature_details (fn: FEATURE_NAME; af: ANONYMOUS_FEATURE)
      require
         not_done_to_report_errors: error_handler.is_empty -- required by gives_permission_to
      local
         i: INTEGER
         feature_name, id, assign_anchor, const_string, client_str: STRING
         require_not_empty, ensure_not_empty, need_blank: BOOLEAN
         c_value: EXPRESSION
         cst: CST_ATT
         manifest_string: MANIFEST_STRING
         btc: BASE_TYPE_CONSTANT
         tm: TYPE_MARK
      do
         feature_name := once ""
         feature_name.clear_count
         fn.complete_name_in(feature_name)
         id := once ""
         id.copy(once "id.")
         id.append(feature_name)

         client_str := once ""
         client_str.clear_count
         if feature_clause_client_list /= Void then
            from
               i := 1
            until
               i > clients.count
            loop
               tm := clients.item(i)
               -- TYPED_INTERNALS and INTERNALS_HANDLER are no 
               -- interesting POVs
               if tm.class_text.name.to_string /= as_typed_internals and
                  tm.class_text.name.to_string /= as_internals_handler and
                  af.permissions.gives_permission_to(tm, context.type) then
                  client_str.append(tm.written_mark)
                  client_str.append(",") -- always append , as we need the separator also at the end to prevent finding substrings
               end
               i := i + 1
            end
            html.with_attribute(once "data-access", client_str)
         end

         open_block_head(html, css_feature, id)

         html.with_attribute(once "name", filtered_attribute(feature_name))
         html.open_anchor
         html.close_anchor
         set_suffixed_attribute(once "class", css_feature, css_name_suffix, html)
         html.open_span
         html.put_string(feature_name)
         html.close_span
         if af.arguments /= Void then
            -- html.put_entity(once "nbsp")
            html.put_string(once " (")
            from
               i := 1
            until
               i > af.arguments.count
            loop
               if i > 1 then
                  html.put_string(once ", ")
               end
               html.put_string(af.arguments.name(i).to_string)
               html.put_string(once ": ")
               put_type_mark(af.arguments.type_mark(i))
               i := i + 1
            end
            html.put_character(')')
         end
         if af.result_type /= Void then
            html.put_string(once ": ")
            put_type_mark(af.result_type)
         end
         if af.feature_text.assigned /= Void then
            html.put_string(once " assign ")
            assign_anchor := once ""
            assign_anchor.copy(once "#")
            af.feature_text.assigned.complete_name_in(assign_anchor)
            html.with_attribute(once "class", once "feature_link")
            html.with_attribute(once "href", filtered_attribute(assign_anchor))
            html.open_anchor
            assign_anchor.clear_count
            af.feature_text.assigned.complete_name_in(assign_anchor)
            html.put_string(assign_anchor)
            html.close_anchor
         end

         if {CST_ATT} ?:= af then
            cst ::= af
            c_value := cst.value
            const_string := "is "
            if {BASE_TYPE_CONSTANT} ?:= c_value then
               btc ::= c_value
               const_string.append(btc.to_string)
            elseif {MANIFEST_STRING} ?:= c_value then
               manifest_string ::= c_value
               const_string.append(once "%"")
               const_string.append(manifest_string.to_string)
               const_string.append(once "%"")
            else
               const_string := once ""
            end

            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_value_suffix, html)
            html.open_div
            html.put_string(const_string)
            need_blank := True
         end

         if fn.is_frozen then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_frozen_suffix, html)
            html.open_div
            html.put_string(frozen_str)
            need_blank := True
         end

         if {WRITABLE_ATTRIBUTE} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("writable attribute")
            need_blank := True
         elseif {CST_ATT} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("constant attribute")
            need_blank := True
         elseif {ONCE_PROCEDURE} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("once procedure")
            need_blank := True
         elseif {ONCE_FUNCTION} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("once function")
            need_blank := True
         elseif {E_PROCEDURE} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("effective procedure")
            need_blank := True
         elseif {E_FUNCTION} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("effective function")
            need_blank := True
         elseif {DEFERRED_PROCEDURE} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("deferred procedure")
            need_blank := True
         elseif {DEFERRED_FUNCTION} ?:= af then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_attribute_suffix, html)
            html.open_div
            html.put_string("deferred function")
            need_blank := True
         end

         html.close_div
         set_suffixed_attribute(once "class", css_feature, css_access_suffix, html)
         print_client_list
         html.open_div
         
         if need_blank then
            html.close_div
            set_suffixed_attribute(once "class", css_feature, css_blank_suffix, html)
            html.open_div
         end

         close_block_head(html, css_feature)

         if af.header_comment /= Void then
            open_comment_block(html, css_feature)
            context.write_feature_comment(af.header_comment, af, 1, 2)
            close_comment_block(html)
         end

         require_not_empty := af.require_assertion /= Void and then not require_is_empty(af.require_assertion)
         ensure_not_empty := af.ensure_assertion /= Void and then not assertion_list_is_empty(af.ensure_assertion)
         if af.obsolete_mark /= Void or else af.header_comment /= Void or else require_not_empty or else ensure_not_empty then
            open_expand_block(html, css_feature, id, False)

            if af.obsolete_mark /= Void then
               set_suffixed_attribute(once "class", css_obsolete, css_msg_suffix, html)
               html.open_span
               html.put_string(obsolete_feature_str)
               html.close_span
               set_suffixed_attribute(once "class", css_obsolete, css_mark_suffix, html)
               html.open_span
               html.put_string(af.obsolete_mark.to_string)
               html.close_span
            else
               if af.header_comment /= Void then
                  open_comment_block(html, css_feature)
                  context.write_feature_comment(af.header_comment, af, 2, 0)
                  close_comment_block(html)
               end
               if require_not_empty then
                  set_suffixed_attribute(once "class", css_assertion, css_keyword_suffix, html)
                  html.open_span
                  html.put_string(require_str)
                  html.close_span
                  print_require(af.require_assertion, af)
               end
               if ensure_not_empty then
                  set_suffixed_attribute(once "class", css_assertion, css_keyword_suffix, html)
                  html.open_span
                  html.put_string(ensure_str)
                  html.close_span
                  print_assertion_list(af.ensure_assertion, af)
               end
            end
            close_expand_block(html)
         end
         close_block(html)
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   require_is_empty (ra: REQUIRE_ASSERTION): BOOLEAN
      require
         ra /= Void
      local
         i: INTEGER
      do
         Result := True
         if ra.local_require /= Void then
            Result := assertion_list_is_empty(ra.local_require)
         end
         if ra.direct_parents_require /= Void then
            from
               i := ra.direct_parents_require.lower
            until
               not Result or else i > ra.direct_parents_require.upper
            loop
               Result := require_is_empty(ra.direct_parents_require.item(i))
               i := i + 1
            end
         end
      end

   assertion_list_is_empty (al: ASSERTION_LIST): BOOLEAN
      require
         al /= Void
      local
         i: INTEGER; a: ASSERTION
      do
         Result := True
         if not al.is_empty then
            from
               i := al.lower
            until
               not Result or else i > al.upper
            loop
               a := al.item(i)
               Result := a.expression = Void
               i := i + 1
            end
         end
      end

   print_require (ra: REQUIRE_ASSERTION; for_feature: ANONYMOUS_FEATURE)
      local
         i: INTEGER; has_else: BOOLEAN
      do
         if ra.local_require /= Void and then ra.direct_parents_require /= Void then
            html.put_string(once "(")
            has_else := True
         end
         if ra.local_require /= Void then
            print_assertion_list(ra.local_require, for_feature)
         end
         if has_else then
            html.put_string(once ") or else (")
         end
         if ra.direct_parents_require /= Void then
            html.open_list
            from
               i := ra.direct_parents_require.lower
            until
               i > ra.direct_parents_require.upper
            loop
               print_require(ra.direct_parents_require.item(i), for_feature)
               i := i + 1
            end
            html.close_list
         end
         if has_else then
            html.put_string(once ")")
         end
      end

   print_assertion_list (al: ASSERTION_LIST; for_feature: ANONYMOUS_FEATURE)
      local
         i: INTEGER
      do
         if al.count > 0 then
            html.open_list
            from
               i := al.lower
            until
               i > al.upper
            loop
               print_assertion(al.item(i), for_feature)
               i := i + 1
            end
            html.close_list
         end
      end

   print_assertion (a: ASSERTION; for_feature: ANONYMOUS_FEATURE)
      local
         ewc: EXPRESSION_WITH_COMMENT; e: EXPRESSION; c: COMMENT
      do
         html.open_list_item
         if a.tag /= Void then
            set_suffixed_attribute(once "class", css_assertion, css_name_suffix, html)
            html.open_span
            html.put_string(a.tag.to_string)
            html.put_string(once ": ")
            html.close_span
         end
         e := a.expression
         c := a.comment
         if e /= Void then
            if ewc ?:= e then
               ewc ::= e
               check
                  c = Void
               end
               e := ewc.expression
               c := ewc.comment
            end
            e.accept (Current)
         end
         if c /= Void then
            context.write_feature_comment(c, for_feature, 1, 0)
         end
         html.put_break
         html.close_list_item
      end

feature {}
   visit_generic_type_mark (visited: GENERIC_TYPE_MARK)
      local
         list: ARRAY[TYPE_MARK]; i: INTEGER
      do
         put_class_name(visited.class_text_name, False)
         html.put_character('[')
         from
            list := visited.generic_list
            i := list.lower
         until
            i > list.upper
         loop
            if i > list.lower then
               html.put_string(once ", ")
            end
            put_type_mark(list.item(i))
            i := i + 1
         end
         html.put_character(']')
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         put_class_name(visited.class_text_name, True)
         html.put_character('[')
         put_class_name(class_name_tuple, True)
         html.put_character('[')
         visited.written_open.accept(Current)
         if visited.pretty_code = function_code then
            html.put_string(once ", ")
            visited.result_type.accept(Current)
         end
         html.put_character(']')
         html.put_character(']')
      end

feature {FEATURE_NAME}
   visit_feature_name (visited: FEATURE_NAME)
      do
         inspect
            phase
         when invariant_phase then
            check False end
         when summary_creation_phase, details_creation_phase, details_features_phase then
            if class_text.feature_clause_list /= Void then
               look_for_creation := visited
               class_text.feature_clause_list.accept(Current)
               look_for_creation := Void
            end
         when summary_features_phase then
         end
      end

feature {FORMAL_GENERIC_TYPE_MARK}
   visit_formal_generic_type_mark (visited: FORMAL_GENERIC_TYPE_MARK)
      do
         html.put_string(visited.written_mark)
      end

feature {LIKE_FEATURE_TYPE_MARK}
   visit_like_feature_type_mark (visited: LIKE_FEATURE_TYPE_MARK)
      local
         fs: FEATURE_STAMP; ct: TYPE
      do
         ct := context.type
         fs := ct.lookup(ct.registered_name(visited.like_what)) --.resolve_dynamic_binding_for(ct)
         --|*** No need to resolve fs for ct since it was looked up in ct... or am I missing something? <FM-18/03/2006>
         put_type_mark(fs.anonymous_feature(ct).result_type)
      end

feature {LIKE_ARGUMENT_TYPE_MARK}
   visit_like_argument_type_mark (visited: LIKE_ARGUMENT_TYPE_MARK)
      do
         put_type_mark(visited.declaration_type)
      end

feature {LIKE_CURRENT_TYPE_MARK}
   visit_like_current_type_mark (visited: LIKE_CURRENT_TYPE_MARK)
      do
         put_class(context_class_text, True)
      end

feature {ARGUMENT_NAME_REF}
   visit_argument_name_ref (visited: ARGUMENT_NAME_REF)
      do
         html.put_string(visited.to_string)
      end

feature {EFFECTIVE_ARG_LIST}
   visit_effective_arg_list (visited: EFFECTIVE_ARG_LIST)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > visited.count
         loop
            visited.expression(i).accept(Current)
            if i < visited.count then
               html.put_string(once ", ")
            end
            i := i + 1
         end
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING)
      do
         html.put_string(visited.source_view)
      end

feature {WRITTEN_CURRENT}
   visit_written_current (visited: WRITTEN_CURRENT)
      do
         html.put_string(visited.to_string)
      end

feature {RESULT}
   visit_result (visited: RESULT)
      do
         html.put_string(once "Result")
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD)
      do
         html.put_string(old_str)
         html.put_character(' ')
         visited.expression.accept(Current)
      end

feature {}
   visit_call_support (visited: FEATURE_CALL)
      local
         t: EXPRESSION; fn:FEATURE_NAME; args: EFFECTIVE_ARG_LIST; ref:STRING
         name: STRING
      do
         t := visited.target
         fn := visited.feature_name
         args := visited.arguments
         name := fn.to_string
         ref := once ""
         ref.copy(once "#")
         fn.complete_name_in(ref)

         if fn.is_prefix_name then
            if t.declaration_type.class_text = class_text then
               html.with_attribute(once "class", css_feature_link)
               html.with_attribute(once "href", filtered_attribute(ref))
               html.open_anchor
               html.put_string(name)
               html.close_anchor
            else
               html.put_string(name)
            end

            if args /= Void then
               args.accept(Current)
            end

            html.put_character(' ')
            t.accept(Current)
         elseif fn.is_infix_name then
            t.accept(Current)
            html.put_character(' ')

            if t.declaration_type.class_text = class_text then
               html.with_attribute(once "class", css_feature_link)
               html.with_href(ref)
               html.open_anchor
               html.put_string(name)
               html.close_anchor
            else
               html.put_string(name)
            end

            html.put_character(' ')
            if args /= Void then
               args.accept(Current)
            end
         else
            check
               fn.is_simple_feature_name
            end

            t.accept(Current)

            if not t.is_implicit_current then
               html.put_character('.')
            end

            if t.declaration_type.class_text = class_text then
               html.with_attribute(once "class", css_feature_link)
               html.with_href(ref)
               html.open_anchor
               html.put_string(name)
               html.close_anchor
            else
               html.put_string(name)
            end

            if args /= Void then
               html.put_character('(')
               args.accept(Current)
               html.put_character(')')
            end
         end
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ)
      do
         visited.left_side.accept(Current)
         html.put_character(' ')
         if visited.eq_flag then
            html.put_character('=')
         else
            html.put_string(once "/=")
         end
         html.put_character(' ')
         visited.right_side.accept(Current)
      end

feature {IMPLICIT_CAST}
   visit_implicit_cast (visited: IMPLICIT_CAST)
      do
         visited.expression.accept(Current)
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID)
      do
         html.put_string(visited.to_string)
      end
feature {E_TRUE}
   visit_e_true (visited: E_TRUE)
      do
         html.put_string(visited.to_string)
      end

feature {E_FALSE}
   visit_e_false (visited: E_FALSE)
      do
         html.put_string(visited.to_string)
      end

feature {CHARACTER_CONSTANT}
   visit_character_constant (visited: CHARACTER_CONSTANT)
      do
         html.put_string(visited.to_string)
      end

feature {INTEGER_CONSTANT}
   visit_integer_constant (visited: INTEGER_CONSTANT)
      do
         html.put_string(visited.to_string)
      end

feature {NATURAL_CONSTANT}
   visit_natural_constant (visited: NATURAL_CONSTANT)
      do
         html.put_string(visited.to_string)
      end

feature {REAL_CONSTANT}
   visit_real_constant (visited: REAL_CONSTANT)
      do
         html.put_string(visited.to_string)
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION)
      do
         html.put_string(once "(create {")
         put_class_name(visited.explicit_type.class_text_name, class_text /= visited.explicit_type.class_text)
         html.put_character('}')
         if visited.call /= Void and then not visited.default_create_call then
            visited.call.accept(Current)
         end
         html.put_character(')')
      end

feature {}
   class_text: CLASS_TEXT

   phase: INTEGER

   options: EIFFELDOC_OPTIONS
      do
         Result := context.options
      end

   html: EIFFELDOC_OUTPUT_STREAM
      do
         Result := context.html
      end

   context_class_text: CLASS_TEXT
      do
         Result := context.class_text
      end

   make (a_context: like context)
      require
         a_context /= Void
      do
         context := a_context
         create find_clients.make
      end

   put_type_mark (visited: TYPE_MARK)
      local
         list: ARRAY[TYPE_MARK]; i: INTEGER
      do
         if visited.is_static then
            put_class(visited.resolve_in(context.type).class_text, False)
            if visited.is_generic then
               html.put_character('[')
               from
                  list := visited.generic_list
                  i := list.lower
               until
                  i > list.upper
               loop
                  if i > list.lower then
                     html.put_string(once ", ")
                  end
                  put_type_mark(list.item(i))
                  i := i + 1
               end
               html.put_character(']')
            end
         else
            visited.accept(Current)
         end
      end

   put_class (ct: CLASS_TEXT; show_generic: BOOLEAN)
      local
         class_name: CLASS_NAME; i: INTEGER; arg: FORMAL_GENERIC_ARG
      do
         class_name := ct.name
         put_class_name(class_name, ct /= context_class_text and then not is_generic_name(class_name, context_class_text))
         if show_generic and then ct.is_generic then
            html.put_entity(once "nbsp")
            html.put_character('[')
            from
               i := 1
            until
               i > ct.formal_generic_list.count
            loop
               if i > 1 then
                  html.put_string(once ", ")
               end
               arg := ct.formal_generic_list.item(i)
               class_name := arg.name
               put_class_name(class_name, not is_generic_name(class_name, ct))
               if arg.constraint /= Void then
                  html.put_entity(once "nbsp")
                  html.put_string(once "->")
                  html.put_entity(once "nbsp")
                  --arg.constraint.specialize_in(context.type)
                  put_type_mark(arg.constraint)
               end
               i := i + 1
            end
            html.put_character(']')
         end
         if not depends.has(class_name) then
            depends.add(class_name)
         end
      end

   put_class_name (class_name: CLASS_NAME; anchored: BOOLEAN)
      require
         non_void_classname: class_name /= Void
      local
         anchor: STRING
      do
         if anchored then
            
            anchor := filename_of(class_name.class_text)
         end
         put_class_name_string(class_name.to_string, anchor)
      end

   put_class_name_string (class_name_string, anchor: STRING)
         -- Must be called '''only''' by `put_class_name'
      do
         if anchor = Void then
            html.put_string(class_name_string)
         else
            html.with_attribute(once "class", css_class_link)
            html.with_href(anchor)
            html.open_anchor
            html.put_string(class_name_string)
            html.close_anchor
         end
      end

   is_generic_name (class_name: CLASS_NAME; context_class: CLASS_TEXT): BOOLEAN
      local
         i: INTEGER
      do
         if context_class.is_generic then
            from
               i := 1
            until
               Result or else i > context_class.formal_generic_list.count
            loop
               Result := context_class.formal_generic_list.item(i).name.is_equal(class_name)
               i := i + 1
            end
         end
      end

   context: EIFFELDOC_CONTEXT

feature {INDEX_LIST, INDEX_CLAUSE} -- unused vistors
   visit_index_list (visited: INDEX_LIST)
      do
      end

   visit_index_clause (visited: INDEX_CLAUSE)
      do
      end

end -- class EIFFELDOC_SHORTER_CLASSDOC
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
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
