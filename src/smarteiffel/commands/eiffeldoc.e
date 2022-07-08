-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELDOC
   --
   -- The HTML documentation tool. It generates a whole site that describes a project, given a loadpath.se
   -- file or an ACE file.
   --
   -- If no such file is provided, the classes from the configuration file are used.
   --

inherit
   EXTERNAL_TOOL
      export {EIFFELDOC_OPTIONS}
         flag_match
      redefine
         command_line_name
      end
   CLUSTER_VISITOR

insert
   EIFFELDOC_GLOBALS

create {}
   make

feature {ANY}
   command_line_name: STRING "eiffeldoc"

   usage: STRING
      once
         Result := "Usage: "
         Result.append(command_line_name)
         Result.extend(' ')
         Result.append(options.command_usage)
         Result.append("{-prune cluster...} {-remote cluster address...} {-verbose} {-help} [loadpath.se | ACE file]%N")
         Result.extend('%N')
         Result.append(options.command_help)
         Result.append("{
  -prune <cluster>    Exclude <cluster> from the generated documentation. It
                       uses the loadpath.se or ACE syntax for paths. Note that
                       it also removes all subclusters.
                       For example:

         }")
         Result.append("                        ")
         Result.append(command_line_name)
         Result.append(" -prune 'lib/xml'%N")
         Result.append("{
  -remote <cluster> <url>
                      Use the documentation at <url> for <cluster>. Note that,
                       like -prune, documentation for <cluster> is not
                       generated. It is useful for consistency.
                       For example:

         }")
         Result.append("                        ")
         Result.append(command_line_name)
         Result.append(" -remote 'lib' 'http://doc.liberty-eiffel.org/libraries/'%N")
         Result.append("[

The loadpath.se or ACE file is not compulsory. When not set, the classes of
the current directory are considered, and the classes of the default loadpath.

Note that you should use a loadpath.se or an ACE file for more sensible
results. -prune should be avoided whenever possible (it usually leads to
inconsistent HTML pages, with dangling links). Use at your own risk.

         ]")
      end

