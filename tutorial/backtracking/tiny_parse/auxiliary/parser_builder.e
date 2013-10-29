class PARSER_BUILDER

create {ANY}
   make

feature {ANY}
   make is
      do
      end

   begin_grammar is
      do
         create grammar.make
         is_valid := False
      end

   set_blanks (expr: STRING) is
      do
         prepare_regular_expression(expr)
         if not has_error then
            grammar.set_blanks(regexp_root)
         end
      end

   set_root (name: STRING) is
      do
         select_rule(name)
         grammar.set_root(rule)
      end

   begin_rule (name: STRING) is
      do
         select_rule(name)
         defined_rule := rule
         stack.clear_count
      end

   end_rule_sequence is
      do
         rule.set_sequence(stack.twin)
         stack.clear_count
      end

   end_rule_alternative is
      do
         rule.set_alternative(stack.twin)
         defined_rule.set_item(rule)
         stack.clear_count
      end

   begin_terminal (terminal_name: STRING) is
      do
         not_yet_implemented
      end

   end_rule is
      do
         not_yet_implemented
      end

   add_rulename (name: STRING) is
      do
         select_rule(name)
         stack.add_last(rule)
      end

   add_fixed (expr: STRING) is
      do
         prepare_regular_expression(expr)
         if not has_error then
            stack.add_last(create {PARSER_FIXED}.make(regexp_root))
         end
      end

   add_recorded (expr: STRING) is
      do
         prepare_regular_expression(expr)
         if not has_error then
            stack.add_last(create {PARSER_RECORDED}.make(regexp_root))
         end
      end

   optional is
      do
         stack.put(create {PARSER_OPTIONAL}.make(stack.last), stack.upper)
      end

   separated_list is
      do
         stack.put(create {PARSER_LIST}.make(stack.item(stack.upper - 1), stack.last), stack.upper - 1)
         stack.remove_last
      end

   simple_list is
      do
         stack.add_last(Void)
         separated_list
      end

   validate is
      do
      end

   create_parser is
      require
         is_valid
         not has_error
      do
         not_yet_implemented
      ensure
         parser /= Void
      end

   parser: PARSER

   is_valid: BOOLEAN
   grammar: PARSER_GRAMMAR
   has_error: BOOLEAN

feature {ANY}
   prepare_regular_expression (expr: STRING) is
      do
         regexp_root := regexp_builder.convert_posix_pattern(expr)
         if regexp_builder.last_error_message /= Void then
            has_error := True
         end
      end

   regexp_builder: REGULAR_EXPRESSION_BUILDER

   regexp_root: REGULAR_EXPRESSION

feature {ANY}
   select_rule (name: STRING) is
      do
         rule := grammar.rules.reference_at(name)
         if rule = Void then
            create rule.make(name.twin)
            grammar.rules.add(rule, rule.name)
         end
      end

   defined_rule, rule: PARSER_RULE

   stack: FAST_ARRAY[BACKTRACKING_NODE]

end -- class PARSER_BUILDER
