-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FORMAL_ARG_LIST
	--
	-- For the formal arguments list of a routine.
	--

insert
	DECLARATION_LIST

creation {ANY}
	make

feature {ANY}
	name (i: INTEGER): ARGUMENT_NAME1 is
		do
			Result := flat_list.item(i)
		end

	pretty (indent_level: INTEGER) is
		local
			i, j, column, wrap_limit: INTEGER; buffer: STRING; c: CHARACTER
		do
			buffer := once "........................"
			buffer.clear_count
			-- Fill the `buffer' first:
			from
				i := list.lower
			until
				i > list.upper
			loop
				list.item(i).pretty_in(buffer)
				buffer.append(once "; ")
				i := i + 1
			end
			-- Output of `pretty' now start:
			pretty_printer.put_character('(')
			from
				wrap_limit := pretty_printer.wrap_limit
			until
				buffer.is_empty
			loop
				column := pretty_printer.column
				i := buffer.index_of(';', 1)
				check
					i > 0
				end
				if column + i <= wrap_limit then
					from
					until
						buffer.index_of(';', i + 1) = 0 or else column + buffer.index_of(';', i + 1) > wrap_limit
					loop
						i := buffer.index_of(';', i + 1)
					end
				else
					i := buffer.index_of(',', 1)
					if i = 0 then
						i := buffer.index_of(';', 1)
					else
						from
						until
							buffer.index_of(',', i + 1) = 0 or else column + buffer.index_of(',', i + 1) > wrap_limit
						loop
							i := buffer.index_of(',', i + 1)
						end
					end
				end
				check
					i > 1
				end
				-- Output from 1 .. `i' range:
				from
					j := 1
				until
					j > i
				loop
					c := buffer.item(j)
					if j = i and then c = ';' then
						if pretty_printer.parano_mode then
							pretty_printer.put_character(c)
						end
					else
						pretty_printer.put_character(c)
					end
					j := j + 1
				end
				buffer.remove_head(i)
				if not buffer.is_empty then
					if buffer.first = ' ' then
						buffer.remove_first
					end
				end
				if not buffer.is_empty then
					pretty_printer.set_indent_level(indent_level)
				end
			end
			pretty_printer.put_character(')')
		end

	short (shorted_type: TYPE) is
		local
			i: INTEGER
		do
			short_printer.hook_or(once "hook302", once " (")
			from
				i := list.lower
			until
				i > list.upper
			loop
				list.item(i).short(shorted_type)
				i := i + 1
				if i <= list.upper then
					short_printer.hook_or(once "hook303", once "; ")
				end
			end
			short_printer.hook_or(once "hook306", once ")")
		end

	accept (visitor: FORMAL_ARG_LIST_VISITOR) is
		do
			visitor.visit_formal_arg_list(Current)
		end

feature {RUN_FEATURE}
	c_frame_descriptor (type: TYPE; format, locals: STRING) is
		require
			ace.no_check
		local
			i: INTEGER; static_tm: TYPE_MARK
		do
			from
				i := 1
			until
				i > count
			loop
				format.append(name(i).to_string)
				static_tm := type_mark(i).to_static(type)
				static_tm.c_frame_descriptor_in(format)
				locals.append(once "(void**)&a")
				i.append_in(locals)
				locals.extend(',')
				i := i + 1
			end
		end

feature {LIVE_TYPE, RUN_FEATURE}
	compile_to_c_in (type: TYPE; c_code_buffer: STRING) is
		local
			i: INTEGER; static_tm: TYPE_MARK
		do
			from
				i := 1
			until
				i > count
			loop
				static_tm := type_mark(i).to_static(type)
				static_tm.c_type_for_argument_in(c_code_buffer)
				c_code_buffer.extend(' ')
				c_code_buffer.extend('a')
				i.append_in(c_code_buffer)
				i := i + 1
				if i <= count then
					c_code_buffer.extend(',')
				end
			end
		end

feature {JVM}
	jvm_switch_push (type: TYPE; dyn_fal: like Current): INTEGER is
			-- Push inside switching method.
		require
			count = dyn_fal.count
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				Result := Result + jvm_switch_push_ith(type, dyn_fal, i)
				i := i + 1
			end
		end

feature {JVM}
	jvm_switch_push_ith (type: TYPE; dyn_fal: like Current; i: INTEGER): INTEGER is
		local
			ft, at: TYPE; offset: INTEGER
		do
			offset := jvm.argument_offset_of(name(i))
			ft := type_mark(i).resolve_in(type)
			at := dyn_fal.type_mark(i).resolve_in(type)
			ft.canonical_type_mark.jvm_push_local(offset)
			--|*** Is Result really used ? *** Dom 16-09-2005 ***
			Result := at.canonical_type_mark.jvm_stack_space
			jvm.kernel_expanded_convert(ft, at)
		end

feature {RUN_FEATURE, JVM}
	jvm_descriptor_in (buffer: STRING) is
		local
			i: INTEGER; at: TYPE_MARK
		do
			from
				i := 1
			until
				i > count
			loop
				at := type_mark(i)
				if at.is_reference then
					buffer.append(jvm_root_descriptor)
				else
					at.jvm_descriptor_in(buffer)
				end
				i := i + 1
			end
		end

feature {ADDRESS_OF, CECIL_ENTRY}
	external_prototype_in (str: STRING; target_type: TYPE) is
		local
			i: INTEGER; t: TYPE_MARK
		do
			from
				i := 1
			until
				i > count
			loop
				t := type_mark(i).to_static(target_type)
				sedb_breakpoint
				t.c_type_for_external_in(str)
				str.extend(' ')
				str.extend('a')
				i.append_in(str)
				i := i + 1
				if i <= count then
					str.extend(',')
				end
			end
		end

feature {AGENT_CREATION}
	omitted_open_arguments (type, target_type: TYPE; sp: POSITION): EFFECTIVE_ARG_LIST is
			-- Create the corresponding ommited open arguments list.
		local
			rank: INTEGER; open_operand: OPEN_OPERAND; resolved: TYPE
		do
			create open_operand.question_mark(sp)
			open_operand.set_rank(1)
			resolved := type_mark(1).resolve_in(target_type)
			open_operand.update_resolved_memory(type, resolved)
			create Result.make_1(open_operand)
			from
				rank := 2
			until
				rank > count
			loop
				create open_operand.question_mark(sp)
				open_operand.set_rank(rank)
				resolved := type_mark(rank).resolve_in(target_type)
				open_operand.update_resolved_memory(type, resolved)
				Result.add_last(open_operand)
				rank := rank + 1
			end
		ensure
			Result.count = count
		end

feature {ANY}
	has_like_current: BOOLEAN is
		local
			i: INTEGER
		do
			from
				i := flat_list.upper
			until
				Result or else i < flat_list.lower
			loop
				Result := flat_list.item(i).result_type.is_like_current
				i := i - 1
			end
		end

feature {DECLARATION}
	add_last (n: LOCAL_ARGUMENT1) is
		require
			{ARGUMENT_NAME1} ?:= n
		local
			i: INTEGER; n1, n2: like name
		do
			n1 ::= n
			from
				i := flat_list.lower
			until
				flat_list.item(i) = Void
			loop
				n2 := flat_list.item(i)
				if n2.to_string = n1.to_string then
					error_handler.add_position(n1.start_position)
					error_handler.add_position(n2.start_position)
					error_handler.append("Same argument name appears twice in this formal argument list.")
					error_handler.print_as_fatal_error
				end
				i := i + 1
			end
			flat_list.put(n1, i)
			n1.set_rank(i)
		end

feature {}
	make (l: like list) is
			-- Parsing creation procedure.
		require
			l.lower = 1
			not l.is_empty
		local
			an: like name; tlf: LIKE_FEATURE_TYPE_MARK; an2: ARGUMENT_NAME2; tla, tla2: LIKE_ARGUMENT_TYPE_MARK
			i, rank, il, actual_count: INTEGER
		do
			list := l
			-- Setting up the `flat_list' first:
			actual_count := compute_flat_list_count_by_using_list
			create flat_list.make(1, actual_count)
			from
				il := list.lower
			until
				il > list.upper
			loop
				list.item(il).append_in_formal_arg_list(Current)
				il := il + 1
			end
			-- Substituting LIKE_FEATURE_TYPE_MARK/LIKE_ARGUMENT_TYPE_MARK:
			from
				check
					count = actual_count
				end
				i := actual_count
			until
				i = 0
			loop
				an := name(i)
				tlf ?= an.result_type
				if tlf /= Void then
					rank := fast_rank_of(tlf.like_what.to_string)
					if rank = i then
						error_handler.add_position(tlf.start_position)
						error_handler.append(fz_cad)
						error_handler.print_as_fatal_error
					elseif rank > 0 then
						create an2.refer_to(tlf.like_what.start_position, Current, rank)
						create tla.make(tlf.start_position, an2)
						an.set_result_type(tla)
					end
				end
				i := i - 1
			end
			if ace.all_check then
				from
					i := count
				until
					i = 0
				loop
					tla ?= name(i).result_type
					if tla /= Void then
						rank := fast_rank_of(tla.like_what.to_string)
						tla2 ?= name(rank).result_type
						if tla2 /= Void then
							error_handler.add_position(tla.start_position)
							error_handler.add_position(tla2.start_position)
							error_handler.append(fz_cad)
							error_handler.print_as_fatal_error
						end
					end
					i := i - 1
				end
			end
		ensure
			list = list
			flat_list /= Void
		end

	tmp_string: STRING is
		once
			create Result.make(32)
		end

end -- class FORMAL_ARG_LIST
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
