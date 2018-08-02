-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class REGULAR_EXPRESSION_BUILDER
   --
   -- Regular expression building from various dialects.
   -- Some REGULAR_EXPRESSION object is build from a string
   -- describing a pattern. A regular expression is a pattern
   -- that is matched against a subject string.
   --
   -- See tutorial/regular_expression for usage.
   --

feature {ANY} -- Building REGULAR_EXPRESSION
   convert_posix_pattern (p: STRING): REGULAR_EXPRESSION
         -- Create some REGULAR_EXPRESSION from the pattern `p' according to POSIX syntax.
         -- If `p' is not a valid regular expression according to POSIX syntax, then `Result' is Void
         -- and `last_error_message' and `last_error_position' are set.
      require
         p /= Void
      do
         Result := convert_backtracking_pattern(p, posix_builder)
      ensure
         Result /= Void xor last_error_message /= Void
         initialized: Result /= Void implies not Result.last_match_succeeded
         substitution_cleared: Result /= Void implies not Result.substitution_pattern_ready
      end

   convert_perl_pattern (p: STRING): REGULAR_EXPRESSION
         -- Create some REGULAR_EXPRESSION from the pattern `p' according to Perl syntax.
         -- If `p' is not a valid regular expression according to Perl syntax, then `Result' is Void
         -- and `last_error_message' and `last_error_position' are set.
      require
         p /= Void
      do
         if has_extended_legibility then
            perl5_builder.set_extended_legibility
         else
            perl5_builder.set_no_extended_legibility
         end
         Result := convert_backtracking_pattern(p, perl5_builder)
      ensure
         Result /= Void xor last_error_message /= Void
         initialized: Result /= Void implies not Result.last_match_succeeded
         substitution_cleared: Result /= Void implies not Result.substitution_pattern_ready
      end

   convert_python_pattern (p: STRING): REGULAR_EXPRESSION
         -- Create some REGULAR_EXPRESSION from the pattern `p' according to Python syntax.
         -- If `p' is not a valid regular expression according to Python syntax, then `Result' is Void
         -- and `last_error_message' and `last_error_position' are set.
      require
         p /= Void
      do
         if has_extended_legibility then
            python_builder.set_extended_legibility
         else
            python_builder.set_no_extended_legibility
         end
         Result := convert_backtracking_pattern(p, python_builder)
      ensure
         Result /= Void xor last_error_message /= Void
         initialized: Result /= Void implies not Result.last_match_succeeded
         substitution_cleared: Result /= Void implies not Result.substitution_pattern_ready
      end

