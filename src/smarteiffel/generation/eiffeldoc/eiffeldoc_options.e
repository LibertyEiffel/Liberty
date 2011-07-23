-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC_OPTIONS
   -- Arguments that modify the behavior of Eiffeldoc

insert
   ARGUMENTS
   EIFFELDOC_GLOBALS

creation {EIFFELDOC}
   make

feature {ANY}
   title: STRING
   home_address: STRING
   css: STRING
   js: STRING
   depends: BOOLEAN
   wiki_prefix: STRING

feature {EIFFELDOC, EIFFELDOC_SHORTER}
   generate_jsfile is
      do
         generate_js(js, real_js)
      end

   generate_stylesheets is
      do
         generate_css(css, real_css)
      end

feature {EIFFELDOC, EIFFELDOC_SHORTER, EIFFELDOC_SHORTER_SOURCEDOC, EIFFELDOC_SHORTER_CLASSDOC}
   open_tabs (html: HTML_OUTPUT_STREAM) is
      require
         html /= Void
      do
         html.with_attribute(once "class", once "menu")
         html.open_list
      end

   add_tab (html: HTML_OUTPUT_STREAM; name, address: STRING) is
      require
         html /= Void
         name /= Void
      do
         if address = Void then
            html.with_attribute(once "class", once "selected")
            html.open_list_item
            html.put_string(name)
            html.close_list_item
         else
            html.open_list_item
            html.open_anchor_address(address, Void)
            html.put_string(name)
            html.close_anchor
            html.close_list_item
         end
      end

   close_tabs (html: HTML_OUTPUT_STREAM) is
      require
         html /= Void
      do
         html.close_list
      end

   open_menu (html: HTML_OUTPUT_STREAM; name, selected: STRING) is
      do
         html.with_attribute(once "class", once "points_of_view_block")
         html.open_div
         html.with_attribute(once "class", once "points_of_view_head")
         html.open_div
         html.with_attribute(once "class", once "points_of_view_head_layout")
         html.open_div
         html.with_attribute(once "class", once "points_of_view_expand_mark")
         html.with_attribute(once "id", once "points_of_view._hl")
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
         html.with_attribute(once "id", once "points_of_view._expanded")
         html.with_attribute(once "style", once "display: none")
         html.open_div
         html.with_attribute(once "class", once "class_link")
         html.open_list
      end

   add_menu_item (html: HTML_OUTPUT_STREAM; name, address: STRING) is
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

   close_menu (html: HTML_OUTPUT_STREAM) is
      require
         html /= Void
      do
         html.close_list
         html.close_div
         html.close_div
      end

feature {EIFFELDOC}
   parse_argument (i: INTEGER): INTEGER is
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
            end
         elseif eiffeldoc.flag_match(once "home_address", arg) then
            if i + 1 <= argument_count then
               home_address := argument(i + 1)
               Result := 2
            end
         elseif eiffeldoc.flag_match(once "css", arg) then
            if i + 1 <= argument_count then
               css := argument(i + 1)
               Result := 2
            end
         elseif eiffeldoc.flag_match(once "js", arg) then
            if i + 1 <= argument_count then
               js := argument(i + 1)
               Result := 2
            end
         elseif eiffeldoc.flag_match(once "wiki_prefix", arg) then
            if i + 1 <= argument_count then
               wiki_prefix := argument(i + 1)
               Result := 2
            end
         elseif eiffeldoc.flag_match(once "depends", arg) then
            depends := True
            Result := 1
         end
      end

   set_default_arguments is
      do
         if title = Void then
            title := once "Generated Documentation"
         end
      end

   command_usage: STRING is
      do
         Result := once "[
                         {-title title} {-home_address address}
                         {-js file} {-css file} {-depends}
                         ]"
      end

   command_help: STRING is
      do
         Result := once "[
                         -title            the title of the generated documentation

                         -home_address     address of the 'go home' upper-left link

                         -js               the javascript file to use

                         -css              the stylesheet to use

                         -wiki_prefix      prefix of generated wiki URLs (the wiki word is
                                           added as a suffix to make the whole URL)

                         -depends          generate dependant classes even if their cluster is
                                           pruned

                         If -home_address is not given, the 'go home' upper link won't be generated.
                         If a proper JavaScript file is not given with the -js flag, the 'navigation'
                         will not be possible (except for browser which are not CSS compliant).

                         ]"
      end

feature {}
   generate_css (css_fn, real_css_fn: STRING) is
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

   generate_js (js_fn, real_js_fn: STRING) is
      require
         real_js_fn /= Void
      local
         ft: FILE_TOOLS
      do
         if js_fn /= Void and then ft.is_readable(js_fn) then
            copy_file(js_fn, real_js_fn)
         end
      end

   copy_file (from_file, to_file: STRING) is
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

   generate_default_css (real_css_fn: STRING) is
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
   make (e: EIFFELDOC) is
      do
         eiffeldoc := e
      end

   eiffeldoc: EIFFELDOC

end -- class EIFFELDOC_OPTIONS
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
