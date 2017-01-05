-- See the Copyright notice at the end of this file.
--
class XML_DTD_PARSER
   --
   -- Parses a validation instruction in an XML file:
   --  <!DOCTYPE . . .>
   --

insert
   XML_PARSER_TOOLS
      redefine
         next, current_character, end_of_input
      end
   XML_DTD_MEMORY
   SINGLETON
      undefine
         is_equal
      end
   URL_VALIDITY

create {XML_PARSER}
   make

feature {XML_PARSER} -- Error reporting
   has_error: BOOLEAN
      do
         Result := error /= Void
      end

   error_message: STRING
      require
         has_error
      do
         Result := once ""
         Result.copy(error)
      end

feature {XML_PARSER}
   parse (a_buffer: like buffer): XML_DTD_VALIDATOR
      require
         a_buffer /= Void
      local
         id: UNICODE_STRING; sid: STRING; u: URL
      do
         error := Void
         set_buffer(a_buffer)
         skip_blanks
         if end_of_input then
            set_error(Error_end_of_file)
         else
            id := read_identifier
            if end_of_input then
               set_error(Error_end_of_file)
            else
               Result := new_dtd_validator(id.twin)
               skip_blanks
               sid := read_identifier_as_string
               skip_blanks
               if sid /= Void then
                  inspect
                     sid
                  when "SYSTEM" then
                     u := parse_system_dtd(Result)
                     if not has_error then
                        -- the inline DTD takes precedence over the external one
                        parse_inline_dtd(Result)
                        if not has_error then
                           parse_external_dtd(Result, u)
                        else
                           u.disconnect
                           url_pool.recycle(u)
                        end
                     end
                  when "PUBLIC" then
                     u := parse_public_dtd(Result)
                     if not has_error then
                        -- the inline DTD takes precedence over the external one
                        parse_inline_dtd(Result)
                        if not has_error then
                           parse_external_dtd(Result, u)
                        else
                           u.disconnect
                           url_pool.recycle(u)
                        end
                     end
                  else
                     set_error(once "Unknown dtd location")
                  end
               else
                  parse_inline_dtd(Result)
               end
            end
         end
      end

