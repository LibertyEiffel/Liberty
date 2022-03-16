-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FEATURE_TEXT
   --
   -- Syntactical representation of one feature declaration. Keep in
   -- mind that we also have to handle the synonym mechanism and that
   -- a FEATURE_TEXT object may represent more than one single
   -- feature.
   --

inherit
   VISITABLE
   INDEXINGABLE

insert
   GLOBALS

create {TMP_FEATURE}
   writable_attribute, once_procedure, once_function, deferred_procedure, deferred_function, e_procedure,
   e_function, external_procedure, external_function, string_constant, character_constant, boolean_constant,
   integer_constant, real_constant, unique_constant

create {CLASS_TEXT}
   non_written_one

feature {ANY}
   feature_clause: FEATURE_CLAUSE
         -- Back-link to the corresponding one.

   names: FEATURE_NAME_LIST
         -- All the names of the feature.

   assigned: FEATURE_NAME
         -- The assigned name

   arguments: FORMAL_ARG_LIST
         -- Arguments if any.

   result_type: TYPE_MARK
         -- Result type if any.

   anonymous_feature: ANONYMOUS_FEATURE
         -- The corresponding one.

   constant_value: EXPRESSION
         -- The one if any.

   header_comment: COMMENT
         -- Header comment for a routine or following comment for
         -- an attribute.

   obsolete_mark: MANIFEST_STRING
         -- The `obsolete' mark if any.

   sedb_trace_before_exit: POSITION
         -- Use for example to force a sedb to trace the end of empty routines.

   is_inline_agent: BOOLEAN
         -- True if the feature is an inline agent

   has_closures: BOOLEAN
         -- True if the feature contains inline agents

   clients: CLIENT_LIST
      do
         Result := feature_clause.clients
      ensure
         Result /= Void
      end

   require_assertion: REQUIRE_ASSERTION
         -- Not Void if any.
      do
         Result := anonymous_feature.require_assertion
      end

   rescue_compound: INSTRUCTION
         -- Not Void if any.
      do
         Result := anonymous_feature.rescue_compound
      end

   ensure_assertion: ENSURE_ASSERTION
         -- Not Void if any.
      do
         Result := anonymous_feature.ensure_assertion
      end

   class_text: CLASS_TEXT
      do
         Result := feature_clause.class_text
      ensure
         Result /= Void
      end

feature {AGENT_CREATION}
   inline_agent_pretty (indent_level: INTEGER)
      require
         is_inline_agent
      do
         anonymous_feature.pretty(indent_level, True)
      end

feature {FEATURE_CLAUSE}
   pretty
      require
         pretty_printer.indent_level = 1
         not is_inline_agent
      do
         anonymous_feature.pretty(1, False)
         pretty_printer.set_indent_level(0)
      ensure
         pretty_printer.indent_level = 0
      end

   add_into (fc: like feature_clause; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
      require
         fc /= Void
         fd /= Void
      local
         i: INTEGER; fn1, fn2: FEATURE_NAME; af: ANONYMOUS_FEATURE
      do
         feature_clause := fc -- Checking for multiple definition first:
         from
            i := 1
         until
            i > names.count
         loop
            fn1 := names.item(i)
            af := fd.reference_at(fn1)
            if af /= Void then
               error_handler.add_position(fn1.start_position)
               fn2 := af.names.internal_name(fn1)
               check
                  fn1.is_equal(fn2)
               end
               error_handler.add_position(fn2.start_position)
               error_handler.append(once "Double definition of feature ")
               error_handler.append(fn1.to_string)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            end
            i := i + 1
         end
         -- Adding the new one:
         anonymous_feature.add_into(Current, fd)
      ensure
         feature_clause = fc
      end

feature {}
   closure_arguments: FAST_ARRAY[FORMAL_ARG_LIST]
   closure_local_vars: FAST_ARRAY[LOCAL_VAR_LIST]

feature {EIFFEL_PARSER}
   set_inline_agent (ca: COLLECTION[FORMAL_ARG_LIST]; clv: COLLECTION[LOCAL_VAR_LIST])
      require
         ca /= Void
         clv /= Void
      do
         is_inline_agent := True
         if not ca.is_empty then
            create closure_arguments.from_collection(ca)
         end
         if not clv.is_empty then
            create closure_local_vars.from_collection(clv)
         end
         anonymous_feature.set_closure(closure_arguments, closure_local_vars)
      ensure
         is_inline_agent
         closure_arguments /= ca
            and then (ca.is_empty implies closure_arguments = Void)
            and then (not ca.is_empty
               implies closure_arguments.count = ca.count
               and then (
                  ((closure_arguments.lower)|..|(closure_arguments.upper)).for_all(agent (i: INTEGER; ca_: COLLECTION[FORMAL_ARG_LIST]): BOOLEAN
                                                                                      do
                                                                                         Result := closure_arguments.item(i) = ca_.item(i - closure_arguments.lower + ca_.lower)
                                                                                      end (?, ca)) --| **** TODO: closure (bug)
               ))
         closure_local_vars /= clv
            and then (clv.is_empty implies closure_local_vars = Void)
            and then (not clv.is_empty
               implies closure_local_vars.count = clv.count
               and then (
                  ((closure_local_vars.lower)|..|(closure_local_vars.upper)).for_all(agent (i: INTEGER; clv_: COLLECTION[LOCAL_VAR_LIST]): BOOLEAN
                                                                                        do
                                                                                           Result := closure_local_vars.item(i) = clv_.item(i - closure_local_vars.lower + clv_.lower)
                                                                                        end (?, clv)) --| **** TODO: closure (bug)
               ))
      end

   set_header_comment (hc: COMMENT)
      do
         header_comment := hc
         if anonymous_feature /= Void then
            anonymous_feature.set_header_comment(hc)
         end
      ensure
         header_comment = hc
      end

   set_rescue_compound (c: INSTRUCTION)
      require
         not eiffel_parser.no_rescue
         c /= Void
      do
         anonymous_feature.set_rescue_compound(c)
      ensure
         rescue_compound = c
      end

   set_ensure_assertion (ea: like ensure_assertion)
      require
         ea /= Void
      do
         anonymous_feature.set_ensure_assertion(ea)
      ensure
         ensure_assertion = ea
      end

   set_sedb_trace_before_exit (position: POSITION)
      require
         not position.is_unknown
      do
         sedb_trace_before_exit := position
      ensure
         sedb_trace_before_exit = position
      end

feature {ANY}
   accept (visitor: FEATURE_TEXT_VISITOR)
      do
         visitor.visit_feature_text(Current)
      end

feature {}
   writable_attribute (n: like names; rt: like result_type; om: like obsolete_mark
                       hc: like header_comment; ra: like require_assertion; idx: like index_list)
      require
         n /= Void
      do
         names := n
         result_type := rt
         obsolete_mark := om
         header_comment := hc
         index_list := idx
         create {WRITABLE_ATTRIBUTE} anonymous_feature.make(rt, om, hc, ra)
         anonymous_feature.set_header_comment(header_comment)
         anonymous_feature.set_index_list(idx)
      ensure
         names = n
         result_type = rt
      end

   once_procedure (n: like names; a: like arguments; om: like obsolete_mark; hc: like header_comment
                   ra: like require_assertion; local_vars: LOCAL_VAR_LIST
                   routine_body: INSTRUCTION
                   aa: like assigned; idx: like index_list; c: like has_closures)
      require
         n /= Void
      do
         names := n
         arguments := a
         obsolete_mark := om
         header_comment := hc
         assigned := aa
         index_list := idx
         has_closures := c
         create {ONCE_PROCEDURE} anonymous_feature.make(a, om, hc, ra, local_vars, routine_body, Void, c)
      ensure
         names = n
         arguments = a
         obsolete_mark = om
         header_comment = hc
         assigned = aa
         has_closures = c
      end

   once_function (n: like names; a: like arguments; rt: like result_type; om: like obsolete_mark
                  hc: like header_comment; ra: like require_assertion; local_vars: LOCAL_VAR_LIST
                  routine_body: INSTRUCTION; routine_then: EXPRESSION
                  idx: like index_list; c: like has_closures)
      require
         n /= Void
         rt /= Void
      do
         names := n
         arguments := a
         result_type := rt
         obsolete_mark := om
         header_comment := hc
         index_list := idx
         has_closures := c
         create {ONCE_FUNCTION} anonymous_feature.make(a, rt, om, hc, ra, local_vars, routine_body, routine_then, c)
      ensure
         names = n
         arguments = a
         result_type = rt
         obsolete_mark = om
         header_comment = hc
         has_closures = c
      end

   e_procedure (n: like names; a: like arguments; om: like obsolete_mark; hc: like header_comment
                ra: like require_assertion; local_vars: LOCAL_VAR_LIST
                routine_body: INSTRUCTION
                aa: like assigned; idx: like index_list; c: like has_closures)
      require
         n /= Void
      do
         names := n
         arguments := a
         obsolete_mark := om
         header_comment := hc
         assigned := aa
         index_list := idx
         has_closures := c
         create {E_PROCEDURE} anonymous_feature.make(a, om, hc, ra, local_vars, routine_body, Void, c)
      ensure
         names = n
         arguments = a
         obsolete_mark = om
         header_comment = hc
         assigned = aa
         has_closures = c
      end

   e_function (n: like names; a: like arguments; rt: like result_type; om: like obsolete_mark
               hc: like header_comment; ra: like require_assertion; local_vars: LOCAL_VAR_LIST
               routine_body: INSTRUCTION; routine_then: EXPRESSION
               idx: like index_list; c: like has_closures)
      require
         n /= Void
         rt /= Void
      do
         names := n
         arguments := a
         result_type := rt
         obsolete_mark := om
         header_comment := hc
         index_list := idx
         has_closures := c
         create {E_FUNCTION} anonymous_feature.make(a, rt, om, hc, ra, local_vars, routine_body, routine_then, c)
      ensure
         names = n
         arguments = a
         result_type = rt
         obsolete_mark = om
         header_comment = hc
         has_closures = c
      end

   deferred_procedure (n: like names; a: like arguments; om: like obsolete_mark; hc: like header_comment
                       ra: like require_assertion; aa: like assigned; idx: like index_list)
      require
         n /= Void
      do
         names := n
         arguments := a
         obsolete_mark := om
         header_comment := hc
         assigned := aa
         index_list := idx
         create {DEFERRED_PROCEDURE} anonymous_feature.make(a, om, hc, ra)
      ensure
         names = n
         arguments = a
         obsolete_mark = om
         header_comment = hc
         assigned = aa
      end

   deferred_function (n: like names; a: like arguments; rt: like result_type; om: like obsolete_mark
                      hc: like header_comment; ra: like require_assertion; idx: like index_list)
      require
         n /= Void
         rt /= Void
      do
         names := n
         arguments := a
         result_type := rt
         obsolete_mark := om
         header_comment := hc
         index_list := idx
         create {DEFERRED_FUNCTION} anonymous_feature.make(a, rt, om, hc, ra)
      ensure
         names = n
         arguments = a
         result_type = rt
         obsolete_mark = om
         header_comment = hc
      end

   external_procedure (n: like names; a: like arguments; om: like obsolete_mark; hc: like header_comment
                       ra: like require_assertion; native: NATIVE; alias_tag: MANIFEST_STRING
                       aa: like assigned; idx: like index_list)
      require
         n /= Void
      do
         names := n
         arguments := a
         obsolete_mark := om
         header_comment := hc
         assigned := aa
         index_list := idx
         create {EXTERNAL_PROCEDURE} anonymous_feature.make(a, om, hc, ra, native, alias_tag)
      ensure
         names = n
         arguments = a
         obsolete_mark = om
         header_comment = hc
         assigned = aa
      end

   external_function (n: like names; a: like arguments; rt: like result_type; om: like obsolete_mark
                      hc: like header_comment; ra: like require_assertion; native: NATIVE
                      alias_tag: MANIFEST_STRING; idx: like index_list)
      require
         n /= Void
         rt /= Void
      do
         names := n
         arguments := a
         result_type := rt
         obsolete_mark := om
         header_comment := hc
         index_list := idx
         create {EXTERNAL_FUNCTION} anonymous_feature.make(a, rt, om, hc, ra, native, alias_tag)
      ensure
         names = n
         arguments = a
         result_type = rt
         obsolete_mark = om
         header_comment = hc
      end

   string_constant (n: like names; rt: like result_type; ms: MANIFEST_STRING; idx: like index_list)
      require
         n /= Void
         rt.is_string
         ms /= Void
      do
         names := n
         result_type := rt
         index_list := idx
         create {CST_ATT_STRING} anonymous_feature.make(rt, ms)
         anonymous_feature.set_header_comment(header_comment)
         anonymous_feature.set_index_list(idx)
      ensure
         names = n
         result_type = rt
      end

   character_constant (n: like names; rt: like result_type; cc: CHARACTER_CONSTANT; idx: like index_list)
      require
         n /= Void
         rt.is_character
         cc /= Void
      do
         names := n
         result_type := rt
         index_list := idx
         create {CST_ATT_CHARACTER} anonymous_feature.make(rt, cc)
         anonymous_feature.set_header_comment(header_comment)
         anonymous_feature.set_index_list(idx)
      ensure
         names = n
         result_type = rt
      end

   boolean_constant (n: like names; rt: like result_type; bc: BOOLEAN_CONSTANT; idx: like index_list)
      require
         n /= Void
         rt.is_boolean
         bc /= Void
      do
         names := n
         result_type := rt
         index_list := idx
         create {CST_ATT_BOOLEAN} anonymous_feature.make(rt, bc)
         anonymous_feature.set_header_comment(header_comment)
         anonymous_feature.set_index_list(idx)
      ensure
         names = n
         result_type = rt
      end

   integer_constant (n: like names; rt: like result_type; ic: INTEGER_CONSTANT; idx: like index_list)
      require
         n /= Void
         rt.is_integer
         ic /= Void
      do
         names := n
         result_type := rt
         index_list := idx
         ic.set_result_type(rt)
         create {CST_ATT_INTEGER} anonymous_feature.make(ic)
         anonymous_feature.set_header_comment(header_comment)
         anonymous_feature.set_index_list(idx)
      ensure
         names = n
         result_type = rt
      end

   real_constant (n: like names; rt: like result_type; rc: REAL_CONSTANT; idx: like index_list)
      require
         n /= Void
         rt.is_real
         rc /= Void
      do
         names := n
         result_type := rt
         index_list := idx
         create {CST_ATT_REAL} anonymous_feature.make(rt, rc)
         --|*** TO DO ***
         anonymous_feature.set_header_comment(header_comment)
         anonymous_feature.set_index_list(idx)
      ensure
         names = n
         result_type = rt
      end

   unique_constant (n: like names; rt: like result_type; idx: like index_list)
      require
         n /= Void
         rt.is_integer
      do
         names := n
         result_type := rt
         index_list := idx
         create {CST_ATT_UNIQUE} anonymous_feature.make(rt)
         anonymous_feature.set_header_comment(header_comment)
         anonymous_feature.set_index_list(idx)
      ensure
         names = n
         result_type = rt
      end

   non_written_one (fc: like feature_clause; n: like names; af: like anonymous_feature)
         -- To create automatically-generated features.
      require
         fc /= Void
         n /= Void
         af /= Void
      do
         feature_clause := fc
         names := n
         anonymous_feature := af
      ensure
         feature_clause = fc
         names = n
         anonymous_feature = af
      end

invariant
   names /= Void
   anonymous_feature /= Void
   assigned /= Void implies result_type = Void

end -- class FEATURE_TEXT
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
