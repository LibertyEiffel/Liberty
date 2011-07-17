class PARSER_BUILDER
creation make
feature
	make is
		do
			create regexp_builder.make
		end

	begin_grammar is
		do
			create grammar.make
			is_valid := False
		end

	set_blanks(expr: STRING) is 
		do
			prepare_regular_expression(expr)
			if not has_error then
				grammar.set_blanks(regexp_root)
			end
		end

	set_root(name: STRING) is
		do
			select_rule(name)
			grammar.set_root(rule)
		end

	begin_rule(name: STRING) is
		do
			select_rule(name)
			defined_rule := rule
			stack.clear_count
		end

	end_rule_sequence is
		do
			rule.set_sequence(stack)
			stack.clear_count
		end

	end_rule_alternative is
		do
			rule.set_alternative(stack)
			defined_rule.set_item()
			stack.clear_count
		end

	add_rulename(name: STRING) is
		do
			select_rule(name)
			stack.add_last(rule)
		end

	add_fixed(expr: STRING) is
		do
			prepare_regular_expression(expr)
			if not has_error then
				stack.add_last(create {PARSER_FIXED}.make(regexp_root))
			end
		end

	add_recorded(expr: STRING) is
		do
			prepare_regular_expression(expr)
			if not has_error then
				stack.add_last(create {PARSER_RECORDED}.make(regexp_root))
			end
		end

	optional is
		do
			stack.put(create {PARSER_OPTIONAL}.make(stack.last),stack.upper)
		end

	separated_list is
		do
			stack.put(create {PARSER_LIST}.make(stack.item(stack.upper-1),stack.last),stack.upper-1)
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
	
	is_valid: BOOLEAN

	grammar: PARSER_GRAMMAR

	has_error: BOOLEAN

feature

	prepare_regular_expression(expr: STRING) is
		do
			regexp_builder.set_expression(expr)
			regexp_builder.build
			if regexp_builder.has_error then
				has_error := True
			else
				regexp_root := regexp_builder.regular_expression
			end
		end

	regexp_builder: POSIX_REGULAR_EXPRESSION_BUILDER
	regexp_root: REGULAR_EXPRESSION_ROOT

feature

	select_rule(name: STRING) is
		do
			rule := grammar.rules.reference_at(name)
			if rule=Void then
				create rule.make(name.twin)
				grammar.rules.add(rule.rule.name)
			end
		end

	defined_rule, rule: PARSER_RULE

	stack: FAST_ARRAY[BACKTRACKING_NODE]

end

