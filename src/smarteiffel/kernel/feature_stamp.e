-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FEATURE_STAMP
   --
   -- FEATURE_STAMPs are globally allocated by the FEATURE_ACCUMULATOR.
   --

inherit
   HASHABLE
   VISITABLE

insert
   GLOBALS

create {FEATURE_ACCUMULATOR}
   make

feature {ANY}
   name: FEATURE_NAME
         -- The corresponding unique one for this `name'.

feature {}
   make (n: like name)
      require
         n /= Void
      do
         name := n
         hash_code := n.hash_code
         create roots.make
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE, TYPE]} anonymous_features.with_capacity(5)
         debug
            debug_info := n.to_string.twin
         end
      ensure
         name = n
      end

feature {FEATURE_STAMP}
   debug_info: STRING

feature {ANY}
   has_run_feature_for (t: TYPE): BOOLEAN
      do
         if run_features /= Void then
            Result := run_features.fast_has(t)
         end
      end

   run_feature_for (t: TYPE): RUN_FEATURE
      require
         has_run_feature_for(t) --|*** fn = t.get_feature_name(Current)
      do
         debug ("run_feature_for")
            if not has_run_feature_for(t) then
               error_handler.append(once "Feature ")
               if anonymous_features.is_empty then
                  error_handler.append(once " ??? ")
               else
                  error_handler.append(anonymous_features.item(1).first_name.to_string)
               end
               -- TODO: translate error message
               error_handler.append(once " non collectee dans ")
               error_handler.append(t.name.to_string)
               error_handler.append(once "... ca va planter.")
               error_handler.print_as_warning
               sedb_breakpoint
            end
         end
         Result := run_features.fast_reference_at(t)
      ensure
         Result /= Void
      end

feature {LIVE_TYPE}
   make_run_feature (t: TYPE; fn: FEATURE_NAME)
      require
         has_anonymous_feature_for(t)
         not has_run_feature_for(t)
      do
         if run_features = Void then
            create {HASHED_DICTIONARY[RUN_FEATURE, TYPE]} run_features.with_capacity(anonymous_features.count)
         end
         check
            not run_features.fast_has(t)
         end
         run_features.add(anonymous_feature(t).brand_new_run_feature_for(t, fn, False), t)
      ensure
         run_feature_for(t) /= Void
      end

   simplify (t: TYPE): ANONYMOUS_FEATURE
         -- MUST NOT BE CALLED BY ANYONE EXCEPT LIVE_TYPE (because
         -- LIVE_TYPE keeps memory of the link between FS and ANONYMOUS_FEATURE)
      local
         af: ANONYMOUS_FEATURE
      do
         af := anonymous_features.fast_at(t)
         smart_eiffel.push_context(af)
         Result := af.simplify(t)
         smart_eiffel.pop_context(af)
         if Result /= af then
            anonymous_features.fast_put(Result, t)
         end
      end

   contextual_simplify (t: TYPE): ANONYMOUS_FEATURE
         -- MUST NOT BE CALLED BY ANYONE EXCEPT LIVE_TYPE (because
         -- LIVE_TYPE keeps memory of the link between FS and ANONYMOUS_FEATURE)
      local
         af: ANONYMOUS_FEATURE
      do
         af := anonymous_features.fast_at(t)
         Result := af.contextual_simplify(t)
         if Result /= af then
            anonymous_features.fast_put(Result, t)
         end
      end

feature {LIVE_TYPE}
   update_anonymous_feature (type: TYPE; af: ANONYMOUS_FEATURE)
      require
         anonymous_features.at(type) /= af
      do
         anonymous_features.fast_put(af, type)
      end

feature {ANY}
   has_anonymous_feature_for (a_type: TYPE): BOOLEAN
      do
         Result := anonymous_features.fast_reference_at(a_type) /= Void
      ensure
         Result implies has_type(a_type)
      end

   has_type (a_type: TYPE): BOOLEAN
      do
         Result := anonymous_features.fast_has(a_type)
      end

   hash_code: INTEGER

   accept (visitor: FEATURE_STAMP_VISITOR)
      do
         visitor.visit_feature_stamp(Current)
      end

feature {FEATURE_ACCUMULATOR}
   rename_notify (context_type, parent_type: TYPE; parent_edge: PARENT_EDGE; parent_feature_stamp: FEATURE_STAMP)
      require
         context_type /= Void
         parent_type /= Void
         context_type /= parent_type
         parent_edge.do_rename(parent_feature_stamp.name).is_equal(name)
         --|*** If you are feeling brave, please turn the following comment into an executable assertion. <FM-25/03/2006>
         -- must be called with `parent_type' growing in topological order (i.e. never heir before ancestor),
         -- or else `resolve_static_binding_for' can fail.
      local
         do_add, stop: BOOLEAN; index: INTEGER; context_class, parent_class: CLASS_TEXT
      do
         context_class := context_type.class_text
         parent_class := parent_type.class_text
         do_add := True
         if rename_up_context_class = Void then
            create rename_up_context_class.with_capacity(4)
            create rename_up_parent_class.with_capacity(4)
            create rename_up_edge.with_capacity(4)
            create rename_up_parent_feature_stamp.with_capacity(4)
         elseif context_type.is_generic then
            --|*** This test is probably not too expensive.  Still, I think it's possible to do without it
            --|*** (think `is_validity_check_site') <FM-26/03/2006>
            from
               index := rename_up_edge.fast_first_index_of(parent_edge)
               stop := not rename_up_edge.valid_index(index)
            until
               stop
            loop
               stop := rename_up_parent_feature_stamp.item(index) = parent_feature_stamp
               if stop then
                  check
                     rename_up_context_class.item(index) = context_class
                     rename_up_parent_class.item(index) = parent_class
                  end
                  -- We have already been notified:
                  do_add := False
               else
                  index := rename_up_edge.fast_index_of(parent_edge, index + 1)
                  stop := not rename_up_edge.valid_index(index)
               end
            end
         end
         if do_add then
            rename_up_context_class.add_last(context_class)
            rename_up_parent_class.add_last(parent_class)
            rename_up_edge.add_last(parent_edge)
            rename_up_parent_feature_stamp.add_last(parent_feature_stamp)
            parent_feature_stamp.rename_down_notify(parent_class, context_class, parent_edge, Current)
            debug
               debug_info.append(" [rename_up "
                                 + context_class.name.to_string
                                   + " " + parent_feature_stamp.name.to_string
                                     + " in " + parent_class.name.to_string + "]")
            end
         end
      end

