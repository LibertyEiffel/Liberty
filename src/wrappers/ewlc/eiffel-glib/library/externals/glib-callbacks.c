/* Eiffel callbacks for the Glib library 
 * 
 * based on the original Glib:
 * Copyright (C) 1995-2017: Peter Mattis, Spencer Kimball and Josh MacDonald
 * Copyright (C) 1997-2017: the GLib Team and others

 * Copyright (C) 2007-2017: , Paolo Redaelli, EWLC team
 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 */
   
/* Callbacks found in Glib version 2.12.4 */
#include <stdio.h>
#include "glib-callbacks.h"
#include "cecil.h"


/* GSourceFunc () */

/* gboolean    (*GSourceFunc)                  (gpointer data); */

/* Specifies the type of function passed to g_timeout_add(), g_timeout_add_full(), g_idle_add(), and g_idle_add_full(). */
/* data : 	data passed to the function, set when the source was created with one of the above functions. */
/* Returns : 	it should return FALSE if the source should be removed. */


/* GCompareFunc () */

/* gint        (*GCompareFunc)                 (gconstpointer a, */
/*                                              gconstpointer b); */

/* Specifies the type of a comparison function used to compare two values. The function should return a negative integer if the first value comes before the second, 0 if they are equal, or a positive integer if the first value comes after the second. */
/* a : 	a value. */
/* b : 	a value to compare with. */
/* Returns : 	negative value if a < b; zero if a = b; positive value if a > b */

/* GCompareDataFunc () */

/* gint (*GCompareDataFunc) (gconstpointer a, gconstpointer b,
   gpointer user_data); */

int EiffelGCompareDataFunc (void *a, void *b, void *user_data) {
  /* Specifies the type of a comparison function used to compare two values. The function should return a negative integer if the first value comes before the second, 0 if they are equal, or a positive integer if the first value comes after the second. */
  /* a : 	a value. */
  /* b : 	a value to compare with. */
  /* user_data : 	user data to pass to comparison function. */
  /* Returns : 	negative value if a < b; zero if a = b; positive value if a > b.  */
  
  // Note: debug code commented out
  // printf("EiffelGCompareDataFunc (a=%p, b=%p, user_data=%p)\n",a,b,user_data);
  /* print(user_data.generator.to_external) translated to C */
  // void *generator = G_COMPARE_DATA_CALLBACK_generator(user_data); 
  // printf("Generator %p%n",generator);
  // char *generator_name = STRING_to_external(generator); 
  // printf("Generator name %p%n",generator_name);
  // printf("user_data is a %s\n",generator_name);
  return G_COMPARE_DATA_CALLBACK_callback(user_data,a,b);
};

/* GFunc () */

/* void        (*GFunc)                        (gpointer data, */
/*                                              gpointer user_data); */

/* Specifies the type of functions passed to g_list_foreach() and g_slist_foreach(). */
/* data : 	the element's data. */
/* user_data : 	user data passed to g_list_foreach() or g_slist_foreach(). */


/* ModuleCheckInit () */

/* const gchar* (*GModuleCheckInit)            (GModule *module); */

/* Specifies the type of the module initialization function. If a module contains a function named g_module_check_init() it is called automatically when the module is loaded. It is passed the GModule structure and should return NULL on success or a string describing the initialization error. */
/* module : 	the GModule corresponding to the module which has just been loaded. */
/* Returns : 	NULL on success, or a string describing the initialization error. */
/* GModuleUnload () */

/* void        (*GModuleUnload)                (GModule *module); */

/* Specifies the type of the module function called when it is unloaded. If a module contains a function named g_module_unload() it is called automatically when the module is unloaded. It is passed the GModule structure. */
/* module : 	the GModule about to be unloaded. */

/* GPrintFunc () */

/* void        (*GPrintFunc)                   (const gchar *string); */

/* Specifies the type of the print handler functions. These are called with the complete formatted string to output. */
/* string : 	the message to be output. */

/* GLogFunc () */

/* void        (*GLogFunc)                     (const gchar *log_domain, */
/*                                              GLogLevelFlags log_level, */
/*                                              const gchar *message, */
/*                                              gpointer user_data); */

