class EIFFELDOC_SHORTER_SOURCEDOC
--
-- Prints the source of a class
--

inherit
   IN_OUT_VISITOR
      redefine
         enter_class_text, exit_class_text,
         visit_creation_clause,
         visit_feature_clause,
         visit_feature_text,
         visit_feature_name_list,
         do_visit_anonymous_feature,
         enter_require_assertion, exit_require_assertion,
         enter_ensure_assertion, exit_ensure_assertion
      end
insert
   EIFFELDOC_GLOBALS

create {EIFFELDOC_SHORTER}
   make

feature {EIFFELDOC_SHORTER}
   generate (ct: CLASS_TEXT; source_filename: STRING)
      do
         class_text := ct
         html := html_output_stream_for_file(source_filename)
         write_header(html, source_filename, options.js, options.css)
         html.body
         ct.accept(Current)
         html.close
         html.disconnect
      end

feature {}
   enter_class_text (visited: CLASS_TEXT): BOOLEAN
      local
         i: INTEGER; fga: FORMAL_GENERIC_ARG
      do
         Result := visited = class_text
         if Result then
            if class_text.heading_comment1 /= Void then
               put_comment(class_text.heading_comment1)
            end
            if visited.is_deferred then
               put_keyword(once "deferred")
            elseif visited.is_expanded then
               put_keyword(once "expanded")
            end
            html.put_character(' ')
            put_keyword(once "class")
            html.put_character(' ')
            html.put_string(visited.name.to_string)
            if visited.is_generic then
               html.put_character('[')
               from
                  i := 1
               until
                  i > visited.formal_generic_list.count
               loop
                  if i > 1 then
                     html.put_string(once ", ")
                  end
                  fga := visited.formal_generic_list.item(i)
                  html.put_string(fga.name.to_string)
                  if fga.constraint /= Void then
                     html.put_string(once "->")
                     html.put_string(fga.constraint.written_mark)
                  end
                  i := i + 1
               end
               html.put_character(']')
            end
            if visited.heading_comment2 /= Void then
               indent_more
               put_comment(visited.heading_comment2)
               indent_less
            end
         end
      end

   exit_class_text (visited: CLASS_TEXT)
      do
         indent_line
         put_keyword(once "end")
         if visited.end_comment /= Void then
            html.put_break
            put_comment(visited.end_comment)
         end
      end

feature {CREATION_CLAUSE}
   visit_creation_clause (visited: CREATION_CLAUSE)
      local
         b: STRING
      do
         put_keyword(once "create")
         if visited.clients /= Void then
            html.put_character(' ')
            b := once ""
            b.clear_count
            visited.clients.append_in(b)
            html.put_string(b)
         end
         indent_more
         html.put_break
         indent_line
         visited.procedure_list.accept(Current)
         indent_less
         html.put_break
         html.put_break
      end

feature {FEATURE_CLAUSE}
   visit_feature_clause (visited: FEATURE_CLAUSE)
      local
         i: INTEGER; b: STRING
      do
         put_keyword(once "feature")
         if visited.clients /= Void then
            html.put_character(' ')
            b := once ""
            b.clear_count
            visited.clients.append_in(b)
            html.put_string(b)
         end
         if visited.list /= Void then
            indent_more
            from
               i := visited.list.lower
            until
               i > visited.list.upper
            loop
               html.put_break
               visited.list.item(i).accept(Current)
               i := i + 1
            end
            indent_less
         end
         html.put_break
      end

feature {FEATURE_TEXT}
   visit_feature_text (visited: FEATURE_TEXT)
      do
         html.open_anchor_name(visited.names.first.hash_code.out)
         indent_line
         visited.names.accept(Current)
         visited.anonymous_feature.accept(Current)
         html.close_anchor
         html.put_break
      end

feature {FEATURE_NAME_LIST}
   visit_feature_name_list (visited: FEATURE_NAME_LIST)
      local
         i: INTEGER; name: STRING
      do
         from
            i := 1
         until
            i > visited.count
         loop
            if i > 1 then
               html.put_string(once ", ")
            end
            name := visited.item(i).to_string
            html.put_string(name)
            i := i + 1
         end
      end

