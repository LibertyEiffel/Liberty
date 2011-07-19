-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FAKE_TUPLE
	--
	-- Pseudo expression used to avoid creation of TUPLEs while lauching agents.
	-- Also important to check arguments passing more stricly.
	--
	
inherit
   EXPRESSION
	
creation {EFFECTIVE_ARG_LIST}
   make
	
feature {ANY}
   is_void: BOOLEAN is False
	
   is_current, is_implicit_current: BOOLEAN is False
	
   precedence: INTEGER is 2
	
   is_static: BOOLEAN is False
	
   is_manifest_string: BOOLEAN is False
	
   is_result: BOOLEAN is False
	
   is_writable: BOOLEAN is False
	
   extra_bracket_flag: BOOLEAN is False
	
   start_position: POSITION
	
   debug_info: STRING
	
   specialize_in (type: TYPE): like Current is
      local
			i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
			Result := Current
			if list /= Void then
				from
					i := list.upper
				until
					i < list.lower or else e1 /= e2
				loop
					e1 := list.item(i)
					e2 := e1.specialize_in(type)
					i := i - 1
				end
				if e1 = e2 then
					Result := Current
				else
					from
						Result := twin
						l := list.twin
						Result.set_list(l)
						l.put(e2, i + 1)
					until
						i < l.lower
					loop
						l.put(l.item(i).specialize_in(type), i)
						i := i - 1
					end
				end
			end
      end
	
   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
			i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
			Result := Current
			if list /= Void then
				from
					i := list.upper
				until
					i < list.lower or else e1 /= e2
				loop
					e1 := list.item(i)
					e2 := e1.specialize_thru(parent_type, parent_edge, new_type)
					i := i - 1
				end
				if e1 = e2 then
					Result := Current
				else
					from
						Result := twin
						l := list.twin
						Result.set_list(l)
						l.put(e2, i + 1)
					until
						i < l.lower
					loop
						l.put(l.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
						i := i - 1
					end
				end
			end
      end
	
   specialize_2 (type: TYPE): like Current is
      local
			i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
			Result := Current
			if list /= Void then
				from
					i := list.upper
				until
					i < list.lower or else e1 /= e2
				loop
					e1 := list.item(i)
					e2 := e1.specialize_2(type)
					i := i - 1
				end
				if e1 = e2 then
					Result := Current
				else
					from
						Result := twin
						l := list.twin
						Result.set_list(l)
						l.put(e2, i + 1)
					until
						i < l.lower
					loop
						l.put(l.item(i).specialize_2(type), i)
						i := i - 1
					end
				end
			end
      end
	
   has_been_specialized: BOOLEAN is
      local
			i: INTEGER
      do
			Result := True
			if list /= Void then
				from
					i := list.upper
				until
					not Result or else i < list.lower
				loop
					Result := list.item(i).has_been_specialized
					i := i - 1
				end
			end
      end
	
   resolve_in (type: TYPE): TYPE is
      do
			sedb_breakpoint
			check
				False
				-- Because Void can be a valid item in `list,' and because Void as no type, 
				-- one must not collect `Current' entirely. Each item must be collected separately.
			end
      end
   
   collect (type: TYPE): TYPE is
      do
			sedb_breakpoint
			check
				False
				-- Because Void can be a valid item in `list,' and because Void as no type, 
				-- one must not collect `Current' entirely. Each item must be collected separately.
			end
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
      end
	
   adapt_for (type: TYPE): like Current is
      local
			i: INTEGER; e1, e2: EXPRESSION; l: like list
      do
			Result := Current
			if list /= Void then
				from
					i := list.upper
				until
					i < list.lower or else e1 /= e2
				loop
					e1 := list.item(i)
					e2 := e1.adapt_for(type)
					i := i - 1
				end
				if e1 = e2 then
					Result := Current
				else
					from
						Result := twin
						l := list.twin
						Result.set_list(l)
						l.put(e2, i + 1)
					until
						i < l.lower
					loop
						l.put(l.item(i).adapt_for(type), i)
						i := i - 1
					end
				end
			end
      end
	
   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
      end
	
   simplify (type: TYPE): FAKE_TUPLE is
      do
			Result := Current --|*** To be done ***
      end
	
   compile_to_c (type: TYPE) is
      local
			i: INTEGER; e: EXPRESSION
      do
			if list /= Void then
				from
					i := list.lower
				until
					i > list.upper
				loop
					e := list.item(i)
					e.mapping_c_arg(type)
					if i < list.upper then
						cpp.pending_c_function_body.extend(',')
					end
					i := i + 1
				end
			end
      end
	
   mapping_c_target (type, target_formal_type: TYPE) is
      do
			check
				False
			end
      end
	
   mapping_c_arg (type: TYPE) is
      do
			check
				False
			end
      end
	
   safety_check (type: TYPE) is
      local
			i: INTEGER
      do
			if list /= Void then
				from
					i := list.upper
				until
					i < list.lower
				loop
					list.item(i).safety_check(type)
					i := i - 1
				end
			end
      end
	
   declaration_type: TYPE is
      local
			i: INTEGER; rt: TYPE_MARK; gl: ARRAY[TYPE_MARK]
      do
			-- (Yes, it is leaky, but it is not called very often at all.)
			if list = Void then
				create {EMPTY_TUPLE_TYPE_MARK} rt.make(start_position)
			else
				from
					create gl.make(1, list.count)
					i := list.upper
				until
					i < list.lower
				loop
					rt := list.item(i).declaration_type.canonical_type_mark
					gl.put(rt, i + 1)
					i := i - 1
				end
				create {NON_EMPTY_TUPLE_TYPE_MARK} rt.make(start_position, gl)
			end
			Result := rt.type
      end
   
   use_current (type: TYPE): BOOLEAN is
      local
			i: INTEGER
      do
			if list /= Void then
				from
					i := list.upper
				until
					Result or else i < list.lower
				loop
					Result := list.item(i).use_current(type)
					i := i - 1
				end
			end
      end
	
   pretty (indent_level: INTEGER) is
      do
			check -- No FAKE_TUPLE created during `pretty'.
				False
			end
      end
	
   pretty_target (indent_level: INTEGER) is
      do
			check -- No FAKE_TUPLE created during `pretty'.
				False
			end
      end
	
   bracketed_pretty (indent_level: INTEGER) is
      do
			check -- No FAKE_TUPLE created during `pretty'.
				False
			end
      end
	
   short (type: TYPE) is
      local
         i: INTEGER
      do
         short_printer.hook_or(once "open_sb",once "[")
				if list /= Void then
					from
						i := list.lower
					until
						i > list.upper
					loop
						list.item(i).short(type)
						i := i + 1
						if i <= list.upper then
							short_printer.hook_or(once "ma_sep", once ",")
							end
						end
					end
					short_printer.hook_or(once "close_sb",once "]")
					end
					
					short_target (type: TYPE) is
      do
			short_target(type)
      end
	
   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
			check False end
      end
	
   jvm_branch_if_false, jvm_branch_if_true  (type: TYPE): INTEGER is
      do
			check False end
      end
	
   compile_to_jvm (type: TYPE) is
      local
			i: INTEGER
      do
			if list /= Void then
				from
					i := list.lower
				until
					i > list.upper
				loop
					list.item(i).compile_to_jvm(type)
					i := i + 1
				end
			end
      end
	
   compile_target_to_jvm (type: TYPE) is
      do
			check
				False
			end
      end
	
   accept(visitor: FAKE_TUPLE_VISITOR) is
      do
         visitor.visit_fake_tuple(Current)
      end
	
   count: INTEGER is
      do
			if list /= Void then
				Result := list.count
			end
      end
	
   expression (i: INTEGER): EXPRESSION is
      require
			i.in_range(1, count)
      do
			Result := list.item(i - 1)
      end
	
feature {AGENT_LAUNCHER}
   implicit_cast (type: TYPE; open: ARRAY[TYPE]): like Current is
      local
			i, j: INTEGER; e1, e2: EXPRESSION; l: like list
      do
			if list = Void then
				Result := Current
			else
				from
					j := open.upper
					i := list.upper
				until
					i < list.lower or else e1 /= e2
				loop
					e1 := list.item(i)
					if e1.is_void then
						e2 := e1
					else
						e2 := assignment_handler.implicit_cast(e1, e1.resolve_in(type), open.item(j))
					end
					i := i - 1
					j := j - 1
				end
				if e1 = e2 then
					Result := Current
				else
					from
						Result := twin
						l := list.twin
						Result.set_list(l)
						l.put(e2, i + 1)
					until
						i < l.lower
					loop
						e2 := l.item(i)
						e2 := assignment_handler.implicit_cast(e2, e2.resolve_in(type), open.item(j))
						l.put(e2, i)
						i := i - 1
						j := j - 1
					end
				end
			end
      end
	
feature {FAKE_TUPLE}
   set_list (l: like list) is
      require
			l /= Void
      do
			list := l
      ensure
			list = l
      end
	
feature {FAKE_TUPLE_VISITOR}
   list: FAST_ARRAY[EXPRESSION]
	
feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		local
			l: like list; ft: like Current
		do
			if list /= Void then
				l := inline_dynamic_dispatch_of(code_accumulator, type, list)
			end
			if l = list then
				code_accumulator.current_context.add_last(Current)
			else
				ft := twin
				ft.set_list(l)
				code_accumulator.current_context.add_last(ft)
			end
		end
	
feature {}
   make (mt: MANIFEST_TUPLE) is
      require
			mt /= Void
      local
			i: INTEGER; eal: EFFECTIVE_ARG_LIST
      do
			start_position := mt.start_position
			eal := mt.effective_arg_list
			if eal /= Void then
				from
					i := eal.count
					create list.make(i)
				until
					i = 0
				loop
					list.put(eal.expression(i), i - 1)
					i := i - 1
				end
			end
      end
	
invariant
	
   not start_position.is_unknown
	
end --  FAKE_TUPLE
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
