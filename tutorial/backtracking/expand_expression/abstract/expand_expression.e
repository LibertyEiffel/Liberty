-- See the Copyright notice at the end of this file.
--
class EXPAND_EXPRESSION
   --
   -- That program shows the use of ABSTRACT_BACKTRACKING.
   --
   -- That program read expressions from the standard input and print the
   -- expansion of the read expression on the standard output.
   -- The expressions are composed of sequence and alternative of terms.
   -- The expansion is the list of all the sequences allowed when
   -- alternatives are removed.
   --
   -- For example the input expression "(0+1)(0+1)(0+1)" will give the
   -- following output:
   --
   --   (1)   0 0 0
   --   (2)   0 0 1
   --   (3)   0 1 0
   --   (4)   0 1 1
   --   (5)   1 0 0
   --   (6)   1 0 1
   --   (7)   1 1 0
   --   (8)   1 1 1
   --
   -- The grammar of the input expressions is in ABNF like:
   --
   --    expression  ::= alternative
   --    alternative ::= sequence [ '+' sequence ]...
   --    sequence    ::= term [ ['.'] term ]...
   --    term        ::= | '(' alternative ')' | "[^().+]*"
   --

inherit
   ABSTRACT_BACKTRACKING
      undefine default_create
      end
   MINI_PARSER_BUFFER
      -- a nicer name when inherited!
      rename next as next_character
      end
   EXPRESSION_ITEM_GLOBALS
      undefine default_create
      end

insert
   EXCEPTIONS
      undefine default_create
      end

create {ANY}
   make

feature {ANY} -- make
   make
         -- read one line and treat it until end of input
      do
         from
            initialise
            io.read_line
         until
            io.end_of_input
         loop
            parse
            expand_all
            io.read_line
         end
      end

   initialise
         -- initialisation
      do
         create buffer.make(10)
         create stack.with_capacity(100)
      end

feature {ANY} -- enumeration of expansions
   root, current_item: EXPRESSION_ITEM

   goto_item (item: like current_item)
         -- set the 'current_item' to 'item'
      do
         current_item := item
      ensure
         definition: current_item = item
      end

   stack: FAST_ARRAY[EXPRESSION_ITEM]

   expand_all
         -- print all the expansions of the root
      local
         i, n: INTEGER
      do
         from
            -- go to the first solution
            stack.clear_count
            goto_item(root)
            search_first
         until
            is_off
         loop
            -- print the solution using the path iterator
            if True then
               from
                  n := n + 1
                  io.put_string(once "%T(")
                  io.put_integer(n)
                  io.put_string(once ")%T")
                  i := 0
               until
                  i > stack.upper
               loop
                  if i > 0 then
                     io.put_character(' ')
                  end
                  io.put_string(stack.item(i).value)
                  i := i + 1
               end
               io.put_new_line
            end
            -- go to the next solution
            search_next
         end
         io.flush
      end

   evaluate_current_state
         -- Here is how must be driven the and or explorer
         -- Only the basic features are called
         -- the evaluation of 'current_item' is made depending
         -- of its type.
      local
         alt: EXPAND_ALTERNATIVE; seq: EXPAND_SEQUENCE
      do
         -- print("evaluation of "+current_item.out+"%N")
         inspect
            current_item.type
         when And_item then
            -- should evaluate first and then
            -- should evaluate second.
            seq := sequence_pool.get_instance
            seq.make(current_item.second)
            push_sequence(seq)
            goto_item(current_item.first)
            -- note:
            --   goto_item changes current_item then it
            --   have to be called after push_and if no
            --   temporary variable is used
         when Or_item then
            -- should evaluate first or else
            -- should evaluate second.
            alt := alternative_pool.get_instance
            alt.make(current_item.second, stack.count)
            push_alternative(alt)
            goto_item(current_item.first)
         when Value_item then
            -- record the current item in the path
            -- and use continue to go to the next
            stack.add_last(current_item)
            continue
         when Empty_item, Success_item then
            -- nothing to do
            -- use continue to go to the next
            continue
         when Failure_item then
            -- cancel the evaluation
            backtrack
         end
      end

   context_clear, context_push, context_restore, context_restore_and_pop, context_cut
      do
      end

feature {ANY} -- parsing
   parse
         -- initialise the mini_parser_buffer behavior
         -- then call parse and treat syntax errors with
         -- exceptions
      local
         cancelled: BOOLEAN
      do
         if not cancelled then
            initialize_with(io.last_string)
            skip_separators
            if end_reached then
               root := the_failure_item
            else
               root := parse_alternative
               if not end_reached then
                  if current_character = ')' then
                     raise(once "unbounded ')'")
                  else
                     raise(once "end not reached")
                  end
               end
            end
         end
      ensure
         root /= Void
      rescue
         root := the_failure_item
         io.put_string("Syntax error: ")
         io.put_string(developer_exception_name)
         io.put_character('%N')
         io.last_string.replace_all('%T', ' ')
         io.put_string(io.last_string)
         io.put_character('%N')
         io.put_spaces(current_index - 1)
         io.put_character('^')
         io.put_character('%N')
         cancelled := True
         retry
      end

   parse_alternative: EXPRESSION_ITEM
         -- parse an alternative recursively to construct tree
         -- balanced to the right because it is more efficient
      do
         Result := parse_sequence
         if not end_reached and then current_character = '+' then
            next_character
            skip_separators
            create Result.make_or(Result, parse_alternative)
         end
      end

   parse_sequence: EXPRESSION_ITEM
         -- parse a sequence recursively to construct tree
         -- balanced to the right because it is more efficient
      do
         Result := parse_term
         if not end_reached and then not (once "+)").has(current_character) then
            create Result.make_and(Result, parse_sequence)
         end
      end

   parse_term: EXPRESSION_ITEM
         -- parse a term
      do
         -- skip any '.' that are noise
         from
         until
            end_reached or else current_character /= '.'
         loop
            next_character
            skip_separators
         end

         if end_reached or else (once "+)").has(current_character) then
            -- if already a termination, return the empty item
            Result := the_empty_item
         elseif current_character = '(' then
            -- parse a sub expression in parenthesis
            next_character
            skip_separators
            Result := parse_alternative
            if end_reached or else current_character /= ')' then
               raise(once "unbounded '('")
            end

            next_character
            skip_separators
         else
            -- parse a term
            from
               buffer.clear_count
            until
               end_reached or else current_character.is_separator or else (once "()+.").has(current_character)
            loop
               buffer.add_last(current_character)
               next_character
            end

            create Result.make_value(buffer.twin)
            skip_separators
         end
      end

   the_empty_item: EXPRESSION_ITEM
      once
         create Result.make_empty
      end

   the_failure_item: EXPRESSION_ITEM
      once
         create Result.make_failure
      end

   buffer: STRING

end -- class EXPAND_EXPRESSION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is free software, which comes along with SmartEiffel. This software is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- You can modify it as you want, provided this footer is kept unaltered, and a notification of the changes is added.
-- You are allowed to redistribute it and sell it, alone or as a part of another product.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
