-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class I18N

feature {ANY}
   locale: LOCALE is
         -- The currently set locale
      do
         Result := locale_memory.item
      end

   set_locale (a_locale: like locale) is
         -- Set the current locale
      do
         locale_memory.set_item(a_locale)
         fix_locale(a_locale)
      ensure
         locale = a_locale
      end

feature {ANY} -- Useful constants
   canada: LOCALE is
      once
         create Result.make_country("en", "CA")
      end

   canada_french, quebec: LOCALE is
      once
         create Result.make_country("fr", "CA")
      end

   china: LOCALE is
      once
         create Result.make_country("zh", "CN")
      end

   chinese: LOCALE is
      once
         create Result.make_language("zh")
      end

   english: LOCALE is
      once
         create Result.make_language("en")
      end

   france: LOCALE is
      once
         create Result.make_country("fr", "FR")
      end

   french: LOCALE is
      once
         create Result.make_language("fr")
      end

   german: LOCALE is
      once
         create Result.make_language("de")
      end

   germany: LOCALE is
      once
         create Result.make_country("de", "DE")
      end

   italian: LOCALE is
      once
         create Result.make_language("it")
      end

   italy: LOCALE is
      once
         create Result.make_country("it", "IT")
      end

   japan: LOCALE is
      once
         create Result.make_country("jp", "JP")
      end

   japanese: LOCALE is
      once
         create Result.make_language("jp")
      end

   korea: LOCALE is
      once
         create Result.make_country("ko", "KR")
      end

   korean: LOCALE is
      once
         create Result.make_language("ko")
      end

   prc: LOCALE is
      once
         create Result.make_country("zh", "CN")
      end

   simplified_chinese: LOCALE is
      once
         create Result.make_country("zh", "CN")
      end

   taiwan: LOCALE is
      once
         create Result.make_country("zh", "TW")
      end

   traditional_chinese: LOCALE is
      once
         create Result.make_country("zh", "TW")
      end

   uk: LOCALE is
      once
         create Result.make_country("en", "GB")
      end

   us: LOCALE is
      once
         create Result.make_country("en", "US")
      end

feature {}
   locale_memory: REFERENCE[LOCALE] is
      once
         create Result
         fix_locale(Result.item)
      end

   fix_locale (a_locale: like locale) is
         -- low-level access to the native localization
      local
         language, country, encoding: POINTER
      do
         language := a_locale.language.to_external
         if a_locale.country /= Void then
            country := a_locale.country.to_external
            if a_locale.encoding /= Void then
               encoding := a_locale.encoding.to_external
            end
         end
         i18n_set_system_locale(language, country, encoding)
      end

   i18n_set_system_locale (language, country, encoding: POINTER) is
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "i18n_set_system_locale"
      }"
      end

end -- class I18N
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
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
