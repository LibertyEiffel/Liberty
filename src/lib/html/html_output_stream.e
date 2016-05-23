-- See the Copyright notice at the end of this file.
--
class HTML_OUTPUT_STREAM
   --
   -- Highly tailored filter that outputs well-formed HTML. Be aware that you cannot add any character as you
   -- want. You can filter this stream, but keep it available because it controls the tags.
   --

inherit
   FILTER_OUTPUT_STREAM
      redefine can_put_character, connect_to
      end

create {ANY}
   make, connect_to

feature {ANY} -- CGI extensions: written before the HTML itself is open
   put_cgi_header (key, value: STRING)
      require
         not started
         key /= Void
         value /= Void
      do
         pipe_string(key)
         pipe_string(os_key_colon)
         pipe_string(value)
         pipe_character('%N')
         has_cgi_header := True
      ensure
         has_cgi_header
      end

feature {ANY} -- Main HTML structure
   header
      require
         not started
      do
         if has_cgi_header then
            pipe_character('%N')
            flush
         end
         pipe_string(os_html_header)
         set_state(state_in_header)
      ensure
         in_header
      end

   body
      require
         in_header
      do
         reset_state(state_in_header)
         pipe_string(os_html_body_start)
         pipe_string(attributes)
         pipe_character('>')
         pipe_character('%N')
         attributes.clear_count
         set_state(state_in_body)
      ensure
         in_body
      end

   frames
      require
         in_header
      do
         reset_state(state_in_header)
         set_state(state_in_frames)
      ensure
         in_frames
      end

   close
      require
         in_body or else in_frames
      do
         if in_body then
            pipe_string(os_html_body_footer)
         else
            pipe_string(os_html_frames_footer)
         end
         reset_state(state)
         set_state(state_over)
         flush
      ensure
         finished
      end

feature {ANY}
   last_tag: STRING
      require
         has_open_tag
      do
         Result := tags.last
      ensure
         Result /= Void
      end

   has_open_tag: BOOLEAN
      do
         Result := tags.count > 0
      end

