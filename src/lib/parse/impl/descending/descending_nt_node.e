-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class DESCENDING_NT_NODE
   --
   -- An internal class used by DESCENDING_NON_TERMINAL that implements the LL(n) parsing algorithm.
   --

insert
   TRISTATE_VALUES
      redefine
         copy, is_equal, out_in_tagged_out_memory
      end
   LOGGING
      redefine
         copy, is_equal, out_in_tagged_out_memory
      end
   PARSER_FACET
      redefine
         copy, is_equal, out_in_tagged_out_memory
      end

create {DESCENDING_NON_TERMINAL}
   root

create {DESCENDING_NT_NODE}
   make

feature {ANY}
   out_in_tagged_out_memory
      local
         i: INTEGER
      do
         if prefix_name /= Void then
            tagged_out_memory.extend('"')
            tagged_out_memory.append(prefix_name)
            tagged_out_memory.extend('"')
         end
         if suffices /= Void then
            tagged_out_memory.extend('(')
            from
               i := suffices.lower
            until
               i > suffices.upper
            loop
               if i > suffices.lower then
                  tagged_out_memory.extend('|')
               end
               suffices.item(i).out_in_tagged_out_memory
               i := i + 1
            end
            tagged_out_memory.extend(')')
         end
         if end_of_rule then
            tagged_out_memory.extend('$')
         end
      end

feature {DESCENDING_NON_TERMINAL}
   add (rule: TRAVERSABLE[FIXED_STRING]; a_action: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]])
      local
         node: DESCENDING_NT_NODE; name: FIXED_STRING
      do
         check
            is_root: prefix_name = Void
         end
         if rule.is_empty then
            -- a non-terminal with Epsilon
            if a_action /= Void then
               action := agent call_non_terminal_builder(a_action, rule)
            end
            end_of_rule := True
         else
            name := rule.first.intern
            node := suffices.fast_reference_at(name)
            if node = Void then
               create node.make(name, nt)
               suffices.add(node, name)
            end
            node.do_add(a_action, rule, rule.lower)
         end
      end

   parse (context: DESCENDING_PARSE_CONTEXT): TRISTATE
      local
         parse_action: PARSE_ACTION
      do
         check
            is_root: prefix_name = Void
         end
         Result := parse_suffices(context)
         if Result /= yes and then end_of_rule then
            -- Epsilon
            Result := yes
            create parse_action.make(action)
            debug ("parse")
               parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
            end
            context.actions.add_last(parse_action)
         end
      ensure
         context.actions.count >= old context.actions.count
         ;(Result /= yes) implies context.buffer.current_index = old context.buffer.current_index and then context.actions.count = old context.actions.count
      end

