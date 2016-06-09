-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_OPTIONS
   -- Arguments that modify the behavior of Eiffeldoc

insert
   ARGUMENTS
   EIFFELDOC_GLOBALS

create {EIFFELDOC}
   make

feature {ANY}
   title, short_title: STRING
   css: STRING
   js: STRING
   depends: BOOLEAN

   menu: LINKED_HASHED_DICTIONARY[STRING, STRING]
         -- the menu entries, ordered by cli apparition

   menu_separator, ariadne_separator: STRING

   wiki_prefix: STRING

feature {EIFFELDOC, EIFFELDOC_SHORTER}
   generate_jsfile
      do
         generate_js(js, real_js)
      end

   generate_stylesheets
      do
         generate_css(css, real_css)
      end

feature {EIFFELDOC, EIFFELDOC_SHORTER, EIFFELDOC_SHORTER_SOURCEDOC, EIFFELDOC_SHORTER_CLASSDOC}
   open_tabs (html: HTML_OUTPUT_STREAM)
      require
         html /= Void
      do
         html.with_attribute(once "class", once "menu")
         html.open_list
      end

   add_menu_tabs (html: HTML_OUTPUT_STREAM)
      local
         i: INTEGER; separator: STRING
      do
         from
            separator := once ""
            i := menu.lower
         until
            i > menu.upper
         loop
            add_tab(html, menu.key(i), menu.item(i), separator)
            separator := menu_separator
            i := i + 1
         end
      end

   add_tab (html: HTML_OUTPUT_STREAM; name, address, separator: STRING)
      require
         html /= Void
         name /= Void
      do
         if address = Void then
            html.with_attribute(once "class", once "selected")
            html.open_list_item
            html.put_string(separator)
            html.open_div
            html.put_string(name)
            html.close_div
            html.close_list_item
         else
            html.open_list_item
            html.put_string(separator)
            html.open_anchor_address(address, Void)
            html.put_string(name)
            html.close_anchor
            html.close_list_item
         end
      end

   close_tabs (html: HTML_OUTPUT_STREAM)
      require
         html /= Void
      do
         html.close_list
      end

   open_menu (html: HTML_OUTPUT_STREAM; name, selected: STRING)
      do
         html.with_attribute(once "class", once "points_of_view_block")
         html.open_div
         html.with_attribute(once "class", once "points_of_view_head")
         html.open_div
         html.with_attribute(once "class", once "points_of_view_head_layout")
         html.open_div
         html.with_attribute(once "class", once "points_of_view_expand_mark")
         html.with_attribute(once "id", once "points_of_view.is_hl")
         html.open_div
         html.put_character('+')
         html.close_div
         html.with_attribute(once "id", once "points_of_view.")
         html.with_attribute(once "class", once "points_of_view_title")
         html.open_div


         html.with_attribute(once "class", once "points_of_view_name")
         html.open_span
         html.put_string(name)
         html.close_span
         html.close_div
         html.with_attribute(once "class", once "points_of_view_current")
         html.open_div
         html.put_string(selected)
         html.close_div
         html.close_div
         html.close_div
         html.with_attribute(once "class", once "points_of_view_expanded")
         html.with_attribute(once "id", once "points_of_view.is_expanded")
         html.with_attribute(once "style", once "display: none")
         html.open_div
         html.with_attribute(once "class", once "class_link")
         html.open_list
      end

   add_menu_item (html: HTML_OUTPUT_STREAM; name, address: STRING)
      require
         html /= Void
         name /= Void
         address /= Void
      do
         html.open_list_item
         html.open_anchor_address(address, Void)
         html.put_string(name)
         html.close_anchor
         html.close_list_item
      end

   close_menu (html: HTML_OUTPUT_STREAM)
      require
         html /= Void
      do
         html.close_list
         html.close_div
         html.close_div
      end

