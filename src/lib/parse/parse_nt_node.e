-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PARSE_NT_NODE
	--
	-- An internal class used by PARSE_NON_TERMINAL that implements the LL(n) parsing algorithm.
	--

insert
	TRISTATE_VALUES
		redefine
			copy, is_equal, out_in_tagged_out_memory
		end

creation {PARSE_NON_TERMINAL}
	root

creation {PARSE_NT_NODE}
	make

feature {ANY}
	out_in_tagged_out_memory is
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

feature {PARSE_NON_TERMINAL}
	add (rule: TRAVERSABLE[FIXED_STRING]; a_action: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]) is
		local
			node: PARSE_NT_NODE; name: FIXED_STRING
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

	parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): TRISTATE is
		local
			parse_action: PARSE_ACTION
		do
			check
				is_root: prefix_name = Void
			end
			Result := parse_suffices(buffer, actions)
			if Result /= yes and then end_of_rule then
				-- Epsilon
				Result := yes
				create parse_action.make(action)
				debug ("parse")
					parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
				end
				actions.add_last(parse_action)
			end
		ensure
			actions.count >= old actions.count
			;(Result /= yes) implies buffer.current_index = old buffer.current_index and then actions.count = old actions.count
		end

feature {PARSE_NON_TERMINAL, PARSE_NT_NODE}
	is_coherent: BOOLEAN is
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

	set_default_tree_builder (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; path: COLLECTION[FIXED_STRING]) is
		require
			non_terminal_builder /= Void
		local
			i: INTEGER
		do
			if end_of_rule and then action = Void then
				debug ("parse")
					std_error.put_string(once "Setting default non-terminal tree builder for %"")
					std_error.put_string(nt.name)
					std_error.put_string(once "%": ")
					if prefix_name = Void then
						-- root
						check
							path.is_empty
						end
						std_error.put_line(once "Epsilon")
					else
						from
							i := path.lower
						until
							i > path.upper
						loop
							std_error.put_character('"')
							std_error.put_string(path.item(i))
							std_error.put_character('"')
							std_error.put_character(' ')
							i := i + 1
						end
						std_error.put_character('"')
						std_error.put_string(prefix_name)
						std_error.put_character('"')
						std_error.put_character('>')
						std_error.put_new_line
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

	set_non_terminal (a_non_terminal: like nt) is
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

feature {PARSE_NT_NODE}
	do_add (a_action: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; rule: TRAVERSABLE[FIXED_STRING]; i: INTEGER) is
		require
			rule.valid_index(i)
			rule.item(i) = prefix_name
		local
			name: FIXED_STRING; node: PARSE_NT_NODE
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

	do_parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): TRISTATE is
		require
			not_root: prefix_name /= Void
		local
			old_index, old_count: INTEGER; atom: PARSE_ATOM
			parse_action: PARSE_ACTION
		do
			old_index := buffer.current_index
			old_count := actions.count
			atom := nt.table.item(prefix_name)
			check
				atom /= Void
			end
			Result := atom.parse(buffer, actions)
			check
				suffices = Void implies end_of_rule
			end
			if Result = yes then
				if suffices = Void then
					create parse_action.make(action)
					debug ("parse")
						parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
					end
					actions.add_last(parse_action)
				else
					Result := parse_suffices(buffer, actions)
					if Result /= yes and then end_of_rule then
						-- that's fine: we can end here
						Result := yes
						create parse_action.make(action)
						debug ("parse")
							parse_action.set_name(once "Reduce %"" + nt.name + once "%"")
						end
						actions.add_last(parse_action)
					end
				end
			end
			if Result /= yes then
				buffer.set_current_index(old_index)
				if actions.count > old_count then
					actions.remove_tail(actions.count - old_count)
				end
			end
		ensure
			(Result /= yes) implies buffer.current_index = old buffer.current_index and then actions.count = old actions.count
		end

feature {}
	parse_suffices (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): TRISTATE is
		require
			suffices /= Void
		local
			old_index, old_count, i: INTEGER; node: PARSE_NT_NODE; parsenode: TRISTATE; perhaps: BOOLEAN
		do
			debug ("parse")
				std_error.put_string(once "Scanning non-terminal %"")
				std_error.put_string(nt.name)
				std_error.put_character('"')
				if prefix_name /= Void then
					std_error.put_string(once " for a suffix of %"")
					std_error.put_string(prefix_name)
					std_error.put_character('"')
				end
				std_error.put_new_line
			end
			old_index := buffer.current_index
			old_count := actions.count
			from
				i := suffices.lower
				Result := no
			until
				Result = yes or else i > suffices.upper
			loop
				node := suffices.item(i)
				parsenode := node.do_parse(buffer, actions)
				if parsenode = yes then
					Result := yes
				else
					if parsenode = maybe then
						perhaps := True
					end
					buffer.set_current_index(old_index)
					if actions.count > old_count then
						actions.remove_tail(actions.count - old_count)
					end
					debug ("parse")
						std_error.put_string(once "Still scanning non-terminal %"")
						std_error.put_string(nt.name)
						std_error.put_character('"')
						if prefix_name /= Void then
							std_error.put_string(once " for a suffix of %"")
							std_error.put_string(prefix_name)
							std_error.put_character('"')
						end
						std_error.put_string(once " (%"")
						std_error.put_string(suffices.key(i))
						std_error.put_line(once "%" did not match)")
					end
					i := i + 1
				end
			end
			if Result = no and then perhaps then
				Result := maybe
			end
		ensure
			(Result /= yes) implies buffer.current_index = old buffer.current_index and then actions.count = old actions.count
		end

feature {}
	call_non_terminal_builder (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; path: TRAVERSABLE[FIXED_STRING]) is
		do
			non_terminal_builder.call([nt.name, path])
		end

feature {}
	make (a_prefix_name: like prefix_name; a_nt: like nt) is
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

	root (a_nt: like nt) is
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
	copy (other: like Current) is
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

	is_equal (other: like Current): BOOLEAN is
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

feature {PARSE_NT_NODE}
	prefix_name: FIXED_STRING

	suffices: HASHED_DICTIONARY[PARSE_NT_NODE, FIXED_STRING]

	nt: PARSE_NON_TERMINAL

	action: PROCEDURE[TUPLE]

	end_of_rule: BOOLEAN

invariant
	backlinked: nt /= Void

end -- class PARSE_NT_NODE
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
