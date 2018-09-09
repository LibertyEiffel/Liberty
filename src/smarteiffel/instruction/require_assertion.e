-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class REQUIRE_ASSERTION
   --
   -- To store a `require' or an `require else' assertion.
   --

inherit
   INSTRUCTION
      undefine out_in_tagged_out_memory
      end

insert
   ASSERTION_PRINT_TOOLS
      undefine out_in_tagged_out_memory
      end
   TRAVERSABLE[ASSERTION_LIST]
      --*** Using traversable is very inefficient here (better implementation?)

create {TMP_FEATURE}
   make

create {ANONYMOUS_FEATURE_MIXER}
   from_parents

feature {ANY}
   is_require_else: BOOLEAN
         -- Is it a "require else"?

   end_mark_comment: BOOLEAN
      do
         check
            False -- This one must never be called.
            -- Well, a REQUIRE_ASSERTION is not really an ordinary INSTRUCTION.
         end
      end

   pretty (indent_level: INTEGER)
      do
         check
            local_require /= Void
            direct_parents_require = Void
         end
         if is_require_else then
            local_require.pretty_print_with_tag(2, once "require else")
         else
            local_require.pretty_print_with_tag(2, once "require")
         end
      end

   start_position: POSITION
      do
         if local_require /= Void then
            Result := local_require.start_position
         else
            Result := direct_parents_require.first.start_position
         end
      end

   header_comment: COMMENT
      do
         if local_require /= Void then
            Result := local_require.header_comment
         end
      end

   short (type: TYPE; client: TYPE_MARK; hide_current: BOOLEAN)
      local
         i: INTEGER
      do
         if direct_parents_require = Void then
            short_list(type, local_require, once "hook401", once "      require%N", client, hide_current)
         else
            if local_require = Void then
               short_printer.hook_or(once "hook401", once "      require%N")
            else
               short_list(type, local_require, once "hook402", once "      require%N       (%N", client, hide_current)
               short_printer.hook_or(once "hook404", once "       ) or else (%N")
               --*** Not so good if all parents have hidden expressions (PH 16/07/08)
            end
            from
               i := direct_parents_require.lower
            until
               i > direct_parents_require.upper
            loop
               direct_parents_require.item(i).short_(type, client, hide_current)
               i := i + 1
            end
            if local_require /= Void then
               short_printer.hook_or(once "hook405", once "       )%N")
            end
         end
         short_printer.hook(once "hook403")
      end