feature {EIFFELDOC}
   parse_argument (i: INTEGER): INTEGER
         -- Returns the number of arguments it used (0 if the argument was not matched)
      require
         i.in_range(1, argument_count)
      local
         arg: STRING
      do
         arg := argument(i)
         if eiffeldoc.flag_match(once "title", arg) then
            if i + 1 <= argument_count then
               title := argument(i + 1)
               Result := 2
            else
               std_error.put_line(once "**** Invalid title argument")
            end
         elseif eiffeldoc.flag_match(once "short_title", arg) then
            if i + 1 <= argument_count then
               short_title := argument(i + 1)
               Result := 2
            else
               std_error.put_line(once "**** Invalid title argument")
            end
         elseif eiffeldoc.flag_match(once "menu", arg) then
            if i + 2 <= argument_count then
               menu.put(argument(i + 1), argument(i + 2))
               Result := 3
            else
               std_error.put_line(once "**** Invalid menu arguments")
            end
         elseif eiffeldoc.flag_match(once "menu_separator", arg) then
            if i + 1 <= argument_count then
               menu_separator := argument(i + 1)
               Result := 2
            else
               std_error.put_line(once "**** Invalid menu_separator argument")
            end
         elseif eiffeldoc.flag_match(once "ariadne_separator", arg) then
            if i + 1 <= argument_count then
               ariadne_separator := argument(i + 1)
               Result := 2
            else
               std_error.put_line(once "**** Invalid ariadne_separator argument")
            end
         elseif eiffeldoc.flag_match(once "css", arg) then
            if i + 1 <= argument_count then
               css := argument(i + 1)
               Result := 2
            else
               std_error.put_line(once "**** Invalid css argument")
            end
         elseif eiffeldoc.flag_match(once "js", arg) then
            if i + 1 <= argument_count then
               js := argument(i + 1)
               Result := 2
            else
               std_error.put_line(once "**** Invalid js argument")
            end
         elseif eiffeldoc.flag_match(once "wiki_prefix", arg) then
            if i + 1 <= argument_count then
               wiki_prefix := argument(i + 1)
               Result := 2
            else
               std_error.put_line(once "**** Invalid wiki_prefix argument")
            end
         elseif eiffeldoc.flag_match(once "depends", arg) then
            depends := True
            Result := 1
         end
      end

   set_default_arguments
      do
         if title = Void then
            title := once "Generated Documentation"
         end
         if short_title = Void then
            short_title := once "Clusters"
         end
      end

   command_usage: STRING
      do
         Result := once "{-title title} {-menu address title}... {-js file} {-css file} {-depends} "
      end

   command_help: STRING
      do
         Result := once "[
            Generate API documentation for a project.

            Option summary:

            Information:
              -help               Display this help information
              -version            Display Liberty Eiffel version information
              -verbose            Display detailed information about what the program is
                                   doing

            Titles:
              -title <title>      Specify a title for the generated documentation
              -short_title <title>
                                  Specify an abbreviated form of -title, used in menus

            Resource files:
              -js <file>          Specify a JavaScript file to use. If a proper JavaScript
                                   file is not given, the 'navigation' will not be
                                   possible (except for browsers which are not CSS
                                   compliant).
              -css <file>         Specify the style sheet to use

            Menu items and separators:
              -menu <url> <title> Define a menu item (in the header Ariadne thread)
                                   - its address
                                   - its displayed title
                                   There may be more than one menu item; the ordering
                                   implied by the command line.
              -menu_separator <text>
                                  Specify the text to be inserted between menu items
              -ariadne_separator <text>
                                  Specify the text to be inserted between Ariadne thread
                                   items

            Wiki words:
              -wiki_prefix <url>  Specify the wiki home URL for wiki words

            Cluster management:
              -depends            Generate dependant classes even if their cluster is
                                   pruned

         ]"
      end

feature {}
   generate_css (css_fn, real_css_fn: STRING)
      require
         real_css_fn /= Void
      local
         ft: FILE_TOOLS
      do
         if css_fn = Void or else not ft.is_readable(css_fn) then
            generate_default_css(real_css_fn)
         else
            copy_file(css_fn, real_css_fn)
         end
      end

   generate_js (js_fn, real_js_fn: STRING)
      require
         real_js_fn /= Void
      local
         ft: FILE_TOOLS
      do
         if js_fn /= Void and then ft.is_readable(js_fn) then
            copy_file(js_fn, real_js_fn)
         end
      end

   copy_file (from_file, to_file: STRING)
      local
         source: TEXT_FILE_READ; target: TEXT_FILE_WRITE
      do
         echo.put_string(once "Copying ")
         echo.put_string(from_file)
         echo.put_string(once " to ")
         echo.put_string(to_file)
         echo.put_new_line
         create source.connect_to(from_file)
         if not source.is_connected then
            error_handler.append(once "Cannot open file for reading: ")
            error_handler.append(from_file)
            error_handler.append(once "%N")
            error_handler.print_as_warning
         else
            create target.connect_to(to_file)
            if not target.is_connected then
               error_handler.append(once "Cannot open file for writing: ")
               error_handler.append(to_file)
               error_handler.append(once "%N")
               error_handler.print_as_warning
            else
               from
                  source.read_line
               until
                  source.end_of_input
               loop
                  target.put_string(source.last_string)
                  target.put_new_line
                  source.read_line
               end
               target.disconnect
            end
            source.disconnect
         end
      end

   generate_default_css (real_css_fn: STRING)
      local
         f: TEXT_FILE_WRITE
      do
         create f.connect_to(real_css_fn)
         if not f.is_connected then
            error_handler.append(once "Cannot open file for writing: ")
            error_handler.append(real_css_fn)
            error_handler.append(once "%N")
            error_handler.print_as_warning
         else
            f.put_string(once "A.cluster {%N")
            f.put_string(once "     font-size: 12pt;%N")
            f.put_string(once "     color: black%N")
            f.put_string(once "}%N")
            f.put_string(once "A.home {%N")
            f.put_string(once "     font-size: 12pt;%N")
            f.put_string(once "     color: blue%N")
            f.put_string(once "}%N")
            f.put_string(once "A.class {%N")
            f.put_string(once "     font-size: 12pt;%N")
            f.put_string(once "     color: red%N")
            f.put_string(once "}%N")
            f.put_string(once "A.title {%N")
            f.put_string(once "     font-size: 16pt;%N")
            f.put_string(once "     color: blue%N")
            f.put_string(once "}%N")
            f.flush
            f.disconnect
         end
      end

feature {}
   make (e: EIFFELDOC)
      do
         eiffeldoc := e
         menu_separator := once ""
         ariadne_separator := once ""
         create menu.make
      end

   eiffeldoc: EIFFELDOC

end -- class EIFFELDOC_OPTIONS
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
