
class PARSER_SEQUENCE_MARK_END
inherit ABSTRACT_BACKTRACKING_SEQUENCE
feature
	parseable: PARSER_PARSEABLE
	set_parseable(value: like parseable) is
		do
			parseable := value
		end
	next_sequence(parser: PARSER) is
		do
			parser.push_mark_end(parseable)
			parser.pop_sequence
			parser.continue
		end
end

expanded class PARSER_CONTEXT
feature
	depth, position: INTEGER
	make(d,p: INTEGER) is
		do
			depth:=d
			position:=p
		end
end

expanded class PARSER_MARK
feature
	position: INTEGER
	is_begin: BOOLEAN
	is_end: BOOLEAN is do Result:=not is_begin end
	parseable: PARSER_PARSEABLE
	make_begin(pos: INTEGER; what: like parseable) is do is_begin:=True position:=pos parseable:=what end
	make_end(pos: INTEGER; what: like parseable) is do is_begin:=False position:=pos parseable:=what end
end

class PARSER_GRAMMAR feature
	rules: HASHED_DICTIONARY[RULE,STRING]
	blanks: REGULAR_EXPRESSION_ROOT
	root: RULE
end

deferred class PARSER_PARSEABLE
inherit
	BACKTRACKING_NODE rename explore as parse end
end

class PARSER_RULE inherit PARSER_PARSEABLE feature
	name: STRING
	item: PARSER_PARSEABLE
	parse(parser: PARSER) is do parser.goto_inside(item) end
end

deferred class PARSER_TOKEN inherit PARSER_PARSEABLE feature
	expr: REGULAR_EXPRESSION_ROOT
	make(exp: like expr) is do expr := exp end
	parse(parser: PARSER) is do
		if parser.match(expr) 
			then parser.continue 
			else parser.backtrack
		end
	end
end

class PARSER_FIXED inherit PARSER_TOKEN feature
end

class TOKEN_RECORDED inherit PARSER_TOKEN feature
end

class PARSER_OPTIONAL inherit PARSER_PARSEABLE feature
end

class PARSER_LIST inherit PARSER_PARSEABLE feature
end



