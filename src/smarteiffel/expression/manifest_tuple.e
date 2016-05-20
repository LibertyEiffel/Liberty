class MANIFEST_TUPLE
--
-- Manifest TUPLE creation like:  [ foo , bar ]
--
-- Implementation note: actually, the manifest tuple notation is only syntactic sugar for
-- expression creation call using creators of in class(es) TUPLEs.
--

inherit
   EXPRESSION

create {ANY}
   make

feature {ANY}
   start_position: POSITION
         -- Of opening bracket (provided by the eiffel_parser).

   effective_arg_list: EFFECTIVE_ARG_LIST
         -- Provided by the `eiffel_parser': the list of expressions inside square brackets.
         -- This `effective_arg_list' is Void for the empty TUPLE.

   is_void: BOOLEAN False

   is_current, is_implicit_current: BOOLEAN False

   extra_bracket_flag: BOOLEAN True

   precedence: INTEGER 2

   is_static: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN False

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   pretty (indent_level: INTEGER)
      local
         i: INTEGER
      do
         pretty_printer.put_character('[')
         if effective_arg_list /= Void then
            from
               i := 1
            until
               i > effective_arg_list.count
            loop
               effective_arg_list.expression(i).pretty(indent_level + 1)
               i := i + 1
               if i <= effective_arg_list.count then
                  pretty_printer.put_string(once ", ")
               end
            end
         end
         pretty_printer.put_character(']')
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   short (type: TYPE)
      local
         i: INTEGER
      do
         short_printer.hook_or(once "open_sb",once "[")
         if effective_arg_list /= Void then
            from
               i := 1
            until
               i > effective_arg_list.count
            loop
               effective_arg_list.expression(i).short(type)
               i := i + 1
               if i <= effective_arg_list.count then
                  short_printer.hook_or(once "ma_sep",once ",")
               end
            end
         end
         short_printer.hook_or(once "close_sb",once "]")
      end

   short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   specialize_in (type: TYPE): like Current
      local
         cx: like create_expression; eal: like effective_arg_list
      do
         if effective_arg_list = Void then
            cx := create_expression.specialize_in(type)
            Result := current_or_twin_init(Void, cx)
         else
            check
               create_expression = Void
            end
            eal := effective_arg_list.specialize_in(type)
            Result := current_or_twin_init(eal, Void)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         cx: like create_expression; eal: like effective_arg_list
      do
         if effective_arg_list = Void then
            cx := create_expression.specialize_thru(parent_type, parent_edge, new_type)
            Result := current_or_twin_init(Void, cx)
         else
            check
               create_expression = Void
            end
            eal := effective_arg_list.specialize_thru(parent_type, parent_edge, new_type)
            Result := current_or_twin_init(eal, Void)
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         cx: like create_expression; eal: like effective_arg_list; i: INTEGER
         expression: EXPRESSION; void_type: TYPE
      do
         if effective_arg_list = Void then
            cx := create_expression
         else
            -- Checking that Void is not member of the `effective_arg_list' in order to warn the
            -- user:
            from
               i := 1
            until
               i > effective_arg_list.count
            loop
               expression := effective_arg_list.expression(i)
               if expression.is_void then
                  void_type := expression.resolve_in(type)
                  error_handler.add_position(expression.start_position)
                  error_handler.append(
                     "Using `Void' as an item of a manifest TUPLE is not good practice because `Void' %
                     %has no accurate type. You can work around by using an extra non-initialized %
                     %local variable of some accurate type. Another work around is to use an explicit %
                     %creation of the TUPLE. As an example `create {TUPLE[STRING,ANY]}.make_2(Void,Void)' %
                     %can be used to create a TUPLE[STRING,ANY] with default values.")
                  error_handler.print_as_warning
               end
               i := i + 1
            end
            eal := effective_arg_list.specialize_and_check_on_expressions(type)
            if create_expression = Void then
               cx := create_expression_for(type, eal)
               create_expression := cx
            elseif create_expression.arguments = eal then
               --|*** We should be able to avoid this leak. ***
               --| We also have to check that the creation type is identical.
               --| No time. Still leaky. (Dom feb 8th 2004)
               --|***
               cx := create_expression_for(type, eal)
            else
               cx := create_expression_for(type, eal)
            end
         end
         cx := cx.specialize_and_check(type)
         Result := current_or_twin_init(eal, cx)
      ensure then
         Result.create_expression /= Void
      end

   has_been_specialized: BOOLEAN
      do
         if create_expression /= Void then
            Result := create_expression.has_been_specialized
         else
            Result := effective_arg_list.has_been_specialized
         end
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := create_expression.resolve_in(type)
      end

   declaration_type: TYPE
      do
         Result := create_expression.declaration_type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := create_expression.written_declaration_type_mark
      end

   adapt_for (t: TYPE): like Current
      local
         ce: like create_expression
      do
         ce := create_expression.adapt_for(t)
         Result := current_or_twin_init(effective_arg_list, ce)
      end

   collect (type: TYPE): TYPE
      do
         Result := create_expression.collect(type)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): EXPRESSION
      do
         -- Back to the canonical form:
         Result := create_expression.simplify(type)
         smart_eiffel.magic_count_increment
      end

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         if effective_arg_list /= Void then
            from
               i := 1
            until
               Result or else i > effective_arg_list.count
            loop
               Result := effective_arg_list.expression(i).use_current(type)
               i := i + 1
            end
         end
      end

   safety_check (type: TYPE)
      local
         i: INTEGER
      do
         if effective_arg_list /= Void then
            from
               i := 1
            until
               i > effective_arg_list.count
            loop
               effective_arg_list.expression(i).safety_check(type)
               i := i + 1
            end
         end
      end

   accept (visitor: MANIFEST_TUPLE_VISITOR)
      do
         visitor.visit_manifest_tuple(Current)
      end

feature {MANIFEST_TUPLE, MANIFEST_TUPLE_VISITOR}
   create_expression: CREATE_EXPRESSION
         -- The corresponding one used to implement the manifest TUPLE creation. As an example,
         -- expression ['a'] is internally replaced with the following
         -- expression: create {TUPLE[CHARACTER]}.make('a')

feature {MANIFEST_TUPLE}
   init (eal: like effective_arg_list; ce: like create_expression)
      do
         debug
            if effective_arg_list /= Void then
               check
                  effective_arg_list.count = eal.count
               end
            end
         end
         effective_arg_list := eal
         create_expression := ce
      ensure
         effective_arg_list = eal
         create_expression = ce
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         -- Back to the canonical form:
         create_expression.inline_dynamic_dispatch_(code_accumulator, type)
      end

feature {}
   make (sp: like start_position; eal: like effective_arg_list)
      require
         not sp.is_unknown
      local
         empty_tuple_type_mark: EMPTY_TUPLE_TYPE_MARK
      do
         start_position := sp
         effective_arg_list := eal
         if effective_arg_list = Void then
            -- We have an empty TUPLE, thus creation a []:
            create empty_tuple_type_mark.make(sp)
            create create_expression.make(sp, empty_tuple_type_mark, Void)
         end
      ensure
         start_position = sp
         effective_arg_list = eal
      end

   current_or_twin_init (eal: like effective_arg_list; ce: like create_expression): like Current
      do
         if eal = effective_arg_list and then ce = create_expression then
            Result := Current
         else
            Result := twin
            Result.init(eal, ce)
         end
      ensure
         Result.create_expression = ce
         Result.effective_arg_list = eal
      end

   create_expression_for (type: TYPE; eal: EFFECTIVE_ARG_LIST): CREATE_EXPRESSION
         -- Create the corresponding TUPLE create expression knowing that `eal' has already got its
         -- `specialize_and_check' call using `type'.
      require
         type /= Void
         eal.count >= 1
      local
         types: ARRAY[TYPE_MARK]; i: INTEGER; fake_target: FAKE_TARGET; buffer: STRING
         fn: FEATURE_NAME; tm: TYPE_MARK; non_empty_tuple_type_mark: NON_EMPTY_TUPLE_TYPE_MARK
         proc_call: PROCEDURE_CALL; expression: EXPRESSION
      do
         from
            create types.with_capacity(eal.count, 1)
            i := 1
         until
            i > eal.count
         loop
            expression := eal.expression(i)
            if expression.is_void then
               -- Well, Void must got a TYPE here and ANY is the harmless here:
               tm := smart_eiffel.type_any.canonical_type_mark
            else
               tm := expression.resolve_in(type).canonical_type_mark
            end
            types.add_last(tm)
            i := i + 1
         end
         check
            eal.count = types.count
         end
         create non_empty_tuple_type_mark.make(start_position, types)
         create fake_target.make(start_position, non_empty_tuple_type_mark)
         buffer := once "make_.."
         buffer.copy(as_make)
         buffer.extend('_')
         eal.count.append_in(buffer)
         create fn.ordinary_name(string_aliaser.hashed_string(buffer), start_position)
         if eal.count = 1 then
            create {PROCEDURE_CALL_1} proc_call.make(fake_target, fn, eal)
         else
            create {PROCEDURE_CALL_N} proc_call.make(fake_target, fn, eal)
         end
         create Result.make(start_position, non_empty_tuple_type_mark, proc_call)
      end

end
