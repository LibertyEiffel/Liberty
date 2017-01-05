-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIVE_TYPE_NATIVE_ARRAY_COLLECTOR

inherit
   LIVE_TYPE_EXTRA_COLLECTOR

insert
   GLOBALS

create {MEMORY_HANDLER}
   make

feature {ANY}
   must_collect (live_type: LIVE_TYPE): TAGGED_FLAG
      do
         Result ::= get_tag(live_type)
      end

   is_enabled (class_text: CLASS_TEXT): TAGGED_FLAG
      do
         Result ::= get_tag(class_text)
      end

feature {LIVE_TYPE}
   collect (live_type: LIVE_TYPE)
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; args: FORMAL_ARG_LIST
         flag: TAGGED_FLAG
      do
         flag := must_collect(live_type)
         if flag = Void then
            if not is_native_array_collector_enabled(live_type.type.class_text) then
               flag := no
            else
               fs := live_type.type.feature_stamp_of(mark_item_name)
               if fs = Void then
                  error_handler.append(once "Internal problem while searching for %"mark_item%".")
                  error_handler.print_as_warning
               else
                  af := fs.anonymous_feature(live_type.type)
                  args := af.arguments
                  if args.name(1).resolve_in(live_type.type).generic_list.first.is_reference then
                     flag := yes
                  end
               end
            end
            set_tag(live_type, flag)
         elseif flag.item then
            -- Must collect `mark_native_arrays':
            fs := live_type.type.feature_stamp_of(mark_native_arrays_name)
            if fs = Void then
               error_handler.append(once "Internal problem for %"mark_native_arrays%".")
               error_handler.print_as_warning
            else
               live_type.collect(fs)
            end
         else
            -- Nothing to collect.
         end
      ensure
         must_collect(live_type) /= Void
      end

feature {}
   is_native_array_collector_enabled (class_text: CLASS_TEXT): BOOLEAN
      local
         flag: TAGGED_FLAG
      do
         flag := is_enabled(class_text)
         if flag = Void then
            if class_text.parent_lists = Void then
               flag := no
            elseif is_native_array_collector_enabled_(class_text.parent_lists) then
               flag := yes
            else
               flag := no
            end
            set_tag(class_text, flag)
         end
         Result := flag.item
      end

   is_native_array_collector_enabled_ (parent_lists: PARENT_LISTS): BOOLEAN
      local
         i: INTEGER
      do
         if parent_lists.insert_list /= Void then
            from
               i := parent_lists.insert_list.lower
            until
               Result or else i > parent_lists.insert_list.upper
            loop
               Result := parent_lists.insert_list.item(i).class_text_name = as_native_array_collector
                  or else is_native_array_collector_enabled(parent_lists.insert_list.item(i).class_text)
               i := i + 1
            end
         end
         if parent_lists.inherit_list /= Void then
            -- Even if it is not good practice, we also look inside the `inherit_list':
            from
               i := parent_lists.inherit_list.lower
            until
               Result or else i > parent_lists.inherit_list.upper
            loop
               Result := parent_lists.inherit_list.item(i).class_text_name = as_native_array_collector
                  or else is_native_array_collector_enabled(parent_lists.inherit_list.item(i).class_text)
               i := i + 1
            end
         end
      end

feature {}
   get_tag (tagged: TAGGED): TAGGED_DATA
      require
         tagged /= Void
      do
         Result := tagged.tag(tag_key)
      end

   set_tag (tagged: TAGGED; data: TAGGED_DATA)
      require
         tagged /= Void
         data /= Void
         tagged.tag(tag_key) = Void
      do
         tagged.set_tag(tag_key, data)
      ensure
         tagged.tag(tag_key) = data
      end

   tag_key: FIXED_STRING
      once
         Result := "native_array_collector_tag".intern
      end

feature {}
   make
      do
      end

   yes: TAGGED_FLAG
      once
         create Result.as_true
      end

   no: TAGGED_FLAG
      once
         create Result.as_false
      end

end -- class LIVE_TYPE_NATIVE_ARRAY_COLLECTOR
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
