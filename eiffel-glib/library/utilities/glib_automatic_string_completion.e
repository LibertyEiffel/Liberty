   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: Lexical Scanner (previous)
   Link: Timers (next)
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

   Automatic String Completion

   Automatic String Completion -- support for automatic completion using a group of
   target strings.

Synopsis


 #include <glib.h>


             GCompletion;
 GCompletion* g_completion_new               (GCompletionFunc func);
 gchar*      (*GCompletionFunc)              (gpointer );
 void        g_completion_add_items          (GCompletion *cmp,
                                              GList *items);
 void        g_completion_remove_items       (GCompletion *cmp,
                                              GList *items);
 void        g_completion_clear_items        (GCompletion *cmp);
 GList*      g_completion_complete           (GCompletion *cmp,
                                              const gchar *prefix,
                                              gchar **new_prefix);
 GList*      g_completion_complete_utf8      (GCompletion *cmp,
                                              const gchar *prefix,
                                              gchar **new_prefix);
 void        g_completion_set_compare        (GCompletion *cmp,
                                              GCompletionStrncmpFunc strncmp_func);
 gint        (*GCompletionStrncmpFunc)       (const gchar *s1,
                                              const gchar *s2,
                                              gsize n);
 void        g_completion_free               (GCompletion *cmp);

Description

   GCompletion provides support for automatic completion of a string using any group
   of target strings. It is typically used for file name completion as is common in
   many UNIX shells.

   A GCompletion is created using g_completion_new(). Target items are added and
   removed with g_completion_add_items(), g_completion_remove_items() and
   g_completion_clear_items(). A completion attempt is requested with
   g_completion_complete() or g_completion_complete_utf8(). When no longer needed,
   the GCompletion is freed with g_completion_free().

   Items in the completion can be simple strings (e.g. filenames), or pointers to
   arbitrary data structures. If data structures are used you must provide a
   GCompletionFunc in g_completion_new(), which retrieves the item's string from the
   data structure. You can change the way in which strings are compared by setting a
   different GCompletionStrncmpFunc in g_completion_set_compare().

Details

  GCompletion

 typedef struct {
   GList* items;
   GCompletionFunc func;

   gchar* prefix;
   GList* cache;
   GCompletionStrncmpFunc strncmp_func;
 } GCompletion;

   The data structure used for automatic completion.

   GList *items;                        list of target items (strings or data
                                        structures).
   GCompletionFunc func;                function which is called to get the string
                                        associated with a target item. It is NULL if
                                        the target items are strings.
   gchar *prefix;                       the last prefix passed to
                                        g_completion_complete() or
                                        g_completion_complete_utf8().
   GList *cache;                        the list of items which begin with prefix.
   GCompletionStrncmpFunc strncmp_func; The function to use when comparing strings.
                                        Use g_completion_set_compare() to modify
                                        this function.

   ---------------------------------------------------------------------------------

  g_completion_new ()

 GCompletion* g_completion_new               (GCompletionFunc func);

   Creates a new GCompletion.

   func :    the function to be called to return the string representing an item in
             the GCompletion, or NULL if strings are going to be used as the
             GCompletion items.
   Returns : the new GCompletion.

   ---------------------------------------------------------------------------------

  GCompletionFunc ()

 gchar*      (*GCompletionFunc)              (gpointer );

   Specifies the type of the function passed to g_completion_new(). It should return
   the string corresponding to the given target item. This is used when you use data
   structures as GCompletion items.

   Param1 :  the completion item.
   Returns : the string corresponding to the item.

   ---------------------------------------------------------------------------------

  g_completion_add_items ()

 void        g_completion_add_items          (GCompletion *cmp,
                                              GList *items);

   Adds items to the GCompletion.

   cmp :   the GCompletion.
   items : the list of items to add.

   ---------------------------------------------------------------------------------

  g_completion_remove_items ()

 void        g_completion_remove_items       (GCompletion *cmp,
                                              GList *items);

   Removes items from a GCompletion.

   cmp :   the GCompletion.
   items : the items to remove.

   ---------------------------------------------------------------------------------

  g_completion_clear_items ()

 void        g_completion_clear_items        (GCompletion *cmp);

   Removes all items from the GCompletion.

   cmp : the GCompletion.

   ---------------------------------------------------------------------------------

  g_completion_complete ()

 GList*      g_completion_complete           (GCompletion *cmp,
                                              const gchar *prefix,
                                              gchar **new_prefix);

   Attempts to complete the string prefix using the GCompletion target items.

   cmp :        the GCompletion.
   prefix :     the prefix string, typically typed by the user, which is compared
                with each of the items.
   new_prefix : if non-NULL, returns the longest prefix which is common to all items
                that matched prefix, or NULL if no items matched prefix. This string
                should be freed when no longer needed.
   Returns :    the list of items whose strings begin with prefix. This should not
                be changed.

   ---------------------------------------------------------------------------------

  g_completion_complete_utf8 ()

 GList*      g_completion_complete_utf8      (GCompletion *cmp,
                                              const gchar *prefix,
                                              gchar **new_prefix);

   Attempts to complete the string prefix using the GCompletion target items. In
   contrast to g_completion_complete(), this function returns the largest common
   prefix that is a valid UTF-8 string, omitting a possible common partial
   character.

   You should use this function instead of g_completion_complete() if your items are
   UTF-8 strings.

   cmp :        the GCompletion
   prefix :     the prefix string, typically used by the user, which is compared
                with each of the items
   new_prefix : if non-NULL, returns the longest prefix which is common to all items
                that matched prefix, or NULL if no items matched prefix. This string
                should be freed when no longer needed.
   Returns :    the list of items whose strings begin with prefix. This should not
                be changed.

   Since 2.4

   ---------------------------------------------------------------------------------

  g_completion_set_compare ()

 void        g_completion_set_compare        (GCompletion *cmp,
                                              GCompletionStrncmpFunc strncmp_func);

   Sets the function to use for string comparisons. The default string comparison
   function is strncmp().

   cmp :          a GCompletion.
   strncmp_func : the string comparison function.

   ---------------------------------------------------------------------------------

  GCompletionStrncmpFunc ()

 gint        (*GCompletionStrncmpFunc)       (const gchar *s1,
                                              const gchar *s2,
                                              gsize n);

   Specifies the type of the function passed to g_completion_set_compare(). This is
   used when you use strings as GCompletion items.

   s1 :      string to compare with s2.
   s2 :      string to compare with s1.
   n :       maximal number of bytes to compare.
   Returns : an integer less than, equal to, or greater than zero if the first n
             bytes of s1 is found, respectively, to be less than, to match, or to be
             greater than the first n bytes of s2.

   ---------------------------------------------------------------------------------

  g_completion_free ()

 void        g_completion_free               (GCompletion *cmp);

   Frees all memory used by the GCompletion.

   cmp : the GCompletion.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Lexical-Scanner.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Timers.html
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
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Lexical-Scanner.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Timers.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#id3022738
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#id3023058
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-add-items
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-remove-items
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-clear-items
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete-utf8
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-set-compare
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionStrncmpFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionStrncmpFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-add-items
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-remove-items
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-clear-items
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete-utf8
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionStrncmpFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-set-compare
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete-utf8
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionStrncmpFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-set-compare
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gpointer
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Doubly-Linked-Lists.html#GList
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-complete
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Standard-Macros.html#NULL:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletionStrncmpFunc
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gchar
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gsize
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#g-completion-set-compare
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Automatic-String-Completion.html#GCompletion