feature {}
   make
      local
         o: like options
      do
         root_class_name := as_any
         create pruned_clusters.make(0)
         create cluster_html.make
         create all_clusters.make(0)
         create clusters.make(0)
         create classes.make
         create all_classes.make(0)
         create all_class_urls.make(0)
         create all_class_clusters.make(0)
         create comments.make(0)
         create o.make(Current)
         context.set_options(o)

         bootstrap
         options.set_default_arguments
         options.generate_stylesheets
         options.generate_jsfile
         get_started
         write_clusters
      end

   get_started
      do
         smart_eiffel.initialize_any_tuple
         create core.make(context)
         ace.for_all_clusters(agent load_cluster(?))
         core.do_doc
      end

   load_cluster (cluster: CLUSTER)
      require
         cluster /= Void
      do
         echo.put_string(once "Loading cluster %"")
         echo.put_string(cluster.name)
         echo.put_string(once "%"%N")
         cluster.accept(Current)
      end

   context: EIFFELDOC_CONTEXT
      once
         create Result.make
      end

   options: EIFFELDOC_OPTIONS
      do
         Result := context.options
      end

   core: EIFFELDOC_CORE

   parse_arguments
      local
         i, n: INTEGER
      do
         search_for_verbose_flag
         from
            i := 1
         until
            i > argument_count
         loop
            if flag_match(once "prune", argument(i)) then
               -- prune this cluster
               if i + 1 > argument_count then
                  std_error.put_line(once "**** Missing prune argument")
                  std_error.put_string(usage)
                  die_with_code(1)
               end
               pruned_clusters.add_last(argument(i + 1))
               i := i + 2
            elseif flag_match(once "remote", argument(i)) then
               if i + 2 > argument_count then
                  std_error.put_line(once "**** Missing remote argument")
                  std_error.put_string(usage)
                  die_with_code(1)
               end
               pruned_clusters.add_last(argument(i + 1))
               remote_clusters.add(argument(i + 2), argument(i + 1))
               i := i + 3
            elseif is_help_flag(argument(i)) then
               i := i + 1
            elseif is_version_flag(argument(i)) then
               i := i + 1
            elseif is_verbose_flag(argument(i)) then
               i := i + 1
            else
               n := options.parse_argument(i)
               if n > 0 then
                  debug
                     echo.put_string(once "Argument #")
                     echo.put_integer(i)
                     echo.put_string(once ": ")
                     echo.put_string(argument(i))
                     echo.put_string(once " spans ")
                     if n = 1 then
                        echo.put_string(once "1 argument%N")
                     else
                        echo.put_integer(n)
                        echo.put_string(once " arguments%N")
                     end
                  end

                  i := i + n
               else
                  if i = argument_count and then set_loadpath(argument(i)) then
                     i := i + 1
                  else
                     std_error.put_string(once "**** Invalid extra argument: ")
                     std_error.put_line(argument(i))
                     std_error.put_string(usage)
                     die_with_code(1)
                  end
               end
            end
         end
      end

   set_loadpath (loadpath: STRING): BOOLEAN
      do
         if loadpath.has_suffix(once ".ace") or else loadpath.has_suffix(once ".ACE") then
            -- nothing to do: bootstrap takes care of that
            Result := True
         elseif loadpath.has_suffix(once ".se") or else loadpath.has_suffix(once ".SE") then
            system_tools.add_loadpath_file(loadpath)
            Result := True
         end
      end

   use_short_mode: BOOLEAN True

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         Result := is_verbose_flag(arg)
            or else is_version_flag(arg)
      end

   valid_argument_for_ace_mode: STRING "Only the -verbose and -version flags are allowed in ACE%Nfile mode.%N"

   is_valid_class_name (name: STRING): BOOLEAN
         -- Does it follow the syntactic rules for a class name?  I.e. an uppercase letter followed by
         -- optional uppercase letters, digits and underscores.
      local
         i, n: INTEGER
      do
         if not name.is_empty then
            n := name.count
            from
               i := 2
               Result := name.first.in_range('A','Z')
            until
               not Result or else i > n
            loop
               inspect name.item(i)
               when 'A'..'Z', '0'..'9', '_' then
               else
                  Result := False
               end
               i := i + 1
            end
         end
      end

feature {CLUSTER}
   visit_cluster (visited: CLUSTER)
      local
         bd: BASIC_DIRECTORY; p, s: STRING; cn: HASHED_STRING; ct: CLASS_TEXT
      do
         if pruned_cluster(visited) then
            echo.put_string(once "Cluster ")
            echo.put_string(cluster_name(visited))
            echo.put_string(once " pruned%N")
         else
            echo.put_string(once "Cluster ")
            echo.put_string(cluster_name(visited))
            echo.put_string(once " included%N")

            s := visited.directory_path
            if s /= Void and then not s.is_empty then
               bd.connect_to(s)
               if bd.is_connected then
                  from
                     s := once ""
                     p := once ""
                     bd.read_entry
                  until
                     bd.end_of_input
                  loop
                     s.copy(bd.last_entry)
                     p.copy(visited.directory_path)
                     bd.compute_file_path_with(p, s)
                     p.copy(bd.last_entry)
                     -- p is the complete path of the file
                     s.to_upper
                     if s.has_suffix(once ".E") then
                        s.remove_tail(2)
                        -- s is now simply the class name
                        cn := string_aliaser.hashed_string(s)
                        if is_valid_class_name(s) then
                           ct := visited.class_text(create {CLASS_NAME}.unknown_position(cn, False), True)
                           check
                              ct.cluster = visited
                           end
                           add_class(ct)
                        end
                     end
                     bd.read_entry
                  end
                  bd.disconnect
               end
            end
            write_cluster(visited)
         end
      end

feature {} -- Pruned clusters
   pruned_cluster (cluster: CLUSTER): BOOLEAN
      local
         i: INTEGER; name, s: STRING
      do
         name := cluster_name(cluster)
         from
            i := pruned_clusters.lower
         until
            Result or else i > pruned_clusters.upper
         loop
            s := pruned_clusters.item(i)
            Result := name.has_prefix(s)
            i := i + 1
         end
      end

   pruned_clusters: FAST_ARRAY[STRING]

feature {} -- General HTML files
   open_root_block (html: EIFFELDOC_OUTPUT_STREAM)
      -- Write the `top' anchor.
      -- Write tabs.
      -- Open the `root' block and write the block title.
      require
         html /= Void and then html.in_a_body
      do
         html.open_anchor_name(top_anchor_name)
         html.close_anchor

         -- make tabs
         options.open_tabs(html)
         options.add_menu_tabs(html)
         options.add_tab(html, options.short_title, Void, options.ariadne_separator)
         options.close_tabs(html)

         -- open general block
         set_suffixed_attribute(once "class", css_root, css_block_suffix, html)
         html.open_div
         set_suffixed_attribute(once "class", css_root, css_head_suffix, html)
         html.open_div

         -- write name
         set_suffixed_attribute(once "class", css_root, css_name_suffix, html)
         html.open_span
         html.put_string(options.title)
         html.close_span
         html.close_div
      ensure
         html.in_a_body
      end

   close_root_block (html: EIFFELDOC_OUTPUT_STREAM)
      require
         html /= Void and then html.in_a_body
      do
         html.close_div
      end

   display_name (tag, cluster, default_cluster_name: STRING): STRING
      require
         cluster /= Void
      local
         i, j: INTEGER; done: BOOLEAN
      do
         Result := once ""
         Result.copy(tag)
         from
            i := cluster.first_index_of(':')
            if cluster.valid_index(i) then
               i := i + 1
            else
               i := cluster.lower
            end
         until
            i > cluster.upper
         loop
            from
               j := cluster.substring_index(once "loadpath.se:", i)
               if not cluster.valid_index(j) then
                  j := cluster.upper + 1
               end
            invariant
               i <= cluster.upper
               i <= j
            until
               i = j
            loop
               Result.extend(cluster.item(i))
               i := i + 1
            end
            i := i + 12 -- "loadpath.se".count
         end

         check
            Result.has_prefix(tag)
         end
         from
            done := Result.count = tag.count
         variant
            Result.count
         until
            done
         loop
            inspect
               Result.last
            when '/', '.' then
               Result.remove_last
               done := Result.count = tag.count
            else
               done := True
            end
         end
         if Result.count = tag.count then
            if default_cluster_name = Void then
               Result.extend('/')
            else
               Result := default_cluster_name
            end
         end
      end

   write_clusters
      local
         i: INTEGER
         cluster: STRING
         id: STRING
         html: EIFFELDOC_OUTPUT_STREAM
         html_parser: HTML_PARSER
      once
         html := html_output_stream_for_file(index_filename)
         write_header(html, options.title, real_js, real_css)
         html.body
         open_root_block(html)

         if all_classes.count > 0 then
            -- write clusters
            write_all_clusters(html)
            from
               i := clusters.lower
            until
               i > clusters.upper
            loop
               cluster := clusters.item(i)
               html_parser := cluster_html.reference_at(cluster)

               open_block(html, css_cluster, display_name(once "Cluster ", cluster, once "Root cluster"), cluster)
               open_expand_block(html, css_cluster, cluster, False)

               if html_parser /= Void then
                  id := once ""
                  id.copy(cluster_comments_id)
                  i.append_in(id)
                  open_block(html, css_cluster_comments, cluster_comments_str, id)
                  open_expand_block(html, css_cluster_comments, id, False)
                  open_comment_block(html, css_cluster_comments)
                  write_description(html_parser, html, False)
                  close_comment_block(html)
                  close_expand_block(html)
                  close_block(html)
               end

               write_classes_for_cluster(cluster, html)
               i := write_sub_clusters(i, html)

               close_expand_block(html)
               close_block(html)
            end
         end

         close_root_block(html)
         html.close
         html.disconnect
      end

   write_sub_clusters (i: INTEGER; html: EIFFELDOC_OUTPUT_STREAM) : INTEGER
      require
         i.in_range(clusters.lower, clusters.upper)
         html /= Void
      local
         current_cluster, id: STRING
         html_parser: HTML_PARSER
      do
         from
            Result := i + 1
         until
            Result > clusters.upper or else
            not clusters.item(Result).has_prefix(clusters.item(i))
         loop
            current_cluster := clusters.item(Result)
            html_parser := cluster_html.reference_at(current_cluster)

            open_block(html, css_sub_cluster, display_name(once "Subcluster ", current_cluster, Void), current_cluster)
            open_expand_block(html, css_sub_cluster, current_cluster, False)

            if html_parser /= Void then
               id := once ""
               id.copy(cluster_comments_id)
               Result.append_in(id)
               open_block(html, css_cluster_comments, cluster_comments_id, id)
               open_expand_block(html, css_cluster_comments, id, False)
               open_comment_block(html, css_cluster_comments)
               write_description(html_parser, html, False)
               close_comment_block(html)
               close_expand_block(html)
               close_block(html)
            end

            write_classes_for_cluster(current_cluster, html)
            Result := write_sub_clusters(Result, html)

            close_expand_block(html)
            close_block(html)
         end
      end

   write_all_clusters (html: EIFFELDOC_OUTPUT_STREAM)
      local
         current_index: CHARACTER; i, j: INTEGER; clazz, url, index: STRING
         urls, clu: FAST_ARRAY[STRING]; com: FAST_ARRAY[COMMENT]
         index_output: EIFFELDOC_OUTPUT_STREAM
      do
         open_block(html, css_all_clusters, all_classes_str, all_classes_id)
         open_expand_block(html, css_all_clusters, all_classes_id, False)

         from
            create index_output.make
            i := all_classes.lower
            current_index := '.'
         until
            i > all_classes.upper
         loop
            clazz := all_classes.item(i)
            if clazz.first /= current_index then
               current_index := clazz.first
               open_block(html, css_letter_cluster, current_index.to_string, current_index.to_string)
               open_expand_block(html, css_letter_cluster, current_index.to_string, False)
               html.open_list
            end
            index := once ""
            index.copy(once "index/")
            index.append(clazz)
            index.append(once ".html")
            html.indent
            html.open_list_item
            html.open_anchor_address(index, Void)
            html.put_string(clazz)
            html.close_anchor
            html.close_list_item

            urls := all_class_urls.item(i)
            index_output := html_output_stream_for_file(index)
            if urls.count = 1 then
               index_output.header
               index_output.put_meta_refresh_api(urls.first)
               index_output.body
               index_output.close
            else
               write_header(index_output, options.title, real_js, real_css)
               index_output.body
               index_output.open_section
               index_output.put_string(once "Disembiguation for class ")
               index_output.put_string(clazz)
               index_output.close_section
               index_output.open_paragraph
               index_output.put_string(once "The class ")
               index_output.put_string(clazz)
               index_output.put_string(once " is present in more than one cluster. Please choose the one you want to browse.")
               index_output.close_paragraph
               index_output.open_list
               context.set_html(index_output)
               from
                  com := comments.item(i)
                  clu := all_class_clusters.item(i)
                  url := once ""
                  j := urls.lower
               until
                  j > urls.upper
               loop
                  url.copy(once "api/")
                  url.append(urls.item(j))
                  index_output.open_list_item
                  index_output.open_anchor_address(url, Void)
                  index_output.put_string(once "in cluster ")
                  index_output.put_string(clu.item(j))
                  index_output.close_anchor
                  if com.item(j) /= Void then
                     open_comment_block(index_output, css_summary)
                     context.write_comment(com.item(j), 1, 2)
                     close_comment_block(index_output)
                  end
                  index_output.close_list_item
                  j := j + 1
               end
               index_output.close_list
               index_output.close
            end
            index_output.disconnect

            i := i + 1
            if i > all_classes.upper or else all_classes.item(i).first /= current_index then
               html.close_list
               close_expand_block(html)
               close_block(html)
            end
         end

         close_expand_block(html)
         close_block(html)
      end

   write_classes_for_cluster (cluster: STRING; html: EIFFELDOC_OUTPUT_STREAM)
      require
         cluster /= Void
         html /= Void
      local
         i, o: INTEGER; clazz, url, id: STRING; list: FAST_ARRAY[STRING]
      do
         list := classes.reference_at(cluster)
         if list /= Void and then list.count > 0 then
            id := once ""
            id.copy(cluster_classes_id)
            id.append(cluster)
            open_block(html, css_cluster_classes, cluster_classes_str, id)
            open_expand_block(html, css_cluster_classes, id, True)

            html.open_list
            from
               i:= list.lower
            until
               i > list.upper
            loop
               clazz := list.item(i)
               html.indent
               html.open_list_item
               o := all_classes.fast_first_index_of(clazz)
               url := all_class_urls.item(o).item(all_class_clusters.item(o).first_index_of(cluster))
               html.open_anchor_address(url, Void)
               html.put_string(clazz)
               html.close_anchor
               html.close_list_item
               i := i + 1
            end
            html.close_list

            close_expand_block(html)
            close_block(html)
         end
      end

   write_cluster (cluster: CLUSTER)
      do
         add_cluster(cluster)
      end

feature {} -- Support features for html writing
   all_clusters: FAST_ARRAY[CLUSTER]

   clusters: FAST_ARRAY[STRING]

   cluster_html: HASHED_DICTIONARY[HTML_PARSER, STRING]

   classes: HASHED_DICTIONARY[FAST_ARRAY[STRING], STRING]

   all_classes: FAST_ARRAY[STRING]
   all_class_urls: FAST_ARRAY[FAST_ARRAY[STRING]]
   all_class_clusters: FAST_ARRAY[FAST_ARRAY[STRING]]

   comments: FAST_ARRAY[FAST_ARRAY[COMMENT]]

   cluster_summary: TEXT_FILE_READ
      once
         create Result.make
      end

   body_node: EIFFELDOC_HTML
      once
         create Result.make
      end

   cluster_name (a_cluster: CLUSTER): STRING
      do
         Result := a_cluster.name
      end

   add_cluster (cluster: CLUSTER)
      local
         i: INTEGER; s: STRING; sorter: COLLECTION_SORTER[STRING]; bd: BASIC_DIRECTORY; ft: FILE_TOOLS
         html_parser: HTML_PARSER
      do
         s := cluster_name(cluster).twin
         i := sorter.insert_index(clusters, s)
         clusters.add(s, i)
         all_clusters.add(cluster, i)
         bd.compute_file_path_with(cluster.directory_path, once "cluster.html")
         debug
            io.put_string(bd.last_entry)
            io.put_new_line
         end
         s := once ""
         s.copy(bd.last_entry)
         if ft.is_readable(s) then
            debug
               io.put_string(once " (readable)%N")
            end
            cluster_summary.connect_to(s)
            create html_parser.parse(cluster_summary)
            cluster_summary.disconnect
            debug
               if body(html_parser) /= Void then
                  io.put_string(body(html_parser).to_string)
               end
               io.put_new_line
            end
            cluster_html.put(html_parser, cluster_name(cluster).twin)
         else
            debug
               io.put_string(once " (not readable!)%N")
            end
         end
      end

   add_class (ct: CLASS_TEXT)
      local
         list, urls, clu: FAST_ARRAY[STRING]; com: FAST_ARRAY[COMMENT]; sorter: COLLECTION_SORTER[STRING]; cluster, clazz: STRING
         i: INTEGER
      do
         cluster := cluster_name(ct.cluster)
         list := classes.reference_at(cluster)
         if list = Void then
            create list.make(0)
            classes.put(list, cluster.twin)
         end
         clazz := ct.name.to_string
         sorter.add(list, clazz)
         i := sorter.index_of(all_classes, clazz)
         if all_classes.valid_index(i) and then all_classes.item(i).is_equal(clazz) then
            urls := all_class_urls.item(i)
            clu := all_class_clusters.item(i)
            com := comments.item(i)
         else
            i := sorter.insert_index(all_classes, clazz)
            all_classes.add(clazz, i)
            create urls.make(0)
            all_class_urls.add(urls, i)
            create com.make(0)
            comments.add(com, i)
            create clu.make(0)
            all_class_clusters.add(clu, i)
         end
         urls.add_last(filename_of(ct).twin)
         com.add_last(ct.heading_comment2)
         clu.add_last(cluster_name(ct.cluster).twin)
         core.add(ct)
      end

   write_description (hp: HTML_PARSER; html: EIFFELDOC_OUTPUT_STREAM; stop_at_dot: BOOLEAN)
      require
         hp /= Void
         html /= Void
      local
         e: HTML_ELEMENT
      do
         e := body(hp)
         if e /= Void then
            e.to_html_stream(html, stop_at_dot)
            debug
               io.put_string(e.to_string)
               io.put_new_line
            end
         end
      end

   body (hp: HTML_PARSER): EIFFELDOC_HTML
      local
         i: INTEGER; e: HTML_ELEMENT; node: HTML_NODE
      do
         from
            i := hp.roots.lower
         until
            Result /= Void or else i > hp.roots.upper
         loop
            e := hp.roots.item(i)
            if e /= Void and then node ?:= e then
               node ::= e
               node := find_body(node)
               if node /= Void then
                  Result := body_node
                  Result.set(node)
               end
            end
            i := i + 1
         end
      end

   find_body (node: HTML_NODE): HTML_NODE
      require
         node /= Void
      local
         i: INTEGER; e: HTML_ELEMENT
      do
         debug
            io.put_string(once "--> ")
            io.put_string(node.name)
            io.put_new_line
         end
         if node.name.same_as(once "body") then
            Result := node
         else
            from
               i := 1
            until
               Result /= Void or else i > node.children_count
            loop
               debug
                  io.put_integer(i)
                  io.put_new_line
               end
               e := node.child(i)
               if Result ?:= e then
                  Result ::= e
                  Result := find_body(Result)
               end
               i := i + 1
            end
         end
      end

invariant
   all_classes.count = all_class_urls.count
   all_classes.count = all_class_clusters.count
   all_classes.count = comments.count
   -- for each i all_class_urls.item(i).count = comments.item(i).count
   -- and all_class_urls.item(i).count = all_class_clusters.item(i).count

end -- class EIFFELDOC
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
