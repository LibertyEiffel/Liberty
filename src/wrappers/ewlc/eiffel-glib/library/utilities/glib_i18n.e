deferred class GLIB_I18N
--    Internationalization

--    Internationalization -- gettext support macros.

-- Synopsis


--  #include <glib.h>
--  #include <glib/gi18n.h>


--  #define     _                               (String)
--  #define     Q_                              (String)
--  #define     N_                              (String)
--  const gchar* g_strip_context                (const gchar *msgid,
--                                               const gchar *msgval);

--  const gchar* const * g_get_language_names   (void);

-- Description

--    GLib doesn't force any particular localization method upon its users. But since
--    GLib itself is localized using the gettext() mechanism, it seems natural to offer
--    the de-facto standard gettext() support macros in an easy-to-use form.

--    In order to use these macros in an application, you must include glib/gi18n.h.
--    For use in a library, must include glib/gi18n-lib.h after defining the
--    GETTEXT_PACKAGE macro suitably for your library:

--  #define GETTEXT_PACKAGE "gtk20"
--  #include <glib/gi18n-lib.h>

-- Details

--   _()

--  #define     _(String)

--    Marks a string for translation, gets replaced with the translated string at
--    runtime.

--    String : the string to be translated

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   Q_()

--  #define     Q_(String)

--    Like _(), but applies g_strip_context() to the translation. This has the
--    advantage that the string can be adorned with a prefix to guarantee uniqueness
--    and provide context to the translator.

--    One use case given in the gettext manual is GUI translation, where one could e.g.
--    disambiguate two "Open" menu entries as "File|Open" and "Printer|Open". Another
--    use case is the string "Russian" which may have to be translated differently
--    depending on whether it's the name of a character set or a language. This could
--    be solved by using "charset|Russian" and "language|Russian".

--    String : the string to be translated, with a '|'-separated prefix which must not
--             be translated

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   N_()

--  #define     N_(String)

--    Marks a string for translation, gets replaced with the untranslated string at
--    runtime. This is useful in situations where the translated strings can't be
--    directly used, e.g. in string array initializers.

--       {
--         static const char *messages[] = {
--           N_("some very meaningful message"),
--           N_("and another one")
--         };
--         const char *string;
--         ...
--         string
--           = index > 1 ? _("a default message") : gettext (messages[index]);

--         fputs (string);
--         ...
--       }

--    String : the string to be translated

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_strip_context ()

--  const gchar* g_strip_context                (const gchar *msgid,
--                                               const gchar *msgval);

--    An auxiliary function for gettext() support (see Q_()).

--    msgid :   a string
--    msgval :  another string
--    Returns : msgval, unless msgval is identical to msgid and contains a '|'
--              character, in which case a pointer to the substring of msgid after the
--              first '|' character is returned.

--    Since 2.4

--    ---------------------------------------------------------------------------------

--   g_get_language_names ()

--  const gchar* const * g_get_language_names   (void);

--    Computes a list of applicable locale names, which can be used to e.g. construct
--    locale-dependent filenames or search paths. The returned list is sorted from most
--    desirable to least desirable and always contains the default locale "C".

--    For example, if LANGUAGE=de:en_US, then the returned list is "de", "en_US", "en",
--    "C".

--    This function consults the environment variables LANGUAGE, LC_ALL, LC_MESSAGES
--    and LANG to find the list of locales specified by the user.

--    Returns : a NULL-terminated array of strings owned by GLib that must not be
--              modified or freed.

--    Since 2.6
end -- class GLIB_I18N