feature {ANY} -- options
   is_case_insensitive: BOOLEAN
         -- Is the match case insensitive?
         -- Default is False

   is_case_sensitive: BOOLEAN
         -- Is the match case sensitive?
         -- Default is True
      do
         Result := not is_case_insensitive
      end

   set_case_sensitive
         -- Set the match as case sensitive.
      do
         is_case_insensitive := False
      ensure
         definition: is_case_insensitive = False and is_case_sensitive = True
      end

   set_case_insensitive
         -- Set the match as case insensitive.
      do
         is_case_insensitive := True
      ensure
         definition: is_case_insensitive = True and is_case_sensitive = False
      end

   does_any_match_newline: BOOLEAN
         -- Does the "any character" mark match a newline?
         -- Default is False

   set_any_match_newline
         -- The "any character" mark will match a newline.
      do
         does_any_match_newline := True
      ensure
         definition: does_any_match_newline = True
      end

   set_any_dont_match_newline
         -- The "any character" mark will not match a newline.
      do
         does_any_match_newline := False
      ensure
         definition: does_any_match_newline = False
      end

   does_match_line_boundary: BOOLEAN
         -- Does the begin/end marks match line boundary?
         -- Default is False

   does_match_text_boundary: BOOLEAN
         -- Does the begin/end marks match text boundary?
         -- Default is True
      do
         Result := not does_match_line_boundary
      ensure
         definition: Result = not does_match_line_boundary
      end

   set_match_line_boundary
         -- The begin/end marks will match line boundary.
      do
         does_match_line_boundary := True
      ensure
         definition: does_match_line_boundary = True and does_match_text_boundary = False
      end

   set_match_text_boundary
         -- The begin/end marks will match text boundary.
      do
         does_match_line_boundary := False
      ensure
         definition: does_match_line_boundary = False and does_match_text_boundary = True
      end

   has_extended_legibility: BOOLEAN
         -- Is the extended legibility active?

   has_extended_ligibility: BOOLEAN
         obsolete
            "Use `has_extended_legibility' instead."
         do
            Result := has_extended_legibility
         end

   set_extended_legibility
         -- Activate extended legibility.
      do
         has_extended_legibility := True
      ensure
         definition: has_extended_legibility = True
      end

   set_extended_ligibility
      obsolete
         "Use `set_extended_legibility' instead."
      do
         set_extended_legibility
      ensure
         definition: has_extended_legibility = True
      end

   set_no_extended_legibility
         -- Deactivate extended legibility.
      do
         has_extended_legibility := False
      ensure
         definition: has_extended_legibility = False
      end

   set_no_extended_ligibility
      obsolete
         "Use `set_no_extended_legibility' instead."
      do
         set_no_extended_legibility
      ensure
         definition: has_extended_legibility = False
      end

   set_default_options
         -- Set the default options
      do
         set_case_sensitive
         set_any_dont_match_newline
         set_match_text_boundary
         set_no_extended_legibility
      ensure
         is_case_sensitive
         not does_any_match_newline
         does_match_text_boundary
         not has_extended_legibility
      end

feature {ANY} -- Error informations
   last_error_message: STRING
         -- Used to report error during last creation attempt.
         --
         -- See also `convert_perl_pattern', `convert_posix_pattern'.

   last_error_position: INTEGER
         -- Used to report error position during last creation attempt.
         --
         -- See also `convert_perl_pattern', `convert_posix_pattern'.

feature {} -- Internal
   posix_builder: POSIX_REGULAR_EXPRESSION_BUILDER
         -- The builder for the POSIX syntax
      once
         create Result.make
      end

   perl5_builder: PERL5_REGULAR_EXPRESSION_BUILDER
         -- The builder for the PERL5 syntax
      once
         create Result.make
      end

   python_builder: PYTHON_REGULAR_EXPRESSION_BUILDER
         -- The builder for the Python syntax
      once
         create Result.make
      end

   convert_backtracking_pattern (p: STRING; builder: BACKTRACKING_REGULAR_EXPRESSION_BUILDER): BACKTRACKING_REGULAR_EXPRESSION
         -- Create some BACKTRACKING_REGULAR_EXPRESSION from the pattern `p' according to the syntax
         -- passed by the given 'builder'.
         -- If `p' is not a valid regular expression according the said syntax, then `Result' is Void
         -- and `last_error_message' and `last_error_message' are set.
      require
         p /= Void and builder /= Void
      do
         if is_case_insensitive then
            builder.set_case_insensitive
         else
            builder.set_case_sensitive
         end
         if does_any_match_newline then
            builder.set_any_match_newline
         else
            builder.set_any_dont_match_newline
         end
         if does_match_line_boundary then
            builder.set_match_line_boundary
         else
            builder.set_match_text_boundary
         end
         builder.set_expression(p)
         builder.parse
         if builder.has_result then
            create {BACKTRACKING_REGULAR_EXPRESSION} Result.make
            Result.set_pattern(builder.last_pattern)
            last_error_message := Void
         else
            last_error_position := builder.position
            last_error_message := builder.last_error.twin
         end
      ensure
         Result /= Void xor last_error_message /= Void
         initialized: Result /= Void implies not Result.last_match_succeeded
         substitution_cleared: Result /= Void implies not Result.substitution_pattern_ready
      end

end -- class REGULAR_EXPRESSION_BUILDER
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
