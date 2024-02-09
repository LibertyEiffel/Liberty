-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EIFFELDOC_GLOBALS

insert
   GLOBALS

feature {}
   operator_filter: HASHED_DICTIONARY[STRING, CHARACTER]
      once
         create Result.make
         Result.add(".add.", '+')
         Result.add(".sub.", '-')
         Result.add(".tim.", '*')
         Result.add(".div.", '/')
         Result.add(".mod.", '\')
         Result.add(".and.", '&')
         Result.add(".pipe.", '|')
         Result.add(".lt.", '<')
         Result.add(".gt.", '>')
         Result.add(".eq.", '=')
         Result.add(".pow.", '^')
         Result.add(".sp.", ' ')
         Result.add(".pnd.", '#')
         Result.add(".quot.", '"')
         Result.add(".tld.", '~')
         Result.add(".at.", '@')
      end

   remote_clusters: HASHED_DICTIONARY[STRING, STRING]
      once
         create Result.make
      end

   remote_cluster (cluster: CLUSTER): STRING
         -- Void if the cluster is not remote (should be generated)
      local
         s: STRING; i: INTEGER
      do
         from
            s := once ""
            s.clear_count
            i := cluster.name.lower
         until
            Result /= Void or else i > cluster.name.upper
         loop
            s.extend(cluster.name.item(i))
            Result := remote_clusters.reference_at(s)
            i := i + 1
         end
      end

   css_root: STRING "root"
   css_all_clusters: STRING "all_clusters"
   css_letter_cluster: STRING "letter_cluster"
   css_cluster: STRING "cluster"
   css_sub_cluster: STRING "sub_cluster"
   css_cluster_comments: STRING "cluster_comments"
   css_cluster_classes: STRING "cluster_classes"
   css_points_of_view: STRING "points_of_view"
   css_summary: STRING "summary"
   css_overview: STRING "overview"
   css_feature: STRING "feature"
   css_invariant: STRING "invariant"
   css_assertion: STRING "assertion"
   css_obsolete: STRING "obsolete"
   
   css_block_suffix: STRING "_block"
   css_head_suffix: STRING "_head"
   css_head_layout_suffix: STRING "_head_layout"
   css_expand_mark_suffix: STRING "_expand_mark"
   css_expand_mark_hover_suffix: STRING "_expand_mark_hover"
   css_title_suffix: STRING "_title"
   css_nav_link_suffix: STRING "_nav_link"
   css_name_suffix: STRING "_name"
   css_comment_suffix: STRING "_comment"
   css_clause_comment_suffix: STRING "_clause_comment"
   css_feature_item_suffix: STRING "_feature_item"
   css_expanded_suffix: STRING "_expanded"
   css_current_suffix: STRING "_current"
   css_keyword_suffix: STRING "_keyword"
   css_msg_suffix: STRING "_msg"
   css_mark_suffix: STRING "mark"
   css_deferred_suffix: STRING "_deferred"
   css_frozen_suffix: STRING "_frozen"
   css_attribute_suffix: STRING "_attribute"
   css_once_suffix: STRING "_once"
   css_blank_suffix: STRING "_blank"
   css_value_suffix: STRING "_value"
   css_access_suffix: STRING "_access"
   css_note_suffix: STRING "_note"
   css_note_tag_suffix: STRING "_note_tag"
   css_note_values_suffix: STRING "_note_values"

   css_nav_link: STRING "nav_link"
   css_class_link: STRING "class_link"
   css_feature_link: STRING "feature_link"

   index_filename: STRING "index.html"

   top_anchor_name: STRING "top"
   top_anchor_address: STRING "#top"
   top_link_name: STRING "top"
   home_link_name: STRING "home"
   wiki_link_name: STRING "wiki"
   points_of_view_menu_name: STRING "Point of view"
   all_feature_entry_name: STRING "All features"
   class_str: STRING "class "
   deferred_str: STRING "deferred"
   expanded_str: STRING "expanded"
   frozen_str: STRING "frozen"
   once_str: STRING "once"
   obsolete_class_str: STRING "This class is obsolete: "
   obsolete_feature_str: STRING "This feature is obsolete: "

   summary_title_str: STRING "Summary"
   direct_parents_str: STRING "Direct parents"
   known_children_str: STRING "Known children"
   inherit_list_str: STRING "Inherit list"
   insert_list_str: STRING "Insert list"

   all_classes_str: STRING "All classes"
   cluster_comments_str: STRING "Description"
   cluster_classes_str: STRING "Classes"
   overview_title_str: STRING "Overview"
   creation_features_str: STRING "Creation features"
   exported_features_str: STRING "Exported features"
   features_str: STRING "Features"
   class_invariant_str: STRING "Class invariant"
   require_str: STRING "require"
   ensure_str: STRING "ensure"
   old_str: STRING "old"

   all_classes_id: STRING "All classes:"
   cluster_comments_id: STRING "Cluster description:"
   cluster_classes_id: STRING "Cluster classes:"
   summary_id: STRING "Summary:"
   points_of_view_id: STRING "Points of view:"
   overview_id: STRING "Overview:"
   class_invariant_id: STRING "Class invariant:"

   title_bar: STRING "Eiffeldoc: "
   real_css: STRING "eiffeldoc.css"
   real_js : STRING "eiffeldoc.js"

   filtered_attribute(value: STRING): STRING
      require
         value /= Void
      local
         i: INTEGER
         c: CHARACTER
      do
         Result := once ""
         Result.clear_count
         i := value.lower
         if value.first = '#' then
            Result.extend('#')
            i := i + 1
         end
         from
         until
            i > value.upper
         loop
            c := value.item(i)
            if operator_filter.has(c) then
               Result.append(operator_filter.at(c))
            else
               Result.extend(c)
            end
            i := i + 1
         end
      end

   set_suffixed_attribute (name, base_value, suffix: STRING; html_os: EIFFELDOC_OUTPUT_STREAM)
      require
         name /= Void
         base_value /= Void
         suffix /= Void
         html_os /= Void
      local
         s: STRING
      do
         s := once ""
         s.copy(base_value)
         s.append(suffix)
         html_os.with_attribute(name, s)
      end

   html_output_stream_for_file (filename: STRING): EIFFELDOC_OUTPUT_STREAM
      require
         filename /= Void
      local
         path: STRING; depth: INTEGER; bd: BASIC_DIRECTORY
         tfw: TEXT_FILE_WRITE
      do
         depth := create_dirs(filename)
         path := last_dirname
         if path /= Void then
            bd.compute_file_path_with(path, basename_of(filename))
            if not bd.last_entry.is_empty then
               path.copy(bd.last_entry)
            else
               std_error.put_string(once "*** Could not compute the file name ")
               std_error.put_string(basename_of(filename))
               std_error.put_string(once " in the directory ")
               std_error.put_string(path)
               std_error.put_line(once " -- creating file in current directory.")
               depth := 0
               path := basename_of(filename)
            end
         else
            std_error.put_string(once "*** Could not create a directory for the file ")
            std_error.put_string(filename)
            std_error.put_line(once " -- creating file in current directory.")
            depth := 0
            path := basename_of(filename)
         end
         create tfw.connect_to(path)
         create Result.connect_to(tfw)
         Result.set_depth(depth)
      end

   write_header (html_os: EIFFELDOC_OUTPUT_STREAM; title, js, css: STRING)
      require
         html_os /= Void
         title /= Void
      do
         html_os.header
         html_os.open_title
         html_os.put_string(title_bar)
         html_os.put_string(title)
         html_os.close_title
         html_os.put_stylesheet(css)
         html_os.put_javascript(js)
         html_os.open_noscript
         html_os.open_style
         html_os.put_string(once ".expand_block_hidden { display: block; }")
         html_os.close_style
         html_os.close_noscript
         html_os.with_attribute(once "onload", once "init()")
      ensure
         html_os.in_header
      end

   open_block_head (html_os: EIFFELDOC_OUTPUT_STREAM; css_base_class, base_id: STRING)
      require
         html_os /= Void
         css_base_class /= Void
         base_id /= Void
      local
         id: STRING
      do
         id := once ""
         id.clear_count
         id.copy(base_id)
         id.add_last('.')
         id := filtered_attribute(id)

         html_os.indent
         set_suffixed_attribute(once "class", css_base_class, css_block_suffix, html_os)
         html_os.open_div
         set_suffixed_attribute(once "class", css_base_class, css_head_suffix, html_os)
         html_os.open_div
         set_suffixed_attribute(once "class", css_base_class, css_head_layout_suffix, html_os)
         html_os.open_div
         set_suffixed_attribute(once "id", id, once "_hl", html_os)
         set_suffixed_attribute(once "class", css_base_class, css_expand_mark_suffix, html_os)
         html_os.open_div
         html_os.put_character(' ')
         html_os.close_div
         set_suffixed_attribute(once "id", id, once "", html_os)
         set_suffixed_attribute(once "class", css_base_class, css_title_suffix, html_os)
         html_os.open_div
      end

   close_block_head (html_os: EIFFELDOC_OUTPUT_STREAM; css_base_class: STRING)
      require
         html_os /= Void
         css_base_class /= Void
      do
         html_os.close_div
         set_suffixed_attribute(once "class", css_base_class, css_nav_link_suffix, html_os)
         html_os.open_div
         html_os.with_attribute(once "class", css_nav_link)
         html_os.open_anchor_address(top_anchor_address, Void)
         html_os.put_string(top_link_name)
         html_os.close_anchor
         html_os.close_div
         html_os.close_div
         html_os.close_div
      end

   open_block (html_os: EIFFELDOC_OUTPUT_STREAM; css_base_class, name, base_id: STRING)
      require
         html_os /= Void
         css_base_class /= Void
         name /= Void
         base_id /= Void
      do
         open_block_head(html_os, css_base_class, base_id)

         set_suffixed_attribute(once "class", css_base_class, css_name_suffix, html_os)
         html_os.open_span
         html_os.put_string(name)
         html_os.close_span

         close_block_head(html_os, css_base_class)
      end

   close_block (html_os: EIFFELDOC_OUTPUT_STREAM)
      require
         html_os /= Void
      do
         html_os.indent
         html_os.close_div
      end

   open_comment_block (html_os: EIFFELDOC_OUTPUT_STREAM; css_base_class: STRING)
      require
         html_os /= Void
         css_base_class /= Void
      do
         set_suffixed_attribute(once "class", css_base_class, css_comment_suffix, html_os)
         html_os.open_div
      end

   close_comment_block (html_os: EIFFELDOC_OUTPUT_STREAM)
      require
         html_os /= Void
      do
         html_os.indent
         html_os.close_div
      end

   open_expand_block (html_os: EIFFELDOC_OUTPUT_STREAM; css_base_class: STRING; base_id: STRING; expand: BOOLEAN)
      require
         html_os /= Void
         css_base_class /= Void
         base_id /= Void
      local
         css_class, id: STRING
      do
         id := once ""
         id.clear_count
         id.copy(base_id)
         id.add_last('.')

         set_suffixed_attribute(once "id", filtered_attribute(id), once "_expanded", html_os)
         css_class := css_base_class
         if not expand then
            css_class := "expand_block_hidden " + css_base_class
         end
         set_suffixed_attribute(once "class", css_class, css_expanded_suffix, html_os)
         html_os.open_div
      end

   close_expand_block (html_os: EIFFELDOC_OUTPUT_STREAM)
      require
         html_os /= Void
      do
         html_os.indent
         html_os.close_div
      end

   create_dirs (a_filename: STRING): INTEGER
         -- And returns the depth of the tree
      local
         i, j: INTEGER; bd: BASIC_DIRECTORY; buffer, dirname: STRING
      do
         last_dirname := once ""
         last_dirname.make_from_string(bd.current_working_directory)
         buffer := once ""
         buffer.copy(a_filename)
         from
            i := buffer.first_index_of('/')
         until
            not buffer.valid_index(i) or else last_dirname = Void
         loop
            if i - 1 > j + 1 then
               dirname := once ""
               dirname.copy(buffer)
               dirname.shrink(j + 1, i - 1)
               bd.compute_subdirectory_with(last_dirname, dirname)
               if bd.last_entry.is_empty then
                  std_error.put_string(once "*** Could not compute the subdirectory ")
                  std_error.put_string(dirname)
                  std_error.put_string(once" of ")
                  std_error.put_line(last_dirname)
                  last_dirname := Void
               else
                  last_dirname.copy(bd.last_entry)
                  bd.connect_to(last_dirname)
                  if bd.is_connected then
                     Result := Result + 1
                     bd.disconnect
                  elseif bd.create_new_directory(last_dirname) then
                     Result := Result + 1
                  else
                     std_error.put_string(once "*** Could not create ")
                     std_error.put_line(last_dirname)
                     last_dirname := Void
                  end
               end
            end
            j := i
            i := buffer.index_of('/', j + 1)
         end
      end

   last_dirname: STRING

   basename_of (a_filename: STRING): STRING
      local
         i: INTEGER
      do
         i := a_filename.last_index_of('/')
         if a_filename.valid_index(i) then
            Result := once ""
            Result.copy(a_filename)
            Result.shrink(i + 1, Result.count)
         else
            Result := a_filename
         end
      end

   filename_of (a_class: CLASS_TEXT): STRING
      require
         a_class /= Void
      local
         i: INTEGER; s, n: STRING; c, k: CHARACTER
      do
         -- Rmk, 2017-01-09: removed client dependent file names -> all 
         -- different point of views are now in one single file

         -- We add '.d' at the end of the directory names in the cluster name part to be sure not to
         -- have clashes between directory names and class names in case-insensitive file systems.
         -- We also remove double slashes

         Result := once ""
         from
            n := a_class.cluster.name
            s := remote_cluster(a_class.cluster)
            if s /= Void then
               Result.copy(s)
               if Result.last /= '/' then
                  Result.extend('/')
               end
               Result.append(once "api/")
            else
               Result.copy(once "api/")
            end
            c := n.first
            Result.extend(c)
            i := 2
         until
            i > n.count
         loop
            k := n.item(i)
            if k = ':' then
               k := '/'
            end
            if c = '/' then
               if k /= '/' then
                  Result.extend(k)
               end
            elseif k = '/' then
               Result.append(once ".d/")
            else
               Result.extend(k)
            end
            c := k
            i := i + 1
         end
         Result.append(a_class.name.to_string)
         Result.append(once ".html")
      end

   class_name_any: CLASS_NAME
      local
         hs: HASHED_STRING
      once
         hs := string_aliaser.hashed_string(as_any)
         create Result.unknown_position(hs, False)
      end

   class_name_tuple: CLASS_NAME
      local
         hs: HASHED_STRING
      once
         hs := string_aliaser.hashed_string(as_tuple)
         create Result.unknown_position(hs, False)
      end

end -- class EIFFELDOC_GLOBALS
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
-- https://www.liberty-eiffel.org
-- ------------------------------------------------------------------------------------------------------------------------------
