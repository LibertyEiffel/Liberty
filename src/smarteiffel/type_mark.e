-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class TYPE_MARK
   --
   -- Handling of an Eiffel type mark.
   --
   -- Handling of Eiffel kernel classes:
   --
   --      Type Mark         |            Handled by Class
   --      -----------------------------------------------
   --      BOOLEAN           |           BOOLEAN_TYPE_MARK
   --      CHARACTER         |         CHARACTER_TYPE_MARK
   --      INTEGER_8         |           INTEGER_TYPE_MARK
   --      INTEGER_16        |           INTEGER_TYPE_MARK
   --      INTEGER_32        |           INTEGER_TYPE_MARK
   --      INTEGER           |           INTEGER_TYPE_MARK
   --      INTEGER_64        |           INTEGER_TYPE_MARK
   --      REAL_32           |              REAL_TYPE_MARK
   --      REAL_64           |              REAL_TYPE_MARK
   --      REAL              |              REAL_TYPE_MARK
   --      REAL_80           |              REAL_TYPE_MARK
   --      POINTER           |           POINTER_TYPE_MARK
   --      ANY               |               ANY_TYPE_MARK
   --      STRING            |            STRING_TYPE_MARK
   --      ARRAY[FOO]        |             ARRAY_TYPE_MARK
   --      NATIVE_ARRAY[BAR] |      NATIVE_ARRAY_TYPE_MARK
   --      TUPLE             |       EMPTY_TUPLE_TYPE_MARK
   --      TUPLE[FOO]        |   NON_EMPTY_TUPLE_TYPE_MARK
   --      ROUTINE ...       |             AGENT_TYPE_MARK
   --      PROCEDURE ...     |             AGENT_TYPE_MARK
   --      FUNCTION ...      |             AGENT_TYPE_MARK
   --      PREDICATE ...     |             AGENT_TYPE_MARK
   --
   -- Handling of other classes (excluding previous types):
   --
   -- *CLASS_TYPE_MARK: when the original type mark is not generic, not outside
   -- expanded and it is not a formal generic argument. Thus, this is
   -- the most common case.
   -- *FORMAL_GENERIC_TYPE_MARK: when original declaration type mark is a formal
   -- generic argument.
   -- *USER_GENERIC_TYPE_MARK: when original type has generic argument (excluding ARRAY,
   -- NATIVE_ARRAY and AGENT_TYPE_MARK as explained previously) and is not outside
   -- expanded.
   -- *LIKE_CURRENT_TYPE_MARK: when the written type mark is "like Current"
   -- *LIKE_FEATURE_TYPE_MARK: when the written type mark is "like <feature>"
   -- *LIKE_ARGUMENT_TYPE_MARK: when the written type mark "like <argument>"
   --

inherit
   VISITABLE

insert
   GLOBALS

