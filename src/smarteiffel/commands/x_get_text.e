class X_GET_TEXT

inherit
   GET_TEXT_CALL_FINDER
   CODE_PRINTER

insert
   EXTERNAL_TOOL
   FEATURE_STAMP_VISITOR
   INI_HANDLER

create {}
   make

feature {ANY}
   make
      local
         plugin_factory: FAKE_PLUGIN_FACTORY
      do
         bootstrap
         create plugin_factory.make
         system_tools.set_plugin_factory(plugin_factory)
         smart_eiffel.initialize_any_tuple
         root_class_name := ace.root_class_name.to_string
         root_procedure_name := ace.root_procedure_name
         do_compile
         find_get_text_seeds
         find_get_text_stamps
         ace.for_all(agent visit_class_text(?))
         print_info(std_output)
      end

   parse_arguments
      local
         argi: INTEGER; arg: STRING
      do
         search_for_verbose_flag
         from
            argi := 1
         until
            argi > argument_count
         loop
            arg := argument(argi)
            if is_help_flag(arg) then
               argi := argi + 1
            elseif is_verbose_flag(arg) then
               argi := argi + 1
            else
               if root_class_name = Void then
                  root_class_name := arg
                  argi := argi + 1
               elseif root_procedure_name = Void then
                  root_procedure_name := arg
                  argi := argi + 1
               else
                  argi := argi + 1
               end
            end
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
      end

   compile
      do
      end

   valid_argument_for_ace_mode: STRING "Do not use arguments in ace mode"

   use_short_mode: BOOLEAN False

   usage: STRING "x_get_text root_class"

feature {}
   find_get_text_seeds
      local
         hs: HASHED_STRING; get_text_class_name: CLASS_NAME; get_text_type: TYPE; fn: FEATURE_NAME
         seed: FEATURE_STAMP; get_text_declaration: GET_TEXT_DECLARATION
         number_get_text_declaration: NUMBER_GET_TEXT_DECLARATION
      do
