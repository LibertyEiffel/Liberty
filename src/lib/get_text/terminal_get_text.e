deferred class TERMINAL_GET_TEXT[E_]

inherit
   GET_TEXT[E_]

feature {}
   init
         -- Initialise with default values.
      do
         set_default_message_locale
         register_domain(text_domain)
      end

feature {ANY}
   set_environment_variable (variable, value: STRING)
         -- Try to assign the `value' to the system environment `variable' (like
         -- SYSTEM.set_environment_variable). Changes to language variables (such as LANGUAGE, LC_xxx, LANG)
         -- immediately affect the language of xxx_translation functions (unlike SYSTEM.set_environment_variable).
      require
         variable /= Void
         value /= Void
      deferred
      end

feature {ANY}
   set_message_locale (locale_name: like message_locale)
         -- Set the locale (roughly, the language) in which the
         -- program should output messages.
         --
         -- The `locale_name' should have the following form:
         --   language[_territory][.codeset]
         -- The territory field is usually a country name
         --
         -- For instance, en_US would be a typical `locale_name'.
      require
         not locale_name.is_empty
      deferred
      ensure
         message_locale.is_equal(locale_name)
      end

   set_default_message_locale
         -- Try to read the default locale in the environment
         -- (environment variable, register, ...)
      deferred
      end

end -- class TERMINAL_GET_TEXT