feature {FEATURE_STAMP}
   rename_down_notify (context_class, child_class: CLASS_TEXT; edge: PARENT_EDGE; child_feature_stamp: FEATURE_STAMP)
      do
         if rename_down_context_class = Void then
            create rename_down_context_class.with_capacity(4)
            create rename_down_child_class.with_capacity(4)
            create rename_down_edge.with_capacity(4)
            create rename_down_child_feature_stamp.with_capacity(4)
         end
         rename_down_context_class.add_last(context_class)
         rename_down_child_class.add_last(child_class)
         rename_down_edge.add_last(edge)
         rename_down_child_feature_stamp.add_last(child_feature_stamp)
         debug
            debug_info.append(" [rename_down "
                              + context_class.name.to_string
                                + " " + child_feature_stamp.name.to_string
                                  + " in " + child_class.name.to_string + "]")
         end
      end

feature {ANY}
   has_root (type: TYPE): BOOLEAN
      require
         type /= Void
      do
         Result := roots.fast_has(type)
      end

feature {FEATURE_ACCUMULATOR}
   add_root (type: TYPE)
      require
         type /= Void
         not_so_sure: not has_root(type)
      do
         roots.fast_add(type)
         debug
            debug_info.append(" [root in " + type.name.to_string + "]")
         end
      ensure
         has_root(type)
      end

   add_anonymous_feature (an_af: ANONYMOUS_FEATURE; a_type: TYPE)
      require
         an_af /= Void
         has_type(a_type)
         not has_anonymous_feature_for(a_type)
      do
         anonymous_features.fast_put(an_af, a_type)
         debug
            if debug_info = Void then
               debug_info := a_type.name.to_string.twin
               debug_info.extend('.')
               an_af.names.first.complete_name_in(debug_info)
            end
         end
      ensure
         has_anonymous_feature_for(a_type)
      end

