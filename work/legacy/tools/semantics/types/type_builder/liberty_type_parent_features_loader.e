-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_TYPE_PARENT_FEATURES_LOADER
   --
   -- Loads the type's parents' features.
   --
   -- Also loads the parent invariant.
   --

insert
   LIBERTY_TYPE_BUILDER_TOOLS

create {LIBERTY_TYPE_BUILDER}
   make

feature {}
   make (a_builder: like builder; a_current_entity: like current_entity; a_universe: like universe; a_effective_generic_parameters: like effective_generic_parameters; a_redefined_features: like redefined_features)
      require
         a_builder /= Void
         a_current_entity /= Void
         a_universe /= Void
         a_effective_generic_parameters /= Void
         a_redefined_features /= Void
      do
         builder := a_builder
         current_entity := a_current_entity
         type := a_current_entity.result_type
         universe := a_universe
         effective_generic_parameters := a_effective_generic_parameters
         create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]} parent_features.with_capacity(50) -- ANY contains 50 features
         redefined_features := a_redefined_features
      ensure
         builder = a_builder
         current_entity = a_current_entity
         universe = a_universe
         effective_generic_parameters = a_effective_generic_parameters
         redefined_features = a_redefined_features
      end

   universe: LIBERTY_UNIVERSE

feature {LIBERTY_TYPE_BUILDER}
   load
      local
         has_parents: BOOLEAN
      do
         has_parents := inject_parents(type.ast.inherit_clause, False)
         has_parents := inject_parents(type.ast.insert_clause, has_parents)
         if not has_parents and then not errors.has_error then
            inject_parent_invariant(universe.type_any)
            inject_parent_features(universe.type_any, Void)
         end
         push_parent_features_in_type
         if not redefined_features.is_empty then
            builder.set_redefined_features(redefined_features)
         end
      end

