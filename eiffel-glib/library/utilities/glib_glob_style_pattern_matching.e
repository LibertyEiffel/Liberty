   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: Commandline option parser (previous)
   Link: Simple XML Subset Parser (next)
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

   Glob-style pattern matching

   Glob-style pattern matching -- matches strings against patterns containing '*'
   (wildcard) and '?' (joker).

Synopsis


 #include <glib.h>


             GPatternSpec;
 GPatternSpec* g_pattern_spec_new            (const gchar *pattern);
 void        g_pattern_spec_free             (GPatternSpec *pspec);
 gboolean    g_pattern_spec_equal            (GPatternSpec *pspec1,
                                              GPatternSpec *pspec2);
 gboolean    g_pattern_match                 (GPatternSpec *pspec,
                                              guint string_length,
                                              const gchar *string,
                                              const gchar *string_reversed);
 gboolean    g_pattern_match_string          (GPatternSpec *pspec,
                                              const gchar *string);
 gboolean    g_pattern_match_simple          (const gchar *pattern,
                                              const gchar *string);

Description

   The g_pattern_match* functions match a string against a pattern containing '*'
   and '?' wildcards with similar semantics as the standard glob() function: '*'
   matches an arbitrary, possibly empty, string, '?' matches an arbitrary character.

   Note that in contrast to glob(), the '/' character can be matched by the
   wildcards, there are no '[...]' character ranges and '*' and '?' can not be
   escaped to include them literally in a pattern.

   When multiple strings must be matched against the same pattern, it is better to
   compile the pattern to a GPatternSpec using g_pattern_spec_new() and use
   g_pattern_match_string() instead of g_pattern_match_simple(). This avoids the
   overhead of repeated pattern compilation.

Details

  GPatternSpec

 typedef struct _GPatternSpec GPatternSpec;

   A GPatternSpec is the 'compiled' form of a pattern. This structure is opaque and
   its fields cannot be accessed directly.

   ---------------------------------------------------------------------------------

  g_pattern_spec_new ()

 GPatternSpec* g_pattern_spec_new            (const gchar *pattern);

   Compiles a pattern to a GPatternSpec.

   pattern : a zero-terminated UTF-8 encoded string.
   Returns : a newly-allocated GPatternSpec.

   ---------------------------------------------------------------------------------

  g_pattern_spec_free ()

 void        g_pattern_spec_free             (GPatternSpec *pspec);

   Frees the memory allocated for the GPatternSpec.

   pspec : a GPatternSpec.

   ---------------------------------------------------------------------------------

  g_pattern_spec_equal ()

 gboolean    g_pattern_spec_equal            (GPatternSpec *pspec1,
                                              GPatternSpec *pspec2);

   Compares two compiled pattern specs and returns whether they will match the same
   set of strings.

   pspec1 :  a GPatternSpec.
   pspec2 :  another GPatternSpec.
   Returns : Whether the compiled patterns are equal.

   ---------------------------------------------------------------------------------

  g_pattern_match ()

 gboolean    g_pattern_match                 (GPatternSpec *pspec,
                                              guint string_length,
                                              const gchar *string,
                                              const gchar *string_reversed);

   Matches a string against a compiled pattern. Passing the correct length of the
   string given is mandatory. The reversed string can be omitted by passing NULL,
   this is more efficient if the reversed version of the string to be matched is not
   at hand, as g_pattern_match() will only construct it if the compiled pattern
   requires reverse matches.

   Note that, if the user code will (possibly) match a string against a multitude of
   patterns containing wildcards, chances are high that some patterns will require a
   reversed string. In this case, it's more efficient to provide the reversed string
   to avoid multiple constructions thereof in the various calls to
   g_pattern_match().

   Note also that the reverse of a UTF-8 encoded string can in general not be
   obtained by g_strreverse(). This works only if the string doesn't contain any
   multibyte characters. Glib offers the g_utf_strreverse() function to reverse
   UTF-8 encoded strings.

   pspec :           a GPatternSpec.
   string_length :   the length of string.
   string :          the UTF-8 encoded string to match.
   string_reversed : the reverse of string or NULL.
   Returns :         TRUE if string matches pspec.

   ---------------------------------------------------------------------------------

  g_pattern_match_string ()

 gboolean    g_pattern_match_string          (GPatternSpec *pspec,
                                              const gchar *string);

   Matches a string against a compiled pattern. If the string is to be matched
   against more than one pattern, consider using g_pattern_match() instead while
   supplying the reversed string.

   pspec :   a GPatternSpec.
   string :  the UTF-8 encoded string to match.
   Returns : TRUE if string matches pspec.

   ---------------------------------------------------------------------------------

  g_pattern_match_simple ()

 gboolean    g_pattern_match_simple          (const gchar *pattern,
                                              const gchar *string);

   Matches a string against a pattern given as a string. If this function is to be
   called in a loop, it's more efficient to compile the pattern once with
   g_pattern_spec_new() and call g_pattern_match_string() repetively.

   pattern : the UTF-8 encoded pattern.
   string :  the UTF-8 encoded string to match.
   Returns : TRUE if string matches pspec.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Simple-XML-Subset-Parser.html
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
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Commandline-option-parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Simple-XML-Subset-Parser.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#id3068508
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#id3068712
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-spec-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-spec-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-spec-equal
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match-string
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match-simple
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-spec-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match-string
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match-simple
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-String-Utility-Functions.html#g-strreverse
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#GPatternSpec
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-spec-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Glob-style-pattern-matching.html#g-pattern-match-string
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#TRUE:CAPS
