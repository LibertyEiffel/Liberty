-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class LOCALE

insert
   TIME_HANDLER
      redefine
         out_in_tagged_out_memory, default_create
      end

create {ANY}
   default_create, make, make_language, make_country, make_encoding

feature {ANY}
   language: FIXED_STRING
   country: FIXED_STRING
   encoding: FIXED_STRING

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(language)
         if country /= Void then
            tagged_out_memory.extend('_')
            tagged_out_memory.append(country)
            if encoding /= Void then
               tagged_out_memory.extend('.')
               tagged_out_memory.append(encoding)
            end
         end
      end

feature {ANY} -- some useful locale-related items

   -- NOTE: All those features share the same once STRING.
   -- Be sure to copy the result if it is meant to be kept.

   localized_text (text_id: ABSTRACT_STRING): STRING
         -- Generic text translation
      local
         tid, t: POINTER
      do
         tid := text_id.to_external
         t := i18n_localized_text(tid)
         Result := to_string(t)
         if tid = t then
            Result.prepend(once "???")
         end
      end

    -- see nl_langinfo(3)

   localized_time (time: TIME): STRING
      do
         Result := to_string(i18n_localized_time(time.time_memory))
      end

   localized_date (time: TIME): STRING
      do
         Result := to_string(i18n_localized_date(time.time_memory))
      end

   localized_time_and_date (time: TIME): STRING
      do
         Result := to_string(i18n_localized_time_and_date(time.time_memory))
      end

   localized_day (day: INTEGER): STRING
      require
         day.in_range(0, 7) -- 0 and 7 are Sunday
      do
         Result := to_string(i18n_localized_day(day))
      end

   localized_abbreviated_day (day: INTEGER): STRING
      require
         day.in_range(0, 7) -- 0 and 7 are Sunday
      do
         Result := to_string(i18n_localized_abbreviated_day(day))
      end

   localized_month (month: INTEGER): STRING
      require
         month.in_range(1, 12)
      do
         Result := to_string(i18n_localized_month(month))
      end

   localized_abbreviated_month (month: INTEGER): STRING
      require
         month.in_range(1, 12)
      do
         Result := to_string(i18n_localized_abbreviated_month(month))
      end

   localized_radix_character: STRING
         -- (decimal dot, decimal comma, etc.)
      do
         Result := to_string(i18n_localized_radix_character)
      end

   localized_thousands_separator: STRING
      do
         Result := to_string(i18n_localized_thousands_separator)
      end

   localized_yes: STRING
      do
         Result := to_string(i18n_localized_yes)
      end

   localized_no: STRING
      do
         Result := to_string(i18n_localized_no)
      end

   localized_ante_meridiem: STRING
      do
         Result := to_string(i18n_localized_ante_meridiem)
      end

   localized_post_meridiem: STRING
      do
         Result := to_string(i18n_localized_post_meridiem)
      end

feature {}
   to_string (p: POINTER): STRING
      do
         if p.is_not_null then
            Result := once ""
            Result.from_external_copy(p)
         end
      ensure
         p.is_null implies Result = Void
         p.is_not_null implies Result /= Void
      end

feature {ANY}
   valid_spec (spec: ABSTRACT_STRING): BOOLEAN
         -- Checking the validity of the argument of `make'.
      local
         i, j: INTEGER
      do
         i := spec.first_index_of('_')
         j := spec.first_index_of('.')
         if spec.valid_index(i) then
            Result := spec.substring(spec.lower, i - 1).is_equal(spec.substring(spec.lower, i - 1).as_lower)
            if Result then
               if spec.valid_index(j) then
                  Result := spec.substring(i + 1, j - 1).is_equal(spec.substring(i + 1, j - 1).as_upper)
               else
                  Result := spec.substring(i + 1, spec.upper).is_equal(spec.substring(i + 1, spec.upper).as_upper)
               end
            end
         else
            Result := spec.is_equal(spec.as_lower)
         end
      end

feature {ANY}
   make_language (a_language: ABSTRACT_STRING)
      require
         a_language.is_equal(a_language.as_lower)
      do
         language := a_language.intern
         country := Void
         encoding := Void
      ensure
         language.is_equal(a_language)
         country = Void
         encoding = Void
      end

   make_country (a_language, a_country: ABSTRACT_STRING)
      require
         a_language.is_equal(a_language.as_lower)
         a_country.is_equal(a_country.as_upper)
      do
         language := a_language.intern
         country := a_country.intern
         encoding := Void
      ensure
         language.is_equal(a_language)
         country.is_equal(a_country)
         encoding = Void
      end

   make_encoding (a_language, a_country, a_encoding: ABSTRACT_STRING)
      require
         a_language.is_equal(a_language.as_lower)
         a_country.is_equal(a_country.as_upper)
         a_encoding /= Void
      do
         language := a_language.intern
         country := a_country.intern
         encoding := a_encoding.intern
      ensure
         language.is_equal(a_language)
         country.is_equal(a_country)
         encoding.is_equal(a_encoding)
      end

   make (spec: ABSTRACT_STRING)
      require
         valid_spec(spec)
      local
         i, j: INTEGER; l, c: ABSTRACT_STRING
      do
         i := spec.first_index_of('_')
         j := spec.first_index_of('.')
         if spec.valid_index(i) then
            l := spec.substring(spec.lower, i - 1)
            if spec.valid_index(j) then
               c := spec.substring(i + 1, j - 1)
               make_encoding(l, c, spec.substring(j + 1, spec.upper))
            else
               make_country(l, spec.substring(i + 1, spec.upper))
            end
         else
            make_language(spec)
         end
      end

   default_create
      local
         langp: POINTER; lang: STRING
      do
         langp := i18n_get_environment_language
         if langp.is_not_null then
            create lang.from_external(langp)
         end
         if lang /= Void and then valid_spec(lang) then
            make(lang)
         else
            make(once "en")
         end
      end

   i18n_get_environment_language: POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_get_environment_language()"
      }"
      end

   i18n_localized_time (time: INTEGER_64): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_time"
      }"
      end

   i18n_localized_date (time: INTEGER_64): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_date"
      }"
      end

   i18n_localized_time_and_date (time: INTEGER_64): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_time_and_date"
      }"
      end

   i18n_localized_day (day: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_day"
      }"
      end

   i18n_localized_abbreviated_day (day: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_abbreviated_day"
      }"
      end

   i18n_localized_month (month: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_month"
      }"
      end

   i18n_localized_abbreviated_month (month: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_abbreviated_month"
      }"
      end

   i18n_localized_radix_character: POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_radix_character()"
      }"
      end

   i18n_localized_thousands_separator: POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_thousands_separator()"
      }"
      end

   i18n_localized_yes: POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_yes()"
      }"
      end

   i18n_localized_no: POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_no()"
      }"
      end

   i18n_localized_ante_meridiem: POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_ante_meridiem()"
      }"
      end

   i18n_localized_post_meridiem: POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_post_meridiem()"
      }"
      end

   i18n_localized_text (text_id: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_localized_text"
      }"
      end

invariant
   language /= Void
   encoding /= Void implies country /= Void

end -- class LOCALE
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