--         parser_buffer.load_file(once "get_text.se")
--         ini_parser.a_inifile

         create {HASHED_DICTIONARY[ABSTRACT_GET_TEXT_DECLARATION, FEATURE_STAMP]}get_text_seeds.make
         echo.put_line(once "Looking for #(1)..." # fz_get_text_class)
         hs := string_aliaser.hashed_string(fz_get_text_class)
         create get_text_class_name.unknown_position(hs, False)
         get_text_class := smart_eiffel.class_text(get_text_class_name)
         get_text_type := get_text_class.declaration_type_of_like_current
         echo.put_line(once "#(1) found in #(2)" # fz_get_text_class # get_text_class.path)

         create fn.simple_feature_name(fz_get_text, get_text_class.name.start_position)
         seed := get_text_type.search(fn)
         if seed /= Void then
            echo.put_line(fz_found_at # fz_get_text # seed.anonymous_feature(get_text_type).start_position.out)
            create get_text_declaration.make(1, get_text_type)
            get_text_seeds.add(get_text_declaration, seed)
         else
            echo.put_line(fz_not_found # fz_get_text)
         end

         create fn.simple_feature_name(fz_number_get_text, get_text_class.name.start_position)
         seed := get_text_type.search(fn)
         if seed /= Void then
            echo.put_line(fz_found_at # fz_number_get_text # seed.anonymous_feature(get_text_type).start_position.out)
            create number_get_text_declaration.make(1, 2, get_text_type)
            get_text_seeds.add(number_get_text_declaration, seed)
         else
            echo.put_line(fz_not_found # fz_number_get_text)
         end
      end

   find_get_text_stamps
      local
         i, j: INTEGER; types: DICTIONARY[TYPE, HASHED_STRING]; type, declaration_type: TYPE
         seed, stamp: FEATURE_STAMP
         get_text_name: FEATURE_NAME
      do
         create {HASHED_DICTIONARY[ABSTRACT_GET_TEXT_DECLARATION, FEATURE_STAMP]}get_text_declarations.make
         types := smart_eiffel.type_dictionary
         from
            i := types.lower
         until
            i > types.upper
         loop
            type := types.item(i)
            echo.put_line(once "Looking for (number_)get_text declarations in #(1)" # type.name.to_string)
            from
               j := get_text_seeds.lower
            until
               j > get_text_seeds.upper
            loop
               declaration_type := get_text_seeds.item(j).declaration_type
               if type.inherits_from(declaration_type) then
                  seed := get_text_seeds.key(j)
                  stamp := seed.resolve_static_binding_for(declaration_type, type)
                  get_text_declarations.put(get_text_seeds.item(j), stamp)
                  get_text_name := stamp.anonymous_feature(type).first_name
                  echo.put_line(fz_found_as # fz_get_text # get_text_name.to_string # get_text_name.start_position.out)
               end
               j := j + 1
            end
            i := i + 1
         end
      end

   get_text_class: CLASS_TEXT

   get_text_seeds: DICTIONARY[ABSTRACT_GET_TEXT_DECLARATION, FEATURE_STAMP]

   do_compile
      local
         hashed_root_class_name: HASHED_STRING; root_name: CLASS_NAME; root: CLASS_TEXT; root_type: TYPE
      do
         hashed_root_class_name := string_aliaser.hashed_string(root_class_name)
         create root_name.unknown_position(hashed_root_class_name, False)
         root := smart_eiffel.class_text(root_name)
         if root = Void then
            error_handler.append(once "Cannot load root class ")
            error_handler.append(root_class_name)
            error_handler.extend('.')
            error_handler.print_as_error
         else
            root_type := root.declaration_type_of_like_current
         end
      end

   print_info (output: OUTPUT_STREAM)
      local
         i: INTEGER
         t: TIME
         tf: TIME_FORMATTER
      do
         output.put_string("[
# SOME DESCRIPTIVE TITLE.
# Copyright (C) YEAR THE PACKAGE'S COPYRIGHT HOLDER
# This file is distributed under the same license as the PACKAGE package.
# FIRST AUTHOR <EMAIL@ADDRESS>, YEAR.
#
#, fuzzy
msgid ""
msgstr ""
"Project-Id-Version: PACKAGE VERSION\n"
"Report-Msgid-Bugs-To: \n"
"POT-Creation-Date:
                            ]")
         t.update
--***         create {TIME_IN_FOOBAR} tf.set_time(t)
--***         tf.set_short_mode(True)
--***         io.put_string(tf.to_string)
         output.put_string("[
\n"
"PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
"Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
"Language-Team: LANGUAGE <LL@li.org>\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=CHARSET\n"
"Content-Transfer-Encoding: 8bit\n"
"Plural-Forms: nplurals=INTEGER; plural=EXPRESSION;\n"

                            ]")
         from
            i := messages.lower
         until
            i > messages.upper
         loop
            output.put_string(once "[

#
msgid "
                                   ]")
            output.put_string(messages.item(i).to_string)
            output.put_string(once "[
"
msgstr ""

                                   ]")
            i := i + 1
         end
         from
            i := number_messages.lower
         until
            i > number_messages.upper
         loop
            output.put_string(once "[

#
msgid "
                                   ]")
            output.put_string(number_messages.key(i).to_string)
            output.put_string(once "[
"
msgid_plural "
                                   ]")
            output.put_string(number_messages.item(i))
            output.put_string(once "[
"
msgstr[0] ""
msgstr[1] ""

                                   ]")
            i := i + 1
         end
      end

   visit_feature_stamp (visited: FEATURE_STAMP)
      do
         crash
      end

   fz_found_at: STRING "#(1) found at #(2)"

   fz_found_as: STRING "#(1) found as #(2)(#(3))"

   fz_not_found: STRING "#(1) not found"

   fz_get_text_class: STRING "GET_TEXT"

   fz_number_get_text_class: STRING "NUMBER_GET_TEXT"

   fz_get_text: STRING "translation"

   fz_number_get_text: STRING "number_translation"

end -- class X_GET_TEXT