feature {ANY} -- Attributes management
   attributes: STRING
         -- Because there are so many attributes for each tag, we did not want features with scores
         -- of parameters. So, we decided to have a general-purpose `with_attribute' feature to be called
         -- before a tag creation.
         --
         -- Typical use:
         --
         -- html_out.with_attribute(once "width", once "80%%)
         -- html_out.with_attribute(once "align", once "center")
         -- html_out.with_attribute(once "valign", once "top")
         -- html_out.open_table_cell

   with_attribute (name, value: STRING)
         -- Call this feature before adding an opening tag; all the attributes will be added to the tag.
      do
         attributes.extend(' ')
         attributes.append(name)
         if value /= Void then
            attributes.extend('=')
            attributes.extend('%'')
            quote_quotes(value, attributes)
            attributes.extend('%'')
         end
      end

feature {HTML_HANDLER}
   open_tag (tag: STRING)
      do
         pipe_character('<')
         pipe_string(tag)
         pipe_string(attributes)
         pipe_character('>')
         tags.add_last(tag)
         attributes.clear_count
      ensure
         tags.count = old tags.count + 1
         last_tag.same_as(tag)
      end

   open_close_tag (tag: STRING)
      do
         pipe_character('<')
         pipe_string(tag)
         pipe_string(attributes)
         pipe_character('/')
         pipe_character('>')
         attributes.clear_count
      ensure
         tags.count = old tags.count
      end

   close_tag (tag: STRING)
      require
         tags.count > 0
         last_tag.same_as(tag)
      do
         pipe_character('<')
         pipe_character('/')
         pipe_string(tag)
         pipe_character('>')
         tags.remove_last
      ensure
         tags.count = old tags.count - 1
      end

   put_filtered_string (string: STRING)
      do
         pipe_string(string)
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         if in_script then
            pipe_character(c)
         else
            inspect
               c
            when '<' then
               pipe_string(os_entity_lt)
            when '>' then
               pipe_string(os_entity_gt)
            when '&' then
               pipe_string(os_entity_amp)
            else
               pipe_character(c)
            end
         end
      end

   filtered_flush
      do
         stream.filtered_flush
      end

feature {ANY} -- Putting characters
   can_put_character (c: CHARACTER): BOOLEAN
      do
         Result := in_header or else in_script or else in_a_body or else in_a_form or else in_preformatted
      end

   put_entity (entity: STRING)
      require
         started
         not finished
         not entity.has(';')
         not entity.has('&')
         not entity.has('<')
         not entity.has('>')
      do
         pipe_character('&')
         pipe_string(entity)
         pipe_character(';')
      end

   put_comment (comment: STRING)
      do
         pipe_string(os_start_comment)
         pipe_quoted_string(comment)
         pipe_string(os_end_comment)
      end

feature {ANY}
   indent
      require
         started
         not finished
      local
         i: INTEGER
      do
         if not in_preformatted then
            if not last_character_is_new_line then
               pipe_character('%N')
            end
            from
               i := tags.count
            until
               i < 0
            loop
               pipe_character('%T')
               i := i - 1
            end
            last_character_is_new_line := False
         end
      end

feature {ANY} -- Header tags
   put_base (base: STRING)
      require
         in_header
      do
         indent
         pipe_string(os_base)
         pipe_quoted_string(base)
         pipe_string(os_end_open_close_tag_attrib)
         pipe_character('%N')
      end

   put_meta (equiv, content: STRING)
      require
         in_header
      do
         indent
         pipe_string(os_meta_equiv)
         pipe_quoted_string(equiv)
         if content /= Void then
            pipe_string(os_attrib_content)
            pipe_quoted_string(content)
         end
         pipe_string(os_end_open_close_tag_attrib)
         pipe_character('%N')
      end

   put_stylesheet (ref: STRING)
      require
         in_header
      do
         indent
         pipe_string(os_stylesheet)
         pipe_quoted_string(ref)
         pipe_string(os_end_open_close_tag_attrib)
         pipe_character('%N')
      end

   put_javascript (ref: STRING)
      require
         in_header
         ref /= Void
      do
         indent
         pipe_string(os_script_begin)
         pipe_string(os_javascript)
         pipe_string(os_attrib_type)
         pipe_quoted_string(os_text_javascript)
         pipe_string(os_attrib_src)
         pipe_quoted_string(ref)
         pipe_string(os_script_end)
         pipe_character('%N')
      end

   open_title
      require
         in_header
      do
         indent
         open_tag(os_title)
      end

   close_title
      require
         in_header
         last_tag.same_as(os_title)
      do
         close_tag(os_title)
      end

   put_script (language, source: STRING)
      require
         in_header
         language /= Void
         source /= Void
      do
         indent
         pipe_string(os_script_begin)
         pipe_string(language)
         pipe_string(os_attrib_src)
         pipe_quoted_string(source)
         pipe_string(os_script_end)
         pipe_character('%N')
      end

   open_script (language: STRING)
      require
         in_header
         language /= Void
      do
         indent
         with_attribute(os_language, language)
         open_tag(os_script)
         set_state(state_in_script)
      end

   close_script
      require
         in_script
         last_tag.same_as(os_script)
      do
         close_tag(os_script)
         reset_state(state_in_script)
      end

feature {ANY} -- Frames
   open_frameset
      require
         in_frames or else in_frameset
      do
         indent
         open_tag(os_frameset)
         set_state(state_in_frameset)
      ensure
         in_frameset
      end

   close_frameset
      require
         in_frameset
      do
         close_tag(os_frameset)
         reset_state(state_in_frameset)
      ensure
         in_frames or else in_frameset
      end

   put_frame (src, name: STRING)
      require
         in_frameset
         src /= Void
      do
         indent
         with_attribute(os_src, src)
         if name /= Void then
            with_attribute(os_name, name)
         end
         open_close_tag(os_frame)
      ensure
         in_frameset
      end

   open_noframes
      require
         in_frames
      do
         indent
         open_tag(os_noframes)
         set_state(state_in_noframes)
      ensure
         in_noframes
      end

   close_noframes
      require
         in_noframes
      do
         close_tag(os_noframes)
         reset_state(state_in_noframes)
      ensure
         in_frames
      end

feature {ANY} -- Body tags
   open_section
      require
         in_a_body
      do
         indent
         open_tag(os_h1)
      end

   close_section
      require
         in_a_body
         last_tag.same_as(os_h1)
      do
         close_tag(os_h1)
      end

   open_subsection
      require
         in_a_body
      do
         indent
         open_tag(os_h2)
      end

   close_subsection
      require
         in_a_body
         last_tag.same_as(os_h2)
      do
         close_tag(os_h2)
      end

   open_subsubsection
      require
         in_a_body
      do
         indent
         open_tag(os_h3)
      end

   close_subsubsection
      require
         in_a_body
         last_tag.same_as(os_h3)
      do
         close_tag(os_h3)
      end

   put_break
      require
         in_a_body
      do
         open_close_tag(os_br)
      end

   put_horizontal_rule
      require
         in_a_body
      do
         open_close_tag(os_hr)
      end

   put_image (source: STRING)
      require
         in_a_body
         source /= Void
      do
         with_attribute(os_src, source)
         open_close_tag(os_img)
      end

   open_bold
      require
         in_a_body or in_preformatted
      do
         open_tag(os_b)
      end

   close_bold
      require
         in_a_body or in_preformatted
         last_tag.same_as(os_b)
      do
         close_tag(os_b)
      end

   open_font (size: STRING)
      require
         in_a_body or in_preformatted
      do
         if size /= Void then
            with_attribute(os_size, size)
         end
         open_tag(os_font)
      end

   close_font
      require
         in_a_body or in_preformatted
         last_tag.same_as(os_font)
      do
         close_tag(os_font)
      end

   open_italics
      require
         in_a_body or in_preformatted
      do
         open_tag(os_i)
      end

   close_italics
      require
         in_a_body or in_preformatted
         last_tag.same_as(os_i)
      do
         close_tag(os_i)
      end

   open_underlined
      require
         in_a_body or in_preformatted
      do
         open_tag(os_u)
      end

   close_underlined
      require
         in_a_body or in_preformatted
         last_tag.same_as(os_u)
      do
         close_tag(os_u)
      end

   open_typeset
      require
         in_a_body or in_preformatted
      do
         open_tag(os_tt)
      end

   close_typeset
      require
         in_a_body or in_preformatted
         last_tag.same_as(os_tt)
      do
         close_tag(os_tt)
      end

   open_anchor_address (ref, target: STRING)
      require
         in_a_body or in_preformatted
         ref /= Void
      do
         with_attribute(os_href, ref)
         if target /= Void then
            with_attribute(os_target, target)
         end
         open_tag(os_a)
      end

   open_anchor_name (ref: STRING)
      require
         in_a_body or in_preformatted
         ref /= Void
      do
         with_attribute(os_name, ref)
         open_tag(os_a)
      end

   open_anchor
      require
         in_a_body or in_preformatted
      do
         open_tag(os_a)
      end

   close_anchor
      require
         in_a_body or in_preformatted
         last_tag.same_as(os_a)
      do
         close_tag(os_a)
      end

   open_list
      require
         in_a_body
      do
         indent
         open_tag(os_ul)
         set_state(state_in_list)
      ensure
         in_list
      end

   open_numbered_list
      require
         in_a_body
      do
         indent
         open_tag(os_ol)
         set_state(state_in_list)
      ensure
         in_list
      end

   close_list
      require
         in_list
         last_tag.same_as(os_ul) or else last_tag.same_as(os_ol)
      do
         close_tag(last_tag)
         reset_state(state_in_list)
      ensure
         in_a_body
      end

   open_definition_list
      require
         in_a_body
      do
         indent
         open_tag(os_dl)
         set_state(state_in_definition_list)
      ensure
         in_definition_list
      end

   close_definition_list
      require
         in_definition_list
      do
         indent
         close_tag(os_dl)
         reset_state(state_in_definition_list)
      ensure
         in_a_body
      end

   open_definition_term
      require
         in_definition_list
      do
         indent
         open_tag(os_dt)
         set_state(state_in_definition_term)
      ensure
         in_definition_term
      end

   close_definition_term
      require
         in_definition_term
      do
         indent
         close_tag(os_dt)
         reset_state(state_in_definition_term)
      ensure
         in_definition_list
      end

   open_definition_description
      require
         in_definition_list
      do
         indent
         open_tag(os_dd)
         set_state(state_in_definition_description)
      ensure
         in_definition_description
      end

   close_definition_description
      require
         in_definition_description
      do
         indent
         close_tag(os_dd)
         reset_state(state_in_definition_description)
      ensure
         in_definition_list
      end

   open_list_item
      require
         in_list
      do
         indent
         open_tag(os_li)
         set_state(state_in_list_item)
      ensure
         in_list_item
      end

   close_list_item
      require
         in_list_item
         last_tag.same_as(os_li)
      do
         close_tag(os_li)
         reset_state(state_in_list_item)
      ensure
         in_list
      end

   open_table
      require
         in_a_body
      do
         indent
         open_tag(os_table)
         set_state(state_in_table)
      ensure
         in_table
      end

   close_table
      require
         in_table
         last_tag.same_as(os_table)
      do
         close_tag(os_table)
         reset_state(state_in_table)
      ensure
         in_a_body
      end

   open_table_row
      require
         in_table
      do
         indent
         open_tag(os_tr)
         set_state(state_in_table_row)
      ensure
         in_table_row
      end

   close_table_row
      require
         in_table_row
         last_tag.same_as(os_tr)
      do
         close_tag(os_tr)
         reset_state(state_in_table_row)
      ensure
         in_table
      end

   open_table_cell
      require
         in_table_row
      do
         indent
         open_tag(os_td)
         set_state(state_in_table_cell)
      ensure
         in_table_cell
      end

   close_table_cell
      require
         in_table_cell
         last_tag.same_as(os_td)
      do
         close_tag(os_td)
         reset_state(state_in_table_cell)
      ensure
         in_table_row
      end

feature {ANY} -- Forms
   open_form (name, method, action: STRING)
      require
         in_a_body
         name /= Void
         action /= Void
         method.same_as(os_method_get) or else method.same_as(os_method_post)
      do
         indent
         with_attribute(os_method, method)
         with_attribute(os_action, action)
         open_tag(os_form)
         set_state(state_in_form)
      ensure
         in_form
      end

   close_form
      require
         in_form
         last_tag.same_as(os_form)
      do
         close_tag(os_form)
         reset_state(state_in_form)
      end

   open_text_area (name: STRING; rows, cols: INTEGER)
      require
         in_a_form
         name /= Void
         rows > 0
         cols > 0
      do
         indent
         with_attribute(os_name, name)
         os.clear_count
         rows.append_in(os)
         with_attribute(os_rows, os)
         os.clear_count
         cols.append_in(os)
         with_attribute(os_cols, os)
         open_tag(os_textarea)
         set_state(state_in_text_area)
      ensure
         in_text_area
      end

   close_text_area
      require
         in_text_area
      do
         check
            last_tag.same_as(os_textarea)
         end
         close_tag(os_textarea)
         reset_state(state_in_text_area)
      end

   put_button (name, title: STRING)
      require
         in_a_form
         name /= Void
      do
         put_input(os_button, name, title, False)
      end

   put_validate_button (name, title: STRING)
      require
         in_a_form
         name /= Void
      do
         put_input(os_submit, name, title, False)
      end

   put_reset_button (name, title: STRING)
      require
         in_a_form
         name /= Void
      do
         put_input(os_reset, name, title, False)
      end

   put_hidden_field (name, value: STRING)
      require
         in_a_form
         name /= Void
      do
         put_input(os_hidden, name, value, False)
      end

   put_text_field (name, value: STRING)
      require
         in_a_form
         name /= Void
      do
         put_input(os_text, name, value, False)
      end

   put_password_field (name, value: STRING)
      require
         in_a_form
         name /= Void
      do
         put_input(os_password, name, value, False)
      end

   put_radio_button (name, value: STRING; checked: BOOLEAN)
      require
         in_a_form
         name /= Void
         value /= Void
      do
         put_input(os_radio, name, value, checked)
      end

   put_check_box (name, value: STRING; checked: BOOLEAN)
      require
         in_a_form
         name /= Void
         value /= Void
      do
         put_input(os_checkbox, name, value, checked)
      end

   open_combo_select (name: STRING)
      require
         in_a_form
         name /= Void
      do
         indent
         with_attribute(os_name, name)
         open_tag(os_select)
         set_state(state_in_select)
      ensure
         in_select
      end

   open_multiple_select (name: STRING; size: INTEGER)
      require
         in_a_form
         name /= Void
         size > 0
      local
         siz: STRING
      do
         indent
         with_attribute(os_name, name)
         os.clear_count
         size.append_in(os)
         with_attribute(os_size, os)
         with_attribute(os_multiple, Void)
         open_tag(os_select)
         set_state(state_in_select)
      ensure
         in_select
      end

   close_select
      require
         in_select
         last_tag.same_as(os_select)
      do
         close_tag(os_select)
         reset_state(state_in_select)
      ensure
         in_a_form
      end

   open_option (value: STRING)
      require
         in_select
      local
         param: STRING
      do
         indent
         with_attribute(os_value, value)
         open_tag(os_option)
         set_state(state_in_option)
      ensure
         in_option
      end

   close_option
      require
         in_option
         last_tag.same_as(os_option)
      do
         close_tag(os_option)
         reset_state(state_in_option)
      ensure
         in_select
      end

   open_paragraph
      require
         in_a_body
      do
         indent
         open_tag(os_paragraph)
         set_state(state_in_paragraph)
      ensure
         in_paragraph
      end

   close_paragraph
      require
         in_paragraph
      do
         close_tag(os_paragraph)
         reset_state(state_in_paragraph)
      ensure
         in_a_body
      end

   open_preformatted
      require
         in_a_body
      do
         indent
         open_tag(os_pre)
         set_state(state_in_pre)
      ensure
         in_preformatted
      end

   close_preformatted
      require
         in_preformatted
         last_tag.same_as(os_pre)
      do
         close_tag(os_pre)
         reset_state(state_in_pre)
      end

   open_blockquote
      require
         in_a_body
      do
         indent
         open_tag(os_blockquote)
         set_state(state_in_blockquote)
      ensure
         in_blockquote
      end

   close_blockquote
      require
         in_blockquote
      do
         close_tag(os_blockquote)
         reset_state(state_in_blockquote)
      ensure
         in_a_body
      end

   open_div
      require
         in_a_body
      do
         indent
         open_tag(os_div)
         set_state(state_in_div)
      ensure
         in_div
      end

   close_div
      require
         in_div
      do
         close_tag(os_div)
         reset_state(state_in_div)
      ensure
         in_a_body
      end

   open_span
      require
         in_a_body
      do
         indent
         open_tag(os_span)
         set_state(state_in_span)
      ensure
         in_span
      end

   close_span
      require
         in_span
      do
         close_tag(os_span)
         reset_state(state_in_span)
      ensure
         in_a_body
      end

feature {}
   put_input (type, name, value: STRING; checked: BOOLEAN)
      do
         indent
         with_attribute(os_type, type)
         with_attribute(os_name, name)
         if value /= Void then
            with_attribute(os_value, value)
         end
         if checked then
            with_attribute(os_checked, Void)
         end
         open_close_tag(os_input)
      end

feature {ANY} -- State queries
   started: BOOLEAN
      do
         Result := state /= state_closed
      end

   finished: BOOLEAN
      do
         Result := state = state_over
      end

   in_header: BOOLEAN
      do
         Result := state = state_in_header
      end

   in_script: BOOLEAN
      do
         Result := state = state_in_script
      end

   in_body: BOOLEAN
      do
         Result := state = state_in_body
      end

   in_list: BOOLEAN
      do
         Result := state = state_in_list
      end

   in_list_item: BOOLEAN
      do
         Result := state = state_in_list_item
      end

   in_table: BOOLEAN
      do
         Result := state = state_in_table
      end

   in_table_row: BOOLEAN
      do
         Result := state = state_in_table_row
      end

   in_table_cell: BOOLEAN
      do
         Result := state = state_in_table_cell
      end

   in_form: BOOLEAN
      do
         Result := state = state_in_form
      end

   in_select: BOOLEAN
      do
         Result := state = state_in_select
      end

   in_option: BOOLEAN
      do
         Result := state = state_in_option
      end

   in_frames: BOOLEAN
      do
         Result := state = state_in_frames
      end

   in_frameset: BOOLEAN
      do
         Result := state = state_in_frameset
      end

   in_noframes: BOOLEAN
      do
         Result := state = state_in_noframes
      end

   in_a_body: BOOLEAN
      do
         Result := in_body or else in_list_item or else in_table_cell or else in_form or else in_noframes or else in_paragraph or else in_blockquote or else in_div or else in_span or else in_definition_term or else in_definition_description
      end

   in_a_form: BOOLEAN
      do
         Result := in_form or else in_option or else (in_a_body and then states.fast_has(state_in_form))
      end

   in_text_area: BOOLEAN
      do
         Result := state = state_in_text_area
      end

   in_paragraph: BOOLEAN
      do
         Result := state = state_in_paragraph
      end

   in_blockquote: BOOLEAN
      do
         Result := state = state_in_blockquote
      end

   in_div: BOOLEAN
      do
         Result := state = state_in_div
      end

   in_preformatted: BOOLEAN
      do
         Result := state = state_in_pre
      end

   in_span: BOOLEAN
      do
         Result := state = state_in_span
      end

   in_definition_list: BOOLEAN
      do
         Result := state = state_in_definition_list
      end

   in_definition_description: BOOLEAN
      do
         Result := state = state_in_definition_description
      end

   in_definition_term: BOOLEAN
      do
         Result := state = state_in_definition_term
      end

feature {} -- States
   state: INTEGER
      do
         Result := states.last
      end

   set_state (a_state: like state)
      do
         states.add_last(a_state)
      ensure
         states.count = old states.count + 1
      end

   reset_state (a_state: like state)
      require
         state = a_state
      do
         states.remove_last
      ensure
         states.count = old states.count - 1
      end

   state_closed: INTEGER 0

   state_in_header: INTEGER 10

   state_in_script: INTEGER 11

   state_in_body: INTEGER 20

   state_in_list: INTEGER 21

   state_in_list_item: INTEGER 22

   state_in_table: INTEGER 23

   state_in_table_row: INTEGER 24

   state_in_table_cell: INTEGER 25

   state_in_text_area: INTEGER 26

   state_in_paragraph: INTEGER 27

   state_in_blockquote: INTEGER 28

   state_in_div: INTEGER 29

   state_in_pre: INTEGER 30

   state_in_form: INTEGER 40

   state_in_select: INTEGER 41

   state_in_option: INTEGER 42

   state_in_frames: INTEGER 50

   state_in_frameset: INTEGER 51

   state_in_noframes: INTEGER 52

   state_in_span: INTEGER 53

   state_in_definition_list: INTEGER 60

   state_in_definition_description: INTEGER 61

   state_in_definition_term: INTEGER 62

   state_over: INTEGER 99

feature {} -- Send to the underlying stream
   pipe_character (c: CHARACTER)
         -- Put the character down the pipe.
      do
         stream.filtered_put_character(c)
         last_character_is_new_line := c = '%N'
      end

   pipe_string (s: STRING)
         -- Put the whole string down the pipe.
      local
         i: INTEGER
      do
         from
            i := s.lower
         until
            i > s.upper
         loop
            pipe_character(s.item(i))
            i := i + 1
         end
      end

   pipe_quoted_string (quoted: STRING)
      do
         os.clear_count
         quote_quotes(quoted, os)
         pipe_string(os)
      end

feature {}
   quote_quotes (quoted, in: STRING)
         -- Internal transformation in tag attributes
      local
         i: INTEGER; c: CHARACTER
      do
         from
            i := quoted.lower
         until
            i > quoted.upper
         loop
            c := quoted.item(i)
            inspect
               c
            when '%'' then
               in.append(os_entity_quot)
            when '<' then
               in.append(os_entity_lt)
            when '>' then
               in.append(os_entity_gt)
            when '&' then
               in.append(os_entity_amp)
            else
               in.extend(c)
            end
            i := i + 1
         end
      end

feature {ANY}
   make
      do
      end

   connect_to (a_stream: like stream)
      do
         Precursor(a_stream)
         if attributes = Void then
            create tags.with_capacity(16)
            create states.with_capacity(16)
            attributes := ""
         else
            tags.clear_count
            states.clear_count
            attributes.clear_count
         end
         check
            tags.count = 0
            states.count = 0
            attributes.count = 0
         end
         set_state(state_closed)
      end

feature {}
   local_can_disconnect: BOOLEAN
      do
         Result := finished
      end

   tags: FAST_ARRAY[STRING]

   states: FAST_ARRAY[INTEGER]

   has_cgi_header: BOOLEAN -- are there any CGI headers before the HTML itself is inserted?

   last_character_is_new_line: BOOLEAN -- True if the last put character was a '%N'

feature {} -- Once strings
   os_key_colon: STRING ": "

   os_html_header: STRING "<!doctype html public %"-//w3c//dtd xhtml 1.0 transitional//en%" %"dtd/xhtml1-transitional.dtd%">%N<html>%N<head>%N"

   os_html_body_start: STRING "</head>%N<body"

   os_html_body_footer: STRING "</body>%N</html>%N"

   os_html_frames_footer: STRING "</html>%N"

   os_start_comment: STRING "<!-- "

   os_end_comment: STRING " -->"

   os_entity_quot: STRING "&quot;"

   os_entity_lt: STRING "&lt;"

   os_entity_gt: STRING "&gt;"

   os_entity_amp: STRING "&amp;"

   os_base: STRING "<base href='"

   os_end_open_close_tag_attrib: STRING "'/>"

   os_meta_equiv: STRING "<meta http-equiv='"

   os_attrib_content: STRING "' content='"

   os_attrib_type: STRING "' type='"

   os_stylesheet: STRING "<link rel='StyleSheet' type='text/css' href='"

   os_text_javascript: STRING "text/javascript"

   os_title: STRING "title"

   os_script_begin: STRING "<script language='"

   os_attrib_src: STRING "' src='"

   os_script_end: STRING "'></script>"

   os_language: STRING "language"

   os_javascript: STRING "javascript"

   os_script: STRING "script"

   os_h1: STRING "h1"

   os_h2: STRING "h2"

   os_h3: STRING "h3"

   os_br: STRING "br"

   os_hr: STRING "hr"

   os_img: STRING "img"

   os_src: STRING "src"

   os_b: STRING "b"

   os_i: STRING "i"

   os_u: STRING "u"

   os_tt: STRING "tt"

   os_size: STRING "size"

   os_font: STRING "font"

   os_pre: STRING "pre"

   os_href: STRING "href"

   os_target: STRING "target"

   os_name: STRING "name"

   os_a: STRING "a"

   os_ul: STRING "ul"

   os_dt: STRING "dt"

   os_dd: STRING "dd"

   os_dl: STRING "dl"

   os_ol: STRING "ol"

   os_li: STRING "li"

   os_table: STRING "table"

   os_tr: STRING "tr"

   os_td: STRING "td"

   os_method_get: STRING "GET"

   os_method_post: STRING "POST"

   os_method: STRING "method"

   os_action: STRING "action"

   os_form: STRING "form"

   os_rows: STRING "rows"

   os_cols: STRING "cols"

   os_textarea: STRING "textarea"

   os_submit: STRING "submit"

   os_button: STRING "button"

   os_reset: STRING "reset"

   os_hidden: STRING "hidden"

   os_password: STRING "password"

   os_text: STRING "text"

   os_radio: STRING "radio"

   os_checkbox: STRING "checkbox"

   os_select: STRING "select"

   os_multiple: STRING "multiple"

   os_value: STRING "value"

   os_option: STRING "option"

   os_type: STRING "type"

   os_checked: STRING "checked"

   os_input: STRING "input"

   os_frameset: STRING "frameset"

   os_frame: STRING "frame"

   os_noframes: STRING "noframes"

   os_paragraph: STRING "p"

   os_blockquote: STRING "blockquote"

   os_div: STRING "div"

   os_span: STRING "span"

   os: STRING ""
         -- used as a buffer

end -- class HTML_OUTPUT_STREAM
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
