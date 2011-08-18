-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIVE_TYPE_NATIVE_ARRAY_COLLECTOR

inherit
   LIVE_TYPE_EXTRA_COLLECTOR

insert
   GLOBALS

create {C_PRETTY_PRINTER}
   make

feature {ANY}
   must_collect (live_type: LIVE_TYPE): LIVE_TYPE_EXTRA_COLLECTED_FLAG is
      do
         Result ::= live_type.extra_collected(tag)
      end

feature {LIVE_TYPE}
   collect (live_type: LIVE_TYPE) is
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; args: FORMAL_ARG_LIST
         flag: LIVE_TYPE_EXTRA_COLLECTED_FLAG
      do
         flag := must_collect(live_type)
         if flag = Void then
            if cpp.gc_handler.is_off or else not live_type.type.is_native_array_collector_enabled then
               flag := no
            else
               fs := live_type.type.feature_stamp_of(mark_item_name)
               if fs = Void then
                  error_handler.append("Internal problem while searching for %"mark_item%".")
                  error_handler.print_as_warning
               else
                  af := fs.anonymous_feature(live_type.type)
                  args := af.arguments
                  if args.name(1).resolve_in(live_type.type).generic_list.first.is_reference then
                     flag := yes
                  end
               end
            end
            live_type.set_extra_collected(tag, flag)
         elseif flag.item then
            -- Must collect `mark_native_arrays':
            fs := live_type.type.feature_stamp_of(mark_native_arrays_name)
            if fs = Void then
               error_handler.append("Internal problem for %"mark_native_arrays%".")
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
   make is
      do
      end

   tag: FIXED_STRING is
      once
         Result := "native_array_collector".intern
      end

   yes: LIVE_TYPE_EXTRA_COLLECTED_FLAG is
      once
         create Result.as_true
      end

   no: LIVE_TYPE_EXTRA_COLLECTED_FLAG is
      once
         create Result.as_false
      end

end -- class LIVE_TYPE_NATIVE_ARRAY_COLLECTOR
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