feature {ANY}
   anonymous_feature (target_type: TYPE): ANONYMOUS_FEATURE
      require
         target_type /= Void
         has_anonymous_feature_for(target_type)
      do
         Result := anonymous_features.fast_reference_at(target_type)
         if Result = Void then
            error_handler.add_position(name.start_position)
            error_handler.append(once "Cannot find the feature ")
            error_handler.append(name.to_string)
            error_handler.append(once " in type ")
            error_handler.append(target_type.name.to_string)
            error_handler.append(once ". Compiler lost! ")
            --error_handler.print_as_internal_error
         end
      ensure
         Result = Void implies not error_handler.is_empty
      end

   resolve_static_binding_for (declaration_type, new_type: TYPE): FEATURE_STAMP
         -- Assuming that `name' is the feature called in `declaration_type', looks for the
         -- corresponding one to be called in `new_type'.
      require
         declaration_type /= Void
         new_type /= Void
         declaration_type.class_text = new_type.class_text or else new_type.insert_inherit_test(declaration_type) /= unrelated_code
      local
         declaration_class, new_class: CLASS_TEXT
      do
         declaration_class := declaration_type.class_text
         new_class := new_type.class_text
         if new_class = declaration_class or else new_class.inherits_from(declaration_class) then
            Result := resolve_static_binding_for_inherit(declaration_class, new_class)
         else
            Result := resolve_static_binding_for_insert(declaration_class, new_class)
         end
      end

feature {FEATURE_STAMP}
   resolve_static_binding_for_inherit (declaration_class, new_class: CLASS_TEXT): FEATURE_STAMP
         -- Assuming that `name' is the feature called in `declaration_class', looks for the corresponding one
         -- to be called in `new_class'. Only inherit links are considered.
      require
         declaration_class /= Void
         new_class /= Void
         declaration_class = new_class or else new_class.inherits_from(declaration_class)
      local
         i: INTEGER; context_class, child_class: CLASS_TEXT
      do
         if rename_down_edge = Void then
            -- No rename, well, it can be only the same one (very common):
            Result := Current
         elseif declaration_class = new_class then
            -- Again, the same one (common too):
            Result := Current
         elseif new_class.obvious_resolve_static_binding(declaration_class, False) then
            Result := Current
         else
            check
               rename_down_edge /= Void
            end
            -- Warning: the next two loops are very brittle. They only work because rename_down_context_class
            -- is topologically sorted (ancestors first). You don't want to change the loop's direction. Have
            -- a look at test_rename9 if you still want to change the loops.

            -- Looking first for a direct match
            from
               i := rename_down_context_class.lower
            until
               Result /= Void or else i > rename_down_context_class.upper
            loop
               if rename_down_context_class.item(i) = declaration_class and then
                  rename_down_child_class.item(i) = new_class and then
                  rename_down_edge.item(i).is_inherit_member
                then
                  -- Exactly what we are looking for:
                  Result := rename_down_child_feature_stamp.item(i)
               end
               i := i + 1
            end
            if Result = Void then
               -- Looking for a possible path:
               from
                  i := rename_down_context_class.lower
               until
                  Result /= Void or else i > rename_down_context_class.upper
               loop
                  if rename_down_edge.item(i).is_inherit_member then
                     context_class := rename_down_context_class.item(i)
                     if context_class = declaration_class then
                        child_class := rename_down_child_class.item(i)
                        if new_class /= child_class then
                           if new_class.inherits_from(child_class) then
                              Result := rename_down_child_feature_stamp.item(i)
                              Result := Result.resolve_static_binding_for_inherit(child_class, new_class)
                           end
                        end
                     elseif context_class.inherits_from(declaration_class) then
                        child_class := rename_down_child_class.item(i)
                        if child_class = new_class then
                           -- Exactly what we are looking for:
                           Result := rename_down_child_feature_stamp.item(i)
                        elseif new_class.inherits_from(child_class) then
                           Result := rename_down_child_feature_stamp.item(i).resolve_static_binding_for_inherit(child_class, new_class)
                        end
                     end
                  end
                  i := i + 1
               end
               if Result = Void then
                  -- Finally, there is no rename:
                  Result := Current
               end
            end
         end
      end

   resolve_static_binding_for_insert (declaration_class, new_class: CLASS_TEXT): FEATURE_STAMP
         -- Assuming that `name' is the feature called in `declaration_class', looks for the corresponding one
         -- to be called in `new_class'.  Inherit and insert links are considered.
      require
         declaration_class /= Void
         new_class /= Void
         declaration_class = new_class or else new_class.insert_inherit_test(declaration_class) /= unrelated_code
      local
         i, insert_inherit_code: INTEGER; context_class, child_class: CLASS_TEXT
      do
         if rename_down_edge = Void then
            -- No rename, well, it can be only the same one (very common):
            Result := Current
         elseif declaration_class = new_class then
            -- Again, the same one (common too):
            Result := Current
         elseif new_class.obvious_resolve_static_binding(declaration_class, True) then
            Result := Current
         else
            check
               rename_down_edge /= Void
            end
            -- Warning: the next two loops are very brittle. They only work because rename_down_context_class
            -- is topologically sorted (ancestors first). You don't want to change the loop's direction. Have
            -- a look at test_rename9 if you still want to change the loops.

            -- Looking first for a direct match
            from
               i := rename_down_context_class.lower
            until
               i > rename_down_context_class.upper
            loop
               if rename_down_context_class.item(i) = declaration_class and then
                  rename_down_child_class.item(i) = new_class then
                  -- Exactly what we are looking for:
                  if Result = Void then
                     Result := rename_down_child_feature_stamp.item(i)
                  else
                     --***
                  end
               end
               i := i + 1
            end
            from
               i := rename_down_context_class.lower
            until
               i > rename_down_context_class.upper
            loop
               context_class := rename_down_context_class.item(i)
               if context_class = declaration_class then
                  child_class := rename_down_child_class.item(i)
                  if new_class /= child_class then
                     insert_inherit_code := new_class.insert_inherit_test(child_class)
                     if insert_inherit_code /= unrelated_code then
                        if Result = Void then
                           Result := rename_down_child_feature_stamp.item(i)
                           Result := Result.resolve_static_binding_for_insert(child_class, new_class)
                        else
                           --***
                        end
                     end
                  end
               else
                  insert_inherit_code := context_class.insert_inherit_test(declaration_class)
                  if insert_inherit_code /= unrelated_code then
                     child_class := rename_down_child_class.item(i)
                     if child_class = new_class then
                        -- Exactly what we are looking for:
                        if Result = Void then
                           Result := rename_down_child_feature_stamp.item(i)
                        else
                           --***
                        end
                     else
                        insert_inherit_code := new_class.insert_inherit_test(child_class)
                        if insert_inherit_code /= unrelated_code then
                           if Result = Void then
                              Result := rename_down_child_feature_stamp.item(i).resolve_static_binding_for_insert(child_class, new_class)
                           else
                              --***
                           end
                        end
                     end
                  end
               end
               i := i + 1
            end
            if Result = Void then
               -- Finally, there is no rename:
               Result := Current
            end
         end
      end

feature {ANY}
   no_rename: BOOLEAN
      do
         Result := rename_down_edge = Void
      end

feature {ANY}
   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      require
         has_type(parent_type)
         new_type /= parent_type
         new_type /= Void
         parent_edge /= Void
         new_type.direct_thru_step(parent_type, parent_edge)
      local
         new_name: like name
      do
         new_name := parent_edge.do_rename(name)
         if new_name = name then
            Result := Current
         else
            --| **** TODO fix TEST_INHERIT2, problem seems to be around here (bad renaming)
            --|if name.to_string.has_suffix(once "reset") then
            --|   io.put_line("{#(1)}.#(2) -> {#(3)}.#(4)" # parent_type.name.to_string # name.to_string # new_type.name.to_string # new_name.to_string)
            --|end
            Result := feature_accumulator.feature_stamp_of(new_name)
         end
      ensure
         Result = new_type.lookup(parent_edge.do_rename(parent_type.get_feature_name(Current)))
      end

feature {TYPE, LIVE_TYPE, CREATION_CLAUSE}
   anonymous_feature_if_exist (target_type: TYPE): ANONYMOUS_FEATURE
      require
         target_type /= Void
      do
         Result := anonymous_features.fast_reference_at(target_type)
      end

feature {TYPE}
   register_type (type: TYPE)
      do
         anonymous_features.add(Void, type)
      ensure
         has_type(type)
      end

   add_seeds (type: TYPE; parent_edge: PARENT_EDGE; seed_set: SET[ABSOLUTE_FEATURE_NAME]; inherit_link: BOOLEAN): BOOLEAN
      require
         type /= Void
         parent_edge /= Void
         seed_set /= Void
      local
         i: INTEGER; fs: like Current
      do
         --|*** This implementation is quite slow. Maybe it is possible to take shortcuts like
         --|*** resolve_static_binding does. <FM-26/03/2006>
         if has_type(type) and then (rename_down_edge = Void or else not rename_down_edge.fast_has(parent_edge)) then
            Result := True
            type.add_seeds(Current, seed_set, inherit_link)
         end
         if rename_up_edge /= Void then
            from
               i := rename_up_edge.fast_first_index_of(parent_edge)
            until
               not rename_up_edge.valid_index(i)
            loop
               fs := rename_up_parent_feature_stamp.item(i)
               if fs.has_type(type) then
                  Result := True
                  type.add_seeds(fs, seed_set, inherit_link)
               end
               i := rename_up_edge.fast_index_of(parent_edge, i + 1)
            end
         end
      end

   print_feature_hierarchy(type: TYPE; parent_edge: PARENT_EDGE; seed: ABSOLUTE_FEATURE_NAME; inherit_link: BOOLEAN): BOOLEAN
      require
         type /= Void
         parent_edge /= Void
      local
         i: INTEGER; fs: like Current
      do
         if has_type(type) and then (rename_down_edge = Void or else not rename_down_edge.fast_has(parent_edge)) then
            Result := type.print_feature_hierarchy(Current, seed, inherit_link)
         end
         if rename_up_edge /= Void then
            from
               i := rename_up_edge.fast_first_index_of(parent_edge)
            until
               not rename_up_edge.valid_index(i)
            loop
               fs := rename_up_parent_feature_stamp.item(i)
               if fs.has_type(type) then
                  Result := type.print_feature_hierarchy(fs, seed, inherit_link)
               end
               i := rename_up_edge.fast_index_of(parent_edge, i + 1)
            end
         end
      end

   specialize_and_check (t: TYPE)
      require
         has_type(t)
         has_anonymous_feature_for(t)
      local
         af1, af2: ANONYMOUS_FEATURE
      do
         af1 := anonymous_features.fast_at(t)
         af2 := af1.specialize_and_check(t)
         if af1 /= af2 then
            anonymous_features.fast_put(af2, t)
         end
      ensure
         has_anonymous_feature_for(t)
      end

feature {CECIL_ENTRY, ADDRESS_OF}
   fake_feature_call (start_position: POSITION; target: EXPRESSION; target_type: TYPE): CODE
         -- Creates the corresponding fake call.
      require
         target_type /= Void
      local
         af: ANONYMOUS_FEATURE; fake_arguments: EFFECTIVE_ARG_LIST
         procedure_call: PROCEDURE_CALL; function_call: FUNCTION_CALL
         feature_name: like name
      do
         feature_name := name.twin
         feature_name.set_start_position(start_position)
         af := Current.anonymous_feature(target_type)
         fake_arguments := fake_effective_arg_list(start_position, target_type, af)
         -- Let's now create the corresponding fake `code':
         if af.result_type = Void then
            if fake_arguments = Void then
               create {PROCEDURE_CALL_0} procedure_call.make(target, feature_name)
            elseif fake_arguments.count = 1 then
               create {PROCEDURE_CALL_1} procedure_call.make(target, feature_name, fake_arguments)
            else
               create {PROCEDURE_CALL_N} procedure_call.make(target, feature_name, fake_arguments)
            end
            procedure_call.set_feature_stamp(Current)
            Result := procedure_call
         else
            if fake_arguments = Void then
               create {FUNCTION_CALL_0} function_call.make(target, feature_name)
            elseif fake_arguments.count = 1 then
               create {FUNCTION_CALL_1} function_call.make(target, feature_name, fake_arguments)
            else
               create {FUNCTION_CALL_N} function_call.make(target, feature_name, fake_arguments)
            end
            function_call.set_feature_stamp(Current)
            Result := function_call
         end
      ensure
         Result.start_position = start_position
      end