feature {}
   do_visit_anonymous_feature (visited: ANONYMOUS_FEATURE)
      local
         args: FORMAL_ARG_LIST; decls: ARRAY[DECLARATION]; decl: DECLARATION
         i: INTEGER; b: STRING
         routine: EFFECTIVE_ROUTINE; extern: EXTERNAL_ROUTINE
      do
         args := visited.arguments
         if args /= Void then
            html.put_entity(once "nbsp")
            html.put_character('(')
            decls := args.list
            from
               i := decls.lower
            until
               i > decls.upper
            loop
               if i > decls.lower then
                  html.put_string(once "; ")
               end
               decl := decls.item(i)
               b := once ""
               b.clear_count
               decl.pretty_in(b)
               html.put_string(b)
               i := i + 1
            end
            html.put_character(')')
         end
         if visited.result_type /= Void then
            html.put_string(once ": ")
            html.put_string(visited.result_type.written_mark)
         end
         if not visited.is_attribute then
            html.put_character(' ')
            put_keyword(once "is")
         end
         indent_more
         if visited.header_comment /= Void then
            indent_more
            put_comment(visited.header_comment)
            indent_less
         else
            html.put_break
         end
         if visited.obsolete_mark /= Void then
            indent_line
            put_keyword(once "obsolete")
            html.put_character(' ')
            html.with_attribute(once "class", once "source_obsolete")
            html.open_typeset
            html.put_character('"')
            html.put_string(visited.obsolete_mark.to_string)
            html.put_character('"')
            html.close_typeset
            html.put_break
         end
         if visited.require_assertion /= Void then
            visited.require_assertion.accept(Current)
            html.put_break
         end
         if visited.is_deferred then
            indent_line
            put_keyword(once "deferred")
            html.put_break
         elseif visited.is_attribute then
            -- nothing
         elseif routine ?:= visited then
            --|*** berk -- lost information type :-(
            routine ::= visited
            if routine.local_vars /= Void then
               -- TODO local vars
               html.put_break
            end
            indent_line
            if {ONCE_ROUTINE} ?:= routine then
               put_keyword(once "once")
            else
               put_keyword(once "do")
            end
            if routine.routine_body /= Void then
               routine.routine_body.accept(Current)
               html.put_break
            end
            if routine.routine_then /= Void then
               put_keyword(once "then")
               routine.routine_then.accept(Current)
               html.put_break
            end
         elseif extern ?:= visited then
            --|*** berk -- lost information type :-(
            extern ::= visited
            indent_line
            put_keyword(once "external")
            html.put_character(' ')
            html.with_attribute(once "class", once "source_external")
            html.open_typeset
            html.put_character('"')
            html.put_string(extern.native.external_tag.to_string)
            html.put_character('"')
            html.close_typeset
            html.put_break
            if extern.alias_string /= Void then
               indent_line
               put_keyword(once "alias")
               html.put_character(' ')
               html.with_attribute(once "class", once "source_alias")
               html.open_typeset
               html.put_character('"')
               html.put_string(extern.alias_string.to_string)
               html.put_character('"')
               html.close_typeset
               html.put_break
            end
         end
         if visited.rescue_compound /= Void then
            visited.rescue_compound.accept(Current)
            html.put_break
         end
         if visited.ensure_assertion /= Void then
            visited.ensure_assertion.accept(Current)
            html.put_break
         end
         if not visited.is_attribute then
            indent_line
            put_keyword(once "end")
         end
         indent_less
         html.put_break
      end

feature {}
   enter_require_assertion (visited: REQUIRE_ASSERTION): BOOLEAN
      do
         Result := True
         indent_line
         put_keyword(once "require")
         if visited.is_require_else then
            html.put_character(' ')
            put_keyword(once "else")
         end
         indent_more
      end

   exit_require_assertion (visited: REQUIRE_ASSERTION)
      do
         indent_less
      end

feature {}
   enter_ensure_assertion (visited: ENSURE_ASSERTION): BOOLEAN
      do
         Result := True
         indent_line
         put_keyword(once "ensure")
         if visited.is_ensure_then then
            html.put_character(' ')
            put_keyword(once "then")
         end
         indent_more
      end

   exit_ensure_assertion (visited: ENSURE_ASSERTION)
      do
         indent_less
      end

feature {}
   indent_amount: INTEGER

   indent_comment (line: STRING)
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > indent_amount
         loop
            html.put_string(once "   ")
            i := i + 1
         end
         html.put_string(once "-- ")
         html.put_string(line)
      end

   indent_line
      local
         i: INTEGER
      do
         html.with_attribute(once "class", once "source_indent")
         html.open_typeset
         from
            i := 1
         until
            i > indent_amount
         loop
            html.put_entity(once "nbsp")
            html.put_entity(once "nbsp")
            html.put_entity(once "nbsp")
            i := i + 1
         end
         html.close_typeset
      end

   indent_more
      do
         indent_amount := indent_amount + 1
      end

   indent_less
      do
         indent_amount := indent_amount - 1
      end

feature {}
   put_keyword (keyword: STRING)
      do
         html.with_attribute(once "class", once "source_keyword")
         html.open_bold
         html.put_string(keyword)
         html.close_bold
      end

   put_comment (comment: COMMENT)
      local
         i: INTEGER
         list: ARRAY[STRING]
      do
         html.with_attribute(once "class", once "source_comment")
         html.open_preformatted
         from
            list := comment.list
            i := list.lower
         until
            i > list.upper
         loop
            indent_comment(list.item(i))
            html.put_new_line
            i := i + 1
         end
         html.close_preformatted
      end

feature {}
   options: EIFFELDOC_OPTIONS
   html: EIFFELDOC_OUTPUT_STREAM
   class_text: CLASS_TEXT

   make (a_options: like options)
      require
         a_options /= Void
      do
         options := a_options
      end

end