feature {REQUIRE_ASSERTION}
   short_(type: TYPE; client: TYPE_MARK; hide_current: BOOLEAN)
         -- Short the require without printing the `require' keyword.
         --*** Some indent level should be added (PH 16/07/08)
      local
         i: INTEGER
      do
         if direct_parents_require = Void then
            short_list(type, local_require, once "hoook406", once "", client, hide_current)
         else
            if local_require /= Void then
               short_list(type, local_require, once "hook407", once "       (%N", client, hide_current)
               short_printer.hook_or(once "hook404", once "       ) or else (%N")
               --*** Not so good if all parents have hidden expressions (PH 16/07/08)
            end
            from
               i := direct_parents_require.lower
            until
               i > direct_parents_require.upper
            loop
               direct_parents_require.item(i).short_(type, client, hide_current)
               i := i + 1
            end
            if local_require /= Void then
               short_printer.hook_or(once "hook405", once "       )%N")
            end
         end
      end

feature {}
   short_list (type: TYPE; al: ASSERTION_LIST; h1, r1: STRING; client: TYPE_MARK; hide_current: BOOLEAN)
      local
         i: INTEGER
      do
         tmp_assertion_list.clear_count
         if not al.is_empty then
            from
               i := al.lower
            until
               i > al.upper
            loop
               if client = Void or else not hidden_expression_detector.visit(al.item(i), type, client, hide_current) then
                  tmp_assertion_list.add_last(al.item(i))
               end
               i := i + 1
            end
         end
         tmp_assertion_list.clear_count
         if not al.is_empty then
            from
               i := 0
            until
               i > al.upper
            loop
               if client = Void or else not hidden_expression_detector.visit(al.item(i), type, client, hide_current) then
                  tmp_assertion_list.add_last(al.item(i))
               end
               i := i + 1
            end
         end
         if header_comment /= Void or else not tmp_assertion_list.is_empty then
            short_printer.hook_or(h1, r1)
--*** Shouldn't "once" be added before each manifest string? (PH 16/07/08)
            if header_comment = Void then
               short_printer.hook_or("hook412", "")
            else
               short_printer.hook_or("hook413", "")
               header_comment.short("hook414", "    --", "hook415", "%N")
               short_printer.hook_or("hook416", "")
            end
            if tmp_assertion_list.is_empty then
               short_printer.hook_or("hook417", "")
            else
               short_printer.hook_or("hook418", "")
               from
                  i := tmp_assertion_list.lower
               until
                  i = tmp_assertion_list.upper
               loop
                  tmp_assertion_list.item(i).short_hooks(type
                  , "hook419"
                  , "    "
                  , "hook420" -- before each assertion
                  , "", "hook421" -- no tag
                  , "", "hook422" -- before tag
                  , ": ", "hook423" -- after tag
                  , "", "hook424" -- no expression
                  , "", "hook425" -- before expression
                  , ";", "hook426" -- after expression except last
                  , "%N", "hook427" -- no comment
                  , "", "hook428" -- before comment
                  , " --", "hook429" -- comment begin line
                  , "%N", "hook430" -- comment end of line
                  , "", "hook431" -- after comment
                  , "")
                  -- end of each assertion
                  i := i + 1
               end
               tmp_assertion_list.item(i).short_hooks(type
               , "hook419"
               , "    "
               , "hook420" -- before each assertion
               , "", "hook421" -- no tag
               , "", "hook422" -- before tag
               , ": ", "hook423" -- after tag
               , "", "hook424" -- no expression
               , "", "hook432" -- before expression
               , "", "hook426" -- after expression except last
               , "%N", "hook427" -- no comment
               , "", "hook428" -- before comment
               , " --", "hook429" -- comment begin line
               , "%N", "hook430" -- comment end of line
               , "", "hook431" -- after comment
               , "")
               short_printer.hook_or("hook433", "")
            end
            short_printer.hook_or("hook434", "")
         end
      end

feature {ANY}
   specialize_in (type: TYPE): like Current
      local
         lr: like local_require
      do
         Result := Current
         if local_require /= Void then
            lr := local_require.specialize_in(type)
            if lr /= local_require then
               Result := twin
               Result.set_local_require(lr)
            end
         end
         -- specialize_in does not apply to direct_parents_require
      end

   has_been_specialized: BOOLEAN
      local
         i: INTEGER
      do
         if local_require /= Void then
            Result := local_require.has_been_specialized
         else
            Result := True
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               not Result or else i > direct_parents_require.upper
            loop
               Result := direct_parents_require.item(i).has_been_specialized
               i := i + 1
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         i: INTEGER; lr: like local_require; ra1, ra2: REQUIRE_ASSERTION
         pr: like direct_parents_require
      do
         Result := Current
         if local_require /= Void then
            lr := local_require.specialize_thru(parent_type, parent_edge, new_type)
            if lr /= local_require then
               Result := twin
               Result.set_local_require(lr)
            end
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
                ra1 /= ra2 or else i > direct_parents_require.upper
            loop
               ra1 := direct_parents_require.item(i)
               ra2 := ra1.specialize_thru(parent_type, parent_edge, new_type)
               i := i + 1
            end
            if ra1 /= ra2 then
               if Result = Current then
                  Result := twin
               end
               from
                  pr := direct_parents_require.twin
                  Result.set_direct_parents_require(pr)
                  pr.put(ra2, i - 1)
               until
                  i > direct_parents_require.upper
               loop
                  pr.put(direct_parents_require.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
            end
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         i: INTEGER; lr: like local_require; ra1, ra2: REQUIRE_ASSERTION
         pr: like direct_parents_require
      do
         Result := Current
         if local_require /= Void then
            lr := local_require.specialize_and_check(type)
            if lr /= local_require then
               Result := twin
               Result.set_local_require(lr)
            end
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               ra1 /= ra2 or else i > direct_parents_require.upper
            loop
               ra1 := direct_parents_require.item(i)
               ra2 := ra1.specialize_and_check(type)
               i := i + 1
            end
            if ra1 /= ra2 then
               if Result = Current then
                  Result := twin
               end
               from
                  pr := direct_parents_require.twin
                  Result.set_direct_parents_require(pr)
                  pr.put(ra2, i - 1)
               until
                  i > direct_parents_require.upper
               loop
                  pr.put(direct_parents_require.item(i).specialize_and_check(type), i)
                  i := i + 1
               end
            end
         end
      end

   collect (type: TYPE): TYPE
      local
         i: INTEGER; dummy: TYPE
      do
         if local_require /= Void then
            dummy := local_require.collect(type)
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               i > direct_parents_require.upper
            loop
               dummy := direct_parents_require.item(i).collect(type)
               i := i + 1
            end
         end
      end

   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         i: INTEGER; lr: like local_require; ra1, ra2: REQUIRE_ASSERTION
         pr: like direct_parents_require; require_assertion: like Current
      do
         require_assertion := Current
         if local_require /= Void then
            lr ::= local_require.inline_dynamic_dispatch(code_accumulator, type)
            check
               lr /= Void
            end
            if lr /= local_require then
               require_assertion := twin
               require_assertion.set_local_require(lr)
            end
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               ra1 /= ra2 or else i > direct_parents_require.upper
            loop
               ra1 := direct_parents_require.item(i)
               ra2 ::= ra1.inline_dynamic_dispatch(code_accumulator, type)
               check
                  ra2 /= Void
               end
               i := i + 1
            end
            if ra1 /= ra2 then
               if require_assertion = Current then
                  require_assertion := twin
               end
               from
                  pr := direct_parents_require.twin
                  require_assertion.set_direct_parents_require(pr)
                  pr.put(ra2, i - 1)
               until
                  i > pr.upper
               loop
                  ra1 ::= direct_parents_require.item(i).inline_dynamic_dispatch(code_accumulator, type)
                  check
                     ra1 /= Void
                  end
                  pr.put(ra1, i)
                  i := i + 1
               end
            end
         end
         code_accumulator.current_context.add_last(require_assertion)
      end

   adapt_for (type: TYPE): like Current
      local
         i: INTEGER; lr: like local_require; ra1, ra2: REQUIRE_ASSERTION
         pr: like direct_parents_require
      do
         Result := Current
         if local_require /= Void then
            lr := local_require.adapt_for(type)
            if lr /= local_require then
               Result := twin
               Result.set_local_require(lr)
            end
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               ra1 /= ra2 or else i > direct_parents_require.upper
            loop
               ra1 := direct_parents_require.item(i)
               ra2 := ra1.adapt_for(type)
               i := i + 1
            end
            if ra1 /= ra2 then
               if Result = Current then
                  Result := twin
               end
               from
                  pr := direct_parents_require.twin
                  Result.set_direct_parents_require(pr)
                  pr.put(ra2, i - 1)
               until
                  i > pr.upper
               loop
                  pr.put(direct_parents_require.item(i).adapt_for(type), i)
                  i := i + 1
               end
            end
         end
      end

   use_current (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         if local_require /= Void then
            Result := local_require.use_current(type)
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               Result or else i > direct_parents_require.upper
            loop
               Result := direct_parents_require.item(i).use_current(type)
               i := i + 1
            end
         end
      end

   is_always_true (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         if local_require /= Void then
            Result := local_require.is_always_true(type)
         end
         if not Result and then direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
               Result := True
            until
               not Result or else i > direct_parents_require.upper
            loop
               Result := direct_parents_require.item(i).is_always_true(type)
               i := i + 1
            end
         end
      end

   safety_check (type: TYPE)
      local
         i: INTEGER
      do
         if local_require /= Void then
            local_require.safety_check(type)
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               i > direct_parents_require.upper
            loop
               direct_parents_require.item(i).safety_check(type)
               i := i + 1
            end
         end
      end

   simplify (type: TYPE): like Current
      do
         check
            simplify_is_only_made_for_boost: False
         end
         not_yet_implemented -- To be sure.
      end

   side_effect_free (type: TYPE): BOOLEAN
      local
         i: INTEGER
      do
         if local_require /= Void then
            Result := local_require.side_effect_free(type)
         else
            Result := True
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               not Result or else i > direct_parents_require.upper
            loop
               Result := direct_parents_require.item(i).side_effect_free(type)
               i := i + 1
            end
         end
      end

   accept (visitor: REQUIRE_ASSERTION_VISITOR)
      do
         visitor.visit_require_assertion(Current)
      end

feature {ANY} -- Implementation of TRAVERSABLE:
   lower: INTEGER
      do
         Result := 1
      end

   upper: INTEGER
      do
         Result := count
      end

   count: INTEGER
      local
         i: INTEGER
      do
         if local_require /= Void then
            Result := 1
         end
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               i > direct_parents_require.upper
            loop
               Result := Result + direct_parents_require.count
               i := i + 1
            end
         end
      ensure then
         count > 0
      end

   is_empty: BOOLEAN False

   item (i: INTEGER): ASSERTION_LIST
      local
         j, k, c: INTEGER
      do
         j := i
         if local_require /= Void then
            j := j - 1
         end
         if j = 0 then
            Result := local_require
         else
            from
          k := direct_parents_require.lower
               c := direct_parents_require.item(k).count
       until
               j <= c
       loop
               j := j - c
          k := k + 1
               c := direct_parents_require.item(k).count
       end
            Result := direct_parents_require.item(k).item(j)
         end
      end

   first: like item
      do
         if local_require = Void then
            Result := direct_parents_require.first.first
         else
            Result := local_require
         end
      end

   last: like item
      do
         if direct_parents_require = Void then
            Result := local_require
         else
            Result := direct_parents_require.last.last
         end
      end

feature {}
   new_iterator: ITERATOR[ASSERTION_LIST]
      do
         check
            False -- Just use the usual pattern instead please.
         end
      end

feature {ANONYMOUS_FEATURE_MIXER}
   add_parent_require (parent_require: like Current)
         -- Add `parent_require' to `Current' only if it is really new code (i.e. using `start_position' to decide.).
      require
         parent_require /= Void
      do
         if start_position /= parent_require.start_position then --*** Have to test each parent (PH 16/7/08)
            if not has_item_located_at(parent_require.start_position) then
               if direct_parents_require = Void then
                  create direct_parents_require.with_capacity(1)
               end
               direct_parents_require.add_last(parent_require)
            end
         end
      end

feature {}
   has_item_located_at (sp: POSITION): BOOLEAN
      require
         not sp.is_unknown
      local
         i: INTEGER
      do
         if direct_parents_require /= Void then
            from
               i := direct_parents_require.lower
            until
               Result or else i > direct_parents_require.upper
            loop
               Result := direct_parents_require.item(i).start_position = sp
               i := i + 1
            end
         end
      end

feature {REQUIRE_ASSERTION}
   set_direct_parents_require (pr: like direct_parents_require)
      require
         pr /= Void
      do
         direct_parents_require := pr
      ensure
         direct_parents_require = pr
      end

   set_local_require (lr: like local_require)
      require
         lr /= Void
      do
         local_require := lr
      ensure
         local_require = lr
      end

feature {REQUIRE_ASSERTION, REQUIRE_ASSERTION_VISITOR, ANONYMOUS_FEATURE_MIXER}
   local_require: ASSERTION_LIST

   direct_parents_require: FAST_ARRAY[REQUIRE_ASSERTION]
         -- if `local_require' failed, then every parent has to succeed

feature {}
   make (sp: like start_position; else_flag: BOOLEAN; hc: like header_comment; l: FAST_ARRAY[ASSERTION])
      require
         not sp.is_unknown
         l /= Void implies not l.is_empty
         hc /= Void or else l /= Void
      do
         create local_require.make(sp, hc, l)
         is_require_else := else_flag
      ensure
         is_require_else = else_flag
      end

   from_parents(ra1, ra2: REQUIRE_ASSERTION)
      require
         ra1 /= Void
         ra2 /= Void
      do
         create direct_parents_require.with_capacity(2)
         direct_parents_require.add_last(ra1)
         direct_parents_require.add_last(ra2)
      ensure
         direct_parents_require.count = 2
      end

invariant
   local_require /= Void or else direct_parents_require /= Void

   direct_parents_require /= Void implies not direct_parents_require.is_empty

end -- class REQUIRE_ASSERTION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