feature {}
   fake_effective_arg_list (start_position: POSITION; target_type: TYPE; af: ANONYMOUS_FEATURE): EFFECTIVE_ARG_LIST_N
         -- Note: not moved in ANONYMOUS_FEATURE because we don't need to add more dispatch.
      local
         first: FAKE_ARGUMENT; remainder: FAST_ARRAY[EXPRESSION]; fake_argument: FAKE_ARGUMENT
         fal: FORMAL_ARG_LIST; i: INTEGER
      do
         fal := af.arguments
         if fal /= Void then
            create first.make(target_type, start_position, fal.type_mark(1), 1)
            if fal.count > 1 then
               from
                  create remainder.with_capacity(fal.count - 1)
                  i := 2
               until
                  i > fal.count
               loop
                  create fake_argument.make(target_type, start_position, fal.type_mark(i), i)
                  remainder.add_last(fake_argument)
                  i := i + 1
               end
               create Result.make_n(start_position, first, remainder)
            else
               create Result.make_1(start_position, first)
            end
         end
      end

feature {}
   roots: HASHED_SET[TYPE]
         -- The set of seeds for the corresponding features (i.e. the set of types where the corresponding
         -- feature is newly defined. Examples: the FEATURE_STAMP of `is_equal' has ANY in its `roots'
         -- and the FEATURE_STAMP for `add_last' has both COLLECTION and STRING for example.
         -- *** NOT YET USED. CHECK IF IT IS USEFUL *** Dom march 17th 2006 ***

   anonymous_features: DICTIONARY[ANONYMOUS_FEATURE, TYPE]

   rename_up_context_class: FAST_ARRAY[CLASS_TEXT]

   rename_up_parent_class: FAST_ARRAY[CLASS_TEXT]

   rename_up_edge: FAST_ARRAY[PARENT_EDGE]

   rename_up_parent_feature_stamp: FAST_ARRAY[FEATURE_STAMP]

   rename_down_context_class: FAST_ARRAY[CLASS_TEXT]

   rename_down_child_class: FAST_ARRAY[CLASS_TEXT]

   rename_down_edge: FAST_ARRAY[PARENT_EDGE]

   rename_down_child_feature_stamp: FAST_ARRAY[FEATURE_STAMP]

   run_features: DICTIONARY[RUN_FEATURE, TYPE]

   hash_counter: COUNTER
      once
         create Result
      end

   next_hash: INTEGER
      do
         hash_counter.next
         Result := hash_counter.item
      end

invariant
   name /= Void

   anonymous_features /= Void

end -- class FEATURE_STAMP
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
