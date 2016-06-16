-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AGENT_EXPRESSION
   --
   -- See AGENT_CREATION first because AGENT_CREATION is the first step in an agent's life.
   -- The second step is an AGENT_EXPRESSION which corresponds to the actual call of some delayed
   -- expression. At this time we are supposed to provide the missing arguments. Here are some example of
   -- AGENT_EXPRESSIONs:
   --
   --    x := foo.item([bar])
   --

inherit
   EXPRESSION
   AGENT_LAUNCHER

create {CALL_1}
   make

feature {ANY}
   written_link: CALL_1
         -- To the syntactical written one which is at the origin of the creation of `Current'.

   declaration_type: TYPE
      do
         Result := agent_type.agent_result
      ensure then
         Result /= Void
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := declaration_type.canonical_type_mark
      end

   start_position: POSITION
      do
         Result := written_link.start_position
      end

   is_current, is_implicit_current: BOOLEAN False

   is_void: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN False

   extra_bracket_flag: BOOLEAN True

   specialize_in (type: TYPE): like Current
      do
         check
            False -- (`Current' is created after that phase.)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         t: like target; ft: like fake_tuple
      do
         t := target.specialize_thru(parent_type, parent_edge, new_type)
         ft := fake_tuple.specialize_thru(parent_type, parent_edge, new_type)
         Result := current_or_twin_init(t, ft)
      end

   specialize_and_check (type: TYPE): like Current
      local
         t: like target; ft: like fake_tuple
      do
         t := target.specialize_and_check(type)
         ft := fake_tuple.specialize_and_check(type)
         ft := ft.implicit_cast(type, t.resolve_in(type).open_arguments)
         Result := current_or_twin_init(t, ft)
         Result.specialize_check(type)
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := agent_type.agent_result
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
      end

   adapt_for (type: TYPE): like Current
      local
         t: like target; args: like fake_tuple
      do
         t := target.adapt_for(type)
         args := fake_tuple.adapt_for(type)
         Result := current_or_twin_init(t, args)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
      end

   simplify (type: TYPE): EXPRESSION
      local
         t: like target; args: like fake_tuple; fs: FEATURE_STAMP; target_type: TYPE
      do
         t := target.simplify(type)
         if t.is_void then
            -- As the target is Void, no need to consider arguments anymore.
            target_type := target.resolve_in(type)
            fs := target_type.lookup(feature_name)
            create {VOID_CALL} Result.make(start_position, fs, target_type)
         else
            args := fake_tuple.simplify(type)
            Result := current_or_twin_init(t, args)
         end
      end

   collect (type: TYPE): TYPE
      do
         agent_launcher_collect(type)
         Result := agent_type.agent_result
      end

   accept (visitor: AGENT_EXPRESSION_VISITOR)
      do
         visitor.visit_agent_expression(Current)
      end

   precedence: INTEGER
      do
         Result := atomic_precedence
      end

   short (type: TYPE)
      do
         written_link.short(type)
      end

   short_target (type: TYPE)
      do
         short(type)
         short_printer.put_dot
      end

   pretty (indent_level: INTEGER)
      do
         written_link.pretty(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

feature {AGENT_EXPRESSION}
   init (t: like target; args: like fake_tuple)
      require
         t /= Void
         args /= Void
      do
         target := t
         fake_tuple := args
      ensure
         target = t
         fake_tuple = args
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         t: like target; args: like fake_tuple
      do
         target.inline_dynamic_dispatch_(code_accumulator, type)
         t := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         fake_tuple.inline_dynamic_dispatch_(code_accumulator, type)
         args ::= code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         code_accumulator.current_context.add_last(current_or_twin_init(t, args))
      end

feature {}
   make (type: TYPE; wl: like written_link; at: like agent_type; t: like target; args: EFFECTIVE_ARG_LIST)
      require
         wl /= Void
         at.canonical_type_mark.is_agent
         t /= Void
         at = t.resolve_in(type)
         args /= Void
      do
         agent_type := at
         written_link := wl
         target := t
         fake_tuple := args.to_fake_tuple(type)
         specialize_check(type)
         fake_tuple := fake_tuple.implicit_cast(type, at.open_arguments)
      ensure
         agent_type = at
         written_link = wl
         target = t
         fake_tuple /= Void
      end

   current_or_twin_init (t: like target; args: like fake_tuple): like Current
      require
         t /= Void
         args /= Void
      do
         if target = t and then fake_tuple = args then
            Result := Current
         else
            Result := twin
            Result.init(t, args)
         end
      end

   feature_name: FEATURE_NAME
      do
         Result := feature_name_memory
         if Result = Void then
            create Result.simple_feature_name(as_item, start_position)
            feature_name_memory := Result
         end
      end

   feature_name_memory: FEATURE_NAME

invariant
   written_link /= Void

end -- class AGENT_EXPRESSION
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
