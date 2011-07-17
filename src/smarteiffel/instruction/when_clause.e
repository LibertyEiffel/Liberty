-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class WHEN_CLAUSE
        --
        -- To store a when clause of an inspect instruction. Even if a WHEN_CLAUSE is not an ordinary
        -- INSTRUCTION, it is convenient to inherit INSTRUCTION (contracts an exports).
        --

inherit
        INSTRUCTION

creation {EIFFEL_PARSER}
        parser_make

creation
        make

creation {INTROSPECTION_HANDLER}
        make_strippable

feature {ANY}
        start_position: POSITION
                        -- Of the first character of keyword "when".

        header_comment: COMMENT
                        -- Of the when clause.

        compound: INSTRUCTION
                        -- Of the when clause if any.

        end_mark_comment: BOOLEAN is
                do
                        check
                                False -- Current is not really an INSTRUCTION.
                        end
                end

        use_current (type: TYPE): BOOLEAN is
                do
                        if compound /= Void then
                                Result := compound.use_current(type)
                        end
                end

        specialize_in (new_type: TYPE): like Current is
                local
                        i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
                do
                        if compound /= Void then
                                c := compound.specialize_in(new_type)
                        end
                        from
                                i := list.upper
                        until
                                i < list.lower or else wi1 /= wi2
                        loop
                                wi1 := list.item(i)
                                wi2 := wi1.specialize_in(new_type)
                                i := i - 1
                        end
                        if c = compound and then wi1 = wi2 then
                                Result := Current
                        else
                                Result := twin
                                if wi1 = wi2 then
                                        Result.set_compound(c)
                                else
                                        -- ***
                                        not_yet_implemented
                                        -- ***
                                   -- My guess is that specialize_in must be procedure in WHEN_ITEM !!!
                                   -- If the compiler does not crash... I am right.
                                   -- *** DOM April 23 th 2008 ***
                                        from
                                                l := list.twin
                                                l.put(wi2, i + 1)
                                        until
                                                i < list.lower
                                        loop
                                                l.put(list.item(i).specialize_in(new_type), i)
                                                i := i - 1
                                        end
                                        Result.init(c, l)
                                end
                        end
                end

        specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
                local
                        i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
                do
                        if compound /= Void then
                                c := compound.specialize_thru(parent_type, parent_edge, new_type)
                        end
                        from
                                i := list.upper
                        until
                                i < list.lower or else wi1 /= wi2
                        loop
                                wi1 := list.item(i)
                                wi2 := wi1.specialize_thru(parent_type, parent_edge, new_type)
                                i := i - 1
                        end
                        if c = compound and then wi1 = wi2 then
                                Result := Current
                        else
                                Result := twin
                                if wi1 = wi2 then
                                        Result.set_compound(c)
                                else
                                        -- ***
                                        not_yet_implemented
                                        -- ***
                                   -- My guess is that specialize_thru must be procedure in WHEN_ITEM !!!
                                   -- If the compiler does not crash... I am right.
                                   -- *** DOM April 23 th 2008 ***
                                        from
                                                l := list.twin
                                                l.put(wi2, i + 1)
                                        until
                                                i < list.lower
                                        loop
                                                l.put(list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                                                i := i - 1
                                        end
                                        Result.init(c, l)
                                end
                        end
                end

   specialize_2 (type: TYPE): INSTRUCTION is
                do
                        check
                                False -- *** Why is the work done in INSPECT_STATEMENT ?? *** DOM April 20th 2008 ***
                        end
                        not_yet_implemented -- To be warned even in -boost mode.
                end

        has_been_specialized: BOOLEAN is
                local
                        i: INTEGER
                do
                        Result := compound /= Void implies compound.has_been_specialized
                        if Result then
                                from
                                        i := list.upper
                                until
                                        i < list.lower or else not Result
                                loop
                                        Result := list.item(i).has_been_specialized
                                        i := i - 1
                                end
                        end
                end

        side_effect_free (type: TYPE): BOOLEAN is
                do
                        --|*** Could be better. ***
                end

        accept (visitor: WHEN_CLAUSE_VISITOR) is
                do
                        visitor.visit_when_clause(Current)
                end


feature {INSPECT_STATEMENT}
        create_merged_with (other: like Current): like Current is
                        -- Assuming that `Current' has the same compound as `other', the `Result' is the merged.
                require
                        values_not_yet_computed: values = Void
                local
                        l: like list
                do
                        Result := twin
                        l := list.twin
                        l.append_traversable(other.list)
                        Result.set_list(l)
                end

        is_more_complex_than (other: like Current): BOOLEAN is
                do
                        Result := list.count > other.list.count
                end

feature {INSPECT_STATEMENT}
        condition_live_type: LIVE_TYPE

        set_condition_live_type (clt: like condition_live_type) is
                do
                        condition_live_type := clt
                ensure
                        condition_live_type = clt
                end

feature {ANY}
        collect (type: TYPE): TYPE is
                local
                        i: INTEGER; dummy: TYPE
                do
                        if compound /= Void then
                                if strip_condition /= Void then
                                        condition_live_type.forbid_collecting(strip_condition)
                                end
                                dummy := compound.collect(type)
                                if strip_condition /= Void then
                                        condition_live_type.allow_collecting(strip_condition)
                                end
                        end
                        from
                                i := list.upper
                        until
                                i < list.lower
                        loop
                                list.item(i).collect(type)
                                i := i - 1
                        end
                end

        simplify (type: TYPE): like Current is
                local
                        c: like compound
                do
                        if compound /= Void then
                                c := compound.simplify(type)
                        end
                        if c = compound then
                                Result := Current
                        else
                                Result := twin
                                Result.set_compound(c)
                        end
                end

        compile_to_jvm (type: TYPE) is
                do
                        not_yet_implemented
                end

        compile_to_c (type: TYPE) is
                local
                        bi: INTEGER
                do
                        cpp.pending_c_function_body.append(once "%Nif(")
                        from
                                bi := values.lower
                        until
                                bi > values.upper
                        loop
                                cpp.pending_c_function_body.extend('(')
                                if values.item(bi) = values.item(bi + 1) then
                                        values.item(bi).append_in(cpp.pending_c_function_body)
                                        cpp.pending_c_function_body.append(once "==")
                                        cpp.inspect_local_compile_to_c(type)
                                else
                                        cpp.pending_c_function_body.extend('(')
                                        values.item(bi).append_in(cpp.pending_c_function_body)
                                        cpp.pending_c_function_body.append(once "<=")
                                        cpp.inspect_local_compile_to_c(type)
                                        cpp.pending_c_function_body.append(once ")&&(")
                                        cpp.inspect_local_compile_to_c(type)
                                        cpp.pending_c_function_body.append(once "<=")
                                        values.item(bi + 1).append_in(cpp.pending_c_function_body)
                                        cpp.pending_c_function_body.extend(')')
                                end
                                cpp.pending_c_function_body.extend(')')
                                --
                                bi := bi + 2
                                if bi < values.upper then
                                        cpp.pending_c_function_body.append(once "||")
                                end
                        end
                        cpp.pending_c_function_body.append(once "){%N")
                        if compound /= Void then
                                compound.compile_to_c(type)
                        end
                        cpp.pending_c_function_body.append(once "}%N")
                end

        compile_to_c_switch (type: TYPE) is
                local
                        bi, v: INTEGER
                do
                        from
                                bi := values.lower
                        until
                                bi > values.upper
                        loop
                                from
                                        v := values.item(bi)
                                until
                                        v > values.item(bi + 1)
                                loop
                                        cpp.pending_c_function_body.append(once "case ")
                                        v.append_in(cpp.pending_c_function_body)
                                        cpp.pending_c_function_body.append(once ":%N")
                                        v := v + 1
                                end
                                bi := bi + 2
                        end
                        if compound /= Void then
                                compound.compile_to_c(type)
                        end
                        cpp.pending_c_function_body.append(once "break;%N")
                end

        pretty (indent_level: INTEGER) is
                local
                        i: INTEGER
                do
                        pretty_printer.set_indent_level(indent_level)
                        pretty_printer.keyword(once "when")
                        if header_comment /= Void then
                                header_comment.pretty(indent_level + 1)
                        end
                        if list /= Void then
                                from
                                        i := list.lower
                                until
                                        i > list.upper
                                loop
                                        list.item(i).pretty(indent_level + 1)
                                        i := i + 1
                                        if i <= list.upper then
                                                pretty_printer.put_character(',')
                                                if not pretty_printer.zen_mode then
                                                        pretty_printer.put_character(' ')
                                                end
                                        end
                                end
                        end
                        pretty_printer.keyword(once "then")
                        pretty_printer.set_indent_level(indent_level + 1)
                        if compound /= Void then
                                compound.pretty(indent_level + 1)
                        end
                        pretty_printer.set_indent_level(0)
                end

        safety_check (type: TYPE) is
                do
                        if compound /= Void then
                                compound.safety_check(type)
                        end
                end

        adapt_for (t: TYPE): like Current is
                local
                        i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
                do
                        if compound /= Void then
                                c := compound.adapt_for(t)
                        end
                        from
                                i := list.upper
                        until
                                i < list.lower or else wi1 /= wi2
                        loop
                                wi1 := list.item(i)
                                wi2 := wi1.adapt_for(t)
                                i := i - 1
                        end
                        if c = compound and then wi1 = wi2 then
                                Result := Current
                        else
                                Result := twin
                                if wi1 = wi2 then
                                        Result.set_compound(c)
                                else
                                        from
                                                l := list.twin
                                                l.put(wi2, i + 1)
                                        until
                                                i < list.lower
                                        loop
                                                l.put(list.item(i).adapt_for(t), i)
                                                i := i - 1
                                        end
                                        Result.init(c, l)
                                end
                        end
                end

feature {}
        parser_make (sp: like start_position; hc: like header_comment) is
                require
                        not sp.is_unknown
                do
                        start_position := sp
                        header_comment := hc
                        create list.with_capacity(4)
                ensure
                        start_position = sp
                end

        make (inspect_statement: INSPECT_STATEMENT; sp: like start_position; hc: like header_comment) is
                require
                        inspect_statement /= Void
                        not sp.is_unknown
                do
                        inspect_statement.add_when(Current)
                        start_position := sp
                        header_comment := hc
                        create list.with_capacity(4)
                ensure
                        start_position = sp
                end

        make_strippable (inspect_statement: INSPECT_STATEMENT; condition: like strip_condition) is
                require
                        inspect_statement /= Void
                        condition /= Void
                        inspect_statement.condition_type /= Void
                do
                        strip_condition := condition
                        make(inspect_statement, inspect_statement.start_position, Void)
                ensure
                        strip_condition = condition
                end

feature {INSPECT_STATEMENT}
        validity_check (type, expression_type: TYPE; container: INSPECT_STATEMENT) is
                require
                        type /= Void
                        expression_type /= Void
                        container /= Void
                local
                        i: INTEGER
                do
                        from
                                i := list.lower
                        until
                                i > list.upper
                        loop
                                list.item(i).validity_check(type, expression_type, container)
                                i := i + 1
                        end
                end

        validity_check_continued (type, expression_type: TYPE; occurrence_1: WHEN_ITEM): BOOLEAN is
                require
                        type /= Void
                        expression_type /= Void
                        occurrence_1 /= Void
                local
                        i: INTEGER
                do
                        from
                                i := list.lower
                        until
                                i > list.upper
                                        or else
                                list.item(i).validity_check_continued(type, expression_type, occurrence_1)
                        loop
                                i := i + 1
                        end
                end

feature {INSPECT_STATEMENT}
        includes_integer (v: INTEGER): BOOLEAN is
                local
                        i: INTEGER
                do
                        if values /= Void and then v >= values.item(values.lower) and then v <= values.item(values.upper) then
                                from
                                        i := values.lower
                                until
                                        Result or else i > values.upper
                                loop
                                        Result := values.item(i) <= v and then v <= values.item(i + 1)
                                        i := i + 2
                                end
                        end
                end

        includes_integer_between (l, u: INTEGER): BOOLEAN is
                require
                        invalid_range: l < u
                local
                        i: INTEGER
                do
                        if values /= Void and then u >= values.item(values.lower) and then l <= values.item(values.upper) then
                                from
                                        i := values.lower
                                until
                                        Result or else i > values.upper
                                loop
                                        Result := values.item(i) <= u and then l <= values.item(i + 1)
                                        i := i + 2
                                end
                        end
                end

        largest_range_of_values: INTEGER is
                        -- The largest number of consecutive values - returns 0 if none
                local
                        i, range: INTEGER
                do
                        if values /= Void then
                                from
                                        i := values.lower
                                until
                                        i > values.upper
                                loop
                                        range := values.item(i + 1) - values.item(i) + 1
                                        if range > Result then
                                                Result := range
                                        end
                                        i := i + 2
                                end
                        end
                end

feature {INSPECT_STATEMENT, WHEN_CLAUSE}
        specialize_2_character (type: TYPE): like Current is
                require
                        has_been_specialized
                        not smart_eiffel.status.is_specializing
                local
                        i: INTEGER; c: like compound; l: like list; wi1, wi2: WHEN_ITEM
                do
                        if compound /= Void then
                                c := compound.specialize_2(type)
                        end
                        from
                                i := list.upper
                        until
                                i < list.lower or else wi1 /= wi2
                        loop
                                wi1 := list.item(i)
                                wi2 := wi1.specialize_2_character(type)
                                i := i - 1
                        end
                        if c = compound and then wi1 = wi2 then
                                Result := Current
                        else
                                Result := twin
                                if wi1 = wi2 then
                                        Result.set_compound(c)
                                else
                                        from
                                                l := list.twin
                                                l.put(wi2, i + 1)
                                        until
                                                i < list.lower
                                        loop
                                                l.put(list.item(i).specialize_2_character(type), i)
                                                i := i - 1
                                        end
                                        Result.init(c, l)
                                end
                        end
                ensure
                        has_been_specialized
                        Result.has_been_specialized
                end

        specialize_2_integer (type: TYPE): like Current is
                require
                        has_been_specialized
                        not smart_eiffel.status.is_specializing
                local
                        c: like compound
                do
                        if compound /= Void then
                                c := compound.specialize_2(type)
                        end
                        Result := specialize_2_when_items_integer(type, c)
                ensure
                        has_been_specialized
                        Result.has_been_specialized
                end

        specialize_2_when_items_integer (type: TYPE; c: like compound): like Current is
                require
                        has_been_specialized
                        not smart_eiffel.status.is_specializing
                local
                        i: INTEGER; l: like list; wi1, wi2: WHEN_ITEM
                do
                        from
                                i := list.upper
                        until
                                i < list.lower or else wi1 /= wi2
                        loop
                                wi1 := list.item(i)
                                wi2 := wi1.specialize_2_integer(type)
                                i := i - 1
                        end
                        if c = compound and then wi1 = wi2 then
                                Result := Current
                        else
                                Result := twin
                                if wi1 = wi2 then
                                        Result.set_compound(c)
                                else
                                        from
                                                l := list.twin
                                                l.put(wi2, i + 1)
                                        until
                                                i < list.lower
                                        loop
                                                l.put(list.item(i).specialize_2_integer(type), i)
                                                i := i - 1
                                        end
                                        Result.init(c, l)
                                end
                        end
                ensure
                        has_been_specialized
                        Result.has_been_specialized
                end

        specialize_2_string (type: TYPE): like Current is
                require
                        has_been_specialized
                        not smart_eiffel.status.is_specializing
                local
                        c: like compound
                do
                        if compound /= Void then
                                c := compound.specialize_2(type)
                        end
                        if c = compound then
                                Result := Current
                        else
                                Result := twin
                                Result.set_compound(c)
                        end
                ensure
                        has_been_specialized
                        Result.has_been_specialized
                end

feature {INSPECT_STATEMENT}
        compute_values (type: TYPE) is
                local
                        i: INTEGER; debug_values: like values
                do
                        if values /= Void then
                                -- Well, `values' are already computed and the inspect has only static values.
                                -- Let's check that in the following debug to be really sure:
                                debug
                                        debug_values := values
                                        values := Void
                                        compute_values(type)
                                        check
                                                values.is_equal(debug_values)
                                        end
                                end
                        else
                                from
                                        i := list.upper
                                until
                                        i < list.lower
                                loop
                                        values := list.item(i).compute_values(type, values)
                                        i := i - 1
                                end
                        end
                end

        force_internal_integer_values (type: TYPE) is
                local
                        i: INTEGER
                do
                        from
                                i := list.upper
                        until
                                i < list.lower
                        loop
                                list.item(i).force_internal_integer_values(type, Current)
                                i := i - 1
                        end
                end

        force_internal_character_values (type: TYPE) is
                local
                        i: INTEGER
                do
                        from
                                i := list.upper
                        until
                                i < list.lower
                        loop
                                list.item(i).force_internal_character_values(type, Current)
                                i := i - 1
                        end
                end

        match_value (v: INTEGER): BOOLEAN is
                local
                        i: INTEGER
                do
                        from
                                i := list.upper
                        until
                                Result or else i < list.lower
                        loop
                                Result := list.item(i).match_value(v)
                                i := i - 1
                        end
                end

        strip_or_set_value (v: INTEGER; specialize_type, condition_type: TYPE): like Current is
                local
                        l: like list; ic: INTEGER_CONSTANT
                do
                        if condition_type = Void then
                                Result := Current
                        elseif is_live(condition_type) then
                                create ic.make(v, start_position)
                                if list.is_empty then
                                        add_value(ic)
                                        Result := Current
                                else
                                        create l.with_capacity(1)
                                        Result := twin
                                        Result.init(compound, l)
                                        Result.add_value(ic)
                                end
                                Result := Result.specialize_2_when_items_integer(specialize_type, compound)
                        end
                end

feature {}
        is_live (condition_type: TYPE): BOOLEAN is
                do
                        Result := strip_condition = Void or else condition_type.live_type.collected(strip_condition)
                end

feature {WHEN_CLAUSE, INTROSPECTION_HANDLER, MANIFEST_STRING_INSPECTOR, FEATURE_CALL}
        add_value (v: EXPRESSION) is
                require
                        v /= Void
                local
                        element: WHEN_ITEM
                do
                        create {WHEN_ITEM_1} element.make(v)
                        list.add_last(element)
                end

feature {EIFFEL_PARSER, WHEN_CLAUSE, INTROSPECTION_HANDLER, MANIFEST_STRING_INSPECTOR}
        add_slice (min, max: EXPRESSION) is
                require
                        min /= Void
                        max /= Void
                local
                        element: WHEN_ITEM
                do
                        no_manifest_string_slice_check(min)
                        no_manifest_string_slice_check(max)
                        create {WHEN_ITEM_2} element.make(min, max)
                        list.add_last(element)
                end

feature {WHEN_CLAUSE, INTROSPECTION_HANDLER}
        init (c: like compound; l: like list) is
                require
                        l /= Void
                do
                        compound := c
                        list := l
                ensure
                        compound = c
                        list = l
                end

feature {WHEN_CLAUSE, CODE, EIFFEL_PARSER, INTROSPECTION_HANDLER, MANIFEST_STRING_INSPECTOR}
        set_compound (c: like compound) is
                do
                        compound := c
                ensure
                        compound = c
                end

feature {WHEN_CLAUSE, MANIFEST_STRING_INSPECT_STATEMENT, MANIFEST_STRING_INSPECTOR, WHEN_CLAUSE_VISITOR}
        list: FAST_ARRAY[WHEN_ITEM]

feature {WHEN_CLAUSE}
        values: ARRAY[INTEGER]
                        -- To store pairs of range values in the canonical form as described below.
                        -- The number of items is always pair. A WHEN_ITEM_2 is represented with two
                        -- values but a WHEN_ITEM_1 is also represented with two values (the same one
                        -- which is repeated). Area are merged. Index used in `values' are not meaningful.
                        -- Examples:
                        --      when   1..3, 5 then
                        --      values 1,3,5,5
                        --
                        --      when   1..3, 4 then
                        --      values 1,4

        set_list (l: like list) is
                require
                        l /= Void
                do
                        list := l
                ensure
                        list = l
                end

feature {CODE, EFFECTIVE_ARG_LIST}
        inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
                local
                        c: like compound; when_clause: like Current
                do
                        if compound /= Void then
                                code_accumulator.open_new_context
                                compound.inline_dynamic_dispatch_(code_accumulator, type)
                                c := code_accumulator.current_context_to_instruction
                                code_accumulator.close_current_context
                        end
                        if c = compound then
                                code_accumulator.current_context.add_last(Current)
                        else
                                when_clause := twin
                                when_clause.set_compound(c)
                                code_accumulator.current_context.add_last(when_clause)
                        end
                end

feature {EIFFEL_PARSER}
        parser_add_value (manifest_string_flag: INTEGER; allowed_constant: EXPRESSION): INTEGER is
                require
                        allowed_constant /= Void
                do
                        add_value(allowed_constant)
                        inspect
                                manifest_string_flag
                        when 0 then
                                if {MANIFEST_STRING} ?:= allowed_constant then
                                        Result := 1
                                else
                                        Result := -1
                                end
                        when -1 then
                                if {MANIFEST_STRING} ?:= allowed_constant then
                                        error_handler.add_position(allowed_constant.start_position)
                                        error_handler.append("Cannot use here a manifest STRING because the previous one %
                                    %used in this %"inspect%" statement is not a manifest STRING.")
                                        error_handler.print_as_fatal_error
                                else
                                        Result := -1
                                end
                        when 1 then
                                if {MANIFEST_STRING} ?:= allowed_constant then
                                        Result := 1
                                else
                                        error_handler.add_position(allowed_constant.start_position)
                                        error_handler.append("Must use here a manifest STRING because the previous one %
                                    %used in this %"inspect%" statement is a manifest STRING.")
                                        error_handler.print_as_fatal_error
                                end
                        end
                ensure
                        (Result = -1) or else (Result = 1)
                end

feature {}
        strip_condition: FEATURE_STAMP

        no_manifest_string_slice_check (expression: EXPRESSION) is
                do
                        if expression.is_manifest_string then
                                error_handler.add_position(expression.start_position)
                                error_handler.append("Cannot use '..' with manifest strings.")
                                error_handler.print_as_fatal_error
                        end
                end

        em1: STRING is "Bad when clause."

        em2: STRING is "Empty when clause in inspect."

invariant
        list /= Void

end -- class WHEN_CLAUSE
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
