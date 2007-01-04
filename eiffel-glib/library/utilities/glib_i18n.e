   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: Base64 Encoding (previous)
   Link: Date and Time Functions (next)
   Link: GLib Overview (chapter)
   Link: GLib Fundamentals (chapter)
   Link: GLib Core Application Support (chapter)
   Link: GLib Utilities (chapter)
   Link: GLib Data Types (chapter)
   Link: GLib Tools (chapter)
   Link: Index (index)
   Link: Index of deprecated symbols (index)
   Link: Index of new symbols in 2.2 (index)
   Link: Index of new symbols in 2.4 (index)
   Link: Index of new symbols in 2.6 (index)
   Link: Index of new symbols in 2.8 (index)
   Link: Index of new symbols in 2.10 (index)
   Link: Index of new symbols in 2.12 (index)

   Prev Up Home                      GLib Reference Manual                      Next
   Top  |  Description

   Internationalization

   Internationalization -- gettext support macros.

Synopsis


 #include <glib.h>
 #include <glib/gi18n.h>


 #define     _                               (String)
 #define     Q_                              (String)
 #define     N_                              (String)
 const gchar* g_strip_context                (const gchar *msgid,
                                              const gchar *msgval);

 const gchar* const * g_get_language_names   (void);

Description

   GLib doesn't force any particular localization method upon its users. But since
   GLib itself is localized using the gettext() mechanism, it seems natural to offer
   the de-facto standard gettext() support macros in an easy-to-use form.

   In order to use these macros in an application, you must include glib/gi18n.h.
   For use in a library, must include glib/gi18n-lib.h after defining the
   GETTEXT_PACKAGE macro suitably for your library:

 #define GETTEXT_PACKAGE "gtk20"
 #include <glib/gi18n-lib.h>

Details

  _()

 #define     _(String)

   Marks a string for translation, gets replaced with the translated string at
   runtime.

   String : the string to be translated

   Since 2.4

   ---------------------------------------------------------------------------------

  Q_()

 #define     Q_(String)

   Like _(), but applies g_strip_context() to the translation. This has the
   advantage that the string can be adorned with a prefix to guarantee uniqueness
   and provide context to the translator.

   One use case given in the gettext manual is GUI translation, where one could e.g.
   disambiguate two "Open" menu entries as "File|Open" and "Printer|Open". Another
   use case is the string "Russian" which may have to be translated differently
   depending on whether it's the name of a character set or a language. This could
   be solved by using "charset|Russian" and "language|Russian".

   String : the string to be translated, with a '|'-separated prefix which must not
            be translated

   Since 2.4

   ---------------------------------------------------------------------------------

  N_()

 #define     N_(String)

   Marks a string for translation, gets replaced with the untranslated string at
   runtime. This is useful in situations where the translated strings can't be
   directly used, e.g. in string array initializers.

      {
        static const char *messages[] = {
          N_("some very meaningful message"),
          N_("and another one")
        };
        const char *string;
        ...
        string
          = index > 1 ? _("a default message") : gettext (messages[index]);

        fputs (string);
        ...
      }

   String : the string to be translated

   Since 2.4

   ---------------------------------------------------------------------------------

  g_strip_context ()

 const gchar* g_strip_context                (const gchar *msgid,
                                              const gchar *msgval);

   An auxiliary function for gettext() support (see Q_()).

   msgid :   a string
   msgval :  another string
   Returns : msgval, unless msgval is identical to msgid and contains a '|'
             character, in which case a pointer to the substring of msgid after the
             first '|' character is returned.

   Since 2.4

   ---------------------------------------------------------------------------------

  g_get_language_names ()

 const gchar* const * g_get_language_names   (void);

   Computes a list of applicable locale names, which can be used to e.g. construct
   locale-dependent filenames or search paths. The returned list is sorted from most
   desirable to least desirable and always contains the default locale "C".

   For example, if LANGUAGE=de:en_US, then the returned list is "de", "en_US", "en",
   "C".

   This function consults the environment variables LANGUAGE, LC_ALL, LC_MESSAGES
   and LANG to find the list of locales specified by the user.

   Returns : a NULL-terminated array of strings owned by GLib that must not be
             modified or freed.

   Since 2.6

See Also

   The gettext manual.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Base64-Encoding.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Date-and-Time-Functions.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-fundamentals.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-core.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-data-types.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/tools.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix01.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix02.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix03.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix04.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix05.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix06.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix07.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix08.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Base64-Encoding.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Date-and-Time-Functions.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#id2965644
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#id2965728
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#gettext-macro
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#Q-:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#N-:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#g-strip-context
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#g-get-language-names
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#gettext-macro
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#g-strip-context
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-I18N.html#Q-:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