feature {}
   urls: FAST_ARRAY[URL]
   buffers: FAST_ARRAY[UNICODE_PARSER_BUFFER]

   set_buffer (a_buffer: UNICODE_PARSER_BUFFER)
      do
         if urls = Void then
            create urls.make(0)
            create buffers.make(0)
         end
         urls.add_last(a_buffer.url)
         buffers.add_last(a_buffer)
      end

   set_url (a_url: URL)
      local
         u: URL; b: UNICODE_PARSER_BUFFER
      do
         if urls = Void then
            create urls.make(0)
            create buffers.make(0)
         end
         if a_url /= Void then
            urls.add_last(a_url)
            if buffer_pool.is_empty then
               create b.connect_to(a_url, Void)
            else
               b := buffer_pool.item
               b.connect_to(a_url, Void)
            end
            buffers.add_last(b)
         else
            u := urls.last
            urls.remove_last
            b := buffers.last
            buffers.remove_last
            buffer_pool.recycle(b)
            if not urls.is_empty then
               -- an internal URL, not given by outside-- recycle it.
               if u.is_connected then
                  u.disconnect
               end
               url_pool.recycle(u)
            end
         end
      end

   url: URL
      do
         if urls /= Void then
            Result := urls.last
         end
      end

   buffer: UNICODE_PARSER_BUFFER
      do
         if buffers /= Void then
            Result := buffers.last
         end
      end

   relative_url (a_url: STRING): URL
      require
         not a_url.is_empty
      local
         u: URL
      do
         if valid_url(a_url) then
            if url_pool.is_empty then
               create Result.absolute(a_url)
            else
               Result := url_pool.item
               Result.absolute(a_url)
            end
         else
            u := url
            if url_pool.is_empty then
               create Result.relative(u, a_url)
            else
               Result := url_pool.item
               Result.relative(u, a_url)
            end
         end
         Result.read_only
      end

   parse_system_dtd (validator: XML_DTD_VALIDATOR): URL
      local
         path, err: STRING
      do
         path := read_string_as_string
         skip_blanks
         if path /= Void then
            Result := relative_url(path)
            if not Result.is_connected and then Result.can_connect then
               Result.connect
            end
            if not Result.is_connected then
               url_pool.recycle(Result)
               Result := Void
               err := once ""
               err.copy(once "Unable to retrieve system DTD (")
               err.append(path)
               err.extend(')')
               set_error(err)
            end
         else
            set_error(once "Bad system specification")
         end
      ensure
         not has_error implies Result.is_connected
         has_error implies Result = Void
      end

   parse_public_dtd (validator: XML_DTD_VALIDATOR): URL
      local
         p, pubid: UNICODE_STRING; dtd_url, err: STRING; u: URL; repo: XML_DTD_PUBLIC_REPOSITORY
      do
         p := read_string
         if p /= Void then
            pubid := once U""
            pubid.copy(p)
            skip_blanks
            dtd_url := read_string_as_string
            skip_blanks
            if dtd_url /= Void then
               u := relative_url(dtd_url)
               Result := repo.public_dtd(pubid, u)
               if Result /= Void then
                  if not Result.is_connected and then Result.can_connect then
                     Result.connect
                  end
               end
               if Result = Void or else not Result.is_connected then
                  url_pool.recycle(u)
                  Result := Void
                  err := once ""
                  err.copy(once "Unable to retrieve public DTD (")
                  err.append(dtd_url)
                  err.append(once "): ")
                  err.append(repo.last_error)
                  set_error(err)
               end
            else
               set_error(once "Bad public specification")
            end
         else
            set_error(once "Bad public specification")
         end
      ensure
         not has_error implies Result.is_connected
         has_error implies Result = Void
      end

   parse_external_dtd (validator: XML_DTD_VALIDATOR; a_url: URL)
      require
         a_url.is_connected
         not has_error
      do
         set_url(a_url)
         skip_blanks
         if skip2('<', '?') then
            skip_blanks
            if skip_word(once "xml") then
               parse_xml_header
            else
               set_error(once "Bad processing instruction")
            end
         end
         if not has_error then
            parse_dtd(validator, True)
         end
         set_url(Void)
      ensure
         url = old url
         buffer = old buffer
         buffer.line = old buffer.line
         buffer.column = old buffer.column
         buffer.index = old buffer.index
      end

   parse_inline_dtd (validator: XML_DTD_VALIDATOR)
      do
         skip_blanks
         if skip('[') then
            parse_dtd(validator, False)
         elseif skip('>') then
            -- OK
         else
            set_error(once "'[' or '>' expected")
         end
      end

   parse_dtd (validator: XML_DTD_VALIDATOR; standalone: BOOLEAN)
      local
         done: BOOLEAN; id: STRING
      do
         from
         until
            done or else has_error
         loop
            skip_blanks
            if skip2('<', '!') then
               if end_of_input then
                  set_error(Error_end_of_file)
               elseif skip_word(once "--") then
                  in_comment := True
                  skip_comment
                  in_comment := False
               else
                  id := read_identifier_as_string
                  if id = Void then
                     set_error(once "ELEMENT/ATTLIST/ENTITY expected")
                  else
                     inspect
                        id
                     when "ELEMENT" then
                        skip_blanks
                        parse_element(validator)
                     when "ATTLIST" then
                        skip_blanks
                        parse_attlist(validator)
                     when "ENTITY" then
                        skip_blanks
                        parse_entity(validator)
                     else
                        set_error(once "ELEMENT/ATTLIST/ENTITY expected")
                     end
                     if not has_error then
                        skip_blanks
                        if not skip('>') then
                           set_error(once "Missing '>'")
                        else
                           skip_blanks
                           if standalone then
                              done := end_of_input
                           else
                              if end_of_input then
                                 set_error(Error_end_of_file)
                              end
                           end
                        end
                     end
                  end
               end
            elseif standalone then
               set_error(once "Unexpected characters")
            elseif skip2(']', '>') then
               done := True
            else
               set_error(once "']>' expected")
            end
         end
         if not has_error then
            validator.parse_done
         end
      end

   parse_xml_header
      local
         done: BOOLEAN
      do
         from
         until
            done
         loop
            skip_blanks
            if skip('?') then
               if not skip('>') then
                  set_error(once "Missing '>'")
               end
               done := True
            elseif not parse_attribute and then not has_error then
               skip_blanks
               if not skip2('?', '>') then
                  set_error(once "Bad XML header")
               end
               done := True
            else
               -- just parsed an attribute... go on
               check
                  not done
               end
            end
         end
      end

   parse_attribute: BOOLEAN
         -- an attribute in the XML header
      local
         a, an_attribute, value: STRING
      do
         skip_blanks
         a := read_identifier_as_string
         if a = Void then
            check not Result end
         else
            skip_blanks
            if not skip('=') then
               set_error(once "Missing '='")
               check not Result end
            else
               skip_blanks
               an_attribute := once ""
               an_attribute.copy(a)
               value := read_string_as_string
               if value = Void then
                  set_error(once "Value expected")
                  check not Result end
               else
                  inspect
                     an_attribute
                  when "encoding" then
                     buffer.set_encoding(value)
                  else
                  end
                  Result := True
               end
            end
         end
      end

   skip_comment
      local
         state: INTEGER
      do
         from
         until
            state < 0
         loop
            if end_of_input then
               set_error(Error_end_of_file)
               state := -1
            else
               inspect
                  state
               when 0 then
                  if current_character = '-'.code then
                     state := 1
                  end
                  next
               when 1 then
                  if current_character = '-'.code then
                     state := 2
                  else
                     state := 0
                  end
                  next
               when 2 then
                  if current_character = '>'.code then
                     state := -1
                  else
                     state := 0
                  end
                  next
               end
            end
         end
      end

   parse_element (validator: XML_DTD_VALIDATOR)
      local
         node: UNICODE_STRING
      do
         node := once U""
         node.copy(read_identifier)
         skip_blanks
         if validator.element_built(node) then
            set_error(once "Could not build element")
         else
            node := node.twin -- keep it
            validator.add_element(node)
            parse_element_children(validator)
            if not has_error then
               validator.commit_element(node)
            end
         end
      end

   parse_element_children (validator: XML_DTD_VALIDATOR)
      do
         parse_element_child(validator)
         if not has_error then
            validator.close_fix
         end
      end

   parse_element_child_list (validator: XML_DTD_VALIDATOR)
      local
         done: BOOLEAN
      do
         from
            parse_element_child_alt(validator)
         until
            done
         loop
            skip_blanks
            if skip(',') then
               parse_element_child_alt(validator)
               validator.add_list
            else
               done := True
            end
         end
      end

   parse_element_child_alt (validator: XML_DTD_VALIDATOR)
      local
         done: BOOLEAN
      do
         from
            parse_element_child(validator)
         until
            done
         loop
            skip_blanks
            if skip('|') then
               parse_element_child(validator)
               validator.add_alt
            else
               done := True
            end
         end
      end

   parse_element_child (validator: XML_DTD_VALIDATOR)
      local
         node: UNICODE_STRING
      do
         skip_blanks
         inspect
            current_character
         when 40 then -- '('
            next
            parse_element_child_list(validator)
            skip_blanks
            if not skip(')') then
               breakpoint
               set_error(once "Expected ')'")
            else
               skip_blanks
               inspect
                  current_character
               when 43 then -- '+'
                  next
                  validator.close_one_or_more
               when 42 then -- '*'
                  next
                  validator.close_zero_or_more
               when 63 then -- '?'
                  next
                  validator.close_zero_or_one
               else
                  validator.close_exactly_one
               end
            end
         when 35 then -- '#'
            next
            if skip_word(once "PCDATA") then
               validator.child_pcdata
            else
               set_error(once "Expected %"#PCDATA%"")
            end
         else
            node := read_identifier
            if node.is_equal(once U"ANY") then
               validator.child_any
            elseif node.is_equal(once U"EMPTY") then
               validator.child_empty
            else
               skip_blanks
               inspect
                  current_character
               when 43 then -- '+'
                  next
                  validator.child_one_or_more(node)
               when 42 then -- '*'
                  next
                  validator.child_zero_or_more(node)
               when 63 then -- '?'
                  next
                  validator.child_zero_or_one(node)
               else
                  validator.child_exactly_one(node)
               end
            end
         end
      end

   parse_attlist (validator: XML_DTD_VALIDATOR)
      local
         n, node, att, id: UNICODE_STRING; sid: STRING; done: BOOLEAN
      do
         n := read_identifier
         if n = Void then
            set_error(once "Identifier expected")
         else
            node := once U""
            node.copy(n)
            if not validator.element_built(node) then
               set_error(once "Please define ELEMENT before ATTLIST")
            elseif end_of_input then
               set_error(Error_end_of_file)
            else
               skip_blanks
               n := read_identifier
               from
               until
                  n = Void or else has_error
               loop
                  att := n.twin
                  skip_blanks
                  if end_of_input then
                     set_error(Error_end_of_file)
                  else
                     validator.add_attlist(node, att)
                     if skip('(') then
                        from
                           skip_blanks
                           done := False
                        until
                           done or else has_error
                        loop
                           if end_of_input then
                              set_error(Error_end_of_file)
                           else
                              id := read_identifier
                              skip_blanks
                              validator.addlist_list_value(id.twin)
                              inspect
                                 current_character
                              when 41 then -- ')'
                                 next
                                 done := True
                              when 124 then -- '|'
                                 next
                              else
                                 set_error(once "')' or '|' expected")
                              end
                              skip_blanks
                           end
                        end
                     else
                        sid := read_identifier_as_string
                        skip_blanks
                        inspect
                           sid
                        when "CDATA" then
                           validator.attlist_cdata
                        when "ID" then
                           validator.attlist_id
                        when "IDREF" then
                           validator.attlist_idref
                        when "IDREFS" then
                           validator.attlist_idrefs
                        when "NMTOKEN" then
                           validator.attlist_nmtoken
                        when "NMTOKENS" then
                           validator.attlist_nmtokens
                        when "ENTITY" then
                           validator.attlist_entity
                        when "ENTITIES" then
                           validator.attlist_entities
                        when "NOTATION" then
                           validator.attlist_notation
                        when "xml" then
                           if skip(':') then
                              not_yet_implemented
                           else
                              set_error(once "':' expected")
                           end
                        else
                           set_error(once "Unknown attribute specification")
                        end
                     end
                     parse_attlist_option(validator)
                  end
                  if not has_error then
                     validator.commit_attlist(node, att)
                     if not has_error then
                        skip_blanks
                        n := read_identifier
                     end
                  end
               end
            end
         end
      end

   parse_attlist_option (validator: XML_DTD_VALIDATOR)
      local
         id: STRING; val: UNICODE_STRING
      do
         skip_blanks
         inspect
            current_character
         when 35 then -- '#'
            next
            if end_of_input then
               set_error(Error_end_of_file)
            else
               id := read_identifier_as_string
               inspect
                  id
               when "REQUIRED" then
                  validator.attlist_required
               when "IMPLIED" then
                  validator.attlist_implied
               when "FIXED" then
                  skip_blanks
                  inspect
                     current_character
                  when 39, 34 then
                     val := read_string
                     if validator.attlist_valid_fixed(val) then
                        validator.attlist_fixed(val.twin)
                     else
                        set_error(once "Invalid default value (not in the list?)")
                     end
                  else
                     set_error(once "String expected for FIXED")
                  end
               else
                  set_error(once "Unknown attribute specification")
               end
            end
         when 39, 34 then
            val := read_string
            validator.attlist_default_value(val.twin)
         when 62 then -- '>'
            -- OK, the end
         else
            set_error(once "String expected as default value")
         end
      end

   parse_entity (validator: XML_DTD_VALIDATOR)
      local
         peid, id, val, pubid: UNICODE_STRING; sval: STRING; uval: UNICODE_STRING
      do
         skip_blanks
         if skip('%%') then
            peid := read_identifier.twin
            if has_pe_entity(peid) then
               --|*** TODO: it must be only a warning
               --|*** set_error(once "ENTITY already defined")
            elseif end_of_input then
               set_error(Error_end_of_file)
            elseif skip_word(once "SYSTEM") then
               skip_blanks
               inspect current_character
               when 39, 34 then
                  sval := read_string_as_string
                  add_pe_entity(peid, entity_system_file(sval))
               else
                  set_error(once "String expected as system")
               end
            elseif skip_word(once "PUBLIC") then
               skip_blanks
               inspect current_character
               when 39, 34 then
                  pubid := once U""
                  pubid.copy(read_string)
                  skip_blanks
                  inspect current_character
                  when 39, 34 then
                     sval := read_string_as_string
                     add_pe_entity(peid, entity_public_file(pubid, sval))
                  else
                     set_error(once "String expected as public name")
                  end
               else
                  set_error(once "String expected as public reference")
               end
            else
               skip_blanks
               inspect
                  current_character
               when 39, 34 then
                  val := read_string
                  add_pe_entity(peid, val.twin)
               else
                  set_error(once "String expected as entity value")
               end
            end
         else
            id := read_identifier.twin
            skip_blanks
            if validator.has_entity(id) then
               --|*** TODO: it must be only a warning
               --|*** set_error(once "ENTITY already defined")
            elseif end_of_input then
               set_error(Error_end_of_file)
            elseif skip_word(once "SYSTEM") then
               skip_blanks
               inspect current_character
               when 39, 34 then
                  sval := read_string_as_string
                  uval := new_empty_string
                  if uval.utf8_decode_from(sval) then
                     validator.add_entity(id, entity_system_file(sval), uval)
                  else
                     set_error(once "Invalid unicode string: " + sval)
                  end
               else
                  set_error(once "String expected as system")
               end
            elseif skip_word(once "PUBLIC") then
               skip_blanks
               inspect current_character
               when 39, 34 then
                  pubid := once U""
                  pubid.copy(read_string)
                  skip_blanks
                  inspect current_character
                  when 39, 34 then
                     sval := read_string_as_string
                     validator.add_entity(id, entity_public_file(pubid, sval), entity_public_url(pubid, sval))
                  else
                     set_error(once "String expected as public name")
                  end
               else
                  set_error(once "String expected as public reference")
               end
            else
               inspect
                  current_character
               when 39, 34 then
                  val := read_string.twin
                  validator.add_entity(id, val, Void)
               else
                  set_error(once "String expected as parameter entity value")
               end
            end
            if skip_word(once "NDATA") then
               not_yet_implemented
            end
         end
      end

feature {}
   entity_system_file (path: STRING): UNICODE_STRING
      local
         u: URL
      do
         u := relative_url(path)
         if not u.is_connected and then u.can_connect then
            u.connect
         end
         if u.is_connected then
            Result := new_empty_string
            read_stream_in(Result, u)
            url_pool.recycle(u)
         else
            set_error(once "Cannot find entity system file")
         end
      end

   entity_public_url (pubid: UNICODE_STRING; a_url: STRING): UNICODE_STRING
      local
         repo: XML_DTD_PUBLIC_REPOSITORY; u, file_url: URL
      do
         file_url := relative_url(a_url)
         u := repo.public_dtd(pubid, file_url)
         Result := new_empty_string
         if u = Void then
            if not Result.utf8_decode_from(a_url) then
               set_error(once "Invalid URL: " + a_url)
            end
         else
            if not Result.utf8_decode_from(u.out) then
               set_error(once "Invalid URL: " + u.out)
            end
         end
      end

   entity_public_file (pubid: UNICODE_STRING; a_url: STRING): UNICODE_STRING
      local
         repo: XML_DTD_PUBLIC_REPOSITORY; u, file_url: URL; err: STRING
      do
         file_url := relative_url(a_url)
         u := repo.public_dtd(pubid, file_url)
         if u = Void then
            err := once ""
            err.copy(once "Cannot find entity public file of %"")
            pubid.utf8_encode_in(err)
            err.append(once "%": ")
            err.append(repo.last_error)
            set_error(err)
            free_string(Result)
            Result := Void
         else
            if not u.is_connected and then u.can_connect then
               u.connect
            end
            if u.is_connected then
               Result := new_empty_string
               read_stream_in(Result, u)
               url_pool.recycle(u)
            end
         end
      end

   read_stream_in (a_buffer: UNICODE_STRING; u: URL)
      require
         u.is_connected
      local
         b: UNICODE_PARSER_BUFFER
      do
         from
            if buffer_pool.is_empty then
               create b.connect_to(u, Void)
            else
               b := buffer_pool.item
               b.connect_to(u, Void)
            end
         until
            b.end_of_input
         loop
            a_buffer.extend(b.code)
            b.next
         end
         b.disconnect
         buffer_pool.recycle(b)
      ensure
         not u.is_connected
      end

feature {}
   in_comment: BOOLEAN

   next
      local
         pe_entity_name, string: UNICODE_STRING; err: STRING
      do
         if pe_entity_names = Void or else pe_entity_names.is_empty then
            Precursor
         else
            pe_index := pe_index + 1
            if not pe_entity_strings.last.valid_index(pe_index) then
               -- we finished reading the parameter entity content: remove it
               free_string(pe_entity_names.last)
               pe_index := pe_entity_old_indexes.last
               pe_entity_names.remove_last
               pe_entity_strings.remove_last
               pe_entity_old_indexes.remove_last
               check
                  current_character = ';'.code
               end
               next -- to skip the ';'
            end
         end
         if not end_of_input and then not in_comment and then current_character = '%%'.code then
            next
            if not end_of_input and then is_separator(current_character) then
               -- normal use of the percent sign (maybe in a parameter entity declaration?)
               check
                  current_character = '%%'.code
               end
            else
               from
                  pe_entity_name := new_empty_string
               until
                  end_of_input or else current_character = ';'.code
               loop
                  pe_entity_name.extend(current_character)
                  next
               end
               if end_of_input then
                  set_error(once "Unexpected end of input while parsing a parameter entity")
               else
                  if pe_entity_name.is_empty then
                     set_error(once "Unexpected empty parameter entity name")
                     free_string(pe_entity_name)
                  else
                     if pe_entities /= Void then
                        string := pe_entities.reference_at(pe_entity_name)
                     end
                     if string = Void then
                        err := once ""
                        err.copy(once "Unknown parameter entity %"")
                        pe_entity_name.utf8_encode_in(err)
                        err.extend('"')
                        set_error(err)
                        free_string(pe_entity_name)
                     elseif string.is_empty then
                        -- OK, nothing to parse, let's continue
                        check
                           current_character = ';'.code
                        end
                        next -- to skip the ';'
                        free_string(pe_entity_name)
                     else
                        check
                           current_character = ';'.code
                        end
                        if pe_entity_names = Void then
                           create pe_entity_names.make(0)
                           create pe_entity_strings.make(0)
                           create pe_entity_old_indexes.make(0)
                        end
                        pe_entity_names.add_last(pe_entity_name)
                        pe_entity_strings.add_last(string)
                        if pe_entity_old_indexes.is_empty then
                           pe_entity_old_indexes.add_last(0) -- not used anyway, the buffer has its own index
                        else
                           pe_entity_old_indexes.add_last(pe_index)
                        end
                        pe_index := string.lower
                     end
                  end
               end
            end
         end
      end

   current_character: INTEGER
      do
         if pe_entity_names = Void or else pe_entity_names.is_empty then
            Result := Precursor
         else
            Result := pe_entity_strings.last.item(pe_index)
         end
      end

   end_of_input: BOOLEAN
      do
         if pe_entity_names = Void or else pe_entity_names.is_empty then
            Result := Precursor
         end
      end

   pe_entity_names: FAST_ARRAY[UNICODE_STRING]
   pe_entity_strings: FAST_ARRAY[UNICODE_STRING]
   pe_entity_old_indexes: FAST_ARRAY[INTEGER]
   pe_entities: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
   pe_index: INTEGER

   has_pe_entity (pe_entity_name: UNICODE_STRING): BOOLEAN
      do
         if pe_entities /= Void then
            Result := pe_entities.has(pe_entity_name)
         end
      end

   add_pe_entity (pe_entity_name, string: UNICODE_STRING)
      require
         not has_pe_entity(pe_entity_name)
      do
         if pe_entities = Void then
            create pe_entities.make
         end
         pe_entities.add(string, pe_entity_name)
      end

feature {}
   make
      do
      end

   Error_end_of_file: STRING "Unexpected end of file"

   error: STRING

   set_error (a_error: STRING)
      local
         i: INTEGER
      do
         error := once ""
         error.copy(a_error)
         from
            i := urls.upper
         until
            i < urls.lower
         loop
            error.append(once " in ")
            error.append(urls.item(i).out)
            i := i - 1
         end
         error.append(once " at line ")
         line.append_in(error)
         error.append(once ", column ")
         column.append_in(error)
         breakpoint
      end

invariant
   urls /= Void implies (buffers /= Void and then (urls.count = buffers.count))

end -- class XML_DTD_PARSER
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
