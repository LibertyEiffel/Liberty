class PARSER_GRAMMAR

create {ANY}
   make

feature {ANY}
   make is
      do
      end

feature {PARSER_GRAMMAR}
   --  blanks  '[[:blank:]]+'
   --  root    grammar
   --  grammar     = [blanks] [root] <rule>.
   --  blanks      = 'blanks' fixed.
   --  root        = 'root' rule-name.
   --  rule        = rule-name '=' definition '.'.
   --  definition  = alternative | sequence;
   --  alternative = <rule-name '|'>.
   --  sequence    = <seq-term>.
   --  seq-term    = term | opt-term.
   --  opt-term    = '[' term ']'.
   --  term        = list | rule-name | fixed | recorded.
   --  list        = '<'rule-name [fixed]'>'.
   --  rule-name   =  "[[:alnum:]-_$@]+".
   --  fixed       =  '''' "[^']*(''[^']*)*" ''''.
   --  recorded    =  '"' "[^""]*(""""[^""]*)*" '"'.

   internal_parser: PARSER is
      local
         builder: PARSER_BUILDER
      once
         create builder.make

   --  blanks  '[[:blank:]]+'
         builder.set_blanks(once "[[:blank:]+]")

   --  root    grammar
         builder.set_root(once "grammar")

   --  grammar     = [blanks] [root] <rule>.
         builder.begin_rule(once "grammar")
            builder.add_rulename(once "blanks")
            builder.optional
            builder.add_rulename(once "root")
            builder.optional
            builder.add_rulename(once "rule")
            builder.simple_list
         builder.end_rule_sequence

   --  blanks      = 'blanks' fixed.
         builder.begin_rule(once "blanks")
            builder.add_fixed(once "blanks")
            builder.add_rulename(once "fixed")
         builder.end_rule_sequence

   --  root        = 'root' rule-name.
         builder.begin_rule(once "root")
            builder.add_fixed(once "root")
            builder.add_rulename(once "rule-name")
         builder.end_rule_sequence

   --  rule        = rule-name '=' definition '.'.
         builder.begin_rule(once "rule")
            builder.add_rulename(once "rule-name")
            builder.add_fixed(once "=")
            builder.add_rulename(once "definition")
            builder.add_fixed(once ".")
         builder.end_rule_sequence

   --  definition  = alternative | sequence;
         builder.begin_rule(once "definition")
            builder.add_rulename(once "alternative")
            builder.add_rulename(once "sequence")
         builder.end_rule_alternative

   --  alternative = <rule-name '|'>.
         builder.begin_rule(once "alternative")
            builder.add_rulename(once "rule-name")
            builder.add_fixed(once "|")
            builder.separated_list
         builder.end_rule_sequence

   --  sequence    = <seq-term>.
         builder.begin_rule(once "sequence")
            builder.add_rulename(once "seq-term"
            builder.simple_list
         builder.end_rule_sequence

   --  seq-term    = term | opt-term.
         builder.begin_rule(once "seq-term")
            builder.add_rulename(once "term")
            builder.add_rulename(once "opt-term")
         builder.end_rule_alternative

   --  opt-term    = '[' term ']'.
         builder.begin_rule(once "opt-term")
            builder.add_fixed(once "[")
            builder.add_rulename(once "term")
            builder.add_fixed(once "]")
         builder.end_rule_sequence

   --  term        = list | rule-name | fixed | recorded.
         builder.begin_rule(once "term")
            builder.add_rulename(once "list")
            builder.add_rulename(once "rule-name")
            builder.add_rulename(once "fixed")
            builder.add_rulename(once "recorded")
         builder.end_rule_alternative

   --  list        = '<'rule-name [fixed]'>'.
         builder.begin_rule(once "list")
            builder.add_fixed(once "<")
            builder.add_rulename(once "term")
            builder.add_rulename(once "fixed")
            builder.optional
            builder.add_fixed(once ">")
         builder.end_rule_sequence

   --  rule-name   =  "[[:alnum:]-_$@]+".
         builder.begin_terminal(once "rule-name")
            builder.add_recorded(once "[[:alnum:]-_$@]+")
         builder.end_rule

   --  fixed       =  '''' "[^']*(''[^']*)*" ''''.
         builder.begin_terminal(once "fixed")
            builder.add_fixed(once "'")
            builder.add_recorded(once "[^']*(''[^']*)*")
            builder.add_fixed(once "'")
         builder.end_rule

   --  recorded    =  '"' "[^""]*(""""[^""]*)*" '"'.
         builder.begin_terminal(once "recorded")
            builder.add_fixed(once "%"")
            builder.add_recorded(once "[^%"]*(%"%"[^%"]*)*")
            builder.add_fixed(once "%"")
         builder.end_rule

         builder.create_parser
         Result := builder.parser
      end

end