/* Specifies the prototype of log handler functions. */
/* log_domain : 	the log domain of the message. */
/* log_level : 	the log level of the message (including the fatal and recursion flags). */
/* message : 	the message to process. */
/* user_data : 	user data, set in g_log_set_handler(). */

/* GHookFinalizeFunc () */

/* void        (*GHookFinalizeFunc)            (GHookList *hook_list, */
/*                                              GHook *hook); */

/* Defines the type of function to be called when a hook in a list of hooks gets finalized. */
/* hook_list : 	a GHookList. */
/* hook : 	the hook in hook_list that gets finalized. */


/* GHookFunc () */

/* void        (*GHookFunc)                    (gpointer data); */

/* Defines the type of a hook function that can be invoked by g_hook_list_invoke(). */
/* data : 	the data field of the GHook is passed to the hook function here. */
/* GHookCheckFunc () */

/* gboolean    (*GHookCheckFunc)               (gpointer data); */

/* Defines the type of a hook function that can be invoked by g_hook_list_invoke_check(). */
/* data : 	the data field of the GHook is passed to the hook function here. */
/* Returns : 	FALSE if the GHook should be destroyed. */

/* GHookMarshaller () */

/* void        (*GHookMarshaller)              (GHook *hook, */
/*                                              gpointer marshal_data); */

/* Defines the type of function used by g_hook_list_marshal(). */
/* hook : 	a GHook. */
/* marshal_data : 	user data. */

/* GHookCheckMarshaller () */

/* gboolean    (*GHookCheckMarshaller)         (GHook *hook, */
/*                                              gpointer marshal_data); */

/* Defines the type of function used by g_hook_list_marshal_check(). */
/* hook : 	a GHook. */
/* marshal_data : 	user data. */
/* Returns : 	FALSE if hook should be destroyed. */

/* GHookCompareFunc () */

/* gint        (*GHookCompareFunc)             (GHook *new_hook, */
/*                                              GHook *sibling); */

/* Defines the type of function used to compare GHook elements in g_hook_insert_sorted(). */
/* new_hook : 	the GHook being inserted. */
/* sibling : 	the GHook to compare with new_hook. */
/* Returns : 	a value <= 0 if new_hook should be before sibling. */

/* GHookFindFunc () */

/* gboolean    (*GHookFindFunc)                (GHook *hook, */
/*                                              gpointer data); */

/* Defines the type of the function passed to g_hook_find(). */
/* hook : 	a GHook. */
/* data : 	user data passed to g_hook_find_func(). */
/* Returns : 	TRUE if the required GHook has been found.  */

/* GScannerMsgFunc () */

/* void        (*GScannerMsgFunc)              (GScanner *scanner, */
/*                                              gchar *message, */
/*                                              gboolean error); */

/* Specifies the type of the message handler function. */
/* scanner : 	a GScanner. */
/* message : 	the message. */
/* error : 	TRUE if the message signals an error, FALSE if it signals a warning. */

/* GCompletionFunc () */

/* gchar*      (*GCompletionFunc)              (gpointer ); */

/* Specifies the type of the function passed to g_completion_new(). It should return the string corresponding to the given target item. This is used when you use data structures as GCompletion items. */
/* Param1 : 	the completion item. */
/* Returns : 	the string corresponding to the item. */


/* GCompletionStrncmpFunc () */

/* gint        (*GCompletionStrncmpFunc)       (const gchar *s1, */
/*                                              const gchar *s2, */
/*                                              gsize n); */

/* Specifies the type of the function passed to g_completion_set_compare(). This is used when you use strings as GCompletion items. */
/* s1 : 	string to compare with s2. */
/* s2 : 	string to compare with s1. */
/* n : 	maximal number of bytes to compare. */
/* Returns : 	an integer less than, equal to, or greater than zero if the first n bytes of s1 is found, respectively, to be less than, to match, or to be greater than the first n bytes of s2. */


/* GSpawnChildSetupFunc () */

/* void        (*GSpawnChildSetupFunc)         (gpointer user_data); */

/* Specifies the type of the setup function passed to g_spawn_async(), g_spawn_sync() and g_spawn_async_with_pipes(). On POSIX platforms it is called in the child after GLib has performed all the setup it plans to perform but before calling exec(). On POSIX actions taken in this function will thus only affect the child, not the parent. */

