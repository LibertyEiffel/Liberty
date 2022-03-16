-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PACKRAT_REDUCER

insert
   PACKRAT

feature {PACKRAT_GRAMMAR}
   reduce_nonterminal_def
      deferred
      end

   reduce_grammar
      deferred
      end

   reduce_pattern_first_alternative
      deferred
      end

   reduce_pattern_alternative
      deferred
      end

   reduce_pattern
      deferred
      end

   reduce_pattern_map (alt: PACKRAT_ALTERNATIVE)
      deferred
      end

   reduce_alternative_lookahead
      deferred
      end

   reduce_alternative_suffix_tag
      deferred
      end

   reduce_alternative_tag
      deferred
      end

   reduce_alternative
      deferred
      end

   reduce_quantifier
      deferred
      end

   reduce_suffix
      deferred
      end

   reduce_primary_as_nested_pattern
      deferred
      end

   reduce_primary_as_any
      deferred
      end

   reduce_primary_as_literal
      deferred
      end

   reduce_primay_as_charclass
      deferred
      end

   reduce_primary_as_nonterminal
      deferred
      end

   reduce_literal_start
      deferred
      end

   reduce_literal_string
      deferred
      end

   reduce_literal
      deferred
      end

   reduce_tag_start
      deferred
      end

   reduce_tag_string
      deferred
      end

   reduce_tag
      deferred
      end

   reduce_charclass_start
      deferred
      end

   reduce_charclass_range
      deferred
      end

   reduce_charclass_char
      deferred
      end

   reduce_charclass_class
      deferred
      end

   reduce_charclass
      deferred
      end

   reduce_nonterminal_name
      deferred
      end

   reduce_nonterminal
      deferred
      end

   reduce_space
      deferred
      end

   reduce_image_left_arrow (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_slash (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_not_and (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_star_plus_why (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_open_paren (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_close_paren (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_anychar (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_letter (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_string (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_quote (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_hyphen (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_dot (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_open_bracket (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_close_bracket (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_open_curly (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_close_curly (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

   reduce_image_space (image: PARSER_IMAGE)
      require
         image /= Void
      deferred
      end

end -- class PACKRAT_REDUCER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