feature {}
   inject_parents (parents: LIBERTY_AST_LIST[LIBERTY_AST_PARENT]; had_parents: BOOLEAN): BOOLEAN
      local
         i: INTEGER; parent_clause: LIBERTY_AST_PARENT
         parent: LIBERTY_TYPE; actual_parent: LIBERTY_ACTUAL_TYPE
      do
         from
            Result := had_parents
            i := parents.list_lower
         until
            errors.has_error or else i > parents.list_upper
         loop
            parent_clause := parents.list_item(i)
            parent := type_lookup.resolver.type(parent_clause.type_definition)
            if parent = Void then
               --|*** TODO: error, parent not found
               not_yet_implemented
            end
            actual_parent ::= parent.known_type
            check
               type.is_child_of(actual_parent)
            end
            inject_parent_invariant(actual_parent)
            inject_parent_features(actual_parent, parent_clause.parent_clause)
            Result := True
            i := i + 1
         end
      end

   inject_parent_invariant (parent: LIBERTY_ACTUAL_TYPE)
      do
         --|*** TODO
      end

   inject_parent_features (parent: LIBERTY_ACTUAL_TYPE; clause: LIBERTY_AST_PARENT_CLAUSE)
      local
         i: INTEGER; fd, parent_fd, actual_fd: LIBERTY_FEATURE_DEFINITION; feature_name: LIBERTY_FEATURE_NAME
         pf: like parent_features; rf_count: INTEGER
         precursor_feature: LIBERTY_FEATURE
      do
         create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]} pf.with_capacity(parent.features.count)
         from
            i := parent.features.lower
         until
            i > parent.features.upper
         loop
            feature_name := parent.features.key(i)
            parent_fd := parent.features.item(i)
            check
               parent_fd.current_type = parent
            end
            fd := parent_fd.specialized_in(type)
            check
               fd /= parent_fd
            end
            if fd.has_precursor(parent) then
               breakpoint
            else
               precursor_feature := fd.the_feature.specialized_in(type)
               fd.add_precursor(precursor_feature, parent)
            end
            pf.add(fd, feature_name)
            i := i + 1
         end
         if clause /= Void and then clause.has_clauses then
            rename_features(pf, clause.rename_clause, parent)
            export_features(pf, clause.export_clause)
            undefine_features(parent, pf, clause.undefine_clause)
            rf_count := redefine_features(parent, pf, clause.redefine_clause)
            if rf_count > 0 and then redefined_features.is_empty then
               -- create a new collection because the default empty collection is shared
               create {HASHED_DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]} redefined_features.with_capacity(rf_count)
            end
         end
         from
            i := pf.lower
         until
            i > pf.upper
         loop
            feature_name := pf.key(i)
            fd := pf.item(i)
            actual_fd := parent_features.reference_at(feature_name)
            if actual_fd = Void then
               parent_features.add(fd, feature_name)
               debug ("type.building.internals")
                  log.trace.put_string(once " <=> ")
                  log.trace.put_string(parent.full_name)
                  log.trace.put_string(once ": late binding down to ")
                  log.trace.put_string(type.full_name)
                  log.trace.put_string(once " of feature ")
                  log.trace.put_line(feature_name.full_name)
               end
               precursor_feature := fd.the_feature.specialized_in(type)
               check
                  precursor_feature.current_type = type
               end
               fd.the_feature.bind(precursor_feature, type)
               if not fd.has_precursor(parent) then
                  fd.add_precursor(precursor_feature, parent)
               end
               actual_fd := fd
            else
               debug ("type.building.internals")
                  log.trace.put_string(once " <=> ")
                  log.trace.put_string(parent.full_name)
                  log.trace.put_string(once ": joining in ")
                  log.trace.put_string(type.full_name)
                  log.trace.put_string(once " of feature ")
                  log.trace.put_line(feature_name.full_name)
               end
               actual_fd.join(fd, parent)
               check
                  actual_fd.feature_name.is_equal(feature_name)
               end
               actual_fd.the_feature.bind(actual_fd.the_feature, type)
            end
            actual_fd.the_feature.add_if_redefined(type, feature_name, redefined_features)
            check
               actual_fd.has_precursor(parent)
               actual_fd.the_feature.bound(type) = actual_fd.the_feature
            end

            i := i + 1
         end
      end

   rename_features (pf: like parent_features; clause: LIBERTY_AST_PARENT_RENAME; parent: LIBERTY_ACTUAL_TYPE)
      local
         i: INTEGER; r: LIBERTY_AST_RENAME; old_name, new_name: LIBERTY_FEATURE_NAME
         fd, fd2: LIBERTY_FEATURE_DEFINITION
      do
         from
            i := clause.list_lower
         until
            i > clause.list_upper
         loop
            r := clause.list_item(i)
            create old_name.make_from_ast(r.old_name.feature_name_or_alias, type.ast, type.file)
            create new_name.make_from_ast(r.new_name.feature_name_or_alias, type.ast, type.file)
            fd := pf.reference_at(old_name)
            if fd = Void then
               errors.add_position(old_name.position)
               errors.set(level_error, once "Cannot rename inexistent feature: " + old_name.name)
            else
               fd2 := pf.reference_at(new_name)
               if fd2 = Void then
                  pf.remove(old_name)
                  fd.re_name(new_name)
                  pf.add(fd, new_name)
               else
                  pf.remove(old_name)
                  fd2.join(fd, parent)
                  --|*** TODO: how to know that that particular join provoked an error?
                  --if errors.has_error then
                  --   errors.add_position(new_name.position)
                  --   errors.set(level_error, once "Cannot rename feature (another feature with the same name exists): " + new_name.name)
                  --end
               end
            end
            i := i + 1
         end
      end

   export_features (pf: like parent_features; clause: LIBERTY_AST_PARENT_EXPORT)
      local
         i, j: INTEGER; e: LIBERTY_AST_EXPORT; ef: LIBERTY_AST_EXPORT_FEATURES; feature_name: LIBERTY_FEATURE_NAME; fn: LIBERTY_AST_FEATURE_NAME
         clients: COLLECTION[LIBERTY_TYPE]
         fd: LIBERTY_FEATURE_DEFINITION
      do
         from
            i := clause.list_lower
         until
            i > clause.list_upper
         loop
            e := clause.list_item(i)
            clients := list_clients(e.clients)
            ef := e.features
            if ef.is_all then
               from
                  j := pf.lower
               until
                  j > pf.upper
               loop
                  --|*** TODO: wrong! "all" should only change the clients of those not specifically changed.
                  pf.item(j).set_clients(clients)
                  j := j + 1
               end
            else
               from
                  j := ef.feature_names.lower
               until
                  j > ef.feature_names.upper
               loop
                  fn ::= ef.feature_names.item(j)
                  create feature_name.make_from_ast(fn.feature_name_or_alias, type.ast, type.file)
                  fd := pf.reference_at(feature_name)
                  if fd = Void then
                     errors.add_position(feature_name.position)
                     errors.set(level_error, once "Cannot change export of inexistent feature: " + feature_name.name)
                  else
                     fd.set_clients(clients)
                  end
                  j := j + 1
               end
            end
            i := i + 1
         end
      end

   undefine_features (parent: LIBERTY_ACTUAL_TYPE; pf: like parent_features; clause: LIBERTY_AST_PARENT_UNDEFINE)
         -- replace the feature by a LIBERTY_FEATURE_DEFERRED
      local
         i: INTEGER; feature_name: LIBERTY_FEATURE_NAME; fd: LIBERTY_FEATURE_DEFINITION
         inherited_feature: LIBERTY_FEATURE; deferred_feature: LIBERTY_FEATURE_DEFERRED
      do
         from
            i := clause.list_lower
         until
            i > clause.list_upper
         loop
            create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias, type.ast, type.file)
            fd := pf.reference_at(feature_name)
            if fd = Void then
               errors.add_position(feature_name.position)
               errors.set(level_error, once "Cannot undefine inexistent feature: " + feature_name.name)
            elseif fd.is_frozen then
               errors.add_position(feature_name.position)
               errors.set(level_error, once "Cannot undefine frozen feature: " + feature_name.name)
            else
               inherited_feature := fd.the_feature.specialized_in(type)
               create deferred_feature.make(type)
               deferred_feature.set_precondition(inherited_feature.precondition)
               deferred_feature.set_postcondition(inherited_feature.postcondition)
               deferred_feature.set_context(inherited_feature.context)
               deferred_feature.set_type_resolver(inherited_feature.type_resolver, True)
               debug ("type.building.internals")
                  log.trace.put_string(once " <=> ")
                  log.trace.put_string(parent.full_name)
                  log.trace.put_string(once ": late binding down to ")
                  log.trace.put_string(type.full_name)
                  log.trace.put_string(once " of undefined feature ")
                  log.trace.put_line(feature_name.full_name)
               end
               deferred_feature.replace(inherited_feature, type)
               fd.set_the_feature(deferred_feature)
            end
            i := i + 1
         end
      end

   redefine_features (parent: LIBERTY_ACTUAL_TYPE; pf: like parent_features; clause: LIBERTY_AST_PARENT_REDEFINE): INTEGER
         -- replace the feature by a LIBERTY_FEATURE_REDEFINED
      local
         i: INTEGER; feature_name: LIBERTY_FEATURE_NAME; fd: LIBERTY_FEATURE_DEFINITION
         inherited_feature: LIBERTY_FEATURE; redefined_feature: LIBERTY_FEATURE
      do
         Result := clause.list_count
         if Result > 0 then
            from
               i := clause.list_lower
            until
               i > clause.list_upper
            loop
               create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias, type.ast, type.file)
               fd := pf.reference_at(feature_name)
               if fd = Void then
                  errors.add_position(feature_name.position)
                  errors.set(level_error, once "Cannot redefine inexistent feature: " + feature_name.name)
               elseif fd.is_frozen then
                  errors.add_position(feature_name.position)
                  errors.set(level_error, once "Cannot redefine frozen feature: " + feature_name.name)
               else
                  inherited_feature := fd.the_feature.specialized_in(type)
                  if inherited_feature.bound(type).id = inherited_feature.id then
                     create {LIBERTY_FEATURE_REDEFINED} redefined_feature.make(type)
                     redefined_feature.set_precondition(inherited_feature.precondition)
                     redefined_feature.set_postcondition(inherited_feature.postcondition)
                     redefined_feature.set_context(inherited_feature.context)
                     redefined_feature.set_type_resolver(inherited_feature.type_resolver, True)
                     debug ("type.building.internals")
                        log.trace.put_string(once " <=> ")
                        log.trace.put_string(parent.full_name)
                        log.trace.put_string(once ": late binding down to ")
                        log.trace.put_string(type.full_name)
                        log.trace.put_string(once " of redefined feature ")
                        log.trace.put_line(feature_name.full_name)
                     end
                     redefined_feature.replace(inherited_feature, type)
                  else
                     --|*** TODO: ??? is it possible to have a non-related feature here???
                     redefined_feature := inherited_feature.bound(type)
                  end
                  fd.set_the_feature(redefined_feature)
               end

               i := i + 1
            end
         end
      end

   push_parent_features_in_type
      local
         i: INTEGER
         fn, k: LIBERTY_FEATURE_NAME
         f: LIBERTY_FEATURE_DEFINITION
      do
         from
            i := parent_features.lower
         until
            i >  parent_features.upper
         loop
            f := parent_features.item(i)
            fn := f.feature_name
            debug
               k := parent_features.key(i)
               check
                  fn.is_equal(k)
               end
            end
            if not type.has_feature(fn) then
               torch.burn
               type.add_feature(f)
            else
               check
                  type.features.reference_at(fn) = f
               end
            end
            i := i + 1
         end
      end

feature {}
   parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]
   redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]
   current_entity: LIBERTY_CURRENT

invariant
   parent_features /= Void
   redefined_features /= Void

end -- class LIBERTY_TYPE_PARENT_FEATURES_LOADER
