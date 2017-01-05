deferred class NAME_CONVERTER
   -- Query features to dcover if a symbol name does comply to SmartEiffel's
   -- naming rules and to convert arbitrary C symbols into valid Eiffel names
   -- of classes or features.

insert
   PLATFORM
   EXCEPTIONS

feature {ANY} -- Auxiliary features
   eiffel_feature (a_name: ABSTRACT_STRING): STRING
         -- Translate `a_name' content into a proper feature name for the
         -- Gnu-Eiffel language.  "CamelCase" is translated into "camel_case",
         -- "ENOO" is translated into "enoo". Eventual underscores in front of
         -- `a_name' are removed: "__foo" becomes "foo"; symbols starting with
         -- underscores folloed by a number are prefixed with "a_"; reserved
         -- language names and names of features of class ANY are escaped.
         -- TODO: handle in a fairly
      require
         name_not_void: a_name /= Void
         name_not_empty: not a_name.is_empty
      do
         create Result.make_from_string(a_name)
         -- Remove header underscores.
         from
         until
            Result.first /= '_'
         loop
            Result.remove_first
         end
         -- If first character is a number prepend an `a_'
         if Result.first.is_digit then
            Result.prepend(once "a_")
         end

         insert_underscores(Result)
         -- Remove spurious underscores and the end
         from
         until
            Result.last /= '_'
         loop
            Result.remove_last
         end

         multiple_underscores_remover.substitute_all_in(Result)
         -- Deal with C++ names: turn lt<foo> into lt_of_foo
         -- TODO: queue<dock,deepspace::station> into queue_of_dock_and_deepspace_station

         lt_translator.substitute_all_in(Result)
         gt_translator.substitute_all_in(Result)
         namespace_separator_translator.substitute_all_in(Result)
         Result.to_lower
         Result := adapt(Result, once "_external")
      end

   eiffel_argument (a_name: ABSTRACT_STRING): STRING
         -- `a_name' content translated into a proper argument placeholder for
         -- the Gnu-Eiffel language.  "CamelCase" is translated into
         -- "a_camel_case", "ENOO" is translated into "an_enoo". Eventual
         -- underscores in front of `a_name' are removed: "__foo" becomes
         -- "a_foo". See also `eiffel_feature'.
      require
         name_not_void: a_name /= Void
      local
         e_feature, e_prefix: ABSTRACT_STRING
      do
         e_feature := eiffel_feature(a_name)
         inspect
            e_feature.first
         when 'a', 'e', 'o', 'i', 'u' then
            e_prefix := once "an_"
         else
            e_prefix := once "a_"
         end
         Result := e_prefix + e_feature
      end

   insert_underscores (a_string: STRING)
         -- Insert an underscore ('_') before each uppercase letter following a lowercase one.
      require
         a_string /= Void
         not a_string.is_empty
      local
         i: INTEGER
      do
         from
            i := a_string.lower + 1
         until
            i > a_string.upper
         loop
            if a_string.item(i - 1).is_lower and a_string.item(i).is_upper then
               a_string.insert_character('_', i)
               i := i + 2
            else
               i := i + 1
            end
         end
      end

   camelcase_translator: REGULAR_EXPRESSION
         -- Insert an underscore ('_') between any lowercase letter followed by an uppercase one
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_perl_pattern("([a-z])([A-Z])")
         Result.prepare_substitution("\1_\2")
      end

   multiple_underscores_remover: REGULAR_EXPRESSION
         -- Replace all multiple occurences of underscore "_" with a single one
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_perl_pattern("(\_\_+)")
         Result.prepare_substitution("_")
      end

   lt_translator: REGULAR_EXPRESSION
         -- Replace all occurences of "<" (shown as "&lt;") with "_of_"
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_perl_pattern("(&lt;)")
         Result.prepare_substitution("_of_")
      end

   gt_translator: REGULAR_EXPRESSION
         -- Remove all occurences of ">" (shown as "&gt;")
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_perl_pattern("(&gt;)")
         Result.prepare_substitution("")
      end

   namespace_separator_translator: REGULAR_EXPRESSION
         -- Replace all occurences of "::" (C++ namespace separator) with "_"
      local
         builder: REGULAR_EXPRESSION_BUILDER
      once
         Result := builder.convert_perl_pattern("(&gt;)")
         Result.prepare_substitution("i")
      end

   is_public_name (a_name: ABSTRACT_STRING): BOOLEAN
         -- Does `a_name' start with an alphabetical character? Names
         -- starting with underscores or other strange characters are
         -- usually considered private in C/C++ languages.
      require
         not_void: a_name /= Void
         meaningful_length: a_name.count > 1
      do
         Result := a_name.first.is_letter
      end

   eiffel_class_name (a_string, a_suffix: ABSTRACT_STRING): STRING
         -- An Eiffel class name derived from `a_string'. Trailing and tail
         -- underscores are removed, dashes are turned into underscores,
         -- `a_suffix' is added at the end if not void, all is made uppercase.
      require
         a_string /= Void
      do
         create Result.make_from_string(a_string)
         -- Remove trailing underscores
         from
         until
            Result.first /= '_'
         loop
            Result.remove_first
         end

         check
            Result.last.code /= 0
         end
         -- Remove spurious underscores at the end
         from
         until
            Result.last /= '_'
         loop
            Result.remove_last
         end

         check
            Result.last.code /= 0
         end
         insert_underscores(Result)
         if a_suffix /= Void then
            Result.append(a_suffix)
         end

         check
            Result.last.code /= 0
            -- The reason of this check is not easy understandable here.
            -- It's actually a poor's man test of a strange, old bug of STRING
            -- shown by xml library that don't update capacity and actual
            -- length with an off-by-one length error
         end
         Result.replace_all('-', '_')
         Result.to_upper
         -- print("'"+Result+"' last charcter code is: "+Result.last.code.to_string+"%N")
         check
            Result.last.code /= 0
         end
      ensure
         Result /= Void
         is_valid_class_name(Result)
      end

   is_valid_class_name (a_name: ABSTRACT_STRING): BOOLEAN
         -- Does `a_name' represents a valid Eiffel class name? i.e. does it
         -- start with an upper-case letter and contain only upper-case
         -- letters, underscores and numbers?
      require
         a_name /= Void
      local
         iter: ITERATOR[CHARACTER]; c: CHARACTER
      do
         iter := a_name.new_iterator
         from
            iter.start
            Result := iter.item.is_upper
            iter.next
         until
            Result = False or else not iter.is_off
         loop
            c := iter.item
            Result := c.is_upper or else c.is_digit and c /= '.' or else c = '_'
            iter.next
         end
      end

   adapt (a_name, a_suffix: ABSTRACT_STRING): STRING
         -- A valid, adapted identifier for an Eiffel feature labelled
         -- `a_name'. Can be either `a_name' itself or a new string
         -- containing an adapatation. Reserved words and those of
         -- features belonging to ANY are "escaped", appending `a_suffix'.
      require
         name_not_void: a_name /= Void
         valid_name: a_name.first /= '_'
         suffix_not_void: a_suffix /= Void
         suffix_not_empty: not a_suffix.is_empty
      do
         if keywords.has(a_name) or else any_features.has(a_name) then
            Result := a_name + a_suffix
         elseif Result ?:= a_name then
            Result ::= a_name
         else
            create Result.make_from_string(a_name)
         end
      ensure
         Result /= Void
      end

feature {} -- Constants
   keywords: HASHED_SET[ABSTRACT_STRING]
      once
         Result := {HASHED_SET[ABSTRACT_STRING] << "indexing"
         -- Keywords:
         -- related to classes
         , "class", "deferred", "expanded", "separate", "end", "obsolete", "inherit" -- related to inheritance
         , "insert", "creation", "feature", "rename", "redefine", "undefine", "select", "export", "require" -- design by contract
         , "ensure", "check", "debug", "invariant", "variant", "rescue", "local" -- features body
         , "do", "once", "alias", "external", "attribute", "if" -- control flow
         , "then", "else", "elseif", "when", "from", "until", "loop", "and" -- boolean operators
         , "or", "xor", "not", "implies" >> }
      end

   any_features: HASHED_SET[ABSTRACT_STRING]
         -- The names of the features contained in class ANY.
         -- The following "static" definition of the features of ANY
         -- somehow unacceptable in a perfect world. Yet computing it each
         -- and every time would enlarge the memory usage of the program
         -- quite a lot, not counting the runtime requirements. We will do
         -- it when we will cache compilation results.
      once
         -- The following "static" definition of the features of ANY
         -- somehow unacceptable in a perfect world. Yet computing it each
         -- and every time would enlarge the memory usage of the program
         -- quite a lot, not counting the runtime requirements. We will do
         -- it when we will cache compilation results.
         Result := {HASHED_SET[ABSTRACT_STRING] << "generating", "generator", "same_dynamic_type", "_equal", "standard__equal", "_deep_equal", "twin", "copy", "standard_twin", "standard_copy", "deep_twin", "default", "_default", "print_on", "tagged_out", "out", "out_in_tagged_out_memory", "tagged_out_memory", "fill_tagged_out_memory", "to_pointer", "_basic_expanded_type", "object_size" >> }
      end

end -- class NAME_CONVERTER

-- Copyright (C) 2008-2017: Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