/* On Windows the function is called in the parent. Its usefulness on Windows is thus questionable. In many cases executing the child setup function in the parent can have ill effects, and you should be very careful when porting software to Windows that uses child setup functions. */
/* user_data : 	user data to pass to the function.  */

/* GOptionArgFunc () */

/* gboolean    (*GOptionArgFunc)               (const gchar *option_name, */
/*                                              const gchar *value, */
/*                                              gpointer data, */
/*                                              GError **error); */

/* The type of function to be passed as callback for G_OPTION_ARG_CALLBACK options. */
/* option_name : 	The name of the option being parsed. This will be either a single dash followed by a single letter (for a short name) or two dashes followed by a long option name. */
/* value : 	The value to be parsed. */
/* data : 	User data added to the GOptionGroup containing the option when it was created with g_option_group_new() */
/* error : 	A return location for errors. The error code G_OPTION_ERROR_FAILED is intended to be used for errors in GOptionArgFunc callbacks. */
/* Returns : 	TRUE if the option was successfully parsed, FALSE if an error occurred, in which case error should be set with g_set_error() */

/* GTranslateFunc () */

/* const gchar* (*GTranslateFunc)              (const gchar *str, */
/*                                              gpointer data); */

/* The type of functions which are used to translate user-visible strings, for --help output. */
/* str : 	the untranslated string */
/* data : 	user data specified when installing the function, e.g. in g_option_group_set_translate_func() */
/* Returns : 	a translation of the string for the current locale. The returned string is owned by GLib and must not be freed. */

/* GOptionParseFunc () */

/* gboolean    (*GOptionParseFunc)             (GOptionContext *context, */
/*                                              GOptionGroup *group, */
/*                                              gpointer data, */
/*                                              GError **error); */

/* The type of function that can be called before and after parsing. */
/* context : 	The active GOptionContext */
/* group : 	The group to which the function belongs */
/* data : 	User data added to the GOptionGroup containing the option when it was created with g_option_group_new() */
/* error : 	A return location for error details */
/* Returns : 	TRUE if the function completed successfully, FALSE if an error occurred, in which case error should be set with g_set_error() */

/* GOptionErrorFunc () */

/* void        (*GOptionErrorFunc)             (GOptionContext *context, */
/*                                              GOptionGroup *group, */
/*                                              gpointer data, */
/*                                              GError **error); */

/* The type of function to be used as callback when a parse error occurs. */
/* context : 	The active GOptionContext */
/* group : 	The group to which the function belongs */
/* data : 	User data added to the GOptionGroup containing the option when it was created with g_option_group_new() */
/* error : 	The GError containing details about the parse error */


/* GHashFunc () */

/* guint       (*GHashFunc)                    (gconstpointer key); */

/* Specifies the type of the hash function which is passed to g_hash_table_new() when a GHashTable is created. */

/* The function is passed a key and should return a guint hash value. The functions g_direct_hash(), g_int_hash() and g_str_hash() provide hash functions which can be used when the key is a gpointer, gint, and gchar* respectively. */

/* FIXME: Need more here. The hash values should be evenly distributed over a fairly large range? The modulus is taken with the hash table size (a prime number) to find the 'bucket' to place each key into. The function should also be very fast, since it is called for each key lookup. */
/* key : 	a key. */
/* Returns : 	the hash value corresponding to the key. */

/* GEqualFunc () */

/* gboolean    (*GEqualFunc)                   (gconstpointer a, */
/*                                              gconstpointer b); */

/* Specifies the type of a function used to test two values for equality. The function should return TRUE if both values are equal and FALSE otherwise. */
/* a : 	a value. */
/* b : 	a value to compare with. */
/* Returns : 	TRUE if a = b; FALSE otherwise. */


/* GHFunc () */

/* void        (*GHFunc)                       (gpointer key, */
/*                                              gpointer value, */
/*                                              gpointer user_data); */

/* Specifies the type of the function passed to g_hash_table_foreach(). It is called with each key/value pair, together with the user_data parameter which is passed to g_hash_table_foreach(). */
/* key : 	a key. */
/* value : 	the value corresponding to the key. */
/* user_data : 	user data passed to g_hash_table_foreach(). */

/* GHRFunc () */

