-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_GENERIC
   --
   -- Examples:
   --
   --      {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e' >> }
   --      {FAST_ARRAY[INTEGER] << 1, 2, 3 >> }
   --

inherit
   EXPRESSION
      redefine
         is_equal
      end
   HASHABLE

create {EIFFEL_PARSER, OLD_MANIFEST_ARRAY}
   make

feature {ANY}
   start_position: POSITION
         -- Of the opening curly bracket.

   type_mark: TYPE_MARK
         -- Of the created static TYPE.

   optional_arguments: FAST_ARRAY[EXPRESSION]
         -- Non Void if any.

   item_list: FAST_ARRAY[EXPRESSION]
         -- Which is never empty.

   semicolon_count: INTEGER
         -- When non 0, indicates that there are ";" separators used in the `item_list'.

   created_type: TYPE
         -- The unique corresponding one for `type_mark' (which can be only static).

   manifest_make_feature_stamp: FEATURE_STAMP
         -- Unique too (see `created_type')

   manifest_put_feature_stamp: FEATURE_STAMP
         -- Unique too (see `created_type')

   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_writable: BOOLEAN False

   is_void: BOOLEAN False

   is_result: BOOLEAN False

   is_static: BOOLEAN False

   is_manifest_string: BOOLEAN False

   hash_code: INTEGER
      require
         created_type /= Void
      do
         Result := created_type.hash_code
      end

   is_equal (other: like Current): BOOLEAN
      do
         check
            created_type /= Void
            other.created_type /= Void
         end
         Result := created_type = other.created_type
      end

   declaration_type: TYPE
      do
         if created_type /= Void then
            Result := created_type
         else
            Result := type_mark.type
         end
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := type_mark
      end

   use_current (type: TYPE): BOOLEAN
      do
         if optional_arguments /= Void then
            Result := use_current_of(type, optional_arguments)
         end
         if not Result then
            Result := use_current_of(type, item_list)
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := False
      end

   pretty (indent_level: INTEGER)
      local
         i, sc_count: INTEGER; left_margin: STRING
      do
         pretty_printer.put_string(once "{")
         pretty_printer.put_type_mark(type_mark)
         pretty_printer.put_character(' ')
         if optional_arguments /= Void then
            from
               i := optional_arguments.lower
            until
               i > optional_arguments.upper
            loop
               optional_arguments.item(i).pretty(indent_level)
               pretty_printer.put_string(once ", ")
               i := i + 1
            end
         end
         pretty_printer.put_string(once "<< ")
         left_margin := once ".........................."
         left_margin.clear_count
         pretty_printer.left_margin_in(left_margin)
         from
            i := item_list.lower
         until
            i > item_list.upper
         loop
            item_list.item(i).pretty(indent_level)
            i := i + 1
            sc_count := sc_count + 1
            if i <= item_list.upper then
               if semicolon_count > 0 and then sc_count = semicolon_count then
                  sc_count := 0
                  pretty_printer.put_string(once ";%N")
                  pretty_printer.put_string(left_margin)
               else
                  pretty_printer.put_string(once ", ")
               end
            end
         end
         pretty_printer.put_string(once " >> }")
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty(indent_level)
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty(indent_level)
         pretty_printer.put_character('.')
      end

   extra_bracket_flag: BOOLEAN False

   short (type: TYPE)
      local
         i: INTEGER
      do
         short_printer.hook_or(once "open_curly_bracket", once "{")
         type_mark.short(type)
         short_printer.hook_or(once "blank_space", once " ")
         if optional_arguments /= Void then
            from
               i := optional_arguments.lower
            until
               i > optional_arguments.upper
            loop
               optional_arguments.item(i).short(type)
               short_printer.hook_or(once "eal_sep", once ", ")
               i := i + 1
            end
         end
         short_printer.hook_or(once "op_ma", once "<<")
         from
            i := item_list.lower
         until
            i > item_list.upper
         loop
            item_list.item(i).short(type)
            i := i + 1
            if i <= item_list.upper then
               short_printer.hook_or(once "ma_sep", ", ")
            end
         end
         short_printer.hook_or(once "cl_ma", once ">>")
         short_printer.hook_or(once "blank_space", once " ")
         short_printer.hook_or(once "close_curly_bracket", once "}")
      end

   short_target (type: TYPE)
      do
         short(type)
         short_printer.put_dot
      end

   specialize_in (type: TYPE): like Current
      local
         oa: like optional_arguments; il: like item_list
      do
         type_mark.specialize_in(type)
         if optional_arguments /= Void then
            oa := specialize_in_of(type, optional_arguments)
         end
         il := specialize_in_of(type, item_list)
         if oa = optional_arguments and then il = item_list then
            Result := Current
         else
            Result := twin
            Result.init(oa, il)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         tm: like type_mark; oa: like optional_arguments; il: like item_list
      do
         tm := type_mark.specialize_thru(parent_type, parent_edge, new_type)
         check
            tm = type_mark -- is static.
         end
         if optional_arguments /= Void then
            oa := specialize_thru_of(parent_type, parent_edge, new_type, optional_arguments)
         end
         il := specialize_thru_of(parent_type, parent_edge, new_type, item_list)
         if oa = optional_arguments and then il = item_list then
            Result := Current
         else
            Result := twin
            Result.init(oa, il)
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         oa: like optional_arguments; il: like item_list; af: ANONYMOUS_FEATURE
         cst_att_boolean: CST_ATT_BOOLEAN; cst_att_integer: CST_ATT_INTEGER
         integer_constant: INTEGER_CONSTANT; formal_arg_list: FORMAL_ARG_LIST
         class_to_create: CLASS_TEXT; creation_clause_list: CREATION_CLAUSE_LIST
         mcn: FEATURE_NAME
      do
         if created_type = Void then
            -- We are checking some properties only once here.
            created_type := type_mark.resolve_in(type)
            class_to_create := created_type.class_text
            if class_to_create.is_deferred then
               error_handler.add_position(start_position)
               error_handler.add_position(class_to_create.name.start_position)
               error_handler.append(once "Type ")
               error_handler.append(created_type.name.to_string)
               error_handler.append(once " is deferred. (Cannot create object.)")
               error_handler.add_position(start_position)
               error_handler.print_as_fatal_error
            end
            creation_clause_list := class_to_create.creation_clause_list
            if creation_clause_list = Void then
               error_handler.add_position(start_position)
               error_handler.append(once "Class ")
               error_handler.append(class_to_create.name.to_string)
               error_handler.append(once " not correctly equiped for manifest generic creation (`manifest_creation' %
                                    %missing in the creation clause).")
               error_handler.print_as_fatal_error
            else
               mcn := smart_eiffel.manifest_creation_name
               if not class_to_create.has_creation_check(mcn, start_position, type, created_type) then
                  error_handler.add_position(start_position)
                  if creation_clause_list /= Void then
                     error_handler.add_position(creation_clause_list.start_position)
                  end
                  error_handler.append(once "Class ")
                  error_handler.append(class_to_create.name.to_string)
                  error_handler.append(once " not correctly equiped for manifest generic creation (`manifest_creation' %
                                       %missing in the creation clause).")
                  error_handler.print_as_fatal_error
               end
            end
            manifest_make_feature_stamp := created_type.feature_stamp_of(manifest_make_name)
            af := manifest_make_feature_stamp.anonymous_feature(created_type)
            formal_arg_list := af.arguments
            if optional_arguments = Void then
               if formal_arg_list.count > 1 then
                  error_handler.add_position(start_position)
                  error_handler.add_position(formal_arg_list.name(2).start_position)
                  error_handler.append(once "Missing argument before << ... >> item list.")
                  error_handler.print_as_fatal_error
               end
            elseif formal_arg_list.count /= (optional_arguments.count + 1) then
               error_handler.add_position(optional_arguments.first.start_position)
               error_handler.add_position(af.start_position)
               error_handler.append(once "Wrong number of arguments for manifest generic creation.")
               error_handler.print_as_fatal_error
            end
            manifest_put_feature_stamp := created_type.feature_stamp_of(manifest_put_name)
            af := created_type.feature_stamp_of(manifest_semicolon_check_name).anonymous_feature(created_type)
            if {CST_ATT_BOOLEAN} ?:= af then
               cst_att_boolean ::= af
               if {E_FALSE} ?:= cst_att_boolean.value then
                  if semicolon_count /= 0 then
                     if semicolon_count > 0 then
                        error_handler.add_position(start_position)
                     else
                        error_handler.add_position(irregular_position)
                     end
                     error_handler.add_position(cst_att_boolean.value.start_position)
                     error_handler.append(once "Must not use the %";%" (semicolon) separator for manifest ")
                     error_handler.append(created_type.class_text.name.to_string)
                     error_handler.append(once " creation.")
                     error_handler.print_as_fatal_error
                  end
               else
                  check
                     {E_TRUE} ?:= cst_att_boolean.value
                  end
                  if semicolon_count < 0 then
                     error_handler.add_position(irregular_position)
                     error_handler.append(once "Unexpected %";%" (semicolon) separator in manifest generic expression. %
                                                          %Less items found in this bunch than in the previous one.")
                     error_handler.print_as_fatal_error
                  end
               end
            else
               check {CST_ATT_INTEGER} ?:= af end
               cst_att_integer ::= af
               integer_constant ::= cst_att_integer.value
               if semicolon_count = integer_constant.value_memory then
                  -- The most common correct situation.
               elseif semicolon_count < 0 then
                  error_handler.add_position(irregular_position)
                  error_handler.append(once "Irregular number of items in bunches. The previous bunch is smaller.")
                  error_handler.print_as_error
                  error_handler.add_position(start_position)
                  error_handler.add_position(integer_constant.start_position)
                  error_handler.append(once "Actually, for class ")
                  error_handler.append(created_type.class_text.name.to_string)
                  error_handler.append(once ", each bunch must have exactly ")
                  error_handler.append(integer_constant.value_memory.to_string)
                  error_handler.append(once " items.")
                  error_handler.print_as_fatal_error
               elseif semicolon_count = 0 and then item_list.count = integer_constant.value_memory then
                  -- Only one bunch is correct too.
               else
                  check
                     semicolon_count > 0
                     semicolon_count /= integer_constant.value_memory
                  end
                  error_handler.add_position(start_position)
                  error_handler.add_position(integer_constant.start_position)
                  error_handler.append(once "Wrong usage of %";%" (semicolon) separator in manifest notation. %
                                                           %Each bunch-size must be a multiple of ")
                  error_handler.append(integer_constant.value_memory.to_string)
                  error_handler.append(once ". (Actual bunch size is ")
                  error_handler.append(semicolon_count.to_string)
                  error_handler.append(once ".)")
                  error_handler.print_as_fatal_error
               end
            end
         end -- of checks which are done only once.
         if optional_arguments /= Void then
            oa := optional_arguments_specialize_and_check(type)
         end
         il := item_list_specialize_and_check(type)
         if oa = optional_arguments and then il = item_list then
            Result := Current
         else
            Result := twin
            Result.init(oa, il)
         end
      end

   has_been_specialized: BOOLEAN
      do
         if optional_arguments /= Void then
            Result := has_been_specialized_of(optional_arguments)
         else
            Result := True
         end
         if Result then
            Result := has_been_specialized_of(item_list)
         end
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := created_type
         check
            Result = type_mark.resolve_in(type)
         end
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE; formal_arg_list: FORMAL_ARG_LIST; expression_type, destination_type: TYPE
         fal_idx, list_idx: INTEGER; expression: EXPRESSION
      do
         Result := created_type
         if Result.is_native_array then
            dummy := smart_eiffel.collect(Result, Result.feature_stamp_of(calloc_name), True)
            dummy := smart_eiffel.collect(Result, Result.feature_stamp_of(put_name), True)
         else
            dummy := smart_eiffel.collect(Result, manifest_make_feature_stamp, True)
            dummy := smart_eiffel.collect(Result, manifest_put_feature_stamp, True)
         end
         if optional_arguments /= Void then
            from
               list_idx := optional_arguments.upper
               formal_arg_list := manifest_make_feature_stamp.anonymous_feature(created_type).arguments
               fal_idx := formal_arg_list.count
            until
               list_idx < optional_arguments.lower
            loop
               expression := optional_arguments.item(list_idx)
               if not expression.is_void then
                  expression_type := expression.collect(type)
                  destination_type := formal_arg_list.type_mark(fal_idx).resolve_in(created_type)
                  assignment_handler.collect_normal(expression_type, destination_type)
               end
               list_idx := list_idx - 1
               fal_idx := fal_idx - 1
            end
         end
         -- Now collecting `item_list':
         from
            formal_arg_list := manifest_put_feature_stamp.anonymous_feature(created_type).arguments
            fal_idx := 2
         until
            fal_idx > formal_arg_list.count
         loop
            from
               list_idx := item_list.lower + fal_idx - 2
            until
               list_idx > item_list.upper
            loop
               expression := item_list.item(list_idx)
               if not expression.is_void then
                  expression_type := expression.collect(type)
                  destination_type := formal_arg_list.type_mark(fal_idx).resolve_in(created_type)
                  assignment_handler.collect_normal(expression_type, destination_type)
               end
               list_idx := list_idx + formal_arg_list.count - 1
            end
            fal_idx := fal_idx + 1
         end
         manifest_generic_pool.collect(Current)
      end

   simplify (type: TYPE): like Current
      local
         oa: like optional_arguments; il: like item_list
      do
         if optional_arguments /= Void then
            oa := simplify_of(type, optional_arguments)
         end
         il := simplify_of(type, item_list)
         if oa = optional_arguments and then il = item_list then
            Result := Current
         else
            Result := twin
            Result.init(oa, il)
         end
      end

   safety_check (type: TYPE)
      do
         if optional_arguments /= Void then
            safety_check_of(type, optional_arguments)
         end
         safety_check_of(type, item_list)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         if created_type /= Void then
            Result := created_type
         else
            Result := type_mark.resolve_in(type)
         end
      ensure then
         Result /= Void
      end

   adapt_for (type: TYPE): like Current
      local
         oa: like optional_arguments; il: like item_list
      do
         if optional_arguments /= Void then
            oa := adapt_of(type, optional_arguments)
         end
         il := adapt_of(type, item_list)
         if oa = optional_arguments and then il = item_list then
            Result := Current
         else
            Result := twin
            Result.init(oa, il)
         end
      end

   precedence: INTEGER
      do
         Result := atomic_precedence
      end

   accept (visitor: MANIFEST_GENERIC_VISITOR)
      do
         visitor.visit_manifest_generic(Current)
      end

feature {MANIFEST_GENERIC}
   init (oa, il: FAST_ARRAY[EXPRESSION])
      require
         not il.is_empty
      do
         optional_arguments := oa
         item_list := il
      ensure
         optional_arguments = oa
         item_list = il
      end

feature {OLD_MANIFEST_ARRAY}
   specialize_and_check_from_old_manifest_array (type: TYPE)
         -- Finish initialization of `Current' in order to reach a normal `specialize_and_check' state.
         -- Here `Current' is the canonical form of some OLD_MANIFEST_ARRAY.
      do
         created_type := type_mark.resolve_in(type)
         manifest_make_feature_stamp := created_type.feature_stamp_of(manifest_make_name)
         manifest_put_feature_stamp := created_type.feature_stamp_of(manifest_put_name)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         oa: like optional_arguments; il: like item_list; mg: like Current
      do
         if optional_arguments /= Void then
            oa := inline_dynamic_dispatch_of(code_accumulator, type, optional_arguments)
         end
         il := inline_dynamic_dispatch_of(code_accumulator, type, item_list)
         if oa = optional_arguments and then il = item_list then
            code_accumulator.current_context.add_last(Current)
         else
            mg := twin
            mg.init(oa, il)
            code_accumulator.current_context.add_last(mg)
         end
      end

   irregular_position: POSITION
         -- Not unknown when some irregular usage of the ";" (semicolon) has been detected by the parser.

   make (sp: like start_position; tm: like type_mark; oa, il: FAST_ARRAY[EXPRESSION]
         sc: like semicolon_count; ip: like irregular_position)
      require
         not sp.is_unknown
         tm /= Void
         not il.is_empty
         sc < 0 implies not ip.is_unknown
      do
         if not tm.is_static then
            error_handler.add_position(tm.start_position)
            if tm.is_anchored then
               error_handler.append(once "Cannot use anchored type for this form of creation.")
            else
               error_handler.append(once "Only static type can be used for this form of creation.")
            end
            error_handler.print_as_fatal_error
         end
         start_position := sp
         type_mark := tm
         optional_arguments := oa
         item_list := il
         semicolon_count := sc
         irregular_position := ip
      ensure
         start_position = sp
         type_mark = tm
         optional_arguments = oa
         item_list = il
      end

   specialize_in_of (type: TYPE; l: FAST_ARRAY[EXPRESSION]): FAST_ARRAY[EXPRESSION]
      require
         not l.is_empty
      local
         i: INTEGER; exp1, exp2: EXPRESSION
      do
         from
            i := l.lower
         until
            exp1 /= exp2 or else i > l.upper
         loop
            exp1 := l.item(i)
            exp2 := exp1.specialize_in(type)
            i := i + 1
         end
         if exp1 = exp2 then
            Result := l
         else
            from
               Result := l.twin
               Result.put(exp2, i - 1)
            until
               i > Result.upper
            loop
               Result.put(Result.item(i).specialize_in(type), i)
               i := i + 1
            end
         end
      ensure
         Result.count = l.count
      end

   specialize_thru_of (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE
      l: FAST_ARRAY[EXPRESSION]): FAST_ARRAY[EXPRESSION]
      require
         not l.is_empty
      local
         i: INTEGER; exp1, exp2: EXPRESSION
      do
         from
            i := l.lower
         until
            exp1 /= exp2 or else i > l.upper
         loop
            exp1 := l.item(i)
            exp2 := exp1.specialize_thru(parent_type, parent_edge, new_type)
            i := i + 1
         end
         if exp1 = exp2 then
            Result := l
         else
            from
               Result := l.twin
               Result.put(exp2, i - 1)
            until
               i > Result.upper
            loop
               Result.put(Result.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
               i := i + 1
            end
         end
      ensure
         Result.count = l.count
      end

   optional_arguments_specialize_and_check (type: TYPE): FAST_ARRAY[EXPRESSION]
      require
         not optional_arguments.is_empty
      local
         list_idx, fal_idx: INTEGER; exp1, exp2: EXPRESSION; formal_arg_list: FORMAL_ARG_LIST
         destination_type_mark: TYPE_MARK; destination_type: TYPE
      do
         Result := optional_arguments
         from
            list_idx := Result.upper
            formal_arg_list := manifest_make_feature_stamp.anonymous_feature(created_type).arguments
            fal_idx := formal_arg_list.count
         until
            list_idx < Result.lower
         loop
            exp1 := Result.item(list_idx)
            destination_type_mark := formal_arg_list.type_mark(fal_idx)
            destination_type := destination_type_mark.resolve_in(created_type)
            exp2 := specialize_check(exp1, type, destination_type_mark, destination_type)
            if exp1 /= exp2 then
               if Result = optional_arguments then
                  Result := Result.twin
               end
               Result.put(exp2, list_idx)
            end
            list_idx := list_idx - 1
            fal_idx := fal_idx - 1
         end
      ensure
         Result.count = optional_arguments.count
      end

   use_current_of (type: TYPE; l: FAST_ARRAY[EXPRESSION]): BOOLEAN
      require
         not l.is_empty
      local
         i: INTEGER
      do
         from
            i := l.lower
         until
            Result or else i > l.upper
         loop
            Result := l.item(i).use_current(type)
            i := i + 1
         end
      end

   has_been_specialized_of (l: FAST_ARRAY[EXPRESSION]): BOOLEAN
      require
         not l.is_empty
      local
         i: INTEGER
      do
         from
            i := l.lower
         until
            Result or else i > l.upper
         loop
            Result := l.item(i).has_been_specialized
            i := i + 1
         end
      end

   simplify_of (type: TYPE; l: FAST_ARRAY[EXPRESSION]): FAST_ARRAY[EXPRESSION]
      require
         not l.is_empty
      local
         i: INTEGER; exp1, exp2: EXPRESSION
      do
         from
            i := l.lower
         until
            exp1 /= exp2 or else i > l.upper
         loop
            exp1 := l.item(i)
            exp2 := exp1.simplify(type)
            i := i + 1
         end
         if exp1 = exp2 then
            Result := l
         else
            from
               Result := l.twin
               Result.put(exp2, i - 1)
            until
               i > Result.upper
            loop
               Result.put(Result.item(i).simplify(type), i)
               i := i + 1
            end
         end
      ensure
         Result.count = l.count
      end

   adapt_of (type: TYPE; l: FAST_ARRAY[EXPRESSION]): FAST_ARRAY[EXPRESSION]
      require
         not l.is_empty
      local
         i: INTEGER; exp1, exp2: EXPRESSION
      do
         from
            i := l.lower
         until
            exp1 /= exp2 or else i > l.upper
         loop
            exp1 := l.item(i)
            exp2 := exp1.adapt_for(type)
            i := i + 1
         end
         if exp1 = exp2 then
            Result := l
         else
            from
               Result := l.twin
               Result.put(exp2, i - 1)
            until
               i > Result.upper
            loop
               Result.put(Result.item(i).adapt_for(type), i)
               i := i + 1
            end
         end
      ensure
         Result.count = l.count
      end

   safety_check_of (type: TYPE; l: FAST_ARRAY[EXPRESSION])
      require
         not l.is_empty
      local
         i: INTEGER
      do
         from
            i := l.lower
         until
            i > l.upper
         loop
            l.item(i).safety_check(type)
            i := i + 1
         end
      end

   item_list_specialize_and_check (type: TYPE): like item_list
      require
         type /= Void
      local
         fal_idx, list_idx: INTEGER; exp1, exp2: EXPRESSION; formal_arg_list: FORMAL_ARG_LIST
         destination_type_mark: TYPE_MARK; destination_type: TYPE
      do
         Result := item_list
         from
            formal_arg_list := manifest_put_feature_stamp.anonymous_feature(created_type).arguments
            fal_idx := 2
         until
            fal_idx > formal_arg_list.count
         loop
            from
               list_idx := item_list.lower + fal_idx - 2
            until
               list_idx > item_list.upper
            loop
               exp1 := Result.item(list_idx)
               destination_type_mark := formal_arg_list.type_mark(fal_idx)
               destination_type := destination_type_mark.resolve_in(created_type)
               exp2 := specialize_check(exp1, type, destination_type_mark, destination_type)
               if exp1 /= exp2 then
                  if Result = item_list then
                     Result := Result.twin
                  end
                  Result.put(exp2, list_idx)
               end
               list_idx := list_idx + formal_arg_list.count - 1
            end
            fal_idx := fal_idx + 1
         end
      end

   specialize_check (e: EXPRESSION; type: TYPE;
                       destination_type_mark: TYPE_MARK; destination_type: TYPE): EXPRESSION
      require
         e /= Void
         type /= Void
         destination_type = destination_type_mark.resolve_in(created_type)
      local
         expression_type: TYPE
      do
         if e.is_void then
            check
               e = e.specialize_and_check(type)
            end
            if destination_type.is_expanded then
               error_handler.add_position(destination_type_mark.start_position)
               error_handler.add_position(e.start_position)
               error_handler.append(once "Cannot pass Void into formal argument which is of type ")
               error_handler.append(destination_type.name.to_string)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            end
            Result := e
         else
            Result := e.specialize_and_check(type)
            expression_type := Result.resolve_in(type)
            if not expression_type.can_be_assigned_to(destination_type) then
               error_handler.add_position(destination_type_mark.start_position)
               error_handler.add_position(e.start_position)
               error_handler.append(once "Cannot pass ")
               error_handler.add_expression(e)
               error_handler.append(once " which is of type ")
               error_handler.append(expression_type.name.to_string)
               error_handler.append(once " into formal argument which is of type ")
               error_handler.append(destination_type.name.to_string)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            end
            Result := assignment_handler.implicit_cast(Result, expression_type, destination_type)
         end
      ensure
         Result /= Void
      end

invariant
   not start_position.is_unknown

   type_mark.is_static

   not item_list.is_empty

end -- class MANIFEST_GENERIC
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