feature {DESCENDING_NON_TERMINAL, DESCENDING_NT_NODE}
   is_coherent: BOOLEAN
      local
         i: INTEGER
      do
         if prefix_name = Void then
            Result := True
         else
            Result := nt.table.has(prefix_name)
         end
         if suffices /= Void then
            from
               i := suffices.lower
            until
               not Result or else i > suffices.upper
            loop
               Result := suffices.item(i).is_coherent
               i := i + 1
            end
         end
      ensure
         must_be_coherent: Result
      end

   set_default_tree_builder (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; path: COLLECTION[FIXED_STRING])
      require
         non_terminal_builder /= Void
      local
         i: INTEGER
      do
         if end_of_rule and then action = Void then
            debug ("parse")
               log.trace.put_string(once "Setting default non-terminal tree builder for %"")
               log.trace.put_string(nt.name)
               log.trace.put_string(once "%": ")
               if prefix_name = Void then
                  -- root
                  check
                     path.is_empty
                  end
                  log.trace.put_line(once "Epsilon")
               else
                  from
                     i := path.lower
                  until
                     i > path.upper
                  loop
                     log.trace.put_character('"')
                     log.trace.put_string(path.item(i))
                     log.trace.put_character('"')
                     log.trace.put_character(' ')
                     i := i + 1
                  end
                  log.trace.put_character('"')
                  log.trace.put_string(prefix_name)
                  log.trace.put_character('"')
                  log.trace.put_character('>')
                  log.trace.put_new_line
               end
            end
            if prefix_name /= Void then
               path.add_last(prefix_name)
               action := agent call_non_terminal_builder(non_terminal_builder, path.twin)
               path.remove_last
            else
               -- Epsilon rule
               check
                  path.is_empty
               end
               action := agent call_non_terminal_builder(non_terminal_builder, path.twin)
            end
         end
         if suffices /= Void then
            if prefix_name = Void then
               -- root
               check
                  path.is_empty
               end
               from
                  i := suffices.lower
               until
                  i > suffices.upper
               loop
                  suffices.item(i).set_default_tree_builder(non_terminal_builder, path)
                  i := i + 1
               end
            else
               path.add_last(Void)
               from
                  i := suffices.lower
               until
                  i > suffices.upper
               loop
                  path.put(prefix_name, path.upper)
                  suffices.item(i).set_default_tree_builder(non_terminal_builder, path)
                  i := i + 1
               end
               path.remove_last
            end
         end
      end

   set_non_terminal (a_non_terminal: like nt)
      local
         i: INTEGER
      do
         nt := a_non_terminal
         if suffices /= Void then
            from
               i := suffices.lower
            until
               i > suffices.upper
            loop
               suffices.item(i).set_non_terminal(a_non_terminal)
               i := i + 1
            end
         end
      ensure
         nt = a_non_terminal
      end

feature {DESCENDING_NT_NODE}
   do_add (a_action: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; rule: TRAVERSABLE[FIXED_STRING]; i: INTEGER)
      require
         rule.valid_index(i)
         rule.item(i) = prefix_name
      local
         name: FIXED_STRING; node: DESCENDING_NT_NODE
      do
         if i < rule.upper then
            name := rule.item(i + 1).intern
            if suffices = Void then
               create suffices.make
            end
            node := suffices.fast_reference_at(name)
            if node = Void then
               create node.make(name, nt)
               suffices.add(node, name)
            end
            node.do_add(a_action, rule, i + 1)
         else
            check
               i = rule.upper
            end
            if a_action /= Void then
               action := agent call_non_terminal_builder(a_action, rule)
            end
            end_of_rule := True
         end
      end

   do_parse (context: DESCENDING_PARSE_CONTEXT): TRISTATE
      require
         not_root: prefix_name /= Void
      local
         memo, old_count: INTEGER; atom: PARSE_ATOM[DESCENDING_PARSE_CONTEXT]
         parse_action: PARSE_ACTION
      do
         memo := context.buffer.memo
         old_count := context.actions.count
         atom := nt.table.item(prefix_name)
         check
            atom /= Void
         end
         Result := atom.parse(context)
         check
            suffices = Void implies end_of_rule
         end
         if Result = yes then
            if suffices = Void then
               create parse_action.make(action)
               debug ("parse")
                  parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
               end
               context.actions.add_last(parse_action)
            else
               Result := parse_suffices(context)
               if Result /= yes and then end_of_rule then
                  -- that's fine: we can end here
                  Result := yes
                  create parse_action.make(action)
                  debug ("parse")
                     parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
                  end
                  context.actions.add_last(parse_action)
               end
            end
         end
         if Result /= yes then
            context.buffer.restore(memo)
            if context.actions.count > old_count then
               context.actions.remove_tail(context.actions.count - old_count)
            end
         end
      ensure
         (Result /= yes) implies context.buffer.current_index = old context.buffer.current_index and then context.actions.count = old context.actions.count
      end

feature {}
   parse_suffices (context: DESCENDING_PARSE_CONTEXT): TRISTATE
      require
         suffices /= Void
      local
         memo, old_count, i: INTEGER; node: DESCENDING_NT_NODE; parsenode: TRISTATE; perhaps: BOOLEAN
      do
         debug ("parse")
            log.trace.put_string(once "Scanning non-terminal %"")
            log.trace.put_string(nt.name)
            log.trace.put_character('"')
            if prefix_name /= Void then
               log.trace.put_string(once " for a suffix of %"")
               log.trace.put_string(prefix_name)
               log.trace.put_character('"')
            end
            log.trace.put_new_line
         end
         memo := context.buffer.memo
         old_count := context.actions.count
         from
            i := suffices.lower
            Result := no
         until
            Result = yes or else i > suffices.upper
         loop
            node := suffices.item(i)
            parsenode := node.do_parse(context)
            if parsenode = yes then
               Result := yes
            else
               if parsenode = maybe then
                  perhaps := True
               end
               context.buffer.restore(memo)
               if context.actions.count > old_count then
                  context.actions.remove_tail(context.actions.count - old_count)
               end
               debug ("parse")
                  log.trace.put_string(once "Still scanning non-terminal %"")
                  log.trace.put_string(nt.name)
                  log.trace.put_character('"')
                  if prefix_name /= Void then
                     log.trace.put_string(once " for a suffix of %"")
                     log.trace.put_string(prefix_name)
                     log.trace.put_character('"')
                  end
                  log.trace.put_string(once " (%"")
                  log.trace.put_string(suffices.key(i))
                  log.trace.put_line(once "%" did not match)")
               end
               i := i + 1
            end
         end
         if Result = no and then perhaps then
            Result := maybe
         end
      ensure
         (Result /= yes) implies context.buffer.current_index = old context.buffer.current_index and then context.actions.count = old context.actions.count
      end

feature {}
   call_non_terminal_builder (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; path: TRAVERSABLE[FIXED_STRING])
      do
         non_terminal_builder.call([nt.name, path])
      end

feature {}
   make (a_prefix_name: like prefix_name; a_nt: like nt)
      require
         a_prefix_name /= Void
         a_nt /= Void
      do
         prefix_name := a_prefix_name
         nt := a_nt
      ensure
         prefix_name = a_prefix_name
         nt = a_nt
      end

   root (a_nt: like nt)
      require
         a_nt /= Void
      do
         nt := a_nt
         create suffices.make
      ensure
         nt = a_nt
         suffices /= Void
         is_root: prefix_name = Void
      end

feature {ANY}
   copy (other: like Current)
      local
         i: INTEGER
      do
         nt := other.nt
         prefix_name := other.prefix_name
         action := other.action
         end_of_rule := other.end_of_rule
         if other.suffices /= Void then
            create suffices.with_capacity(other.suffices.capacity)
            from
               i := other.suffices.lower
            until
               i > other.suffices.upper
            loop
               suffices.add(other.suffices.item(i).twin, other.suffices.key(i))
               i := i + 1
            end
         end
      end

   is_equal (other: like Current): BOOLEAN
      local
         i: INTEGER
      do
         Result := prefix_name = other.prefix_name
            and then action = other.action
            and then end_of_rule = other.end_of_rule
         if Result and then other.suffices /= Void then
            Result := suffices /= Void and then suffices.count = other.suffices.count
            from
               i := suffices.lower
            until
               not Result or else i > suffices.upper
            loop
               Result := suffices.fast_reference_at(other.suffices.key(i)).is_equal(other.suffices.item(i))
               i := i + 1
            end
         end
      end

feature {DESCENDING_NT_NODE}
   prefix_name: FIXED_STRING

   suffices: HASHED_DICTIONARY[DESCENDING_NT_NODE, FIXED_STRING]

   nt: DESCENDING_NON_TERMINAL

   action: PROCEDURE[TUPLE]

   end_of_rule: BOOLEAN

invariant
   backlinked: nt /= Void

end -- class DESCENDING_NT_NODE
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