/* gboolean    (*GHRFunc)                      (gpointer key, */
/*                                              gpointer value, */
/*                                              gpointer user_data); */

/* Specifies the type of the function passed to g_hash_table_foreach_remove(). It is called with each key/value pair, together with the user_data parameter passed to g_hash_table_foreach_remove(). It should return TRUE if the key/value pair should be removed from the GHashTable. */
/* key : 	a key. */
/* value : 	the value associated with the key. */
/* user_data : 	user data passed to g_hash_table_remove(). */
/* Returns : 	TRUE if the key/value pair should be removed from the GHashTable. */

/* GTraverseFunc () */

/* gboolean    (*GTraverseFunc)                (gpointer key, */
/*                                              gpointer value, */
/*                                              gpointer data); */

/* Specifies the type of function passed to g_tree_traverse(). It is passed the key and value of each node, together with the user_data parameter passed to g_tree_traverse(). If the function returns TRUE, the traversal is stopped. */
/* key : 	a key of a GTree node. */
/* value : 	the value corresponding to the key. */
/* data : 	user data passed to g_tree_traverse(). */
/* Returns : 	TRUE to stop the traversal.  */


/* GCopyFunc () */

/* gpointer    (*GCopyFunc)                    (gconstpointer src, */
/*                                              gpointer data); */

/* A function of this signature is used to copy the node data when doing a deep-copy of a tree. */
/* src : 	A pointer to the data which should be copied. */
/* data : 	Additional data. */
/* Returns : 	A pointer to the copy. */

/* Since 2.4 */

/* GNodeTraverseFunc () */

/* gboolean    (*GNodeTraverseFunc)            (GNode *node, */
/*                                              gpointer data); */

/* Specifies the type of function passed to g_node_traverse(). The function is called with each of the nodes visited, together with the user data passed to g_node_traverse(). If the function returns TRUE, then the traversal is stopped. */
/* node : 	a GNode. */
/* data : 	user data passed to g_node_traverse(). */
/* Returns : 	TRUE to stop the traversal. */

/* GNodeForeachFunc () */

/* void        (*GNodeForeachFunc)             (GNode *node, */
/*                                              gpointer data); */

/* Specifies the type of function passed to g_node_children_foreach(). The function is called with each child node, together with the user data passed to g_node_children_foreach(). */
/* node : 	a GNode. */
/* data : 	user data passed to g_node_children_foreach(). */

/* GDestroyNotify () */

/* void        (*GDestroyNotify)               (gpointer data); */

/* Specifies the type of function which is called when a data element is destroyed. It is passed the pointer to the data element and should free any memory and resources allocated for it. */
/* data : 	the data element. */

/* GDataForeachFunc () */

/* void        (*GDataForeachFunc)             (GQuark key_id, */
/*                                              gpointer data, */
/*                                              gpointer user_data); */

/* Specifies the type of function passed to g_dataset_foreach(). It is called with each GQuark id and associated data element, together with the user_data parameter supplied to g_dataset_foreach(). */
/* key_id : 	the GQuark id to identifying the data element. */
/* data : 	the data element. */
/* user_data : 	user data passed to g_dataset_foreach(). */

/* GCacheDestroyFunc () */

/* void        (*GCacheDestroyFunc)            (gpointer value); */

/* Specifies the type of the value_destroy_func and key_destroy_func functions passed to g_cache_new(). The functions are passed a pointer to the GCache key or GCache value and should free any memory and other resources associated with it. */
/* value : 	the GCache value to destroy. */


/* GCacheDupFunc () */

/* gpointer    (*GCacheDupFunc)                (gpointer value); */

/* Specifies the type of the key_dup_func function passed to g_cache_new(). The function is passed a key (not a value as the prototype implies) and should return a duplicate of the key. */
/* value : 	the GCache key to destroy (not a GCache value as it seems). */
/* Returns : 	a copy of the GCache key. */

/* GCacheDupFunc () */

/* gpointer    (*GCacheDupFunc)                (gpointer value); */

/* Specifies the type of the key_dup_func function passed to g_cache_new(). The function is passed a key (not a value as the prototype implies) and should return a duplicate of the key. */
/* value : 	the GCache key to destroy (not a GCache value as it seems). */
/* Returns : 	a copy of the GCache key.  */