feature {ANY}
   start_position: POSITION is
         -- The POSITION of the first character of the `Current' type mark where it is originally
         -- written. Note that, even if `has_been_specialized' is True, the `Result' is the POSITION of the
         -- originally written type mark (and not the position of the resolved type mark (when internally
         -- memorized). Finally, In some very rare cases, the `Result' can be an `is_unknown' POSITION.
      deferred
      end

   is_static: BOOLEAN is
         -- An `is_static' type mark is a completely frozen one that cannot change because of inheritance or
         -- because of some different generic derivation.
         --
         -- Here are some examples of `is_static' type marks: "STRING", "ARRAY[STRING]", "COLLECTION[INTEGER]",
         -- "ANY", INTEGER_8, etc.
         --
         -- Assuming that E_ is a formal generic argument, here are some examples of non static
         -- (i.e.`is_static' yields False) type marks: "E_", "ARRAY[E_]", "DICTIONARY[STRING,E_]". Also, are
         -- non-static the following marks: "like Current", "like foo", etc.
      deferred
      end

   declaration_type: TYPE_MARK is
         -- For TYPE_MARKs for which the `is_static' predicate is True, the `Result' is obviously `Current'
         -- (e.g. "STRING" is the `declaration_type' of "STRING" and, as another example, "ARRAY[INTEGER]" is
         -- the `declaration_type' of "ARRAY[INTEGER]").
         --
         -- For "like Current" the `declaration_type' is "STRING" only and only if "like Current" is written
         -- in the "string.e" file. When there is no generic constraint, formal generic arguments are replaced
         -- with "ANY" (as an example, "ANY" is the `declaration_type' of "E_" when "E_" is written in class
         -- "array.e"). In case of a generic constraint, this generic constraint is used in place of "ANY" for
         -- formal generic argument (as an example, the `declaration_type' of a "HASHED_DICTIONARY[V_,K_]" type
         -- mark written inside class "hashed_dictionary.e" is "HASHED_DICTIONARY[ANY,HASHABLE]").
         --
         -- Note that the `declaration_type' of a TYPE_MARK can change during `specialize_thru'.
      deferred
      ensure
         is_static implies Result = Current
         Result = Result.declaration_type
         -- Result.is_static unless it involves like argument
      end

   written_name: HASHED_STRING is
         -- The TYPE_MARK as it is actually written in the source file (i.e. what can be seen at the corresponding
         -- `start_position' in the source file).
      deferred
      ensure
         Result /= Void
      end

   frozen written_mark: STRING is
         -- A short-hand for `written_name.to_string'.
      do
         Result := written_name.to_string
      ensure
         Result = written_name.to_string
      end

   specialize_in (new_type: TYPE) is
         -- As checked in the require assertion, `Current' is written in new_type's base class.
      require
         start_position.class_text = new_type.class_text
      deferred
      ensure
         Current.has_been_specialized
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): TYPE_MARK is
      require
         has_been_specialized
         start_position.class_text /= new_type.class_text
         new_type.direct_thru_step(parent_type, parent_edge)
      deferred
      ensure
         has_been_specialized
         is_static implies Result = Current
         Result.has_been_specialized
      end

   resolve_in (new_type: TYPE): TYPE is
         -- Short-hand for `to_static(new_type).type'
      require
         has_been_specialized
      do
         Result := to_static(new_type, False).type
      ensure
         Result = to_static(new_type, False).type
      end

   to_static (new_type: TYPE; allow_raw_class_name: BOOLEAN): TYPE_MARK is
         -- Compute the `is_static' one in the `new_type' context.
         -- (See also `resolve_in'.)
      require
         has_been_specialized
      deferred
      ensure
         Result.is_static
         is_static implies Result = Current
      end

   signature_resolve_in (new_type: TYPE): TYPE is
         -- Same work as `resolve_in', but all possible "insert" paths are just ignored.
         -- Actually, this is used mostly to check the validity of inherited signatures, hence the
         -- `signature_resolve_in' name.
      require
         has_been_specialized
      deferred
      ensure
         Result /= Void
      end

   has_been_specialized: BOOLEAN is
      deferred
      ensure
         assertion_check_only: Result
      end

feature {ANY} -- Others:
   frozen is_formal_generic: BOOLEAN is
         -- Is it a formal generic argument?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {FORMAL_GENERIC_TYPE_MARK} ?:= Current
      ensure
         Result = {FORMAL_GENERIC_TYPE_MARK} ?:= Current
      end

   is_reference: BOOLEAN is
         -- Is a a reference type mark?
      require
         is_static
      deferred
      ensure
         Result = not is_expanded
      end

   is_expanded: BOOLEAN is
      require
         is_static
      deferred
      ensure
         Result = not is_reference
         Result = (is_kernel_expanded xor is_user_expanded xor is_native_array)
      end

   frozen is_anchored: BOOLEAN is
         -- Is it written "like ..." ?
      do
         Result := {ANCHORED_TYPE_MARK} ?:= Current
      ensure
         Result = {ANCHORED_TYPE_MARK} ?:= Current
      end

   frozen is_like_current: BOOLEAN is
         -- Is it written "like Current" ?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {LIKE_CURRENT_TYPE_MARK} ?:= Current
      ensure
         Result = {LIKE_CURRENT_TYPE_MARK} ?:= Current
         Result implies is_anchored
      end

   is_generic: BOOLEAN is
         -- Is the written type a generic type?
      require
         is_static
      deferred
      ensure
         is_array implies Result
      end

   generic_list: ARRAY[TYPE_MARK] is
      require
         is_generic
      deferred
      ensure
         Result.lower = 1
         not Result.is_empty
      end

   frozen is_kernel_expanded: BOOLEAN is
         -- Is it written one of: "BOOLEAN", "CHARACTER", "INTEGER", "INTEGER_8", "INTEGER_16",
         -- "INTEGER_32", "INTEGER_64", "NATURAL_8", "NATURAL_16", "NATURAL_32", "NATURAL_64",
         -- "REAL_32", "REAL_64", "REAL", "REAL_80", "POINTER".
      do
         if is_boolean then
            Result := True
         elseif is_character then
            Result := True
         elseif is_real then
            Result := True
         elseif is_pointer then
            Result := True
         elseif is_integer then
            Result := True
         elseif is_natural then
            Result := True
         end
      ensure
         Result = (is_boolean or is_character or is_integer or is_real or is_pointer or is_natural)
      end

   frozen is_boolean: BOOLEAN is
         -- Is it written "BOOLEAN"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {BOOLEAN_TYPE_MARK} ?:= Current
      ensure
         Result = {BOOLEAN_TYPE_MARK} ?:= Current
         Result implies is_expanded
      end

   frozen is_character: BOOLEAN is
         -- Is it written "CHARACTER"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {CHARACTER_TYPE_MARK} ?:= Current
      ensure
         Result = {CHARACTER_TYPE_MARK} ?:= Current
         Result implies is_expanded
      end

   frozen is_integer: BOOLEAN is
         -- Is it written "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER_64" or "INTEGER"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {INTEGER_TYPE_MARK} ?:= Current
      ensure
         Result = {INTEGER_TYPE_MARK} ?:= Current
         Result implies is_expanded
      end

   frozen is_real: BOOLEAN is
         -- Is it written "REAL*"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {REAL_TYPE_MARK} ?:= Current
      ensure
         Result = {REAL_TYPE_MARK} ?:= Current
         Result implies is_expanded
      end

   frozen is_pointer: BOOLEAN is
         -- Is it written "POINTER"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {POINTER_TYPE_MARK} ?:= Current
      ensure
         Result = {POINTER_TYPE_MARK} ?:= Current
         Result implies is_expanded
      end

   is_tuple: BOOLEAN is
         -- Is it written "TUPLE" or "TUPLE[...]"?
      do
      ensure
         Result = (once "EMPTY_TUPLE_TYPE_MARK").is_equal(generating_type) or else (once "NON_EMPTY_TUPLE_TYPE_MARK").is_equal(generating_type)
         Result implies is_reference
      end

   frozen is_string: BOOLEAN is
         -- Is it written "STRING"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {STRING_TYPE_MARK} ?:= Current
      ensure
         Result = {STRING_TYPE_MARK} ?:= Current
         Result implies is_reference
      end

   frozen is_fixed_string: BOOLEAN is
         -- Is it written "FIXED_STRING"?
      do
         Result := written_name = string_aliaser.hashed_string(once "FIXED_STRING")
      ensure
         Result implies is_reference
      end

   frozen is_array: BOOLEAN is
         -- Is it written "ARRAY"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {ARRAY_TYPE_MARK} ?:= Current
      ensure
         Result = {ARRAY_TYPE_MARK} ?:= Current
         Result implies is_reference
      end

   frozen is_any: BOOLEAN is
         -- Is it written "ANY"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {ANY_TYPE_MARK} ?:= Current
      ensure
         Result = {ANY_TYPE_MARK} ?:= Current
         Result implies is_reference
      end

   frozen is_native_array: BOOLEAN is
         -- Is it written "NATIVE_ARRAY[...]"?
      do
         Result := {NATIVE_ARRAY_TYPE_MARK} ?:= Current
      ensure
         Result = {NATIVE_ARRAY_TYPE_MARK} ?:= Current
      end

   frozen is_agent: BOOLEAN is
         -- Is the writtent type mark some agent type mark ("ROUTINE[...]", "PROCEDURE[...]", "FUNCTION[...]" or
         -- "PREDICATE[...]")?
      do
         Result := {AGENT_TYPE_MARK} ?:= Current
      ensure
         Result = {AGENT_TYPE_MARK} ?:= Current
         Result implies is_reference
      end

   frozen is_natural: BOOLEAN is
         -- Is it written "NATURAL_8", "NATURAL_16", "NATURAL_32" or "NATURAL_64"?
      do
         -- (The definition is not deferred because this predicate works only on the written type mark.)
         Result := {NATURAL_TYPE_MARK} ?:= Current
      ensure
         Result implies is_expanded
      end

   pretty_in (buffer: STRING) is
      do
         buffer.append(written_mark)
      end

   frozen short (shorted_type: TYPE) is
      require
         shorted_type /= Void
      do
         short_printer.hook(once "Btm")
         short_(shorted_type)
         short_printer.hook(once "Atm")
      end

   default_expression (sp: POSITION): EXPRESSION is
         -- Creates the corresponding ANY `default' expression at `sp'.
      require
         is_static
      do
         if is_reference then
            create {E_VOID} Result.make(sp)
         else
            check
               is_user_expanded
            end
            create {CREATE_EXPRESSION} Result.default_user_expanded(sp, Current)
         end
      ensure
         Result /= Void
      end

feature {ANY}
   id: INTEGER is
         -- Used for example to mangle feature name in the generated C code.
      require
         is_static
      deferred
      ensure
         Result > 0
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      require
         shorted_type /= Void
      deferred
      end

   set_start_position (sp: like start_position) is
      deferred
      ensure
         start_position = sp
      end

feature {TYPE_MARK, GENERIC_TYPE_MARK}
   frozen at (sp: like start_position): like Current is
      require
         is_static
      do
         if start_position /= sp then
            Result := twin
            Result.set_start_position(sp)
         else
            Result := Current
         end
      ensure
         Result.start_position = sp
      end

feature {INTROSPECTION_HANDLER}
   typed_internals_type_mark (position: POSITION): TYPE_MARK is
      local
         tm: TYPE_MARK
         hs: HASHED_STRING
         cn: CLASS_NAME
         gl: ARRAY[TYPE_MARK]
      do
         hs := string_aliaser.hashed_string(as_typed_internals)
         tm := at(position)
         create cn.make(hs, position)
         gl := {ARRAY[TYPE_MARK] 1, <<tm>>}
         create {USER_GENERIC_TYPE_MARK} Result.make(cn, gl)
      end

feature {}
   class_text_memory: CLASS_TEXT
         -- Memory cache for `class_text'.

   has_tried_to_load: BOOLEAN

   long_name_memory: like long_name

   canonical_long_name: HASHED_STRING is
      do
         Result := long_name_memory
         if Result = Void then
            Result := smart_eiffel.long_type_name(class_text_name.hashed_name, class_text.cluster)
            long_name_memory := Result
         end
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
         -- This name embeds cluster information for type unicity.  Normally uses `canonical_long_name' which
         -- uses location info such as `class_text' and `class_text_name'.
      require
         is_static
      deferred
      ensure
         Result /= Void
      end

feature {ANY}
   class_text_name: CLASS_NAME is
         -- The one of the corresponding base class (not the name of the one where it is written!).
      require
         is_static
      deferred
      ensure
         fatal_error_when_not_found: Result /= Void
      end

   class_text: CLASS_TEXT is
         -- The one of the corresponding base class (not the name of the one where it is written!).
      require
         not is_anchored
      local
         bcn: CLASS_NAME
      do
         if class_text_memory /= Void then
            Result := class_text_memory
         else
            bcn := class_text_name
            if bcn /= Void then
               Result := bcn.class_text
               class_text_memory := Result
            else
               error_handler.append(once "Cannot find Base Class for ")
               error_handler.add_position(start_position)
               error_handler.add_type_mark(Current)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            end
         end
      ensure
         Result = class_text_name.class_text
      end

   try_class_text: CLASS_TEXT is
      require
         not is_anchored
         not_done_to_report_errors: error_handler.is_empty
      local
         bcn: CLASS_NAME
      do
         if class_text_memory = Void then
            if not has_tried_to_load then
               bcn := class_text_name
               if bcn /= Void then
                  Result := bcn.try_class_text
                  class_text_memory := Result
               end
               has_tried_to_load := True
            end
         end
         Result := class_text_memory
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   frozen debug_info_in (buffer: STRING) is
         -- For debugging only.
      do
         buffer.append(written_mark)
      end

   type: TYPE is
      require
         is_static
      deferred
      ensure
         Result /= Void
      end

   is_user_expanded: BOOLEAN is
         -- Is it really a user expanded type ?
      require
         is_static
      deferred
      ensure
         Result = (is_expanded and not (is_kernel_expanded xor is_native_array))
      end

   is_empty_expanded: BOOLEAN is
         -- True when is it a user's expanded type with no attribute.
      require
         is_static
         smart_eiffel.status.collecting_done
      deferred
      end

feature {LIVE_TYPE}
   frozen id_extra_information (tfw: TEXT_FILE_WRITE) is
      require
         is_static
      do
         tfw.put_string(once "reference: ")
         if is_reference then
            tfw.put_string(once "yes")
         else
            tfw.put_string(once "no")
         end
         tfw.put_character('%N')
      end

feature {ANY}
   weak_reference_argument (lt: LIVE_TYPE): LIVE_TYPE is
      do
         check False end
         sedb_breakpoint
      end

feature {ANONYMOUS_FEATURE}
   frozen same_signature_type (other: TYPE_MARK; into: TYPE): BOOLEAN is
      do
         Result := other = Current or else signature_resolve_in(into) = other.signature_resolve_in(into)
      end

end -- class TYPE_MARK
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
